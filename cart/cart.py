# -*- coding: utf-8 -*-
"""
Created on Mon Oct 16 21:19:17 2023

@author: KeithLee
"""

from django.conf import settings
from product.models import ProductVariant

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
        # 取得商品識別碼（通常是產品的主鍵）
        for p in self.cart.keys():
         # 透過識別碼從資料庫中取得對應的 ProductVariant 對象            
            self.cart[str(p)]['product'] = ProductVariant.objects.get(pk=p)
            
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

        # 如果購物車沒有產品 就添加一進去
        if productvariant_id not in self.cart:
            self.cart[productvariant_id] = {'id': productvariant_id, 'quantity': 1}

        # 根據產品數量對產品做更新
        if update_quantity:
            self.cart[productvariant_id]['quantity'] += int(quantity)
            
            if self.cart[productvariant_id]['quantity'] == 0:
                self.remove[productvariant_id]
                
        self.save()

    # 刪除產品的方法
    def remove(self, product_id):
        if product_id in self.cart:
            del self.cart[product_id]
            self.save()