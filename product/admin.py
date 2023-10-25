from django.contrib import admin
from .models import Product, ProductVariant, Category



# 擴增在Product 列表裡面也可以新增產品類別(ProductVariant)
class ProductVariantIiline(admin.TabularInline):
    model = ProductVariant

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ['name', 'price', 'category', 'code', 'status','date_of_create', 'date_of_update']
    inlines = [ProductVariantIiline]
    list_per_page = 25
    search_fields = ['name', 'status', 'date_of_create', 'date_of_update']
    
    
@admin.register(ProductVariant)
class ProductVariantAdmin(admin.ModelAdmin):
    list_display = ['id', 'product', 'size', 'stock']
    list_per_page = 25
    search_fields = ['size', 'stock']
    

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['category_name', 'name']
    list_per_page = 25