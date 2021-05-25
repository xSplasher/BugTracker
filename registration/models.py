from django.db import models
import string
import random
from django.contrib.auth.models import User

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


class Profile(models.Model):
    theUser = models.ForeignKey(User, on_delete=models.CASCADE, editable=False)
    gender = models.CharField(max_length=2)
    email = models.EmailField()

    def __str__(self):
        return str(self.theUser)


