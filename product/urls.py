# -*- coding: utf-8 -*-
"""
Created on Mon Oct  9 23:34:50 2023

@author: KeithLee
"""

from django.urls import path
from django.views.generic import RedirectView
from . import views


urlpatterns = [
    path('', RedirectView.as_view(url='all-product/')), # 讓空格重新導向
    path('all-product/', views.ProductsView.as_view(), name='all-product'), # 所有產品頁面
    path('new-product/', views.NewProductsView.as_view(), name='new-product'), # 最新產品頁面
    path('<str:category>/', views.ProductCategoryView.as_view(), name='product-category'), # 類別產品頁面
    path('all-product/<int:pk>/', views.ProductDetailView.as_view(), name='product-detail'), # 產品細節頁面
    ]


