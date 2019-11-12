from django.urls import path

from . import views

app_name = 'sanpham'
urlpatterns = [
    path('', views.index, name='simso'),
    path("san-pham/<str:slug>.html", views.sanpham, name='sanpham'),
    path('sim-theo-gia/<str:slug>.html', views.simtheogia, name='simtheogia'),
    path('sim-theo-mang/<str:slug>.html', views.simtheomang, name='simtheomang'),
    path('sim-theo-loai/<str:slug>.html', views.simtheoloai, name='simtheoloai'),
    path('sim-nam-sinh/<str:slug>.html', views.simnamsinh, name='simnamsinh'),
]
