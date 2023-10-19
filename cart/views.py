from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from .cart import Cart
from product.models import ProductVariant


# 加入購物圖案視圖
def add_to_cart(request, productvariant_id):
    cart = Cart(request)
    cart.add(productvariant_id)
    
    return render(request, 'partials/menu_cart.html')

# 更新購物車圖樣數字
def hx_menu_cart(request):
    return render(request, 'partials/menu_cart.html')

# 購物車
def cart(request):
    return render(request, 'cart.html')
    

# 用ajax追蹤購物車裡面產品數量
def update_cart(request, productvariant_id, action):
    cart = Cart(request)
    
    # 如果回傳是加
    if action == 'increment':
        cart.add(productvariant_id, 1, True)
    # 否則
    else:
        cart.add(productvariant_id, -1, True)
        
    productvariant = ProductVariant.objects.get(pk=productvariant_id)
    quantity = cart.get_item(productvariant_id) # 使用get_item來獲取產品數量

    # 對size不一樣產品做價格的調整
    if '1' in productvariant.size:
        variant_price = productvariant.product.price * 2
    else:
        variant_price = productvariant.price
    
    # 設定回傳的值
    item = {
        'product': {
                'id': productvariant.id,
                'name': productvariant.product.name,
                'image': productvariant.product.image,
                'price': variant_price,
            },
        'total_price': (quantity * variant_price),
        'quantity': quantity,
        }
    
    reponse = render(request, 'partials/cart_item.html', {'item': item})
    reponse['HX-Trigger'] = 'update-menu-cart' # 返回ajax
    
    return reponse


# 確認訂單
@login_required 
def checkout(request):
    return render(request, 'checkout.html')
    
