from cart.models import Order, OrderItem
from product.models import Product, ProductVariant, Category
from django.contrib.auth.models import User

from .serializers import (
    ProductSerializer, ProductVariantSerializer, OrderSerializer, 
    OrderItemSerializer, UserSerializer, CategorySerializer, PasswordChangeSerializer)

from rest_framework.permissions import IsAuthenticated
from rest_framework import generics
from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response


# 產品 創見&顯示
class ProductListCreateAPIView(generics.ListCreateAPIView):
    queryset = Product.objects.all().order_by('id')
    serializer_class = ProductSerializer

product_list_create_view = ProductListCreateAPIView.as_view()

# 個別產別查詢 可根據id
class ProductDetailAPIView(generics.RetrieveAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    
product_detail_view = ProductDetailAPIView.as_view()

# 產品資訊更新
class ProductUpdateAPIView(generics.UpdateAPIView):
    queryset = Product.objects.all().order_by('id')
    serializer_class = ProductSerializer

product_update_view = ProductUpdateAPIView.as_view()

# 產品刪除
class ProductDestroyAPIView(generics.DestroyAPIView):
    queryset = Product.objects.all().order_by('id')
    serializer_class = ProductSerializer

product_destroy_view = ProductDestroyAPIView.as_view()

# 產品種類
class ProductCategoryAPIView(generics.ListCreateAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

product_to_category = ProductCategoryAPIView.as_view()



# 產品變數 創見&顯示
class ProductVariantListCresteAPIView(generics.ListCreateAPIView):
    queryset = ProductVariant.objects.all().order_by('id')
    serializer_class = ProductVariantSerializer

product_variant_list_create_view = ProductVariantListCresteAPIView.as_view()

# 個別產別變數查詢 可根據id
class ProductVariantDetailAPIView(generics.RetrieveAPIView):
    queryset = ProductVariant.objects.all()
    serializer_class = ProductVariantSerializer
    lookup_field = "pk"
    
product_variant_detail_view = ProductVariantDetailAPIView.as_view()

# 產品變數資訊更新
class ProductVariantUpdateAPIView(generics.UpdateAPIView):
    queryset = ProductVariant.objects.all().order_by('id')
    serializer_class = ProductVariantSerializer

produc_variant_update_view = ProductVariantUpdateAPIView.as_view()

# 產品變數刪除
class ProductVariantDestroyAPIView(generics.DestroyAPIView):
    queryset = ProductVariant.objects.all().order_by('id')
    serializer_class = ProductVariantSerializer

product_variant_destroy_view = ProductVariantDestroyAPIView.as_view()



# 訂單 創見 & 顯示
class OrderListCresteAPIView(generics.ListCreateAPIView):
    queryset = Order.objects.all().order_by('-id')
    serializer_class = OrderSerializer

order_list_create_view = OrderListCresteAPIView.as_view()

# 訂單查詢 可根據id
class OrderDetailAPIView(generics.RetrieveAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    lookup_field = "pk"
    
order_detail_view = OrderDetailAPIView.as_view()

# 訂單資訊更新
class OrderUpdateAPIView(generics.UpdateAPIView):
    queryset = Order.objects.all().order_by('id')
    serializer_class = OrderSerializer

order_update_view = OrderUpdateAPIView.as_view()

# 訂單刪除
class OrderDestroyAPIView(generics.DestroyAPIView):
    queryset = Order.objects.all().order_by('id')
    serializer_class = OrderSerializer

order_destroy_view = OrderDestroyAPIView.as_view()



# 訂單產品資訊 創見&顯示
class OrderItemListCresteAPIView(generics.ListCreateAPIView):
    queryset = OrderItem.objects.all().order_by('-id')
    serializer_class = OrderItemSerializer

    
order_item_list_create_view = OrderItemListCresteAPIView.as_view()

# 訂單產品資訊 可根據id
class OrderItemDetailAPIView(generics.RetrieveAPIView):
    queryset = OrderItem.objects.all()
    serializer_class = OrderItemSerializer
    lookup_field = "pk"
    
order_item_detail_view = OrderItemDetailAPIView.as_view()

# 訂單產品資訊更新
class OrderItemUpdateAPIView(generics.UpdateAPIView):
    queryset = OrderItem.objects.all().order_by('id')
    serializer_class = OrderItemSerializer

order_item_update_view = OrderItemUpdateAPIView.as_view()

# 訂單產品資訊刪除
class OrderItemDestroyAPIView(generics.DestroyAPIView):
    queryset = OrderItem.objects.all().order_by('id')
    serializer_class = OrderItemSerializer    

order_item_destroy_view = OrderItemDestroyAPIView.as_view()



# 用戶列表顯示
class UserOrderListCreateAPIView(generics.ListCreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer

user_view = UserOrderListCreateAPIView.as_view()

# 用戶資訊 可根據id
class UserDetailAPIView(generics.RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    lookup_field = "pk"
    
user_detail_view = UserDetailAPIView.as_view()

# 用戶資訊更新
class UserUpdateAPIView(generics.UpdateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer

user_update_view = UserUpdateAPIView.as_view()

# 用戶資訊刪除
class UserDestroyAPIView(generics.DestroyAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer    

user_destroy_view = UserDestroyAPIView.as_view()


# 用戶密碼變更
class PasswordChangeViewAPIView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        serializer = PasswordChangeSerializer(data=request.data)
        if serializer.is_valid():
            # 確認舊密碼是否正確
            old_password = serializer.validated_data['old_password']
            if not request.user.check_password(old_password):
                return Response({'old_password': ['錯誤密碼']}, status=status.HTTP_400_BAD_REQUEST)
            
            # 更新為新密碼
            request.user.set_password(serializer.validated_data['new_password'])
            request.user.save()

            return Response({'status': ["密碼變更成功"]}, status=status.HTTP_200_OK)
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

password_change_view = PasswordChangeViewAPIView.as_view()