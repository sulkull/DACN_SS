from django.contrib import admin
from .models import TinTuc
from django.utils.safestring import mark_safe

# Register your models here.
class TinTucAdmin(admin.ModelAdmin):
    list_display = ['id', 'Title', 'Short_Body', 'CoverImage', 'Date']
    list_filter = ['Date']
    search_fields = ['Title']
    list_per_page = 5

    class Media:
        js = ('tinymce/tinymce.min.js', 'home/js/tinymce_4_config.js')

    def _Body(self, obj):
        _body = mark_safe(obj.Body)
        return _body


admin.site.register(TinTuc,TinTucAdmin)