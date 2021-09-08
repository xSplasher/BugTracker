from django.urls import path, include
from . import views

urlpatterns = [
    path('testing/<str:pk>',views.testing.as_view()),
    path('deletecomment/',views.DeleteComment.as_view()),
    path('newcomment/',views.NewComment.as_view()),
    path('newproject/',views.NewProjects.as_view()),
    path('newuser/',views.AddUser.as_view()),
    path('allusers/',views.GetAllUsers.as_view()),
    path('comments/<int:pk>',views.CommentsGet.as_view()),
    path('projects/all',views.ProjectsGet.as_view()),
    path('projects/<str:pk>',views.ProjectsGet.as_view()),
    path('issue/addnew',views.CreateIssue.as_view()),
    path('issue/all',views.GetAllIssues.as_view()),
    path('issue/<int:pk>',views.GetIssue_theid.as_view()),
    path('isMod/',views.isCurrentUserModerator.as_view()),
]
