import os
from pydantic import BaseSettings


# fastapi env variable configuration
class Settings(BaseSettings):
    database_url_with_schema: str
    secret: str
    apn_push_token_secret: str
    apn_push_key: str
    apn_issuer_key: str
    stripe_api_key_prod: str
    stripe_api_key_dev: str

settings = Settings()
