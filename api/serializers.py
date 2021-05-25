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


class TestSerializer(serializers.ModelSerializer):
    class Meta:
        model = Issues
        fields = ['theid','issue_name','created_by','text']