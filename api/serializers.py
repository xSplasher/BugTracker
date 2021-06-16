from django.contrib.auth.models import User, Group
from rest_framework import serializers
from polls.models import *


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'groups']


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']


class IssuesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Issues
        exclude = ['id']
        #fields = '__all__'
    '''
    def create(self, validated_data):
        theprojectname = validated_data['project_it_belongs_to']
        print(theprojectname)

        project = Projects.objects.get(name=theprojectname)
        #Issues.objects.create(project_it_belongs_to=project)


        print('##############')
        print(theprojectname)
    '''
    
    def to_representation(self, instance):
        rep = super().to_representation(instance)
        #print('YOOOOOOO')
        #print(instance)
        try:
            rep['project_it_belongs_to'] = ProjectSerializer(instance['project_it_belongs_to']).data['name'] # this is used so that get api/issue returns project name instead of object's id
        except:
            print('ah woops')
        
        return rep
    

class ProjectSerializer(serializers.ModelSerializer): # used for listing issues when clicking on a project #ProjectsGet View

    issues = serializers.StringRelatedField(many=True)

    class Meta:
        model = Projects
        #exclude = ['id']
        fields = ['name','issues']