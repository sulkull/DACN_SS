# Generated by Django 2.2.6 on 2019-11-07 13:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sanpham', '0007_auto_20191107_2003'),
    ]

    operations = [
        migrations.AddField(
            model_name='nhamang',
            name='slug',
            field=models.SlugField(default='', max_length=20),
        ),
        migrations.AddField(
            model_name='simnamsinh',
            name='slug',
            field=models.SlugField(default='', max_length=20),
        ),
        migrations.AddField(
            model_name='simtheogia',
            name='slug',
            field=models.SlugField(default='', max_length=20),
        ),
        migrations.AddField(
            model_name='simtheoloai',
            name='slug',
            field=models.SlugField(default='', max_length=20),
        ),
    ]