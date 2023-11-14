# -*- coding: utf-8 -*-
"""
Created on Thu Nov  2 14:25:35 2023

@author: KeithLee
"""

from cart.models import Order, OrderItem
from rest_framework import serializers
from product.models import Product, ProductVariant, Category


class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'
        
        
class OrderItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderItem
        fields = '__all__'
        
        
class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'
        

class ProductVariantSerializer(serializers.ModelSerializer):
    class Meta:
        model =  ProductVariant
        fields = '__all__'
        
        
class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'
    