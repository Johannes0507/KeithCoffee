# Generated by Django 4.2.5 on 2023-10-11 10:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0008_alter_product_code'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='code',
            field=models.CharField(blank=True, help_text='請輸入類別的英文名前三個字母，將會自動生成產品編號。', max_length=10, verbose_name='編號'),
        ),
    ]
