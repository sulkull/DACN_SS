from django.db import models
from giohang.models import GioHang, CTGH
from user.models import CustomerUser
from django.db.models.signals import pre_save, post_save


# Create your models here.
class HoaDon(models.Model):
    GH = models.ForeignKey(GioHang, on_delete=models.CASCADE, null=True, blank=True)
    NgayDatHang = models.DateTimeField(auto_now_add=True)
    ThanhToan = models.BooleanField(default=False)
    GiaoHang = models.BooleanField(default=False)
    TongTien = models.FloatField(default=0)

    def __str__(self):
        return str(self.id)

    def update_total(self):
        cart_total = self.GH.TongTien
        self.TongTien = cart_total
        self.save()
        return cart_total

    def check_done(self):
        #Kiểm tra thông tin user
        user = CustomerUser.objects.get(id=self.GH.user.id)
        tongtien = self.TongTien
        if user.DiaChi and user.SDT and user.email and tongtien > 0:
            return True
        return False


def post_save_cart_total(sender, instance, created, *args, **kwargs):
    if not created:
        cart_obj = instance
        qs = HoaDon.objects.filter(GH=cart_obj)
        if qs.count() == 1:
            order_obj = qs.first()
            order_obj.update_total()


post_save.connect(post_save_cart_total, sender=GioHang)


def post_save_order(sender, instance, created, *args, **kwargs):
    if created:
        instance.update_total()


post_save.connect(post_save_order, sender=HoaDon)