from django.db import models
from django.template.defaultfilters import truncatechars


# Create your models here.

##
# Tạo danh muc san pham _Duc
##
class SimTheoGia(models.Model):
    title = models.CharField(max_length=100)

    class Meta:
        verbose_name_plural = 'Sim theo giá'


class NhaMang(models.Model):
    title = models.CharField(max_length=100)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = 'Nhà mạng'


class SimTheoLoai(models.Model):
    title = models.CharField(max_length=100)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = 'Sim theo loại'


class SimNamSinh(models.Model):
    title = models.CharField(max_length=100)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = 'Sim năm sinh'


# Tạo bảng loại sản phẩm
class LoaiSanPham(models.Model):
    TenLSP = models.CharField(max_length=100)

    def __str__(self):
        return self.TenLSP
    class Meta:
        verbose_name_plural = 'Loại sản phẩm'


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

    class Meta:
        verbose_name_plural = 'Sản Phẩm'

    @property
    def GiaChinhThuc(self):
        return (int)(self.Gia - self.Gia * self.GiamGia / 100)

    def MoTaNgan(self):
        return truncatechars(self.MoTa, 100)
