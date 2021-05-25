from django.urls import path, include

from . import views

app_name = 'polls'
urlpatterns = [
    path('', views.IndexView.as_view(), name='indexpage'),
    path('issue/<str:slug>/', views.IssueView.as_view(), name='issueview'),
    path('createissue/', views.CreateIssueView.as_view(), name='createissue'),
    path('mytickets/', views.IndexMyTicketsView.as_view(), name='mytickets'),
    path('get/', views.GetNote.as_view(), name='index'),
    #path('<int:pk>/', views.DetailView.as_view(), name='detail'),
    #path('<int:pk>/results/', views.ResultsView.as_view(), name='results'),
    #path('<int:question_id>/vote/', views.vote, name='vote'),
]