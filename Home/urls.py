# -*- coding: utf-8 -*-
"""
Created on Mon Oct  9 18:19:42 2023

@author: KeithLee
"""

from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    ]