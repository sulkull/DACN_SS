from django.urls import path

from phongthuy.views import Phongthuy
from . import views

app_name = 'phongthuy'
urlpatterns = [
    path('xem', views.diem, name='diem'),
    path('', Phongthuy.as_view(), name='cretare'),
]