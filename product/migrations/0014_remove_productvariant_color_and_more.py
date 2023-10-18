# Generated by Django 4.2.6 on 2023-10-12 18:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0013_alter_product_options_alter_product_status'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='productvariant',
            name='color',
        ),
        migrations.AlterField(
            model_name='product',
            name='date_of_create',
            field=models.DateField(auto_now_add=True, verbose_name='創建日期'),
        ),
        migrations.AlterField(
            model_name='product',
            name='date_of_update',
            field=models.DateField(auto_now=True, verbose_name='修改日期'),
        ),
        migrations.AlterField(
            model_name='productvariant',
            name='size',
            field=models.CharField(blank=True, max_length=20, null=True, verbose_name='產品變量'),
        ),
    ]