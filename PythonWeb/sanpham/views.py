from django.shortcuts import render
from django.http import HttpResponseRedirect
from .models import SanPham, LoaiSanPham
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from giohang.models import GioHang, CTGH
from user.models import CustomerUser
from news.models import TinTuc

# Create your views here.
def index(request):
    # Lấy dữ liệu từ database
    sanpham = SanPham.objects.get_queryset().order_by('id')

    #Phân trang
    page = request.GET.get('page', 1)
    paginator = Paginator(sanpham, 6)
    try:
        SanPhams = paginator.page(page)
    except PageNotAnInteger:
        SanPhams = paginator.page(1)
    except EmptyPage:
        SanPhams = paginator.page(paginator.num_pages)

    Data = {"SanPhams": SanPhams,
            "SanPhamMois": SanPham.objects.all().order_by('-NgayNhap')[:10],
            "LoaiSanPhams": LoaiSanPham.objects.all(),
            "TinTucs": TinTuc.objects.all().order_by('-id')[:3],
    }
    return render(request, 'simso/home.html', Data)

def sanpham(request, id):
    # Lấy dữ liệu từ database
    sanpham = SanPham.objects.get(id=id)

    Data = {'sanpham': sanpham,
            "LoaiSanPhams": LoaiSanPham.objects.all(),
            }
    return render(request, 'simso/sanpham.html', Data)

def sanphamtheoloai(request, id):
    #Lấy dữ liệu từ database
    danhmuc = LoaiSanPham.objects.get(id=id)

    sanphamtheoloai = danhmuc.sanpham_set.get_queryset().order_by('id')

    #phân trang
    page = request.GET.get('page', 1)
    paginator = Paginator(sanphamtheoloai, 6)
    try:
        SanPhamTheoLoais = paginator.page(page)
    except PageNotAnInteger:
        SanPhamTheoLoais = paginator.page(1)
    except EmptyPage:
        SanPhamTheoLoais = paginator.page(paginator.num_pages)

    Data = {"SanPhamTheoLoais": SanPhamTheoLoais,
            "LoaiSanPhams": LoaiSanPham.objects.all(),
            "SanPhamMois": SanPham.objects.order_by('-NgayNhap')[:10],
            "TinTucs": TinTuc.objects.all().order_by('-id')[:3],
            }
    return render(request, 'simso/sanphamtheoloai.html', Data)

def error(request):
    return render(request, 'simso/error.html')

