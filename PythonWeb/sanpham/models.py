from django.db import models
from django.template.defaultfilters import truncatechars

# Create your models here.

# Tạo bảng loại sản phẩm
class LoaiSanPham(models.Model):
    TenLSP = models.CharField(max_length=100)

    def __str__(self):
        return self.TenLSP

# Tạo bảng sản phẩm
class SanPham(models.Model):
    MaLSP = models.ForeignKey(LoaiSanPham, on_delete=models.CASCADE)
    TenSanPham = models.CharField(max_length=100)
    Gia = models.IntegerField(default=0)
    MoTa = models.TextField()
    Anh = models.ImageField(null=True)
    NgayNhap = models.DateTimeField(auto_now_add=True)
    SoLuong = models.IntegerField(default=1)
    GiamGia = models.IntegerField(default=0)


    def __str__(self):
        return self.TenSanPham

    @property
    def GiaChinhThuc(self):
        return (int)(self.Gia - self.Gia * self.GiamGia / 100)

    def MoTaNgan(self):
        return truncatechars(self.MoTa, 100)