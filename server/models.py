from typing import Optional
from pydantic import BaseModel


class User(BaseModel):
    id: int
    name: str
    email: str
    status: str
    user_role: str


class UserLog(BaseModel):
    id: int
    user_id: int
    user_email: str
    content: str 


class ProductCategory(BaseModel):
    id: int
    name: str


class ProductSubCategory(BaseModel):
    id: int
    name: str
    parent_cat_name: str


class Product(BaseModel):
    id: Optional[int]
    user_id: int
    subcategory_id: int
    name: str
    price: float
    description: str
    status: Optional[str]


class ProductDesc(BaseModel):
    product_id: int
    name: str
    price: float
    description: str