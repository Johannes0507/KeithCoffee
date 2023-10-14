from .models import Product, ProductVariant, Category
from django.views import generic



# 所有產品顯示
from decimal import Decimal

class ProductsView(generic.ListView):
    model = Product

    def get_queryset(self):
        return Product.objects.filter(status__exact='o').order_by('date_of_create')

    # 定義on sale價格
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        products = Product.objects.all()
        for product in products:
            product.on_sale = round((product.price * Decimal('0.9')), 0)
        context['product_list'] = products
    
        return context
        
# 產品各種類別顯示
class ProductCategoryView(generic.ListView):
    model = Product
    
    # 用來處理資料集
    def get_queryset(self):
        category_name = self.kwargs.get('category') # 取得category參數
        category = Category.objects.get(name=category_name) # 取得category裡面的name資料，不能用Product尋找，因為Product只找到字段。
        return Product.objects.filter(category=category)

    # 用來傳遞資訊到HTML
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        products = Product.objects.all()
        for product in products:
            product.on_sale = round((product.price * Decimal('0.9')), 0)
        context['product_list'] = products
        context = super().get_context_data(**kwargs)
        context['category_name'] = self.kwargs.get('category')
    
        return context


    
# 產品detail
class ProductDetail(generic.DetailView):
    model = Product
    
    
    def get_queryset(self):
        return Product.objects.filter(status__exact='o')