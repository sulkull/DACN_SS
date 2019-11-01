import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser
from sanpham.models import SanPham

# Create your models here.

class LoaiNguoiDung(models.Model):
    TenLoai = models.CharField(max_length=10)
    def __str__(self):
        return self.TenLoai


class CustomerUser(AbstractUser):
    MaLND = models.ForeignKey(LoaiNguoiDung, on_delete=models.CASCADE, default='1')
    SDT = models.CharField(default='', max_length=10)
    DiaChi = models.TextField(default='')
    choices = [('0', 'Nam'), ('1', 'Nữ'), ('2', 'Không xác định')]
    GioiTinh = models.CharField(choices=choices, default='2', max_length=20)
    NgaySinh = models.DateField(null=True)

    def HoTen(self):
        return self.first_name + " " + self.last_name

class BinhLuanDanhGia(models.Model):
    MaKH = models.ForeignKey(CustomerUser, on_delete=models.CASCADE)
    MaSP = models.ForeignKey(SanPham, on_delete=models.CASCADE)
    NgayBL = models.DateTimeField(auto_now_add=True)
    NoiDung = models.TextField(default='')
    SoSao = models.IntegerField(default=0)
