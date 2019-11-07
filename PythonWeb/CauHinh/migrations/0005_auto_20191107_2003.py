# Generated by Django 2.2.6 on 2019-11-07 13:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CauHinh', '0004_auto_20191107_1917'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cauhinhseo',
            name='robots',
            field=models.CharField(choices=[('noindex,nofollow', 'Chặn google lập chỉ mục trang web :(noindex,nofollow)'), ('index,follow', 'Lập chỉ mục trang web (index,follow)')], default='index,follow', help_text='Tùy chỉnh lập chỉ mục trang web với google', max_length=100, verbose_name='Robots'),
        ),
    ]
