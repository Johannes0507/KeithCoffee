from django.db import models
from django.contrib.auth.models import User
from product.models import ProductVariant


class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    first_name = models.CharField(verbose_name='姓', max_length=50, null=True)
    last_name = models.CharField(verbose_name='名', max_length=50, null=True)
    username = models.CharField(verbose_name='訂單者名稱', max_length=50, null=True)
    shipping_address = models.CharField(verbose_name='地址', max_length=200)
    another_address = models.CharField(verbose_name='其他地址', max_length=200, blank=True, null=True)
    total_amount = models.IntegerField(verbose_name='總金額')
    email = models.CharField(verbose_name='信箱', max_length=100, blank=True, null=True)
    
    order_create = models.DateTimeField('創建日期', auto_now_add=True)
    order_update = models.DateTimeField('修改日期',auto_now=True)

    ORDER_STATUS = (        
        ('S', 'Shipped'),
        ('B', 'Backlog_order')
        )
    status = models.CharField(
        blank=True,
        verbose_name='訂單狀態',
        max_length=1,        
        choices=ORDER_STATUS,
        default='B',
        )
    
    class Meta:
        ordering = ['-order_create']
        
    def __str__(self):
        return self.user.get_full_name()

class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(ProductVariant, verbose_name='產品', on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField('數量')
    price = models.IntegerField('總金額')
    
    class Meta:
        ordering = ['-id']
    
