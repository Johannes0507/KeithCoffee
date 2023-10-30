# -*- coding: utf-8 -*-
"""
Created on Mon Oct  9 18:19:42 2023

@author: KeithLee
"""

from django.urls import path, include
from . import views
from django.contrib.auth import views as auth_views

# 主頁
urlpatterns = [
    path('', views.index, name='index'),
    path('recommend/', views.coffee_stores, name='recommend'), # 推薦頁面
    path('aboutus/', views.AboutUs, name='abountus'), # 關於我們
    ]


from django.contrib.auth.views import PasswordResetDoneView, PasswordResetConfirmView, PasswordResetCompleteView
from django.urls import reverse_lazy

# 帳號
urlpatterns += [
    path('signup/', views.signup, name='signup'), # 註冊
    path('myaccount/', views.myaccount, name='myaccount'), # 我的帳號
    path('myaccount/edit/', views.edit_myaccount, name='edit_myaccount'), # 帳號資料編輯
    path('login/', auth_views.LoginView.as_view(template_name='account/login.html'), name='login'), # 登入
    path('logout/', auth_views.LogoutView.as_view(), name='logout'), # 登出
    
    path('password_reset/',
         views.PasswordResetView.as_view(template_name='account/password_reset_form.html'), 
         name='password_reset'), # 填寫重設密碼信箱
    
    path('password_reset/done/',
         PasswordResetDoneView.as_view(template_name='account/password_reset_done.html'), 
         name='password_reset_done'), # 填寫完顯示已發送信件字體
    
    path('reset/<uidb64>/<token>/',
         PasswordResetConfirmView.as_view(template_name='account/password_reset_confirm.html', success_url=reverse_lazy('password_reset_complete')), 
         name='password_reset_confirm'), # 從後台得到連結後重設密碼的頁面
    
    path('reset/done/', 
         PasswordResetCompleteView.as_view(template_name='account/password_reset_complete.html'), 
         name='password_reset_complete'), # 完成密碼重置並顯示再次登入連結
    ]




