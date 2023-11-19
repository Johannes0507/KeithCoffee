import requests


endpoint = "http://127.0.0.1:8000/api/orders/"  # GET

# endpoint = "http://127.0.0.1:8000/api/orders/15/" # GET DETAIL

data = {
    "shipping_address": "test",
    "total_amount": "10000",
    "user": 1,
}

get_reponse = requests.get(endpoint)

print(get_reponse.json())
print(get_reponse.status_code) # 印出回復狀態 200、404、500...
