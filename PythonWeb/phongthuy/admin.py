from django.contrib import admin
# Register your models here.
from import_export import resources
from import_export.admin import ImportExportModelAdmin
from phongthuy.models import Datapt


class ptResource(resources.ModelResource):
    class Meta:
        model = Datapt
# Hiển thị bảng Sim theo loại
class ptadmin(ImportExportModelAdmin):
    resource_class = ptResource
admin.site.register(Datapt, ptadmin)