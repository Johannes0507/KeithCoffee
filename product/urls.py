# -*- coding: utf-8 -*-
"""
Created on Mon Oct  9 23:34:50 2023

@author: KeithLee
"""

from django.urls import path
from . import views

urlpatterns = [
    path('all-product/', views.ProductsView.as_view(), name='all-product'),
    path('<str:category>/', views.ProductCategoryView.as_view(), name='product-category'),
    ]

urlpatterns += [
    path('<int:pk>/', views.ProductDetail.as_view(), name='product-detail'),
    ]

