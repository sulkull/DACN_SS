# Generated by Django 2.2 on 2019-05-12 23:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0007_auto_20190512_2353'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customeruser',
            name='GioiTinh',
            field=models.IntegerField(choices=[('0', 'Nam'), ('1', 'Nữ'), ('2', 'Không xác định')], default='2', null=True),
        ),
    ]