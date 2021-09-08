"""bugtracker URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from registration import views
from rest_framework import routers
from api import views as vs
from rest_framework.authtoken import views as authviews
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

router = routers.DefaultRouter()
router.register(r'users', vs.UserViewSet)
router.register(r'groups', vs.GroupViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.

urlpatterns = [
    path('admin/', admin.site.urls),    
    path('chat/', include('chat.urls'), name='chat'),    
    path('register/', views.RegisterPage.as_view()),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('api/', include('api.urls')),
    #path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    #path('api/', include(router.urls)),
    path('api-token-auth/', authviews.obtain_auth_token),
    #path('logout/', views.logout,name='logout'),
    path('', include('polls.urls')),
    path('',include('django.contrib.auth.urls')),
]
