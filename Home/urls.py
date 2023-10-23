# -*- coding: utf-8 -*-
"""
Created on Mon Oct  9 18:19:42 2023

@author: KeithLee
"""

from django.urls import path
from . import views
from django.contrib.auth import views as auth_views

# 主頁
urlpatterns = [
    path('', views.index, name='index'),
    ]

# 帳號
urlpatterns += [
    path('signup/', views.signup, name='signup'), # 註冊
    path('myaccount/', views.myaccount, name='myaccount'), # 我的帳號
    path('myaccount/edit/', views.edit_myaccount, name='edit_myaccount'), # 我的帳號編輯
    path('login/', auth_views.LoginView.as_view(template_name='account/login.html'), name='login'), # 登入
    path('logout/', auth_views.LogoutView.as_view(), name='logout'), # 登出
    ]


# 推薦頁面
urlpatterns += [
    path('recommend/', views.coffee_stores, name='recommend'),
    ]