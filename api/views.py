from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, Http404
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.views import APIView
#from rest_framework_jwt.utils import jwt_decode_handler

# Create your views here.
from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from rest_framework import permissions
from api.serializers import *
from .models import *
from django.contrib.auth.models import User
import random


def random_with_N_digits_15():
    range_start = 10**(15-1)
    range_end = (10**15)-1
    return str(random.randint(range_start, range_end))


class GetAllIssues(APIView):
    permission_classes = (permissions.AllowAny,)
    def get(self, request):
        return JsonResponse({'status':'success','data':IssuesSerializer(Issues.objects.all(), many=True).data})


class GetIssue_theid(APIView):
    permission_classes = (permissions.IsAuthenticated,)
    def get(self, request, pk):
        try:
            element = IssuesSerializer(Issues.objects.get(theid=pk))
        except:
            print('GET API request query failed: the id provided is not found')
            raise Http404
        #print(element.data['project_it_belongs_to'])
        try:
            isModerator = request._user.profile.isModerator
        except:
            isModerator = False
        return JsonResponse({'status':'success','isModerator':isModerator,'data':element.data})


    def put(self, request, pk):

        if request.data['newstate'] == 'makeittrue':
        
            try:
                element = Issues.objects.get(theid=pk)
            except:
                print('PUT API request query failed: the id provided is not found ### GetIssue_theid->put')
                raise Http404

            if (request.user.username == element.created_by) or request._user.profile.isModerator:
                element.isIssueSolved = True
                element.save()
                return JsonResponse({'status':'success'})


        if request.data['newstate'] == 'update_issue':
            try:
                element = IssuesSerializer(Issues.objects.get(theid=pk), data=request.data)
            except:
                print('PUT API request query failed: the id provided is not found ### GetIssue_theid->put')
                raise Http404
            
            if element.is_valid():
                print("PUT Request Succeeded")
                element.save()
                newel = IssuesSerializer(Issues.objects.get(theid=pk))
                return JsonResponse({'status':'success','data':newel.data})

        return JsonResponse({'status':'failure'})
        

    ''' GENERAL PURPOSE PUT // Change anything if u want but the one above is specific for 'Mark as solved' 
        def put(self, request, pk):
            try:
                element = IssuesSerializer(Issues.objects.get(theid=pk), data=request.data)
            except:
                print('PUT API request query failed: the id provided is not found')
                raise Http404
            if element.is_valid():
                print("PUT Request Succeeded")
                element.save()
                newel = IssuesSerializer(Issues.objects.get(theid=pk))
                return JsonResponse({'status':'success','data':newel.data})
            
            else:
                return JsonResponse({'status':'failure'})
        
    '''
    def delete(self, request, pk):
        try:
            element = Issues.objects.get(theid=pk)
        except:
            print('DELETE API request query failed: the id provided is not found')
            raise Http404
        

        if (request.user.username == element.created_by) or request._user.profile.isModerator:
            element.delete()
            print("DELETE Request Succeeded")
            return JsonResponse({'status':'success'})
        else:
            print('something went wrong')
            return JsonResponse({'status':'failure'})

        

class CreateIssue(APIView):
    permission_classes = (permissions.IsAuthenticated,)

    def post(self, request):
        try:
            theobj = Projects.objects.get(name=request.data['project_it_belongs_to'])
        except:
            print('POST API request query failed: the id provided is not found ### CreateIssue->post')
            return JsonResponse({'status':'failure'})
        #print(theobj)
        #request.data._mutable = True
        request.data.update({'project_it_belongs_to':theobj.id})
        #request.data._mutable = False
        #print(request.data)
        #print('#######')
        ser = IssuesSerializer(data=request.data)
        
        if ser.is_valid():
            ser.save()
            #ser.data['yo'] ='bruh'
            #print(ser.data)
            print('Successfully Created Issue!')            
            return JsonResponse({'status':'success'}) #,'data':ser.data
        #print(ser.data)
        return JsonResponse({'status':'failure'})


class ProjectsGet(APIView):
    
    def get(self, request, pk=''):

        try:
            if pk:
                els = Projects.objects.get(theid=pk)
                #print(IssuesSerializer(els.issues, many=True).data)
                return JsonResponse({'status':'success','projectName':els.name,'data':IssuesSerializer(els.issues, many=True).data})
                
            return JsonResponse({'status':'success','data':ProjectSerializer(Projects.objects.all(), many=True).data})
        except:
            return JsonResponse({'status':'failure'})

    
class NewProjects(APIView):
    permission_classes = (permissions.IsAuthenticated,)

    def post(self, request):        
        if request._user.profile.isModerator:
            try:
                Projects.objects.create(theid=random_with_N_digits_15(),name=request.data['project_name'])
                print('yo')
            except:
                print('POST API request query failed: ### NewProjects->post')
                return JsonResponse({'status':'failure'})

            return JsonResponse({'status':'success','data':request.data})

        else:
            return JsonResponse({'status':'failure','data':'not mod'})
        

class CommentsGet(APIView):
    permission_classes = (permissions.IsAuthenticated,)

    
    def get(self, request, pk):
        #theissue = Issues.objects.get(theid=pk)
        #print(theissue.theid)
        #thetest = Comments.objects.all()
        #print(thetest[0].theIssue)
        thecomments = CommentsSerializer(Comments.objects.filter(theIssue__theid=pk), many=True).data
        return JsonResponse({'status':'success','data':thecomments})

    def put(self, request, pk):

        if request.data['newstate'] == 'makeittrue':
            try:
                thecomment = Comments.objects.get(commentId=pk)
            except:
                print('PUT API request query failed: the id provided is not found ### CommentGet->put')
                raise Http404
            thecomment.isThisCommentSolution = True         
            thecomment.theIssue.isIssueSolved = True
            thecomment.theIssue.save()
            thecomment.save()
            return JsonResponse({'status':'success'})

        return JsonResponse({'status':'failure'})

class NewComment(APIView):
    permission_classes = (permissions.IsAuthenticated,)

    def post(self, request):
        try:
            theobj = Issues.objects.get(theid=request.data['IssueId'])
        except:
            print('POST API request query failed: the id provided is not found ### NewComment->post')
            raise Http404

        if not theobj.isIssueSolved:
            request.data.update({'theIssue':theobj.id})
            request.data.update({'created_by':request.user.username})

            thenewcomment = CommentsSerializer(data=request.data)

            if thenewcomment.is_valid():
                thenewcomment.save()
                return JsonResponse({'status':'success'})
            print(thenewcomment.data)

            return JsonResponse({'status':'failure','reason':'data not valid'})

        return JsonResponse({'status':'failure','reason':'issue already closed'})


class DeleteComment(APIView):
    permission_classes = (permissions.IsAuthenticated,)

    def post(self,request):

        try:
            thecomment = Comments.objects.get(commentId=request.data['cId'])
        except:
            print('DELETE API request query failed: the id provided is not found')
            raise Http404


        if thecomment.created_by == request.user.username:
            thecomment.delete()
            print('yep it is')
            return JsonResponse({'status':'success'})
            
        return JsonResponse({'status':'failure'})




class AddUser(APIView):

    permission_classes = (permissions.AllowAny,)

    def post(self, request):
        thenewuser = UserSerializer(data=request.data)

        if thenewuser.is_valid():
            thenewuser.save()
            return JsonResponse({'status':'success', 'data':thenewuser.data})
        else:
            print('error creating new user')
            #print(thenewuser.data)
            return JsonResponse({'status':'failure'})
        

        
class GetAllUsers(APIView):
    permission_classes = (permissions.IsAuthenticated,)

    def get(self, request):
        theusers = UserSerializer(User.objects.all(), many=True).data
        return JsonResponse({'status':'success', 'data':theusers})



class isCurrentUserModerator(APIView):
    permission_classes = (permissions.IsAuthenticated,)

    def get(self, request):
        if request._user.profile.isModerator:            
            return JsonResponse({'isMod': True})
        else:
            return JsonResponse({'isMod': False})