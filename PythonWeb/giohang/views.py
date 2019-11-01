from django.shortcuts import render, redirect
from django.template.loader import render_to_string
from django.core.mail import EmailMessage
from .models import GioHang, CTGH, CTGHMoi
from sanpham.models import SanPham, LoaiSanPham
from hoadon.models import HoaDon
from user.models import CustomerUser


# Create your views here.
# Tạo trang giỏ hàng
def cart_home(request):
    cart_obj, new_obj = GioHang.objects.new_or_get(request)
    sanphams = cart_obj.SanPhams.all()

    tongtien = 0
    ListSP = CTGH.objects.filter(GH=cart_obj)
    if ListSP:
        for item in ListSP:
            tongtien += (item.SoLuong * item.DonGia)
        tongtien += 30000
    cart_obj.TongTien = tongtien
    cart_obj.save()

    ctgh_obj = CTGH.objects.filter(GH=cart_obj)

    # Lấy tổng số lượng sản phẩm
    soluongsp = 0
    if ctgh_obj is not None:
        for item in ctgh_obj:
            soluongsp += item.SoLuong

    request.session['cart_items'] = soluongsp

    if not sanphams:
        return redirect('giohangtrong/')

    Data = {"LoaiSanPhams": LoaiSanPham.objects.all(),
            "GioHangs": cart_obj,
            "CTGHs": ctgh_obj}
    return render(request, 'pages/cart.html', Data)


#Cập nhật giỏ hàng
def cart_update(request):
    #Lấy id sản phẩm
    product_id = request.POST.get('product_id')
    current_url = request.POST.get('current_url')
    cart_obj, new_obj = GioHang.objects.new_or_get(request)

    if product_id is not None:
        try:
            obj = SanPham.objects.get(id=product_id)
        except:
            return redirect('giohang:home')

        #Kiểm tra sản phẩm trong giỏ hàng
        if obj in cart_obj.SanPhams.all():
            ctgh_obj = CTGH.objects.get(GH=cart_obj, SP=product_id)
            ctgh_obj.SoLuong += 1;
            ctgh_obj.save();
        else:
            cart_obj.SanPhams.add(obj)

    #Lấy tổng số lượng sản phẩm
    sanphams = CTGH.objects.filter(GH=cart_obj)
    soluongsp = 0
    if sanphams is not None:
        for item in sanphams:
            soluongsp += item.SoLuong

    request.session['cart_items'] = soluongsp

    return redirect(current_url)


#Xóa sản phẩm trong giỏ hàng
def cart_delete(request):
    #Lấy id sản phẩm
    product_id = request.POST.get('product_id')
    if product_id is not None:
        try:
            obj = SanPham.objects.get(id=product_id)
        except:
            return redirect('giohang:home')

        cart_obj, new_obj = GioHang.objects.new_or_get(request)

        #Kiểm tra sản phẩm trong giỏ hàng
        if obj in cart_obj.SanPhams.all():
            CTGH.objects.filter(GH=cart_obj, SP=obj).delete()
            cart_obj.SanPhams.remove(product_id)
    return redirect('giohang:update')


#Xóa tất cả sản phẩm trong giỏ hàng
def cart_deleteall(request):
    cart_obj, new_obj = GioHang.objects.new_or_get(request)
    CTGH.objects.filter(GH=cart_obj).delete()
    cart_obj.SanPhams.remove(*cart_obj.SanPhams.all())
    request.session['cart_items'] = 0
    return redirect('giohang:home')


#Cập nhật số lượng của sản phẩm
def cart_updatesl(request):
    # Lấy id sản phẩm
    product_id = request.POST.get('product_id')

    #Lấy số lượng sản phẩm
    soluong = (int)(request.POST.get('SoLuong'))
    cart_obj, new_obj = GioHang.objects.new_or_get(request)

    if soluong == 0:
        CTGH.objects.filter(GH=cart_obj, SP=product_id).delete()
        cart_obj.SanPhams.remove(product_id)
    else:
        item = CTGH.objects.get(GH=cart_obj, SP=product_id)
        item.SoLuong = soluong
        item.save()
    return redirect('giohang:home')

#Giỏ hàng trống
def cart_empty(request):
    Data = {"LoaiSanPhams": LoaiSanPham.objects.all(),}
    return render(request, 'pages/giohangtrong.html', Data)

#Đặt hàng
def checkout_home(request):
    user = request.user
    if not user.is_authenticated:
        return redirect('/user/dangnhap')

    cart_obj, cart_created = GioHang.objects.new_or_get(request)
    ctgh = CTGH.objects.filter(GH=cart_obj)
    order_obj = None

    error = ""
    if request.method == "POST":
        if cart_created:
            return redirect("giohang:home")
        else:
            order_obj, new_order_obj = HoaDon.objects.get_or_create(GH=cart_obj)

        is_done = order_obj.check_done()
        if is_done:
            return redirect("giohang:thanhcong")
        else:
            error = "Vui lòng kiểm tra thông tin đặt hàng"

    Data = {"LoaiSanPhams": LoaiSanPham.objects.all(),
            "Order_obj": order_obj,
            "Cart_obj": cart_obj,
            "CTGHs": ctgh,
            "User": user,
            "Error": error,
            }
    return render(request, 'pages/checkout.html', Data)

#Đặt hàng thành công
def thanhcong(request):
    user = request.user
    cart_obj, cart_created = GioHang.objects.new_or_get(request)
    ctgh = CTGH.objects.filter(GH=cart_obj)
    order_obj = None

    if cart_created:
        return redirect("giohang:home")
    else:
        order_obj, new_order_obj = HoaDon.objects.get_or_create(GH=cart_obj)

    #Cập nhật số lượng sản phẩm
    for item in ctgh:
        sanpham = SanPham.objects.get(id=item.SP.id)
        sanpham.SoLuong -= item.SoLuong
        sanpham.save()

    #Gửi thông tin hóa đơn cho người dùng và admin
    mail_subject = '[CichlibShop] Thông tin hóa đơn.'
    message = render_to_string('pages/thongtinhoadon.html', {
        'user': user,
        'Ctghs': ctgh,
        'Cart_obj': cart_obj,
        'Order_obj': order_obj,
    })
    to_email = user.email
    email = EmailMessage(
        mail_subject, message, to=[to_email]
    )
    email.content_subtype = 'html'
    email.mixed_subtype = 'related'
    email.send()


    mail_subject_admin = 'Bạn có một đơn đặt hàng mới.'
    message_admin = render_to_string('pages/thongtinhoadonadmin.html', {
        'User': user,
        'Ctghs': ctgh,
        'Cart_obj': cart_obj,
        'Order_obj': order_obj,
    })
    to_email_admins = CustomerUser.objects.get(is_superuser=True).email
    email_admin = EmailMessage(
        mail_subject_admin, message_admin, to=[to_email_admins]
    )
    email_admin.content_subtype = 'html'
    email_admin.mixed_subtype = 'related'
    email_admin.send()

    request.session['cart_items'] = 0

    # Thay đổi trạng thái thanh toán của hóa đơn khi thanh toán bằng paypal
    if request.GET.get('st'):
        order_obj.ThanhToan = True
        order_obj.save()
    del request.session['cart_id']

    Data = {"LoaiSanPhams": LoaiSanPham.objects.all(),}
    return render(request, 'pages/thanhcong.html', Data)