var users = ["Nguyễn Thị Lan","Công ty HATOK","Công ty TaiMay","Công ty NamSan","Nguyễn Thị Lý","Nguyễn Thị Mỹ Ngọc","Hoàng Kiều Oanh","Nguyễn Thị Thúy","Bùi Thị Huyền Trang","Đào Thị Bảo Yến","Vũ Thị Thùy Dương","Vũ Thái Hà","Lê Thị Hạnh","Hoàng Thị Hoa","Dương Thị Hoài","Phạm Thị Thanh Hương","Trần Thị Mai Lan","Vũ Thị Lan","Nguyễn Thị Mai","Nguyễn Thị Ngà","Hoàng ánh Ngọc","Trần Thị Nguyệt","Lê Thị Sáu","Vũ Thị Thảo","Đoàn Thị Thắm","Vũ Thị Thu Thủy","Lê Thị Thúy","Trần Thị Huyền Trang","Lê Xuân Hiền","Nguyễn Thị Phương","Trần Thị Thủy","Phạm Thị Thanh Nga","Lê Thị Ngọc Sương","Đỗ Thị Huệ","Trần Mai Hương","Nguyễn Thị Bích Ngọc","Phạm Kim Thanh","Nguyễn Thị Hoa Lê","Vũ Thị Nguyệt","Bùi Thị Nhung","Giang Thị Vân","Bùi Thị Phương Lan","Nguyễn Thị Thanh Thảo","La Thị Phương Thảo","Lê Thị Hồng Thắm","Vũ Thị Viên","Lã Tường Vy","Vũ Ngọc Anh","Nguyễn Thị Ngọc Ánh","Đoàn Thị Hồng Hà","Phan Thị Huệ","Ngô Thị Bích Ngọc","Phạm Thị Thanh Nhàn","Đặng Thị Oanh","Nguyễn Thị Minh Phương","Nguyễn Thị Tĩnh","Đỗ Thị Khánh Chi","Trần Thị Thu Hương","Lê Thị Hương","Lê Thị Loan","Nguyễn Thị Thanh Mai","Vũ Thị Hoa Như","Lê Minh Phượng","Phạm Kim Thanh","Đào Thị Thu Thảo","Nguyễn Thị Thư","Nguyễn Thị Vân","Hoàng Nữ Ánh Ngọc","Nguyễn Hạnh Thắm","Mai Thị Thanh Tú","Nguyễn Thị Ngọc Bích","Lê Thị Thanh Hương","Nguyễn Ngọc Diệp"];
var products = ["D-MEDIUM 2 triệu 500k ","STARTUP 1 triệu 299k ","D-PRO 6 triệu 990k","WEB-DN 1triệu500k","WEB-DL 1 triệu"];
var hotline = ["096951xx","0326965xx","09096xx","098376xx","09854xx","03585xx","09756xx","09542xx","09745xx","09848xx","09095xx","09029xx","0986xx"];
function someonePurchasedLoop() {
    setTimeout(function () {
        someonePurchasedTracking();
        someonePurchasedLoop();
    }, Math.floor(Math.random() * 20000 + 20000 + 2000));
}

function someonePurchasedTracking(){
	var user = users[Math.floor(Math.random()*users.length)];
	var product = products[Math.floor(Math.random()*products.length)];
	var hotlines = hotline[Math.floor(Math.random()*hotline.length)];
	jQuery("#user-order").text(user + " thiết kế gói "+ product + "|SDT: " + hotlines);
	jQuery("#someone-purchased").show();

	setTimeout(function () {
        jQuery("#someone-purchased").addClass("fomo-notification-position-bottom-left");
        jQuery("#someone-purchased").removeClass("fomo-notification-position-bottom-left");
        jQuery("#someone-purchased").hide();
    }, 10000);
}


jQuery(document).ready(function($) {
	setTimeout(function () {
		someonePurchasedTracking();
	}, Math.floor(Math.random() * 10000));
	someonePurchasedLoop();
});
