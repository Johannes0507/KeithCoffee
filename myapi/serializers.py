from cart.models import Order, OrderItem
from rest_framework import serializers
from product.models import Product, ProductVariant, Category
from django.contrib.auth.models import User

from rest_framework.reverse import reverse

# 產品
class ProductSerializer(serializers.ModelSerializer):
    custome_url = serializers.SerializerMethodField()
    variants = serializers.HyperlinkedRelatedField(
        many = True,
        read_only = True,
        view_name = 'variant-detail'
        )
    class Meta:
        model = Product
        fields = [
            'name',
            'product_inst',
            'product_desc',
            'image',
            'price',
            'code',
            'category',
            'status',
            'custome_url',
            'variants'
        ]

    def get_custome_url(self, obj):
        request = self.context.get('request')
        if request is None:
            return None
        urls = {
            'detail': reverse("product-detail", kwargs={"pk": obj.pk}, request=request),
            'edit': reverse("api-product-edit", kwargs={"pk": obj.pk}, request=request),
            'destroy': reverse("product-destroy", kwargs={"pk": obj.pk}, request=request)
        }       

        return urls

    
# 產品變數
class ProductVariantSerializer(serializers.ModelSerializer):
    custome_url = serializers.SerializerMethodField()
    
    class Meta:
        model =  ProductVariant
        fields = [
            'product',
            'size',
            'date_of_create',
            'date_of_update',       
            'custome_url'
        ]

    def get_custome_url(self, obj):
        request = self.context.get('request')
        if request is None:
            return None
        urls = {
            'detail': reverse("variant-detail", kwargs={"pk": obj.pk}, request=request),
            'edit': reverse("variant-edit", kwargs={"pk": obj.pk}, request=request),
            'destroy': reverse("variant-destroy", kwargs={"pk": obj.pk}, request=request)
        }       

        return urls

# 訂單
class OrderSerializer(serializers.ModelSerializer):
    custome_url = serializers.SerializerMethodField()
    orderitems = serializers.HyperlinkedRelatedField(
        many = True,
        read_only = True,
        view_name = 'item-detail'
        )    
    
    class Meta:
        model = Order
        fields = [
            'user',
            'first_name',
            'last_name',
            'username',            
            'shipping_address',
            'another_address',
            'total_amount',
            'email',
            'orderitems',
            'custome_url'
        ]

    def get_custome_url(self, obj):
        request = self.context.get('request')
        if request is None:
            return None
        
        urls = {
            'detail': reverse('order-detail', kwargs={'pk': obj.pk}, request=request),
            'edit': reverse('order-edit', kwargs={'pk': obj.pk}, request=request),
            'destroy': reverse('order-destroy', kwargs={'pk': obj.pk}, request=request),
        }
        
        return urls

    
# 訂單資訊
class OrderItemSerializer(serializers.ModelSerializer):
    custome_url = serializers.SerializerMethodField()

    class Meta:
        model = OrderItem
        fields = [
            'order',
            'product',
            'price',
            'quantity',
            'custome_url',
        ]

    def get_custome_url(self, obj):
        request = self.context.get('request')
        if request is None:
            return None
        
        urls = {
            'detail': reverse('item-detail', kwargs={'pk': obj.pk}, request=request),
            'edit': reverse('item-edit', kwargs={'pk': obj.pk}, request=request),
            'destroy': reverse('item-destroy', kwargs={'pk': obj.pk}, request=request),
        }
        
        return urls    

        
# 種類
class CategorySerializer(serializers.ModelSerializer):
    products = serializers.HyperlinkedRelatedField(
        many = True,
        read_only = True,
        view_name = 'product-detail',
    )

    class Meta:
        model = Category
        fields = [
            'id',
            'name',
            'category_name',
            'products',
        ]        


# 使用者
class UserSerializer(serializers.ModelSerializer):
    full_name = serializers.SerializerMethodField()
    custome_url = serializers.SerializerMethodField()
    orders = serializers.HyperlinkedRelatedField(
        many = True,
        read_only = True,
        view_name = 'order-detail'
        )

    class Meta:
        model = User
        fields = [
            'username',
            'first_name',
            'last_name',
            'email',
            'full_name',
            'custome_url',
            'orders'
        ]

    # 組合名字和姓氏來創建全名
    def get_full_name(self, obj):
        return f"{obj.first_name}{obj.last_name}"
    
    def get_custome_url(self, obj):
        request = self.context.get('request')
        if request is None:
            return None
        
        urls = {
            'detail': reverse('user-detail', kwargs={'pk': obj.pk}, request=request),
            'edit': reverse('user-edit', kwargs={'pk': obj.pk}, request=request),
            'destroy': reverse('user-destroy', kwargs={'pk': obj.pk}, request=request),
        }
        
        return urls    

        

class PasswordChangeSerializer(serializers.Serializer):
    old_password = serializers.CharField(required=True)
    new_password = serializers.CharField(required=True)
