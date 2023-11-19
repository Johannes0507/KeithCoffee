from django.db import models


# 產品類別資料庫
class Category(models.Model):
    name = models.CharField(verbose_name='商品種類英文簡稱', max_length=10)
    category_name = models.CharField('商品中文名', null=True, blank=True, max_length=30)
    
    def __str__(self):
        return self.category_name


# 產品資料庫
from decimal import Decimal
from django.urls import reverse

class Product(models.Model):
    name = models.CharField('商品名稱', max_length=100)
    product_inst = models.CharField('簡介', max_length=30, help_text='請輸入產品簡介，限定30個字。')
    product_desc = models.TextField('描述', max_length=1000, help_text='請輸入產品詳細敘述，限定1000個字。')
    image = models.ImageField(upload_to='product_image/')
    price = models.DecimalField('價格', max_digits=10, decimal_places=0)
    code = models.CharField('編號', max_length=10, blank=True, null=True,help_text='可自訂，也可根據類別自動生成編碼')
    category = models.ForeignKey(Category, 
                                 related_name='products', 
                                 verbose_name='商品種類',
                                 on_delete=models.SET_NULL, 
                                 null=True
                                 )
    
    date_of_create = models.DateField('創建日期', auto_now_add=True)
    date_of_update = models.DateField('修改日期',auto_now=True)
    
    SHELVS_STATUS = (
        ('o', '上架'),
        ('u', '下架'),
        )    
    
    status = models.CharField(
        verbose_name='上架狀態',
        max_length=1,
        choices=SHELVS_STATUS,
        blank=True,
        default='o',
        help_text='架上狀態',
        )
    
    class Meta:
        ordering = ['-date_of_create']
    
    def __str__(self):
        return self.name
    
    def get_absolute_url(self):
        return reverse('product-detail', args=[str(self.id)])
    
    def query_set(self):
        return self.id

    # 定義折扣價格
    @property
    def on_sale(self):
        return round((self.price * Decimal('0.9')), 0)
    
    
# 保存產品編碼信號設定
from django.db import models # 用於定義資料模型
# 導入Django的post_save信號，用於在模型實例保存後發送信號
from django.db.models.signals import post_save
# 導入receiver裝飾器，它用於將信號處理函數與信號關聯 
from django.dispatch import receiver

"""
信號處理函數，用於生成和保存code
sender：發送信號的模型。
instance：接收信號的模型的實例。
created：一個布林值，指示是否正在創建新的實例。
**kwargs：是用於接收其他可能的關鍵字參數的字典。
"""
@receiver(post_save, sender=Product)
def generate_product_code(sender, instance, created, **kwargs):
    if created and not instance.code:  # 只在對象創建時運行，確保code字段為空
        product_code = f"{instance.category} - {instance.id:04d}"
        instance.code = product_code
        instance.save() # 保存生成的code回數據庫

        
    
# 產品子類別資料庫
class ProductVariant(models.Model):
    product = models.ForeignKey(Product, related_name='variants', verbose_name='產品' , on_delete=models.CASCADE)
    size = models.CharField('產品變量', max_length=20, null=True, blank=True) # 產品尺寸

    date_of_create = models.DateField(auto_now_add=True) # 新增時間
    date_of_update = models.DateField(auto_now=True) # 更新時間
    

    class Meta:
        ordering = ['date_of_create'] 
    
    
    def __str__(self):
        return self.product.name

    @property
    def pound(self):
        return round((self.price * Decimal('0.9') * 2), 0)
