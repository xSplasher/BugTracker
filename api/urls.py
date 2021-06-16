from django.urls import path, include
from . import views

urlpatterns = [
    path('issue/pro',views.ProjectsGet.as_view()),
    path('issue/addnew',views.CreateIssue.as_view()),
    path('issue/all',views.GetAllIssues.as_view()),
    path('issue/<int:pk>',views.GetIssue_theid.as_view()),
]
