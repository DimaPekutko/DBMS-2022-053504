#!/usr/bin/env python3
from fastapi import FastAPI, status, HTTPException
from server import services
from server.models import Product, ProductDesc


app = FastAPI()



@app.get("/users")
def get_all_users():
    data, stat_code = services.get_all_users()
    if stat_code != status.HTTP_200_OK:
        raise HTTPException(status_code=stat_code, detail=data)
    return data
    

@app.get("/categories")
def get_all_categories():
    data, stat_code = services.get_all_categories()
    if stat_code != status.HTTP_200_OK:
        raise HTTPException(status_code=stat_code, detail=data)
    return data


@app.get("/subcategories")
def get_all_subcategories():
    data, stat_code = services.get_all_subcategories()
    if stat_code != status.HTTP_200_OK:
        raise HTTPException(status_code=stat_code, detail=data)
    return data


@app.get("/products")
def get_all_products():
    data, stat_code = services.get_all_products()
    if stat_code != status.HTTP_200_OK:
        raise HTTPException(status_code=stat_code, detail=data)
    return data


@app.get("/logs")
def get_all_logs():
    data, stat_code = services.get_all_user_logs()
    if stat_code != status.HTTP_200_OK:
        raise HTTPException(status_code=stat_code, detail=data)
    return data


@app.post("/login")
def login(email: str, password: str):
    data, stat_code = services.login(email, password)
    if stat_code != status.HTTP_200_OK:
        raise HTTPException(status_code=stat_code, detail=data)
    return data


@app.post("/register")
def register(name: str, email: str, password: str):
    data, stat_code = services.register(name, email, password)
    if stat_code != status.HTTP_200_OK:
        raise HTTPException(status_code=stat_code, detail=data)
    return data


@app.get("/user/{user_id}/products")
def get_user_products(user_id: int):
    data, stat_code = services.get_user_products(user_id)
    if stat_code != status.HTTP_200_OK:
        raise HTTPException(status_code=stat_code, detail=data)
    return data


@app.post("/user/{user_id}/products")
def create_user_product(product: Product):
    data, stat_code = services.create_user_product(product)
    if stat_code != status.HTTP_200_OK:
        raise HTTPException(status_code=stat_code, detail=data)
    return data


@app.delete("/user/{user_id}/products/{product_id}")
def delete_user_product(product_id: int):
    data, stat_code = services.delete_user_product(product_id)
    if stat_code != status.HTTP_200_OK:
        raise HTTPException(status_code=stat_code, detail=data)
    return data


@app.put("/user/{user_id}/products/{product_id}")
def put_user_product_desc(product_desc: ProductDesc):
    data, stat_code = services.put_user_product_desc(product_desc)
    if stat_code != status.HTTP_200_OK:
        raise HTTPException(status_code=stat_code, detail=data)
    return data


@app.patch("/user/{user_id}/products/{product_id}")
def update_product_status(user_id: int, target_product_id: int, new_status: str):
    data, stat_code = services.update_product_status(user_id, target_product_id, new_status)
    if stat_code != status.HTTP_200_OK:
        raise HTTPException(status_code=stat_code, detail=data)
    return data


@app.patch("/user/{user_id}")
def update_user_status(user_id: int, target_user_id: int, new_status: str):
    data, stat_code = services.update_user_status(user_id, target_user_id, new_status)
    if stat_code != status.HTTP_200_OK:
        raise HTTPException(status_code=stat_code, detail=data)
    return data