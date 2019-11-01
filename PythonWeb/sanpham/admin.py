from typing import List
from django.contrib import admin
from .models import LoaiSanPham, SanPham
# Register your models here.


# Hiển thị bảng sản phẩm trên trang admin
class SanPhamAdmin(admin.ModelAdmin):
    list_display = ['id', 'TenSanPham', 'Gia', 'MoTaNgan', 'Anh', 'NgayNhap', 'SoLuong', 'GiamGia', 'MaLSP']
    list_filter = ['NgayNhap', 'MaLSP']
    search_fields = ['TenSanPham']
    list_per_page = 5


# Hiển thị bảng loại sản phẩm trên trang admin
class LSPAdmin(admin.ModelAdmin):
    list_display = ['id', 'TenLSP']
    search_fields = ['TenLSP']
    list_per_page = 5


admin.site.register(LoaiSanPham,LSPAdmin)
admin.site.register(SanPham, SanPhamAdmin)