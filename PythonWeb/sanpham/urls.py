from django.urls import path
from . import views

app_name = 'sanpham'
urlpatterns = [
    path('', views.index, name='simso'),
    path("sanpham/<str:slug>/", views.sanpham, name='sanpham'),

]
