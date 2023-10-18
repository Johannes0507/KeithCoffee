from django.shortcuts import render

from django.contrib import redirects
from django.contrib.auth import login
from .forms import SignUpForm

def index(request):
    
    return render(request, 'index.html')

# 加入帳號視圖
def signup(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        
        if form.is_valid():
            user = form.save()
            
            login(request, user)
            
            return redirects('/')
    else:
        form = SignUpForm()

    return render(request, 'account/signup.html', {'form': form})

# 登入視圖
def Login(request):
    return render(request, 'account/login.html')