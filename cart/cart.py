# -*- coding: utf-8 -*-
"""
Created on Mon Oct 16 21:19:17 2023

@author: KeithLee
"""

from django.conf import settings
from product.models import ProductVariant, Product

class Cart(object):
    def __init__(self, request):
        # 將傳遞的request對象保存為類的屬性
        self.session = request.session
        cart = self.session.get(settings.CART_SESSION_ID)

        # 如果沒有cart的session就將它設為空值
        if not cart:
            cart =  self.session[settings.CART_SESSION_ID] = {}
        
        self.cart = cart
    
    # 將添加進購物車的商品存入cart的session值product中
    def __iter__(self):
        for productvariant_id, item in self.cart.items():
            product_variant = ProductVariant.objects.filter(pk=productvariant_id)
            for variant in product_variant:
                if variant:
                    item['product'] = variant.product
                    if '1' in variant.size:
                        item['product'].price = item['product'].price * 2
        
                    item['total_price'] = item['product'].price * item['quantity']
                    item['image'] = item['product'].image
                    item['size'] = variant.size
                    item['id'] = variant.id

            yield item
                    
    # 加總購物車所有產品的數量
    def __len__(self):
        # 使用生成器表達式計算購物車中所有商品數量的總和
        return sum(item['quantity'] for item in self.cart.values())
    
    def save(self):
        self.session[settings.CART_SESSION_ID] = self.cart
        self.session.modifield = True
        
    # 向購物車新增或更新
    def add(self, productvariant_id, quantity=1, update_quantity=False):
        productvariant_id = str(productvariant_id)

        # 如果購物車沒有此產品 就添加一個進去
        if productvariant_id not in self.cart:
            self.cart[productvariant_id] = {'id': productvariant_id, 'quantity': 1}

        # 根據產品數量對產品做更新
        if update_quantity:
            self.cart[productvariant_id]['quantity'] += int(quantity)            
            if self.cart[productvariant_id]['quantity'] == 0:
                self.remove(productvariant_id)
                
        self.save()

    # 刪除產品的方法
    def remove(self, productvariant_id):
        if productvariant_id in self.cart:
            del self.cart[productvariant_id]
            self.save()
            
            
    def get_total_cost(self):    
        for p in self.cart.keys():
            self.cart[str(p)]['product'] = ProductVariant.objects.get(pk=p) 
            
        all_price = 0    
        for item in self.cart.values():
            if '1' in item['product'].size:
                variant_price = item['product'].product.price * 2
            else:
                variant_price = item['product'].product.price        
            all_price += int(variant_price * item['quantity']) 
            
        return all_price
    
    def get_total_quantity(self):
        return sum(item['quantity'] for item in self.cart.values())
    
    
    # 查找購物車裡面特定商品的數量
    def get_item(self, productvariant_id):
        return self.cart.get(str(productvariant_id), {}).get('quantity')
    


        
