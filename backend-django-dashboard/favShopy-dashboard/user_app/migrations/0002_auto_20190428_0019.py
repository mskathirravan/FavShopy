# Generated by Django 2.2 on 2019-04-27 18:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user_app', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='product_price',
            field=models.CharField(max_length=200),
        ),
    ]
