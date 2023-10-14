# Generated by Django 4.2.6 on 2023-10-08 18:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, verbose_name='商品名稱')),
                ('product_inst', models.CharField(max_length=30, verbose_name='簡介')),
                ('product_desc', models.TextField(max_length=1000, verbose_name='描述')),
                ('image', models.ImageField(upload_to='product_image/')),
                ('price', models.DecimalField(decimal_places=0, max_digits=10, verbose_name='價格')),
                ('code', models.CharField(max_length=10, verbose_name='編號')),
                ('date_of_create', models.DateField(auto_now_add=True)),
                ('date_of_update', models.DateField(auto_now=True)),
                ('category', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='product.category')),
            ],
        ),
        migrations.CreateModel(
            name='ProductVariant',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('size', models.CharField(max_length=20, verbose_name='尺寸')),
                ('color', models.CharField(max_length=20, verbose_name='顏色')),
                ('stock', models.PositiveIntegerField(default=0, verbose_name='庫存')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='product.product', verbose_name='產品')),
            ],
        ),
    ]
