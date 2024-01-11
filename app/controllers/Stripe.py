from pydantic import BaseModel
from typing import Optional

import stripe

class PaymentRequest(BaseModel):
  customerId: str
  productId: Optional[str] = None 
  amount: int
  email: str
  customerName: str
  metadata: Optional[dict] = None


class Stripe:

    stripe.api_key = "sk_test_D4pNByx08dJpJShCHbDp79Y70007pq01Qn"

    def __init__ (self):
        self.client = stripe

    def get_or_create_customer (
        self,
        email: str,
        customerName: str,
        customerId: str
    ): 
        return self.client.Customer.create(
                email=email,
                name=customerName,
        )
    
    def create_payment_intent(self, amount: str, customer: str):
        return self.client.PaymentIntent.create(
            amount=int(float(amount)) * 100, currency="usd", customer=customer, setup_future_usage="off_session", 
        )
    
    def create_subscription(self, stripeCustomerId: str, productId: str):

        return self.client.Subscription.create(customer=stripeCustomerId, payment_behavior= "default_incomplete", expand=['latest_invoice.payment_intent'], payment_settings={"payment_method_types": ["card"], "save_default_payment_method": "on_subscription"}, items=[{"price": productId.productId }])
    
    def initiatePayment(self, customerId: str, email: str, customerName: str, amount: str ): 
        customer = self.get_or_create_customer(customerId=customerId, email=email, customerName=customerName)
        paymentIntent = self.create_payment_intent(amount=amount, customer=customer.id)

        return {
        "client_secret": paymentIntent.client_secret,
        }

    def initiateSubscription(self, email: str, customerName: str, customerId: str, productId: str):
        customer = self.get_or_create_customer(email, customerName, customerId  )
        subscription = self.create_subscription(customer.id, productId)
        latest_invoice = subscription.latest_invoice 
        payment_intent = latest_invoice.payment_intent
        print("CLIENT SECRET: ", payment_intent.client_secret)

        return payment_intent.client_secret