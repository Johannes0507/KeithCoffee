# Generated by Django 4.2.6 on 2023-10-08 18:31

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0003_alter_product_code'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='productvariant',
            options={'ordering': ['date_of_create']},
        ),
        migrations.AddField(
            model_name='productvariant',
            name='date_of_create',
            field=models.DateField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='productvariant',
            name='date_of_update',
            field=models.DateField(auto_now=True),
        ),
    ]