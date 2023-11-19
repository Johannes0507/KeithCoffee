import requests

auth_endpoint = "http://127.0.0.1:8000/api/auth/"

username = "keith"
password = "moopoo753951"

auth_response = requests.post(auth_endpoint, json={'username': username, 'password': password}) 
print(auth_response.json())
print(auth_response.status_code) 

if auth_response.status_code == 200:
    Token = auth_response.json()["token"]

    # endpoint = "http://127.0.0.1:8000/api/user/change_password/"

    # endpoint = "http://127.0.0.1:8000/api/user/1/update/" # PUT

    # endpoint = "http://127.0.0.1:8000/api/product_variant/"

    # endpoint = "http://127.0.0.1:8000/api/user_list/"

    # endpoint = "http://127.0.0.1:8000/api/product_variant/15/"  # GET

    # endpoint = "http://127.0.0.1:8000/api/orders/60/"  # GET detail

    endpoint = "http://127.0.0.1:8000/api/orders/60/update/" # PUT

    # endpoint = "http://127.0.0.1:8000/api/orders/60/" # DELETE

    headers = {
        "Authorization": f"Token {Token}",
    }

    # data = {
    #     'old_password': 'moopoo753951',
    #     'new_password': '1234567890'
    # }
    
    get_reponse = requests.put(endpoint)

    print(get_reponse.json())
    print(get_reponse.status_code) # 印出回復狀態 200、404、500...
