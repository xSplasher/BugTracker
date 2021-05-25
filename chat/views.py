from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic


# Create your views here.

class IndexView(generic.View):
    template_name = 'chat/index.html'

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)

    def post(self, request, *args, **kwargs):
        return render('POST request!')


class RoomView(generic.View):
    template_name = 'chat/room.html'

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name,{'room_name': kwargs['room_name']})

    def post(self, request, *args, **kwargs):
        return render(request, self.template_name)

def room(request, room_name):
    return render(request, 'chat/room.html', {
        'room_name': room_name
    })