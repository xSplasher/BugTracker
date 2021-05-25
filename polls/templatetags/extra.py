from django import template
from ..models import *

register = template.Library()

@register.simple_tag(takes_context=True)
def get_all_users(context):
    theobs = Notifications.objects.filter(toUser=context['user'])
    return {'thenotif':theobs,'ouruser':context['user']}

    