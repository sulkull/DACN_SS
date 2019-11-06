from typing import List
from django.contrib import admin
from .models import SanPham, SimNamSinh, SimTheoGia, SimTheoLoai, NhaMang
# Register your models here.


# Hiển thị bảng sản phẩm trên trang admin
class SanPhamAdmin(admin.ModelAdmin):
    list_display = ['SoSim','TacVu', 'Gia', 'Anh', 'Mang', 'NgayNhap','id', ]
    list_filter = ['NgayNhap','TacVu','Mang']
    search_fields = ['SoSim']
    exclude = ['slug', ]
    list_per_page = 5


# Hiển thị bảng nhà mạng
class NhaMangAdmin(admin.ModelAdmin):
    list_display = [ 'title','id']
    search_fields = ['title']
    list_per_page = 5


# Hiển thị bảng Sim theo loại
class SimTheoLoaiAdmin(admin.ModelAdmin):
    list_display = [ 'title','id']
    search_fields = ['title']
    list_per_page = 5


# Hiển thị bảng Sim theo giá
class SimTheoGiaAdmin(admin.ModelAdmin):
    list_display = [ 'title','id']
    search_fields = ['title']
    list_per_page = 5


# Hiển thị bảng Sim theo năm
class SimTheoNamAdmin(admin.ModelAdmin):
    list_display = [ 'title','id']
    search_fields = ['title']
    list_per_page = 5


admin.site.register(NhaMang,NhaMangAdmin)
admin.site.register(SimTheoLoai,SimTheoLoaiAdmin)
admin.site.register(SimTheoGia,SimTheoGiaAdmin)
admin.site.register(SimNamSinh,SimTheoNamAdmin)
admin.site.register(SanPham, SanPhamAdmin)