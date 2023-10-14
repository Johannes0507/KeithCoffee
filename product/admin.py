from django.contrib import admin
from .models import Product, ProductVariant, Category




class ProductVariantIiline(admin.TabularInline):
    model = ProductVariant

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'price', 'category', 'code', 'status','date_of_create', 'date_of_update')
    inlines = [ProductVariantIiline]
    
    
@admin.register(ProductVariant)
class ProductVariantAdmin(admin.ModelAdmin):
    list_display = ('product', 'size', 'stock')    
    


admin.site.register(Category)