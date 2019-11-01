from django.urls import path
from . import views

app_name = 'sanpham'
urlpatterns = [
    path('', views.index, name='simso'),
    path("sanpham/<int:id>/", views.sanpham, name='sanpham'),
    path("sanphamtheoloai/<int:id>/", views.sanphamtheoloai, name='sanphamtheoloai'),
]
