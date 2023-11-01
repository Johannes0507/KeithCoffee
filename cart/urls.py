# -*- coding: utf-8 -*-

from django.urls import path
from . import views


urlpatterns = [
    path('', views.cart, name='cart'), # 空格導向購物車頁面
    path('checkout/', views.checkout, name='checkout'), # 訂單確認
    path('checkout/done/', views.CheckoutDone, name='checkout_done'), # 結帳完成
    path('checkout/failed/', views.CheckoutFailed, name='checkout_failed'), # 結帳失敗
    ]

# ajax
urlpatterns += [
    path('add_to_cart/<int:productvariant_id>/', views.add_to_cart, name='add_to_cart'), # ajax 加入購物車的圖標
    path('update_cart/<int:productvariant_id>/<str:action>/', views.update_cart, name='update_cart'), # 變更購物車數量
    path('hx_menu_cart/', views.hx_menu_cart, name='hx_menu_cart'), # ajax 讓購物車數字可以根據商品加減變動
    path('hx_cart_total/', views.hx_cart_total, name='hx_cart_total'), # ajax 購物車的價格總數
    path('hx_cart_total_quantity/', views.hx_cart_total_quantity, name='hx_cart_total_quantity'), # ajax 購物車的商品數量總數
    ]

# 綠界金流串接測試
urlpatterns += [
    path('checkout/ecpay/', views.ecpay_view, name='ecpay'),
    ]