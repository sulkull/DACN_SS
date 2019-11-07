from django.urls import path

from sanpham.views import Category
from . import views

app_name = 'sanpham'
urlpatterns = [
    path('', views.index, name='simso'),
    path("sanpham/<str:slug>/", views.sanpham, name='sanpham'),
    path('<str:slug>', Category.as_view(), name='category'),

]
