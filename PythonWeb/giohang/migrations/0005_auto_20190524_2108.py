# Generated by Django 2.2 on 2019-05-24 14:08

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('giohang', '0004_auto_20190515_2338'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='giohang',
            name='NgayDatHang',
        ),
        migrations.RemoveField(
            model_name='giohang',
            name='ThanhToan',
        ),
    ]