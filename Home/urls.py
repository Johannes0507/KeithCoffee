# -*- coding: utf-8 -*-
"""
Created on Mon Oct  9 18:19:42 2023

@author: KeithLee
"""

from django.urls import path
from .views import index, signup, Login
from django.contrib.auth import views

# 主頁
urlpatterns = [
    path('', index, name='index'),
    ]

# 帳號
urlpatterns += [
    path('signup/', signup, name='signup'),
    path('login/', views.LoginView.as_view(template_name='account/login.html'), name='login'),
    path('logout/', views.LogoutView.as_view(), name='logout'),
    ]