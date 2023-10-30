from django.contrib import admin
from .models import Order, OrderItem


# Register your models here.

@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'shipping_address', 'email', 'status', 'order_create']

@admin.register(OrderItem)
class OrderItem(admin.ModelAdmin):
    list_display = ['order_id', 'product', 'quantity', 'price']

    def order_id(self, obj):        
        return obj.order.id