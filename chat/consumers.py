# chat/consumers.py
import json
from asgiref.sync import async_to_sync
from channels.generic.websocket import WebsocketConsumer
from polls.models import *

#MyModel.objects.filter(pk=some_value).update(field1='some value')

class ChatConsumer(WebsocketConsumer):
    def connect(self):
        self.room_name = self.scope['url_route']['kwargs']['room_name']
        self.room_group_name = 'chat_%s' % self.room_name

        print(self.scope["user"])
        # Join room group
        async_to_sync(self.channel_layer.group_add)(
            self.room_group_name,
            self.channel_name
        )

        self.accept()

    def disconnect(self, close_code):
        # Leave room group
        async_to_sync(self.channel_layer.group_discard)(
            self.room_group_name,
            self.channel_name
        )

    # Receive message from WebSocket
    def receive(self, text_data):
        text_data_json = json.loads(text_data)
        message = text_data_json['message']

        # Send message to room group
        async_to_sync(self.channel_layer.group_send)(
            self.room_group_name,
            {
                'type': 'chat_message',
                'message': message
            }
        )

    # Receive message from room group
    def chat_message(self, event):
        message = event['message']

        # Send message to WebSocket
        self.send(text_data=json.dumps({
            'message': message
        }))

class CommentsConsumer(WebsocketConsumer):
    def connect(self):
        self.accept()


    def receive(self, text_data):
        text_data_json = json.loads(text_data)

        if text_data_json['purpose'] == 'save':

            theid = text_data_json['theid']
            thenewcomment = text_data_json['thenewcomment']
            #print('######## ',theid,thenewcomment)
            Comments.objects.filter(commentId=theid).update(comment=thenewcomment)

            self.send(text_data=json.dumps({
                'from': 'save',
                'message': 'success'
            }))

        if text_data_json['purpose'] == 'delete':

            theid = text_data_json['theid']
            #print('######## ',theid,thenewcomment)
            Comments.objects.filter(commentId=theid).delete()

            self.send(text_data=json.dumps({
                'from': 'delete',
                'message': 'success'
            }))

        if text_data_json['purpose'] == 'deleteIssue':

            theid = text_data_json['theid']
            #print('######## ',theid,thenewcomment)
            Issues.objects.filter(theid=theid).delete()

            self.send(text_data=json.dumps({
                'from': 'deleteIssue',
                'message': 'success'
            }))

        if text_data_json['purpose'] == 'solvedIssue':

            theid = text_data_json['theid']
            #print('######## ',theid)
            Issues.objects.filter(theid=theid).update(isIssueSolved=True)

            self.send(text_data=json.dumps({
                'from': 'solvedIssue',
                'message': 'success'
            }))

        if text_data_json['purpose'] == 'solvedIssueComment':

            theid = text_data_json['theid']
            #print('######## ',theid)
            Comments.objects.filter(commentId=theid).update(isThisCommentSolution=True)

            self.send(text_data=json.dumps({
                'from': 'solvedIssue',
                'message': 'success'
            }))



class NotificationConsumer(WebsocketConsumer):

    def connect(self):
        self.accept()

    def receive(self, text_data):
        text_data_json = json.loads(text_data)
        print('yo')
        if text_data_json['purpose'] == 'update_notification':

            theid = text_data_json['theid']
            Notifications.objects.filter(notificationID=theid).update(isSeen=True)