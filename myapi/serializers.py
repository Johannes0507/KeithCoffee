# -*- coding: utf-8 -*-
"""
Created on Thu Nov  2 14:25:35 2023

@author: KeithLee
"""

from cart.models import Order, OrderItem
from rest_framework import serializers
from product.models import Product


class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'
        
        
        
class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        field = '__all__'