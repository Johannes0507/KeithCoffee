# -*- coding: utf-8 -*-
"""
Created on Tue Oct 17 16:52:32 2023

@author: KeithLee
"""

from django.urls import path
from .views import add_to_cart

# 加入購物車
urlpatterns = [
    path('add_to_cart/<int:productvariant_id>/', add_to_cart, name='add_to_cart'),
    ]