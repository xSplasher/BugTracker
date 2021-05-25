# chat/routing.py
from django.urls import re_path

from . import consumers

websocket_urlpatterns = [
    re_path(r'ws/chat/(?P<room_name>\w+)/$', consumers.ChatConsumer.as_asgi()),
    re_path(r'ws/comment/$', consumers.CommentsConsumer.as_asgi()),
    re_path(r'ws/updatenotif/$', consumers.NotificationConsumer.as_asgi()),
]