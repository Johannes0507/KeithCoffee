from cart.models import Order
from .serializers import OrderSerializer
from rest_framework import viewsets
from django.contrib.auth.decorators import login_required, user_passes_test
from django.utils.decorators import method_decorator


def is_superuser(user):
    if user.is_superuser:
        return user.is_superuser
    elif user.is_authenticated:
        return user.is_authenticated


@method_decorator(login_required, name='dispatch')
class OrderViewSet(viewsets.ModelViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
