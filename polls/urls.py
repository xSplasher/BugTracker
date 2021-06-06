from django.urls import path, include

from . import views

app_name = 'polls'
urlpatterns = [
    path('', views.ProjectsView.as_view(), name='indexpage'),
    path('newproject/', views.Create_new_project.as_view(), name='newproject'),
    path('all/', views.ListALLIssuesView.as_view(), name='allissues'),
    path('project/<str:slug>/', views.ListOfProjectIssuesView.as_view(), name='projectissues'),
    path('issue/<str:slug>/', views.IssueView.as_view(), name='issueview'),
    path('createissue/', views.CreateIssueView.as_view(), name='createissue'),
    #path('createissue/<str:projectid>', views.CreateIssueView.as_view(), name='createissue_from_project'),
    path('mytickets/', views.IndexMyTicketsView.as_view(), name='mytickets'),
    path('get/', views.GetNote.as_view(), name='index'),
    path('letsgo/<int:pk>/', views.ProjectsView.as_view()),
    #path('<int:pk>/', views.DetailView.as_view(), name='detail'),
    #path('<int:pk>/results/', views.ResultsView.as_view(), name='results'),
    #path('<int:question_id>/vote/', views.vote, name='vote'),
]