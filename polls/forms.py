from django import forms
from django.forms import ModelForm
from .models import *

class CreateNewProject(ModelForm):
    class Meta:
        model = Projects
        fields = ['name']

class CreateNewProjectTwo(forms.Form):
    name = forms.CharField()
    message = forms.CharField(widget=forms.Textarea)

    def send_email(self):
        # send email using the self.cleaned_data dictionary
        pass