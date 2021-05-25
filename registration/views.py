from django.shortcuts import render, redirect
from .forms import RegisterForm, TheLogin
from django.views import generic
from .models import *

from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
# Create your views here.

def theindex(response):

    if response.method == 'POST':
        form = TheLogin(response.POST)
        if form.is_valid():
            form.save()
            
        return redirect('/polls/')
    else:
        form = TheLogin()

    return render(response,"registration/register.html",{"form":form})


class RegisterPage(generic.FormView):
    template_name = 'registration/register.html'
    form_class = RegisterForm
    success_url = '/'

    def form_valid(self, form):
        # This method is called when valid form data has been POSTed.
        # It should return an HttpResponse.
        form.save()

        theusername = form.cleaned_data.get('username')
        thegender = form.cleaned_data.get('gender')
        theemail = form.cleaned_data.get('email')

        p = Profile(theUser=User.objects.get(username=theusername),gender=thegender,email=theemail)
        p.save()

        new_user = authenticate(username=theusername, password=form.cleaned_data.get('password1'),)
        login(self.request, new_user)
        #print(form.cleaned_data)
        #print(form.cleaned_data.get('password'))
        return super().form_valid(form)


def logout(response):

    return render(response, "registration/logout.html")