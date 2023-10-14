from django.db import models
from product.models import Product



# Create your models here.


class ShopingCart(models.Model):
    product = models.ForeignKey(Product, verbose_name='產品名稱',on_delete=models.CASCADE)