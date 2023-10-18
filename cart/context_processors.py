# -*- coding: utf-8 -*-
"""
Created on Mon Oct 16 22:55:55 2023

@author: KeithLee
"""

from .cart import Cart

def cart(request):
    return {'cart': Cart(request)}