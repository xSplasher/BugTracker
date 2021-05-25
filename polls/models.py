from django.db import models
from datetime import datetime
import random

def random_with_N_digits():
    range_start = 10**(20-1)
    range_end = (10**20)-1
    return random.randint(range_start, range_end)

#MyModel.objects.filter(pk=some_value).update(field1='some value')
# Create your models here.

class Question(models.Model):
    question_text = models.CharField(max_length= 200)
    pub_date = models.DateTimeField('date published')


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length= 200)
    votes = models.IntegerField(default=0)

class Issues(models.Model):
    theid = models.CharField(max_length=15, editable=False)
    issue_name = models.CharField(max_length=300)
    created_by = models.CharField(max_length=90)
    at = models.DateTimeField(default=datetime.now, editable=False)
    text = models.CharField(max_length=3000)
    priority = models.CharField(max_length=120)
    assignto = models.CharField(max_length=300)
    isIssueSolved = models.BooleanField(default=False)

    def __str__(self):
        return self.issue_name

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
