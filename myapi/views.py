from cart.models import Order, OrderItem
from product.models import Product, ProductVariant

from .serializers import (
    ProductSerializer, ProductVariantSerializer, 
    OrderSerializer, OrderItemSerializer)
from rest_framework import generics



# 產品 創見&顯示
class ProductListCresteAPIView(generics.ListCreateAPIView):
    queryset = Product.objects.all().order_by('id')
    serializer_class = ProductSerializer

product_list_create_view = ProductListCresteAPIView.as_view()

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
    
product_variant_detail_view = ProductDetailAPIView.as_view()

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
    serializer_class = OrderSerializer

order_item_update_view = OrderItemUpdateAPIView.as_view()

# 訂單產品資訊刪除
class OrderItemDestroyAPIView(generics.DestroyAPIView):
    queryset = OrderItem.objects.all().order_by('id')
    serializer_class = OrderItemSerializer    

order_item_destroy_view = OrderItemDestroyAPIView.as_view()