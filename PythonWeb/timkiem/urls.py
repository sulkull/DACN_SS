from django.urls import path
from timkiem import views

app_name='timkiem'
urlpatterns = [
     path('', views.timkiem_nangcao, name='timkiem'),


]
