# Generated by Django 2.2.6 on 2019-11-07 12:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CauHinh', '0003_auto_20191107_1914'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cauhinhseo',
            name='fb_app',
            field=models.CharField(blank='', default='123456767890', max_length=100, verbose_name='Facebook app id'),
        ),
    ]