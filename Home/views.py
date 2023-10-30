from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login
from .forms import SignUpForm


# 主頁視圖
def index(request):
    
    return render(request, 'index.html')


# 註冊視圖
def signup(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        
        if form.is_valid():
            user = form.save() # 儲存表單
            login(request, user) # 把使用者這冊資料儲存進後台
            
            return redirect('/')  # 註冊完之後畫面跳轉到主頁
    else:
        form = SignUpForm() # 如果表單內容不正確讓畫面跳轉到元表單

    return render(request, 'account/signup.html', {'form': form})

# 帳號資訊視圖
@login_required
def myaccount(request):
    return render(request, 'account/myaccount.html')

# 更改帳號資訊
@login_required
def edit_myaccount(request):
    if request.method == 'POST':
        user = request.user
        user.first_name = request.POST.get('first_name')
        user.last_name = request.POST.get('last_name')
        user.username = request.POST.get('username')
        user.email = request.POST.get('email')
        user.save()
        return redirect('myaccount')
    return render(request, 'account/edit_myaccount.html')

# 關於我們
def AboutUs(request):
    return render(request, 'aboutus.html')

# 設置重製密碼發出的信件內容
from django.contrib.auth.views import PasswordResetView

class PasswordResetView(PasswordResetView):
    email_template_name = 'account/password_reset_email.html'



# 店家搜尋視圖
import googlemaps
import json
from django.conf import settings

def coffee_stores(request):
    
    region = request.GET.get('region', '')
    # 咖啡專項選擇篩選
    select_coffee = request.GET.get('select_coffee', '')
    if select_coffee == 'ex':
        select_coffee = '義式咖啡'
    elif select_coffee == 'poc':
        select_coffee = '手沖咖啡'
    elif select_coffee == 'idc':
        select_coffee = '冰滴咖啡'
    elif select_coffee == 'mp':
        select_coffee = '摩卡壺'
    # 行程選單篩選
    select_trip = request.GET.get('select_trip', '')
    if select_trip == 'fg':
        select_trip = '朋友聚會'
    elif select_trip == 'ft':
        select_trip = '休閒'
    elif select_trip == 'dt':
        select_trip = '約會'
    elif select_trip == 'st':
        select_trip = '讀書'
    
    query = f'{region}{select_trip}{select_trip}咖啡廳'
    
    # 獲取Google Maps Platform API權限
    gmaps = googlemaps.Client(key=settings.GOOGLE_API_KEY)
    data = gmaps.places(query=query, language='zh-TW')
    stores = data.get('results', [])
    
    store_list = [] # 店家資訊
    for store in stores:
        place_id = store.get('place_id') # 搜尋店家place_id
        name = store.get('name') # 店家名
        link = f"https://www.google.com/maps/place/?q=place_id:{place_id}" # 店家連結
        rating = store.get('rating') # 店家評分
        
        
        detail = gmaps.place(f"{place_id}", language='zh-TW') # 進到第二層 店家資訊      
        address = detail['result']['formatted_address'] # 店家地址 (原版是英文需翻譯)    
        
        
        # 店家國際電話
        if 'international_phone_number' in detail['result']:
            store_phone = detail['result']['international_phone_number']
        else:
            store_phone = ''                
            
        # 商店圖片
        import requests
        import base64
        if 'photos' in detail['result']:
            photo_reference = detail['result']['photos'][0]['photo_reference']             
            max_width = 300
            max_height = 300    
            # 請求數據
            image = requests.get(f"https://maps.googleapis.com/maps/api/place/photo?photoreference={photo_reference}&maxwidth={max_width}&maxheight={max_height}&key={settings.GOOGLE_API_KEY}")
            # 確認請求是否成功
            if image.status_code == 200:
                image_data = image.content # 獲取HTML數據
            
            # 將圖像資料編碼為 base64
            base64_image = base64.b64encode(image_data).decode('utf-8')
        else:
            base64_image = ''
                
        # 店家評論
        reviews = []
        reviews_data = gmaps.place(f"{place_id}", language='zh-TW')
        
        if 'reviews' in reviews_data['result']:
            for i in range(len(reviews_data['result']['reviews'])):
                text = reviews_data['result']['reviews'][i]['text'].replace('\n', '')
                rating = reviews_data['result']['reviews'][i]['rating']
                reviews.append({
                    'rating': rating,
                    'text': text,
                    })
        
        store_info = {
            'name': name,
            'address': address,
            'link': link,
            'phone': store_phone,
            'photo': base64_image,
            'rating': rating,
            'reviews': reviews,
            }
        
        # 判斷評論裡面有沒有好喝
        all_review = ''
        for review in reviews:
            result_review = review['text']
            all_review += result_review            
        if '好喝' in all_review:
            store_list.append(store_info)        
        
    
    context = { 
        'store_list': store_list,
        }
    
    return render(request, 'google/recommend.html', context)


    