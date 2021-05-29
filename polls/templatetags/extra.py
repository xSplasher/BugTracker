from django import template
from ..models import *

register = template.Library()

@register.simple_tag(takes_context=True)
def get_notification_for_user(context):
    theobs = Notifications.objects.filter(toUser=context['user'])
    return {'the_notifications':theobs,'ouruser':context['user']}

    