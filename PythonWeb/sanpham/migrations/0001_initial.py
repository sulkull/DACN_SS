# Generated by Django 2.2 on 2019-04-27 15:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='LoaiSanPham',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('TenLSP', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='SanPham',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('TenSanPham', models.CharField(max_length=100)),
                ('Gia', models.IntegerField(default=0)),
                ('MoTa', models.TextField()),
                ('Anh', models.CharField(max_length=100)),
                ('NgayNhap', models.DateTimeField(auto_now_add=True)),
                ('SoLuong', models.IntegerField(default=1)),
                ('GiamGia', models.IntegerField(default=0)),
                ('MaLSP', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='sanpham.LoaiSanPham')),
            ],
        ),
    ]