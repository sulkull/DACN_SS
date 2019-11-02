from django.shortcuts import render
from sanpham.models import SanPham
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q, Max
from news.models import TinTuc

# Create your views here.
def ketquatimkiem(request):
    maxprice = SanPham.objects.all().aggregate(Max('Gia'))['Gia__max']

    #Lấy keyword từ user
    method_dict = request.GET
    query = method_dict.get('q', None)
    min = method_dict.get('min', None)
    max = method_dict.get('max', None)

    if query is not None and min is not None and max is not None:
        if min == "":
            min = 0
        if max == "":
            max = maxprice

        # Lấy dữ liệu từ database
        lookups = (Q(TenSanPham__icontains=query) |
                   Q(MaLSP__TenLSP__icontains=query) |
                   Q(MoTa__icontains=query)
                   )
        sanpham = SanPham.objects.filter(lookups, Gia__range=(min, max)).distinct()
    else:
        sanpham = SanPham.objects.get_queryset().order_by('id')


    #Phân trang
    page = request.GET.get('page', 1)
    paginator = Paginator(sanpham, 8)
    try:
        SanPhams = paginator.page(page)
    except PageNotAnInteger:
        SanPhams = paginator.page(1)
    except EmptyPage:
        SanPhams = paginator.page(paginator.num_pages)
    Data = {"SanPhams": SanPhams,
            "Max": maxprice,
            }
    return render(request, 'simso/ketquatimkiem.html', Data)


def ketquatimkiemtintuc(request):

    #Lấy keyword từ user
    method_dict = request.GET
    query = method_dict.get('q', None)

    if query is not None:
        # Lấy dữ liệu từ database
        lookups = (Q(Title__icontains=query) |
                   Q(Short_Body__icontains=query) |
                   Q(Body__icontains=query)
                   )
        tintuc = TinTuc.objects.filter(lookups).distinct().order_by('-id')
    else:
        tintuc = TinTuc.objects.get_queryset().order_by('-id')

    #Phân trang
    page = request.GET.get('page', 1)
    paginator = Paginator(tintuc, 6)
    try:
        TinTucs = paginator.page(page)
    except PageNotAnInteger:
        TinTucs = paginator.page(1)
    except EmptyPage:
        TinTucs = paginator.page(paginator.num_pages)
    Data = {"TinTucs": TinTucs,
            }
    return render(request, 'simso/news.html', Data)

