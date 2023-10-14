# Generated by Django 4.2.5 on 2023-10-11 06:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0007_alter_productvariant_size'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='code',
            field=models.CharField(help_text='請輸入類別的英文名前三個字母，將會自動生成產品編號。', max_length=10, verbose_name='編號'),
        ),
    ]
