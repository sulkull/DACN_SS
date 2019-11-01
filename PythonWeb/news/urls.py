from django.urls import path
from . import views

app_name = 'tintuc'
urlpatterns = [
    path('', views.home, name='news'),
    path("<int:id>/", views.tintuc, name='tintuc'),
]
