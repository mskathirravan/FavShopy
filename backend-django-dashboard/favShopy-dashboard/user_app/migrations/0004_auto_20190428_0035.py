# Generated by Django 2.2 on 2019-04-27 19:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user_app', '0003_auto_20190428_0021'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='product_price',
            field=models.CharField(max_length=200),
        ),
    ]
