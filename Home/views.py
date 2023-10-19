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


# 帳號視圖
@login_required
def myaccount(request):
    return render(request, 'account/myaccount.html')

# 更改帳號
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

