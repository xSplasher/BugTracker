from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse
from django.views import generic
from django.contrib.auth import get_user_model


import random
from .models import *

Users = get_user_model()



'''
class IndexView(generic.ListView):
    template_name = 'polls/index.html'
    context_object_name = 'issues'

    def get_queryset(self):
        """Return the last five published questions."""
        return Issues.objects.all()#Question.objects.order_by('-pub_date')[:5]

    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['bruh'] = 'DUUUUUDE'
        return context
'''


def random_with_N_digits(n):
    range_start = 10**(n-1)
    range_end = (10**n)-1
    return random.randint(range_start, range_end)


class IndexView(generic.View):
    template_name = 'polls/index.html'    
    
    def get(self, request, *args, **kwargs):
        #theqs = list(Issues.objects.all().values_list('issue_name', flat=True))
        theissues = Issues.objects.all().order_by('-at')
        return render(request,self.template_name,{'issues':theissues})

    def post(self, request, *args, **kwargs):
        return HttpResponse('POST request!')


class IndexMyTicketsView(generic.View):
    template_name = 'polls/index.html' 

    def get(self, request, *args, **kwargs):

        if request.user.is_authenticated:
            theissues = Issues.objects.all().filter(created_by=request.user.username).order_by('-at')
            return render(request,self.template_name,{'issues':theissues})

    def post(self, request, *args, **kwargs):
        return HttpResponse('POST request!')


'''
class IssueView(generic.View):
    template_name = 'polls/issue.html'    

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)

    def post(self, request, *args, **kwargs):
        return render(request, self.template_name)

'''

class IssueView(generic.DetailView):    
    model = Issues
    template_name = 'polls/issue.html'
    slug_field = 'theid'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['comments'] = Comments.objects.filter(theIssue=self.get_object()).order_by('-at')
        return context

    def post(self, request, *args, **kwargs):
        print(self.get_object().created_by)
        
        if request.user.is_authenticated:
            thecomment = Comments(theIssue=self.get_object(),comment=self.request.POST['thetext'],created_by=self.request.user.username)
            thecomment.save()
            if request.user.username != self.get_object().created_by.lower():
                thenotification = Notifications(toUser=self.get_object().created_by,thetext='New Comment from '+self.request.user.username+' !',theLink='/issue/'+str(self.get_object().theid),IssueReference=self.get_object())         
                thenotification.save()
            return HttpResponseRedirect("") #render(request, self.template_name)
        
        else:
            return HttpResponseRedirect("")


class DetailView(generic.DetailView):
    model = Question
    template_name = 'polls/detail.html'


class ResultsView(generic.DetailView):
    model = Question
    template_name = 'polls/results.html'


class CreateIssueView(generic.View):
    template_name = 'polls/createissue.html'
    
    def get(self, request, *args, **kwargs):
        print(self.request.user.username)
        theusers = Users.objects.all()
        return render(request, self.template_name,{'theuserlist': theusers})

    def post(self, request, *args, **kwargs):
        #print(request.POST['thetext'])

        if request.user.is_authenticated:
            theprio = ''
            
            if request.POST['priority'] == 'low' or request.POST['priority'] == 'medium' or request.POST['priority'] == 'high' or request.POST['priority'] == 'critical':           
                theprio = request.POST['priority']
            else:
                theprio = 'low'
            if request.POST['issueText'] != '':
                thenewid = random_with_N_digits(15)
                theitem = Issues(theid=thenewid,issue_name=request.POST['issueText'],created_by=self.request.user.username,text=request.POST['text'],priority=theprio,assignto=request.POST['assignto'])
                theitem.save()
                if request.user.username != request.POST['assignto'].lower():
                    print(request.user.username,request.POST['assignto'],request.POST['assignto'].lower())
                    thenotification = Notifications(toUser=request.POST['assignto'],thetext='You have a new assignement from '+self.request.user.username+' !',theLink='/issue/'+str(thenewid),IssueReference=theitem)         
                    thenotification.save()

                return redirect('/issue/'+str(thenewid))
        
            else:
                return HttpResponseRedirect("")
        else:
            return HttpResponseRedirect("")
           
        

class GetNote(generic.View):
    template_name = 'polls/getnote.html'

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)

    def post(self, request, *args, **kwargs):
        theobs = Issues.objects.filter(created_by=request.POST['thename'])
        print(theobs)
        return render(request, self.template_name,{'info':theobs})

def vote(request):
    return render(request, "polls/vote.html", {'theshit':'NO ITS NOT dood'})


def theindex(request):
    return render(request, "polls/theindex.html", {'theshit':'NO ITS NOT dood'})


'''
from django.shortcuts import get_object_or_404,render
from django.http import Http404
from django.http import HttpResponse
from django.template import loader

from .models import Question
# Create your views here.

def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    context = {'latest_question_list':latest_question_list,}
    return render(request,'polls/index.html',context)

def detail(request, question_id):    
    question = get_object_or_404(Question,pk=question_id)
    return render(request,'polls/detail.html',{'question':question})

def results(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/results.html', {'question': question})

def vote(request, question_id):
    return HttpResponse("You're voting on question %s." % question_id)
'''