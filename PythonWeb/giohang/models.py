from django.db import models
from sanpham.models import SanPham
from user.models import CustomerUser
from django.db.models.signals import pre_save, post_save, m2m_changed
import urllib.request
import json


# Create your models here.
# class quản lí giỏ hàng
class GioHangManager(models.Manager):

    def new_or_get(self, request):
        # Lấy cart_id từ session
        cart_id = request.session.get("cart_id", None)
        # Tìm cart_id trong database
        qs = self.get_queryset().filter(id=cart_id)
        if qs.count() == 1:
            cart_obj = qs.first()
            CTGHMoi(cart_obj)
            new_obj = False
            if request.user.is_authenticated and cart_obj.user is None:
                cart_obj.user = request.user
                cart_obj.save()
        else:
            cart_obj = self.GioHangMoi(user=request.user)
            CTGHMoi(cart_obj)
            new_obj = True
            request.session['cart_id'] = cart_obj.id
        return cart_obj, new_obj

    # Tạo giỏ hàng mới
    def GioHangMoi(self,user=None):
        user_obj = None
        if user is not None:
            if user.is_authenticated:
                user_obj = user
        return self.model.objects.create(user=user_obj)


# Tạo chi tiết giỏ hàng mới
def CTGHMoi(cart_obj=None):
    sanphams = cart_obj.SanPhams.all()
    for item in sanphams:
        ctgh_obj, created = CTGH.objects.get_or_create(GH=cart_obj, SP=item)
        ctgh_obj.DonGia = item.GiaChinhThuc
        ctgh_obj.save()


# Tạo bảng giỏ hàng
class GioHang(models.Model):
    user = models.ForeignKey(CustomerUser, on_delete=models.CASCADE, null= True, blank= True)
    SanPhams = models.ManyToManyField(SanPham, blank=True)
    TongTien = models.FloatField(default=0)

    objects = GioHangManager()

    def __str__(self):
        return str(self.id)

    def get_sanphams(self):
        return " - ".join([s.TenSanPham for s in self.SanPhams.all()])


# Tạo bảng chi tiết giỏ hàng
class CTGH(models.Model):
    GH = models.ForeignKey(GioHang, on_delete=models.CASCADE, null=True)
    SP = models.ForeignKey(SanPham, on_delete=models.CASCADE, null=True)
    SoLuong = models.IntegerField(default=1)
    DonGia = models.IntegerField(default=0)

    def __str__(self):
        return str(self.id)

    def ThanhTien(self):
        return self.SoLuong * self.DonGia

    def ToUSD(self):
        req = 'https://openexchangerates.org/api/latest.json?app_id=256d3b5746664d27bc090b385afd574d&symbols=VND'
        data = urllib.request.urlopen(req).read()
        data = json.loads(data.decode('utf-8'))
        rates = data["rates"]
        return self.SoLuong * self.DonGia / rates['VND']

#Cập nhật từ admin
def m2m_changed_cart_receiver(sender, instance, action, *args, **kwargs):
    if action == 'post_add' or action == 'post_remove' or action == 'post_clear':
        sanphams = instance.SanPhams.all()
        if sanphams is None:
            CTGH.objects.filter(GH=instance).delete()
        else:
            ctghs = CTGH.objects.filter(GH=instance)
            for item in ctghs:
                if item.SP not in sanphams:
                    CTGH.objects.get(GH=item.GH, SP=item.SP).delete()

        tongtien = 0
        CTGHMoi(instance)
        ListSP = CTGH.objects.filter(GH=instance)
        for item in ListSP:
            tongtien += (item.SoLuong * item.DonGia)
        tongtien += 30000
        instance.TongTien = tongtien
        instance.save()


m2m_changed.connect(m2m_changed_cart_receiver, sender=GioHang.SanPhams.through)







