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
import operator

# Create your views here.
def index(request):
    # Lấy dữ liệu từ database
    km = SanPham.objects.filter(TacVu='khuyenmai')
    vip = SanPham.objects.filter(TacVu='vip')
    vipdn = SanPham.objects.filter(TacVu='vipdn')
    thuong = SanPham.objects.filter(TacVu='thuong')

    stl = SimTheoLoai.objects.all()
    sns = SimNamSinh.objects.all()
    nm = NhaMang.objects.all()
    stg = SimTheoGia.objects.all()

    # Sắp xếp danh mục sim theo giá theo title
    stg_dsx = sorted(stg, key=operator.attrgetter('title'))

    Data = {
            "km": km,
            "vip": vip,
            "vipdn": vipdn,
            "thuong": thuong,
            "stl": stl,
            "sns": sns,
            "nm": nm,
            "stg": stg_dsx,
            }
    return render(request, "simso/index.html", Data)

def sanpham(request, slug):
    # Lấy dữ liệu từ database
    sanpham = SanPham.objects.get(slug=slug)

    stl = SimTheoLoai.objects.all()
    sns = SimNamSinh.objects.all()
    nm = NhaMang.objects.all()
    stg = SimTheoGia.objects.all()

    #Sắp xếp danh mục sim theo giá theo title
    stg_dsx = sorted(stg, key=operator.attrgetter('title'))

    Data = {'sanpham': sanpham,
            "stl": stl,
            "sns": sns,
            "nm": nm,
            "stg": stg_dsx,
            }
    return render(request, 'simso/detail-sim/detail-sim.html', Data)

def error(request):
    return render(request, 'simso/error.html')

# class Category(ListView):
#     model = SanPham
#     context_object_name = 'sim'
#     queryset = SanPham.objects.all()
#     template_name = 'simso/category/category-index.html'
#
#     def get_context_data(self, **kwargs):
#         context = super(Category, self).get_context_data(**kwargs)
#         context['stl'] = SimTheoLoai.objects.all()
#         context['sns'] = SimNamSinh.objects.all()
#         context['nm'] = NhaMang.objects.all()
#         context['stg'] = SimTheoGia.objects.all()
#         return context


def simtheogia(request, slug):

    stg1 = SimTheoGia.objects.get(slug=slug)
    sanpham = stg1.sanpham_set.all()

    stl = SimTheoLoai.objects.order_by('?')
    sns = SimNamSinh.objects.all()
    nm = NhaMang.objects.all()
    stg = SimTheoGia.objects.all()

    # Sắp xếp danh mục sim theo giá theo title
    stg_dsx = sorted(stg, key=operator.attrgetter('title'))

    Data = {
            'stg1': stg1,
            'sanpham': sanpham,
            "stl": stl,
            "sns": sns,
            "nm": nm,
            "stg": stg_dsx,
            }
    return render(request, 'simso/category/sim-theo-gia.html', Data)


def simtheomang(request, slug):

    nm1 = NhaMang.objects.get(slug=slug)
    sanpham = nm1.sanpham_set.all()

    stl = SimTheoLoai.objects.order_by('?')
    sns = SimNamSinh.objects.all()
    nm = NhaMang.objects.all()
    stg = SimTheoGia.objects.all()

    # Sắp xếp danh mục sim theo giá theo title
    stg_dsx = sorted(stg, key=operator.attrgetter('title'))

    Data = {
            'nm1': nm1,
            'sanpham': sanpham,
            "stl": stl,
            "sns": sns,
            "nm": nm,
            "stg": stg_dsx,
            }
    return render(request, 'simso/category/sim-theo-mang.html', Data)

def simtheoloai(request, slug):

    stl1 = SimTheoLoai.objects.get(slug=slug)
    sanpham = stl1.sanpham_set.all()

    stl = SimTheoLoai.objects.order_by('?')
    sns = SimNamSinh.objects.all()
    nm = NhaMang.objects.all()
    stg = SimTheoGia.objects.all()

    # Sắp xếp danh mục sim theo giá theo title
    stg_dsx = sorted(stg, key=operator.attrgetter('title'))

    Data = {
            'stl1': stl1,
            'sanpham': sanpham,
            "stl": stl,
            "sns": sns,
            "nm": nm,
            "stg": stg_dsx,
            }
    return render(request, 'simso/category/sim-theo-loai.html', Data)


def simnamsinh(request, slug):

    sns1 = SimNamSinh.objects.get(slug=slug)
    sanpham = sns1.sanpham_set.all()

    stl = SimTheoLoai.objects.order_by('?')
    sns = SimNamSinh.objects.all()
    nm = NhaMang.objects.all()
    stg = SimTheoGia.objects.all()

    # Sắp xếp danh mục sim theo giá theo title
    stg_dsx = sorted(stg, key=operator.attrgetter('title'))

    Data = {
            'sns1': sns1,
            'sanpham': sanpham,
            "stl": stl,
            "sns": sns,
            "nm": nm,
            "stg": stg_dsx,
            }
    return render(request, 'simso/category/sim-nam-sinh.html', Data)


