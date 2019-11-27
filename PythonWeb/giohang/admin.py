from typing import List
from django.contrib import admin
from .models import GioHang, CTGH
# Register your models here.

# Hiển thị giỏ hàng trên trang admin
class GioHangAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'get_sanphams', 'TongTien']
    list_filter = ['id']
    search_fields = ['user']
    list_per_page = 10


# Hiển thị chi tiết giỏ hàng trên trang admin
class CTGHAdmin(admin.ModelAdmin):
    list_display = ['id', 'GH', 'SP', 'DonGia']
    list_filter = ['GH']
    search_fields = ['GH']
    list_per_page = 10


admin.site.register(GioHang, GioHangAdmin)
admin.site.register(CTGH, CTGHAdmin)
