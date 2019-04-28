# Generated by Django 2.2 on 2019-04-27 16:55

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_name', models.CharField(max_length=200)),
                ('product_price', models.IntegerField()),
                ('promo', models.CharField(max_length=100)),
                ('expiry_date', models.CharField(max_length=100)),
                ('description', models.TextField(blank=True)),
                ('is_published', models.BooleanField(default=False)),
                ('add_date', models.DateTimeField(blank=True, default=datetime.datetime.now)),
            ],
        ),
    ]