# chat/consumers.py
import json
from asgiref.sync import async_to_sync
from channels.generic.websocket import WebsocketConsumer
from polls.models import *

class NotificationConsumer(WebsocketConsumer):

    def receive(self, text_data):
        text_data_json = json.loads(text_data)

    if text_data_json['purpose'] == 'update_notification':

        theid = text_data_json['theid']
        thenewcomment = text_data_json['thenewcomment']
        print('######## ',theid,thenewcomment)
        #Comments.objects.filter(commentId=theid).update(comment=thenewcomment)