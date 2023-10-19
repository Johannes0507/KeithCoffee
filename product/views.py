from .models import Product, ProductVariant, Category
from django.shortcuts import render
from django.views import generic
    

# 所有產品顯示頁面

class ProductsView(generic.ListView):
    model = Product
    paginate_by = 12
    
    def get_queryset(self):
        searchp = self.request.GET.get('searchp', '')
        sort_option = self.request.GET.get('sort_option', '')
        
    
        if searchp:
            queryset = Product.objects.filter(name__icontains=searchp)
        else:
            queryset = Product.objects.filter(status__exact='o')
    
        if sort_option == 'new':
            queryset = queryset.order_by('-date_of_create')
        elif sort_option == 'ud':
            queryset = queryset.order_by('-price')
        elif sort_option == 'du':
            queryset = queryset.order_by('price')
            
        return queryset
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['searchp'] = self.request.GET.get('searchp', '')
        context['sort_option'] = self.request.GET.get('sort_option', '')
        return context

        
# 產品各種類別顯示頁面
class ProductCategoryView(generic.ListView):
    model = Product
    paginator_by = 12
    template_name = 'product/product_category_list.html'
    
    # 用來處理資料集
    def get_queryset(self):
        category_n = self.kwargs.get('category') # 取得category參數
        category = Category.objects.get(name=category_n) # 取得category裡面的name資料，不能用Product尋找，因為Product只找到字段。
        if category:
           queryset = Product.objects.filter(category=category)     
        
        searchp = self.request.GET.get('searchp', '')
        sort_option = self.request.GET.get('sort_option', '')            

        if searchp:
            queryset = queryset.filter(name__icontains=searchp)
    
        if sort_option == 'new':
            queryset = queryset.order_by('-date_of_create')
        elif sort_option == 'ud':
            queryset = queryset.order_by('-price')
        elif sort_option == 'du':
            queryset = queryset.order_by('price')
        
        return queryset
    
    
    # 用來傳遞資訊到HTML
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['category_n'] = self.kwargs.get('category')
        context['searchp'] = self.request.GET.get('searchp', '')
        context['sort_option'] = self.request.GET.get('sort_option', '')

        return context


# 最新產品顯示頁面
class NewProductsView(generic.ListView):
    mdoel = Product
    template_name = 'product/product_new_list.html'
    
    # 無法在最新產品頁面內用切片搜尋完的產品資料再去做條件搜尋。
    def get_queryset(self):
        searchp = self.request.GET.get('searchp', '')
        sort_option = self.request.GET.get('sort_option', '')   
        queryset = Product.objects.filter(status__exact='o')
        if searchp:
            # 如果搜尋參數存在，過濾查詢集合。
            queryset = queryset.filter(name__icontains=searchp)
    
        if sort_option == 'new':
            # 根據排序參數排序
            queryset = queryset.order_by('-date_of_create')[:12]
        elif sort_option == 'ud':
            queryset = queryset.order_by('-price', '-date_of_create')[:12]
        elif sort_option == 'du':
            queryset = queryset.order_by('price', '-date_of_create')[:12]
        else:
            queryset = queryset.order_by('-date_of_create')[:12]
        
        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['searchp'] = self.request.GET.get('searchp', '')
        context['sort_option'] = self.request.GET.get('sort_option', '')
        return context


    
# 產品detail顯示頁面
class ProductDetailView(generic.DetailView):
    model = Product
    def get_queryset(self):
        
        return Product.objects.filter(status__exact='o')