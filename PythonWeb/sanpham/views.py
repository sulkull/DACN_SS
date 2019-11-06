from django.shortcuts import render
from django.http import HttpResponseRedirect

from CauHinh.models import CauHinhSeo
from .models import SanPham, SimTheoLoai
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
            }
    return render(request, 'simso/detail-sim/detail-sim.html', Data)

def error(request):
    return render(request, 'simso/error.html')

def seo(request):
    seo = CauHinhSeo.objects.all()
    context = {
        'seo': seo,

    }
    return render(request, 'simso/header.html',context)

