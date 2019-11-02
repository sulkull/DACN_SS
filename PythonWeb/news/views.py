from django.shortcuts import render
from .models import TinTuc
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


# Create your views here.
def home(request):
    # Lấy dữ liệu từ database
    tintuc = TinTuc.objects.get_queryset().order_by('-id')

    # Phân trang
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

def tintuc(request, id):
    # Lấy dữ liệu từ database
    tintuc = TinTuc.objects.get(id=id)

    Data = {'TinTuc': tintuc,
            "TinTucKhacs": TinTuc.objects.all().order_by('-id').exclude(id=id)[:10],
            }
    return render(request, 'simso/tintuc.html', Data)










