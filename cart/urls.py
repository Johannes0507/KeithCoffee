# -*- coding: utf-8 -*-

from django.urls import path
from . import views


urlpatterns = [
    path('', views.cart, name='cart'), # 空格導向購物車頁面
    path('checkout/', views.checkout, name='checkout'), # 訂單確認
    path('add_to_cart/<int:productvariant_id>/', views.add_to_cart, name='add_to_cart'), # 加入購物車的圖標
    path('update_cart/<int:productvariant_id>/<str:action>/', views.update_cart, name='update_cart'),
    path('hx_menu_cart/', views.hx_menu_cart, name='hx_menu_cart'),
    ]