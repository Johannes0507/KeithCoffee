# Generated by Django 4.2.5 on 2023-10-11 06:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0006_alter_product_code'),
    ]

    operations = [
        migrations.AlterField(
            model_name='productvariant',
            name='size',
            field=models.CharField(blank=True, max_length=20, null=True, verbose_name='尺寸'),
        ),
    ]