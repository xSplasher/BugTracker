from django.contrib.auth.models import User, Group
from rest_framework import serializers
from polls.models import *


class UserSerializer(serializers.ModelSerializer):

    password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ['username', 'password']

    def create(self, validated_data):
        user = super(UserSerializer, self).create(validated_data)
        user.set_password(validated_data['password'])
        user.save()
        return user

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
        #print(vars(instance))
        #print('########################')
        try:
            rep['project_it_belongs_to'] = ProjectSerializer(instance.project_it_belongs_to).data['name'] # this is used so that get api/issue returns project name instead of object's id
        except:
            print('ah woops')
        
        return rep
    

class ProjectSerializer(serializers.ModelSerializer): # used for listing issues when clicking on a project #ProjectsGet View

    issues = serializers.StringRelatedField(many=True)

    class Meta:
        model = Projects
        #exclude = ['id']
        fields = ['theid','name','issues']


class CommentsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comments
        fields = ['commentId','comment','theIssue','created_by','at','isThisCommentSolution']