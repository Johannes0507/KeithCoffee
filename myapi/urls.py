from django.urls import path
from rest_framework.authtoken.views import obtain_auth_token
from . import views
    
# User
urlpatterns = [
        path('auth/', obtain_auth_token), # token
        path('user/change_password/', views.password_change_view, name='password-change'), # 密碼變更
        path('user/', views.user_view, name='user-list'), # user列表
        path('user/<int:pk>/', views.user_detail_view, name='user-detail'),
        path('user/<int:pk>/update/', views.user_update_view, name='user-edit'),
        path('user/<int:pk>/destroy/', views.user_destroy_view, name='user-destroy'),          
    ]


# 產品API
urlpatterns +=  [
        path('products/', views.product_list_create_view, name='product-1ist'),
        path('products/<int:pk>/', views.product_detail_view, name='api-product-detail'),
        path('products/<int:pk>/update/', views.product_update_view, name='product-edit'),
        path('products/<int:pk>/destroy/', views.product_destroy_view, name='product-destroy'),     
        path('products/category_products/', views.product_to_category, name='category-products'), # 產品                  
    ]


# 產品變數API
urlpatterns += [
        path('product_variant/', views.product_variant_list_create_view, name='variant-list'),
        path('product_variant/<int:pk>/', views.product_variant_detail_view, name='variant-detail'),    
        path('product_variant/<int:pk>/update/', views.produc_variant_update_view, name='variant-edit'),    
        path('product_variant/<int:pk>/destroy/', views.product_variant_destroy_view, name='variant-destroy'),      
    ]


# 訂單API
urlpatterns += [
        path('orders/', views.order_list_create_view, name='order-list'),
        path('orders/<int:pk>/', views.order_detail_view, name='order-detail'),        
        path('orders/<int:pk>/update/', views.order_update_view, name='order-edit'),     
        path('orders/<int:pk>/destroy/', views.order_destroy_view, name='order-destroy'),          
    ]


# 訂單產品資訊API
urlpatterns += [
        path('order_item/', views.order_item_list_create_view, name='item-list'),
        path('order_item/<int:pk>/', views.order_item_detail_view, name='item-detail'),         
        path('order_item/<int:pk>/update/', views.order_item_update_view, name='item-edit'), 
        path('order_item/<int:pk>/destroy/', views.order_item_destroy_view, name='item-destroy'),           
    ]