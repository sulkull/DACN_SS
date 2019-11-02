from django.shortcuts import render
from django.http import HttpResponseRedirect
from .models import SanPham, SimTheoLoai
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from giohang.models import GioHang, CTGH
from user.models import CustomerUser
from news.models import TinTuc

# Create your views here.
def index(request):

    # Lấy dữ liệu từ database

    simvips = SimTheoLoai.objects.get(title='Vip')
    sanpham = simvips.sanpham_set.get_queryset().order_by('id')

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
    }
    return render(request, 'simso/index.html', Data)

def sanpham(request, id):
    # Lấy dữ liệu từ database
    sanpham = SanPham.objects.get(id=id)

    Data = {'sanpham': sanpham,
            }
    return render(request, 'simso/detail-sim/detail-sim.html', Data)

def error(request):
    return render(request, 'simso/error.html')

