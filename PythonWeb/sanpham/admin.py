from typing import List
from django.contrib import admin
from .models import SanPham, SimNamSinh, SimTheoGia, SimTheoLoai, NhaMang
from import_export import resources
from import_export.admin import ImportExportModelAdmin
# Register your models here.


################--Xuất nhập khẩu--#######################
class SimResource(resources.ModelResource):
    class Meta:
        model = SanPham
        # fields = ['SoSim','TacVu', 'Gia', 'Anh', 'Mang', 'NgayNhap','id', ]              #tuy chon data de xuat ra
        #export_order = ['SoSim','TacVu', 'Gia', 'Anh', 'Mang', 'NgayNhap','id', ]         # sap xep lai thu tu
        exclude = ['slug']   #loai bo                                                                                            #
class SimAdmin(ImportExportModelAdmin):
    exclude = ['slug']
    list_display = ['SoSim','TacVu', 'Gia', 'Anh', 'Mang', 'NgayNhap','id', ]
    list_per_page = 5
    search_fields = ['SoSim']
    resource_class = SimResource
admin.site.register(SanPham, SimAdmin)
#################-- End Xuất nhập khẩu ---############################

# Hiển thị bảng nhà mạng
class NhaMangAdmin(admin.ModelAdmin):
    list_display = [ 'title','id','slug']
    search_fields = ['title']
    exclude = ['slug', ]
    list_per_page = 5




class LoaiSimResource(resources.ModelResource):
    class Meta:
        model = SimTheoLoai
        exclude = ['slug', ]
# Hiển thị bảng Sim theo loại
class LoaiSimAdmin(ImportExportModelAdmin):
    exclude = ['slug']
    list_display = ['title', 'id']
    list_per_page = 5
    resource_class = LoaiSimResource
admin.site.register(SimTheoLoai, LoaiSimAdmin)



# Hiển thị bảng Sim theo giá
class SimTheoGiaAdmin(admin.ModelAdmin):
    list_display = [ 'title','id','slug']
    search_fields = ['title']
    exclude = ['slug', ]
    list_per_page = 5


# Hiển thị bảng Sim theo năm
class SimTheoNamAdmin(admin.ModelAdmin):
    list_display = [ 'title','id','slug']
    search_fields = ['title']
    exclude = ['slug', ]
    list_per_page = 5


admin.site.register(NhaMang,NhaMangAdmin)
admin.site.register(SimTheoGia,SimTheoGiaAdmin)
admin.site.register(SimNamSinh,SimTheoNamAdmin)