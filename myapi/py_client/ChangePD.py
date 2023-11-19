
import requests

auth_endpoint = "http://127.0.0.1:8000/api/auth/"

username = "keith"
password = "1234567890"

auth_response = requests.post(auth_endpoint, json={'username': username, 'password': password}) 
print(auth_response.json())
print(auth_response.status_code) 

if auth_response.status_code == 200:
    Token = auth_response.json()["token"]

    endpoint = "http://127.0.0.1:8000/api/user/change_password/"

    headers = {
        "Authorization": f"Token {Token}",
    }

    data = {
        'old_password': '12345678900',
        'new_password': '1234567890'
    }
    
    get_reponse = requests.post(endpoint, headers=headers, json=data)

    print(get_reponse.json())
    print(get_reponse.status_code) # 印出回復狀態 200、404、500...
