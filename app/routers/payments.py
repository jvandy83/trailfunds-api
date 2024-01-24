import uuid

from fastapi import APIRouter, Depends, HTTPException

from typing import Annotated

from pydantic import BaseModel

from dependencies import get_auth

from controllers.Stripe import Stripe

import stripe

from models.prisma import TrailbucksModel, Transaction, TrailOrg, Trail, User as UserModel

from config import settings

stripe.api_key = settings.api_key
# stripe.ApplePayDomain.create(
#   domain_name="trailfunds.ngrok.io"
# )


class User(BaseModel):
    first_name: str
    last_name: str
    email: str
    id: str


class Donation(BaseModel):
    amount: str
    userId: str
    trailId: str


class Trailbucks(BaseModel):
    amount: str
    userId: str

class CheckoutSession(BaseModel):
    productId: str

class PortalSession(BaseModel):
    sessionId: str


router = APIRouter(
    prefix="/api/v1",
    tags=["payments"],
    dependencies=[Depends(get_auth)],
    responses={401: {"description": "Not authorized"}},
)


@router.get("/payment-intents/{amount}")
async def make_payment_intent(amount: str, user: Annotated[User, Depends(get_auth)]):
    amount_plus_transaction_fee = round(float(amount) + ((float(amount) * 0.029) + .3), 2)

    current_user = await UserModel.find_unique(where={"id": user["id"]})

    try:
        client = Stripe()

        payment_intent = client.initiatePayment(amount=round(amount_plus_transaction_fee, 2), customerId=current_user.id, email= current_user.email, customerName= f"{current_user.first_name} {current_user.last_name}")

        return {
            "message": "Payment initiated!",
            "paymentIntent": payment_intent,
        }

    except Exception as e:
        print(e)
        return {"message": "Error"}


@router.post("/trailbucks")
async def add_trailbucks(data: Trailbucks):

    existing_trailbucks_account = await TrailbucksModel.find_unique(
        where={"user_id": data.userId}
    )

    # this will eventually involve calling/receiving
    # a balance from the users financial account

    if existing_trailbucks_account is not None:
        current_balance = existing_trailbucks_account.amount
        deposit = float(data.amount) * 100
        await TrailbucksModel.update(
            where={"user_id": data.userId}, data={"amount": current_balance + deposit}
        )

        return {"msg": "success"}

    try:
        trailbucks = await TrailbucksModel.create(
            data={
                "amount": int(data.amount) * 100,
                "user_id": data.userId,
            },
        )
        print(trailbucks)
    except Exception as e:
        print("Error: ", e)

    return {"Error": e}


@router.post("/donate")
async def donate_trailbucks(data: Donation):
    existing_trailbucks_account = await TrailbucksModel.find_unique(
        where={"user_id": data.userId}
    )

    trail_data = await Trail.find_unique(where={"id": data.trailId})

    # this will eventually involve calling/receiving
    # a balance from a Trailfunds stripe account

    if existing_trailbucks_account is not None:
        current_balance = existing_trailbucks_account.amount
        print("current_balance: ", current_balance)
        donation = float(data.amount)
        print("donation amount: ", donation)
        await TrailbucksModel.update(
            where={"user_id": data.userId}, data={"amount": current_balance - donation}
        )

        transaction = await Transaction.create(
            data={
                "amount": float(data.amount),
                "user_id": data.userId,
                "trail_org_id": trail_data.trail_org_id,
                "trail_id": data.trailId,
                "confirmation_number": str(uuid.uuid4())[5:12],
            },
        )

        print("***transaction.id inside Donate endpoint***: ", transaction.id)

        return transaction.id

    return {"msg": "Please add funds to your Trailbucks account :)"}


@router.get("/current-balance")
async def get_current_balance(user: Annotated[User, Depends(get_auth)]):
    print("INSIDE CURRENT BALANCE")
    print("USER: ", user)
    current_account = await TrailbucksModel.find_unique(where={"user_id": user["id"]})

    print("current_account: ", current_account)

    current_balance = current_account.amount

    return current_balance / 100


@router.get("/transactions")
async def get_transactions(user: Annotated[User, Depends(get_auth)]):
    transactions_trail_orgs = await Transaction.find_many(
        order={"created_at": "desc"},
        include={"trail": True, "trail_org": True},
        where={"user_id": user["id"]},
    )

    return transactions_trail_orgs


@router.post("/create-checkout-session")
async def create_checkout_session(productId: CheckoutSession, user: Annotated[User, Depends(get_auth)]):
    client = Stripe()

    current_user = await UserModel.find_unique(where={"id": user["id"]})

    client_secret = client.initiateSubscription(email=current_user.email, customerName=f"{current_user.first_name} {current_user.last_name}", productId=productId, customerId=current_user.id)

    return {
            "message": "Payment initiated!",
            "clientSecret": client_secret,
        }

@router.post("/create-portal-session")
async def create_portal_session(sessionId: PortalSession):
    print("SESSION_ID: ", sessionId)

    return {"msg": "success"}

@router.get("/transaction/{transactionId}")
async def get_transaction(transactionId: str):
    print("***transactionId inside get transaction request***: ", transactionId)
    transaction = await Transaction.find_unique(
        where={"id": transactionId},
        include={"user": True, "trail": True, "trail_org": True},
    )
    print("***transaction***: ", transaction)

    return transaction
