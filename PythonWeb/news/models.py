from django.db import models


# Create your models here.
# Tạo bảng tin tức
class TinTuc(models.Model):
    Title = models.TextField(null=True)
    Short_Body = models.TextField(null=True)
    Body = models.TextField()
    CoverImage = models.ImageField(default='product-default.jpg')
    Date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.Title


