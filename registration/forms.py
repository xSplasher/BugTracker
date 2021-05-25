from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User 
from django import forms

from django.forms import ModelForm
from .models import MyUser

GEEKS_CHOICES =(
    ("1", "M"),
    ("2", "F"),
    ("3", "Three"),
    ("4", "Four"),
    ("5", "Five"),
)

class RegisterForm(UserCreationForm):
    #username = forms.ChoiceField()
    email = forms.EmailField()
    gender = forms.ChoiceField(choices=(('male','M'),('female','F')))
    
    class Meta:
        model = User
        fields = ['username','email','gender']



class TheLogin(ModelForm):
    class Meta:
        model = MyUser
        fields = ['name','lastname']