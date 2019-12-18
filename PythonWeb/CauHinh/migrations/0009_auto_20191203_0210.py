# Generated by Django 2.2.6 on 2019-12-02 19:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CauHinh', '0008_auto_20191203_0209'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cauhinhseo',
            name='robots',
            field=models.CharField(choices=[('index,follow', 'Lập chỉ mục trang web (index,follow)'), ('noindex,nofollow', 'Chặn google lập chỉ mục trang web :(noindex,nofollow)')], default='index,follow', help_text='Tùy chỉnh lập chỉ mục trang web với google', max_length=100, verbose_name='Robots'),
        ),
    ]