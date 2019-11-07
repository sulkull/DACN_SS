from django.db.models import Max
from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.utils.crypto import random
from django.views.generic import ListView

from .models import SanPham, SimTheoLoai, SimNamSinh, NhaMang, SimTheoGia
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from giohang.models import GioHang, CTGH
from user.models import CustomerUser
from news.models import TinTuc

# Create your views here.
def index(request):
    # Lấy dữ liệu từ database
    km = SanPham.objects.filter(TacVu='khuyenmai')
    vip = SanPham.objects.filter(TacVu='vip')
    vipdn = SanPham.objects.filter(TacVu='vipdn')
    thuong = SanPham.objects.filter(TacVu='thuong')

    Data = {"sim": SanPham.objects.all(),
            "km":km,
            "vip": vip,
            "vipdn": vipdn,
            "thuong": thuong,
            }
    return render(request, "simso/index.html", Data)

def sanpham(request, slug):
    # Lấy dữ liệu từ database
    sanpham = SanPham.objects.get(slug=slug)
    Data = {'sanpham': sanpham,
            "sim": SanPham.objects.all(),
            }
    return render(request, 'simso/detail-sim/detail-sim.html', Data)

def error(request):
    return render(request, 'simso/error.html')

class Category(ListView):
    model = SanPham
    context_object_name = 'sim'
    queryset = SanPham.objects.all()
    template_name = 'simso/category/category-index.html'

    def get_context_data(self, **kwargs):
        context = super(Category, self).get_context_data(**kwargs)
        context['stl'] = SimTheoLoai.objects.order_by('?') #hien thi thu tu ngau nhien
        context['sns'] = SimNamSinh.objects.all()
        context['nm'] = NhaMang.objects.all()
        context['stg'] = SimTheoGia.objects.all()
        return context




