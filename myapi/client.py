# -*- coding: utf-8 -*-
"""
Created on Tue Nov 14 17:29:10 2023

@author: KeithLee
"""

import requests

endpoint = "http://127.0.0.1:8000/api/product_variant/"
# endpoint = "http://127.0.0.1:8000/api/product_variant/15/"  # GET & POST
# endpoint = "http://127.0.0.1:8000/api/order/71/"  # GET detail
# endpoint = "http://127.0.0.1:8000/api/order/71/update/" # PUT
# endpoint = "http://127.0.0.1:8000/api/order/71/destroy/" # DELETE

auth = {
    "username": "keith",
    "password": "moopoo753951",
}

data = {
    "shipping_address": "test",
    "total_amount": "10000",
    "user": 1,
}

get_reponse = requests.get(endpoint)

print(get_reponse.json())
print(get_reponse.status_code) # 印出回復狀態 200、404、500...




# class Client():               
    
#     def get_list(self, item_name):
#         endpoint = f"http://127.0.0.1:8000/api/{item_name}/"
#         get_reponse = requests.get(endpoint)
#         print(get_reponse.json())
#         print("回傳狀態：\n", get_reponse.status_code)
        
#     def get_detail(self, item_name, item_id):
#         endpoint = f"http://127.0.0.1:8000/api/{item_name}/{item_id}/"
#         get_reponse = requests.get(endpoint)
#         print(get_reponse.json())
#         print("回傳狀態：\n", get_reponse.status_code)
        
#     def destroy(self, item_name, )
            
            
# client = Client()

# print(client.get_list("訂單產品細項"))