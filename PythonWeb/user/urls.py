from django.urls import path
from django.conf.urls import url
from . import views
from django.contrib.auth import views as auth_views

app_name = 'user'
urlpatterns = [
    path("dangky/", views.dangky, name='dangky'),
    path("dangnhap/", auth_views.LoginView.as_view(template_name='simso/dangnhap.html',),
         name='dangnhap'),
    path("dangxuat/", auth_views.LogoutView.as_view(next_page='/'), name='dangxuat'),
    path("thongtintaikhoan/", views.thongtintaikhoan, name='thongtintaikhoan'),
    path("doimatkhau/", views.doimatkhau, name='doimatkhau'),
    url(r'^activate/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
        views.activate, name='activate'),
    path("xacthuc/", views.verify, name='xacthuc'),
    path("xacthucsdt/", views.checkcode, name='xacthucsdt'),
]
