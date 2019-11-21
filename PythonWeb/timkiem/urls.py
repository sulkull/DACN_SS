from django.urls import path
from timkiem.views import timkiem_nangcao

app_name='timkiem'
urlpatterns = [
     path('', timkiem_nangcao, name='timkiem'),


]
