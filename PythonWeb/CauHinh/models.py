from django.db import models

from CauHinh import migrations

Default_title = 'Sim số đẹp - Thương hiệu sim số uy tín nhất việt nam'
Default_key = 'Mua sim ,bán sim , Sim số đẹp, sim tứ quý ,sim năm sinh'
Default_des = 'Sim số đẹp - Thương hiệu uy tín trong ngành sim số đẹp từ hơn 10 năm qua, giao sim Miễn phí,dịch vụ tốt nhất thị trường'
Default_fav= '/favico.png'

Default_robot = {
    ('index,follow' , 'Lập chỉ mục trang web (index,follow)'),
    ('noindex,nofollow' , 'Chặn google lập chỉ mục trang web :(noindex,nofollow)')
}


# Create your models herec
class CauHinhSeo(models.Model):
    title = models.CharField(max_length=200,default=Default_title,verbose_name='Tiêu đề website')
    keyword = models.CharField(max_length=300,default=Default_key,verbose_name='Từ khóa website',help_text='Từ khóa được phân cách bằng dầu phẩy')
    des = models.TextField(max_length=300,default=Default_des,verbose_name='Mô tả website')
    favico = models.ImageField(null=True,default=Default_fav,verbose_name='Favico')
    google = models.CharField(max_length=100,blank='',default='Mã google site',verbose_name='Google-Webmaster')
    fb_app = models.CharField(max_length=100,blank='',default='123456767890',verbose_name='Facebook app id')
    robots = models.CharField(max_length=100,choices=Default_robot,verbose_name='Robots' ,help_text='Tùy chỉnh lập chỉ mục trang web với google',default='index,follow')

    def __str__(self):
        return self.title
    class Meta:
        verbose_name_plural = 'Cấu Hình SEO'





