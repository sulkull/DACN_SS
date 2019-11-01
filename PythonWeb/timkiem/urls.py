from django.urls import path
from . import views

app_name = 'timkiem'
urlpatterns = [
    path('ketquatimkiemsanpham/', views.ketquatimkiem, name='ketquatimkiem'),
    path('ketquatimkiemtintuc/', views.ketquatimkiemtintuc, name='ketquatimkiemtintuc'),
]
