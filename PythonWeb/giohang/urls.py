from django.urls import path
from . import views

app_name = 'giohang'
urlpatterns = [
    path('', views.cart_home, name='home'),
    path('update/', views.cart_update, name='update'),
    path('delete/', views.cart_delete, name='delete'),
    path('deleteall/', views.cart_deleteall, name='deleteall'),
    path('updatesl/', views.cart_updatesl, name='updatesl'),
    path('giohangtrong/', views.cart_empty, name='giohangtrong'),
    path('checkout/', views.checkout_home, name='checkout'),
    path('thanhcong/', views.thanhcong, name='thanhcong'),
]