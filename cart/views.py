from django.shortcuts import render

from .cart import Cart

def add_to_cart(request, productvariant_id):
    cart = Cart(request)
    cart.add(productvariant_id)
    
    return render(request, 'partials/menu_cart.html')
    