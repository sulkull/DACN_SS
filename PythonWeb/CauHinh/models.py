from django.db import models

# Create your models herec
class CauHinhSeo(models.Model):
    title = models.CharField(max_length=200,default='Tiêu đề website',verbose_name='Tiêu đề website')
    keyword = models.CharField(max_length=300,default='',verbose_name='Từ khóa website',help_text='Từ khóa được phân cách bằng dầu phẩy')
    des = models.CharField(max_length=300,default='',verbose_name='Mô tả website')
    favico = models.ImageField(null=True,blank='',verbose_name='Favico')
    google = models.CharField(max_length=100,blank='',default='',verbose_name='Google-Webmaster')

    def __str__(self):
        return self.title
    class Meta:
        verbose_name_plural = 'Cấu Hình SEO'
