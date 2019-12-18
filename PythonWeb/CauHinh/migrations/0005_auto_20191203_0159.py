# Generated by Django 2.2.6 on 2019-12-02 18:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CauHinh', '0004_auto_20191202_2117'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cauhinhseo',
            name='robots',
            field=models.CharField(choices=[('index,follow', 'Lập chỉ mục trang web (index,follow)'), ('noindex,nofollow', 'Chặn google lập chỉ mục trang web :(noindex,nofollow)')], default='index,follow', help_text='Tùy chỉnh lập chỉ mục trang web với google', max_length=100, verbose_name='Robots'),
        ),
    ]