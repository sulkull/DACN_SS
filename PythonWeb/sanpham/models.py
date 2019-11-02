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


# Tạo bảng sản phẩm
class SanPham(models.Model):
    LoaiSims = models.ManyToManyField(SimTheoLoai, blank=True)
    SoSim = models.CharField(max_length=100)
    Gia = models.IntegerField(default=0)
    Mang = models.ForeignKey(NhaMang, on_delete=models.CASCADE, null=True)
    Anh = models.ImageField(null=True)
    NgayNhap = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.SoSim

    def get_loaisims(self):
        return " - ".join([s.title for s in self.LoaiSims.all()])

    class Meta:
        verbose_name_plural = 'Sản Phẩm'


