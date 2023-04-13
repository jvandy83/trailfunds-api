from fastapi import APIRouter, Depends, HTTPException

from src.prisma import prisma_user

from config import Settings

from typing import Annotated

from pydantic import BaseModel

import bcrypt

import jwt

settings = Settings()

class UserLogin(BaseModel):
    email: str
    password: str

class UserSignUp(BaseModel):
    firstName: str
    lastName: str
    email: str
    password: str

router = APIRouter(
    prefix="/api/v1/auth",
    tags=["auth"],
    responses={404: {"description": "Not found"}},
)

@router.post('/sign-up')
async def sign_up(user: UserSignUp):

  print('user in signup: ', user)

  existing_user = await prisma_user.find_first(where={'email': user.email } )

  if existing_user is not None:
    raise HTTPException(status_code=404, detail="E-mail is already in use")

  hashed_password = bcrypt.hashpw(user.password.encode('utf-8'), bcrypt.gensalt())
  
  created_user = await prisma_user.create(
      data={
        'first_name': user.firstName,
        'last_name': user.lastName,
        'email': user.email,
        'password': hashed_password.decode()
      }
  )

  # find better way to exclude 
  # password using a query
  # or using decorator in prisma file

  access_token = jwt.encode({'id': new_user.id }, settings.secret, "HS256")
  print()

  return { 'currentUser': {'email': created_user.email, 'firstName': created_user.first_name, 'lastName': created_user.last_name, 'id': created_user.id }, 'accessToken': access_token }

@router.post('/login')
async def login(user: UserLogin):

  existing_user = await prisma_user.find_first(where={'email': user.email } )
  
  hashed_password = existing_user.password

  if bcrypt.checkpw(user.password.encode('utf-8'), hashed_password.encode('utf-8')) and existing_user is not None:

    access_token = jwt.encode({'email': existing_user.email, 'firstName': existing_user.first_name, 'lastName': existing_user.last_name, 'id': existing_user.id, 'isNew': False }, settings.secret)

    return { 'currentUser': {'email': existing_user.email, 'firstName': existing_user.first_name, 'lastName': existing_user.last_name, 'id': existing_user.id }, 'accessToken': access_token }

  else:

    raise HTTPException(status_code=404, detail="Username or password in incorrect")