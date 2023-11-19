
import requests

auth_endpoint = "http://127.0.0.1:8000/api/auth/"

username = "keith"
password = "1234567890"

auth_response = requests.post(auth_endpoint, json={'username': username, 'password': password}) 
print(auth_response.json())
print(auth_response.status_code) 

if auth_response.status_code == 200:
    Token = auth_response.json()["token"]

    endpoint = "http://127.0.0.1:8000/api/products/" # create
    headers = {
        "Authorization": f"Token {Token}",
    }

    filename = r'C:\Users\opjoh\OneDrive\桌面\smile.png'
    
    data = {
        'name': '好喝咖啡',
        'product_inst': '超好喝',
        'product_desc': '超級無敵好喝超級無敵好喝超級無敵好喝超級無敵好喝超級無敵好喝超級無敵好喝超級無敵好喝超級無敵好喝。',
        'price': '33333',
        'code': 'NOMAL'
    }

    with open(filename, 'rb') as f:
        files = {'image': f}

        get_reponse = requests.post(endpoint, headers=headers, data=data, files=files)

        print(get_reponse.json())
        print(get_reponse.status_code) # 印出回復狀態 200、404、500...
