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

# 更新購物車商品總數
def hx_cart_total_quantity(request):
    return render(request, 'partials/cart_total_quantity.html')

# 更新購物車總價格
def hx_cart_total(request):
    return render(request, 'partials/cart_total.html')


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
            'total_price': round(int(Decimal(quantity) * product.price) * 0.9), # 顯示折扣價格
            }
    else:
        item = None
    
    reponse = render(request, 'partials/cart_item.html', {'item': item})
    reponse['HX-Trigger'] = 'update-menu-cart' # 返回ajax
    
    return reponse


# 建立訂單&訂單確認
from .models import Order, OrderItem

@login_required 
def checkout(request):
    if request.method == 'POST':
        user = request.user
        first_name = request.POST.get('first_name', '')
        last_name = request.POST.get('last_name', '')
        username = request.POST.get('username', '')
        shipping_address = request.POST.get('shipping_address', '')
        another_address = request.POST.get('another_address', '')
        total_amount = request.POST.get('total_amount', '')
        email = request.POST.get('email', '')
        
        order_done = Order.objects.create(
            user=user, 
            first_name=first_name,
            last_name=last_name,
            username=username,
            shipping_address=shipping_address, 
            another_address=another_address,
            total_amount=total_amount,
            email=email,    
            )
        
        # 獲取cart裡面資料
        cart = Cart(request)
                
        if cart:
            for item in cart:
                productvariant_id = item['id']
                productvariant = ProductVariant.objects.get(pk=productvariant_id)
                quantity = item['quantity']
                price = item['total_price']
                
                order_item_done = OrderItem(
                    order=order_done, # 這裡存取上面已經建立好的訂單內容
                    product=productvariant, 
                    quantity=quantity,
                    price=price,
                    )
                order_item_done.save()                
        else:
            cart = {}
            
        return redirect('ecpay') # 儲存訂單後跳轉到綠界測試頁面
    
    return render(request, 'checkout.html')


# 綠界串接測試
from .ecpay_testing import main
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse

@csrf_exempt # 讓第三方可以審略csrf進到裡面
def ecpay_view(request):    
    
    return HttpResponse(main(request))


