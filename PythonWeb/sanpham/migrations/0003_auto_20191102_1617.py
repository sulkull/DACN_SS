# Generated by Django 2.2.6 on 2019-11-02 09:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sanpham', '0002_auto_20191102_1616'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sanpham',
            name='LoaiSims',
            field=models.ManyToManyField(blank=True, null=True, to='sanpham.SimTheoLoai'),
        ),
    ]