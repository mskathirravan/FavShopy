from django.db import models
from datetime import datetime


# Create your models here.
class Product(models.Model):
    product_name = models.CharField(max_length=200)
    product_price = models.CharField(max_length=200)
    promo = models.CharField(max_length=100)
    expiry_date = models.CharField(max_length=100)
    description = models.TextField(blank=True)
    is_published = models.BooleanField(default=False)
    #add_date = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return "{},{},{},{},{}".format(self.product_name,self.product_price,self.promo,self.expiry_date,self.description,str(self.is_published))
        #return self.product_name + '-' + self.product_price + '-' + self.promo + '-'+ self.expiry_date+ '-' + self.description + '-' + str(self.is_published)
