from django.db import models
from django.contrib.auth.models import User
from datetime import datetime
import random

from django.db.models.signals import post_save
from django.dispatch import receiver

def random_with_N_digits():
    range_start = 10**(20-1)
    range_end = (10**20)-1
    return random.randint(range_start, range_end)


def random_with_N_digits_15():
    range_start = 10**(15-1)
    range_end = (10**15)-1
    return str(random.randint(range_start, range_end))

#MyModel.objects.filter(pk=some_value).update(field1='some value')
# Create your models here.

class Projects(models.Model):
    theid = models.CharField(max_length=15)
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name
        

'''
def default_fkey():
    return Projects.objects.get(pk=1).theid
'''

class Issues(models.Model):
    theid = models.CharField(max_length=15, editable=False, default=random_with_N_digits_15)
    project_it_belongs_to = models.ForeignKey(Projects, related_name='issues', on_delete=models.CASCADE, default=-999)
    issue_name = models.CharField(max_length=300)
    created_by = models.CharField(max_length=90)
    at = models.DateTimeField(default=datetime.now, editable=False)
    text = models.CharField(max_length=3000)
    priority = models.CharField(max_length=120)
    assignto = models.CharField(max_length=300)
    isIssueSolved = models.BooleanField(default=False)

    def __str__(self):
        return self.issue_name + ' | ' + self.theid

class Comments(models.Model):
    commentId = models.CharField(default=random_with_N_digits, max_length=20, editable=False)
    theIssue = models.ForeignKey(Issues, on_delete=models.CASCADE)
    comment = models.CharField(max_length=3000)    
    created_by = models.CharField(max_length=90)
    at = models.DateTimeField(default=datetime.now, editable=False)
    isThisCommentSolution = models.BooleanField(default=False)

    def __str__(self):
        return self.comment

    def __unicode__(self):
        return

class Notifications(models.Model):
    notificationID = models.CharField(default=random_with_N_digits, max_length=20, editable=False)
    toUser = models.CharField(max_length=90)
    thetext = models.CharField(max_length=3000)
    theLink = models.CharField(max_length=3000)
    IssueReference = models.ForeignKey(Issues, on_delete=models.CASCADE)
    isSeen = models.BooleanField(default=False)

    def __str__(self):
        return self.thetext


class Profile(models.Model):
    theUser = models.OneToOneField(User, on_delete=models.CASCADE)
    isModerator = models.BooleanField(default=False)

    def __str__(self):
        return str(self.theUser)  + ' Profile'


@receiver(post_save, sender=User)
def do_something(sender, instance, created, **kwargs):
    if created:
        print('I MADE A NEW USER !!!!!!!')
        print(instance)
        Profile.objects.create(theUser=instance)