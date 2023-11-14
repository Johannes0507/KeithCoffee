from django.urls import path

from rest_framework.authtoken.views import obtain_auth_token

from . import views
    

urlpatterns = [
        path('auth/', obtain_auth_token),
    ]


# 產品API
urlpatterns +=  [
        path('products/', views.product_list_create_view),
        path('products/<int:pk>/', views.product_detail_view),
        path('products/<int:pk>/update/', views.product_update_view),
        path('products/<int:pk>/destroy/', views.product_destroy_view),                       
    ]

# 產品變數API
urlpatterns += [
        path('product_variant/', views.product_variant_list_create_view),
        path('product_variant/<int:pk>/', views.product_variant_detail_view),    
        path('product_variant/<int:pk>/update/', views.produc_variant_update_view),    
        path('product_variant/<int:pk>/destroy/', views.product_variant_destroy_view),      
    ]

# 訂單API
urlpatterns += [
        path('order/', views.order_list_create_view),
        path('order/<int:pk>/', views.order_detail_view),        
        path('order/<int:pk>/update/', views.order_update_view),     
        path('order/<int:pk>/destroy/', views.order_destroy_view),          
    ]

# 訂單產品資訊API
urlpatterns += [
        path('order_item/', views.order_item_list_create_view),
        path('order_item/<int:pk>/', views.order_item_detail_view),         
        path('order_item/<int:pk>/update/', views.order_item_update_view), 
        path('order_item/<int:pk>/destroy/', views.order_item_destroy_view),           
    ]