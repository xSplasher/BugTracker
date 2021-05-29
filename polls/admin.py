from django.contrib import admin
from .models import *

# Register your models here.

admin.site.register(Projects)
admin.site.register(Question)
admin.site.register(Issues)
admin.site.register(Comments)
admin.site.register(Notifications)