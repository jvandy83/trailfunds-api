from fastapi import APIRouter, Depends, HTTPException

from typing import Annotated

from pydantic import BaseModel

from dependencies import get_auth

import stripe

from src.prisma import Trailbucks as TrailbucksModel, Transaction, User as UserModal, TrailOrg, User as UserModel

stripe.api_key='sk_test_D4pNByx08dJpJShCHbDp79Y70007pq01Qn'
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

router = APIRouter(
    prefix="/api/v1",
    tags=["payments"],
    dependencies=[Depends(get_auth)], 
    responses={401: {"description": "Not authorized"}},
)

@router.get('/payment-intents/{amount}')
async def make_payment_intent(amount: str):

  try:
    customer = stripe.Customer.create(
        name = 'Jared'
    )
    ephemeral_key = stripe.EphemeralKey.create(
        customer=customer['id'],
        stripe_version='2020-03-02',
    )

    payment_intent = stripe.PaymentIntent.create(
        amount = int(amount) * 100,
        currency = 'USD',
        customer = customer.id
    )
    
    return {'message': 'Payment initiated!', 'paymentIntent': payment_intent.client_secret, 'customer': customer, 'ephemeralKey': ephemeral_key.secret, 'data': payment_intent }
    
  except Exception as e:
    print(e)
    return {'message': 'Error'}
  
@router.post('/trailbucks')
async def add_trailbucks(data: Trailbucks):
  print('data inside addTrailbucks: ', data)

  existing_trailbucks_account = await TrailbucksModel.find_unique(where={'user_id': data.userId})

  print('existing_trailbucks_account: ', existing_trailbucks_account)

  # this will eventually involve calling/receiving
  # a balance from the users financial account

  if existing_trailbucks_account is not None:
    current_balance = existing_trailbucks_account.amount
    deposit = int(data.amount)
    await TrailbucksModel.update(
      where={
        'user_id': data.userId
      },
      data={
        'amount': current_balance + deposit
      }
    )

    return {'msg': 'success'}

  try:
    trailbucks = await TrailbucksModel.create(
      data = {
        'amount': int(data.amount),
        'user_id': data.userId,
      },
    )
    print(trailbucks)
  except Exception as e:
    print('Error: ', e)

  return {'msg': 'hello'}

@router.post('/donate')
async def donate_trailbucks(data: Donation):
  print('data inside addTrailbucks: ', data)

  existing_trailbucks_account = await TrailbucksModel.find_unique(where={'user_id': data.userId})

  user = await UserModal.find_unique(where={'id': data.userId})

  print('existing_trailbucks_account: ', existing_trailbucks_account)

  # this will eventually involve calling/receiving
  # a balance from the users financial account

  if existing_trailbucks_account is not None:
    current_balance = existing_trailbucks_account.amount
    donation = int(data.amount)
    await TrailbucksModel.update(
      where={
        'user_id': data.userId
      },
      data={
        'amount': current_balance - donation
      }
    )

    await Transaction.create(
      data={
        'amount': int(data.amount),
        'user_id': data.userId,
        'trail_org_id': 'clgpr0tu9000181qk6888h4jo',
        'trail_id': data.trailId
      }
    )

    return {'msg': 'success'}

  try:
    trailbucks = await TrailbucksModel.create(
      data = {
        'amount': int(data.amount),
        'user_id': data.userId,
      },
    )
    print(trailbucks)
  except Exception as e:
    print('Error: ', e)

  return {'msg': 'hello'}

@router.get('/current-balance')
async def get_current_balance(user: Annotated[User, Depends(get_auth)]):
  print('user in current-balance: ', user)

  current_account = await TrailbucksModel.find_unique(where={'user_id': user['id']})
  print('current_account: ', current_account)

  current_balance = current_account.amount
  print('current_balance: ', current_balance)

  return current_balance
  
@router.get('/transactions')
async def get_transactions(user: Annotated[User, Depends(get_auth)]):

  transactions_trail_orgs = await Transaction.find_many(
    include = {
      'trail': True,
      'trail_org': True
    },
    where = {
      'user_id': user['id']
    }
  )

  print('transactions_trail_orgs: ', transactions_trail_orgs)


  return transactions_trail_orgs
  