# Generated by Django 4.2.6 on 2023-10-30 14:21

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0018_alter_category_name'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='productvariant',
            name='stock',
        ),
    ]
