from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from .cart import Cart
from product.models import ProductVariant, Product


# 加入購物圖案視圖
def add_to_cart(request, productvariant_id):
    cart = Cart(request)
    cart.add(productvariant_id)
    
    return render(request, 'partials/menu_cart.html')

# 更新購物車圖樣數字
def hx_menu_cart(request):
    return render(request, 'partials/menu_cart.html')

# 更新購物車總價格
def hx_cart_total(request):
    return render(request, 'partials/cart_total.html')

# 更新購物車商品總數
def hx_cart_total_quantity(request):
    return render(request, 'partials/cart_total_quantity.html')

# 購物車
def cart(request):
    return render(request, 'cart.html')
    

from decimal import Decimal
# 用ajax追蹤購物車裡面產品數量
def update_cart(request, productvariant_id, action):
    cart = Cart(request)
    
    # 回傳數量加一
    if action == 'increment':
        cart.add(productvariant_id, 1, True)
    # 回傳數量減一
    elif action == 'decrement':        
        cart.add(productvariant_id, -1, True)
        
    productvariant = ProductVariant.objects.get(pk=productvariant_id)
    product =  Product.objects.get(pk=productvariant.product.id)
    
    quantity = cart.get_item(productvariant_id) # 使用get_item來獲取產品數量
    if quantity:
        quantity = quantity['quantity']
        
        # 對size不一樣產品做價格的調整
        if '1' in productvariant.size:
            product.price = product.price * 2
            
        
        # 設定回傳的值
        item = {
            'id': productvariant_id,
            'image': product.image,
            'product': product,
            'quantity': quantity,
            'size': productvariant.size,
            'total_price': (Decimal(quantity) * product.price),
            }
    else:
        item = None
    
    reponse = render(request, 'partials/cart_item.html', {'item': item})
    reponse['HX-Trigger'] = 'update-menu-cart' # 返回ajax
    
    return reponse


# 從購物車移除商品
def remove_cart(request):
    cart = Cart(request)
    if request.method== 'POST':
        productvariant_id = request.POST.get('remove_cart', '')
        cart.remove(productvariant_id)
        
    return redirect('cart')


# 確認訂單
@login_required 
def checkout(request):
    return render(request, 'checkout.html')


# 綠界串接測試
from .ecpay_testing import main
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse

@csrf_exempt
def ecpay_view(request):    
    return HttpResponse(main())