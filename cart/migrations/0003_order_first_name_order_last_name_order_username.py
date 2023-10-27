# Generated by Django 4.2.6 on 2023-10-27 18:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cart', '0002_order_email'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='first_name',
            field=models.CharField(max_length=50, null=True, verbose_name='姓'),
        ),
        migrations.AddField(
            model_name='order',
            name='last_name',
            field=models.CharField(max_length=50, null=True, verbose_name='名'),
        ),
        migrations.AddField(
            model_name='order',
            name='username',
            field=models.CharField(max_length=50, null=True, verbose_name='訂單名'),
        ),
    ]