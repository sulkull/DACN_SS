from django.db import models
from django.template.defaultfilters import truncatechars
from PythonWeb.utils import get_unique_slug

##
# Chọn sim vip _ thường
##


SIM_CHOICES = (
    ('thuong', 'Sim Thường'),
    ('khuyenmai', 'Sim Khuyến Mãi'),
    ('vip', 'Sim Vip'),
    ('vipdn', 'Sim Vip Doanh Nhân'))

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
    LoaiSims = models.ManyToManyField(SimTheoLoai, blank=True,default=0)
    slug = models.SlugField(max_length=20,null=False,default='')
    TacVu = models.CharField(max_length=100,choices=SIM_CHOICES,default='thuong')
    SoSim = models.CharField(max_length=100)
    Gia = models.IntegerField(default=0)
    Mang = models.ForeignKey(NhaMang, on_delete=models.CASCADE, null=True)
    Anh = models.ImageField(null=True)
    NgayNhap = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.SoSim

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = get_unique_slug(self, 'title', 'slug')
        super().save(*args, **kwargs)

    # def get_loaisims(self):
    #     return " - ".join([s.title for s in self.LoaiSims.all()])

    class Meta:
        verbose_name_plural = 'Sản Phẩm'


