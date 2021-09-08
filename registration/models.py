from django.db import models
import string
import random
from django.contrib.auth.models import User

from django.db.models.signals import post_save
from django.dispatch import receiver

# Create your models here.

def createID():
    thewords = string.ascii_letters + '0123456789'
    return ''.join(random.choices(thewords,k=15))

class MyUser(models.Model):
    theid = models.CharField(default=createID,max_length=15)
    username = models.CharField(max_length=60)
    name = models.CharField(max_length=30)
    lastname = models.CharField(max_length=30)

    def __str__(self):
        return str(self.name + ' ' + self.theid)




