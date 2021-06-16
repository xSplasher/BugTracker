from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, Http404
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.views import APIView

# Create your views here.
from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from rest_framework import permissions
from api.serializers import *
from polls.models import *


class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticated]


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Issues.objects.all()
    serializer_class = GroupSerializer
    #ermission_classes = [permissions.IsAuthenticated]

@api_view(['GET', 'POST'])
def TestView(request):
    thedata = IssuesSerializer(Issues.objects.all(), many=True)
    return JsonResponse(thedata.data, safe=False)

class GetAllIssues(APIView):
    def get(self, request):
        return JsonResponse({'status':'success','data':IssuesSerializer(Issues.objects.all(), many=True).data})


class GetIssue_theid(APIView):

    def get(self, request, pk):
        try:
            element = IssuesSerializer(Issues.objects.get(theid=pk))
        except:
            print('GET API request query failed: the id provided is not found')
            raise Http404
        print(element.data['project_it_belongs_to'])
        return JsonResponse({'status':'success','data':element.data})


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
    

    def delete(self, request, pk):
        try:
            element = Issues.objects.get(theid=pk)
        except:
            print('DELETE API request query failed: the id provided is not found')
            raise Http404
            
        element.delete()
        print("DELETE Request Succeeded")
        return JsonResponse({'status':'success'})
    
        

class CreateIssue(APIView):

    def post(self, request):
        #theobj = Projects.objects.get(name=request.data['project_it_belongs_to'])
        #print(theobj)
        #request.data._mutable = True
        #request.data.update({'project_it_belongs_to':theobj})
        #request.data._mutable = False
        #print(request.data)
        #print('#######')
        ser = IssuesSerializer(data=request.data)
        
        if ser.is_valid():
            #ser.save()
            #ser.data['yo'] ='bruh'
            print(ser.data)
            print('Successfully Created Issue!')            
            return JsonResponse({'status':'success'}) #,'data':ser.data
        print(ser.data)
        return JsonResponse({'status':'failure'})


class ProjectsGet(APIView):
    
    def get(self, request):
        els = ProjectSerializer(Projects.objects.get(pk=1))
        return JsonResponse({'data':els.data})