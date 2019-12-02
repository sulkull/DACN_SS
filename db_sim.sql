-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 02, 2019 lúc 02:24 PM
-- Phiên bản máy phục vụ: 10.4.6-MariaDB
-- Phiên bản PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_sim`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add nha mang', 6, 'add_nhamang'),
(22, 'Can change nha mang', 6, 'change_nhamang'),
(23, 'Can delete nha mang', 6, 'delete_nhamang'),
(24, 'Can view nha mang', 6, 'view_nhamang'),
(25, 'Can add sim nam sinh', 7, 'add_simnamsinh'),
(26, 'Can change sim nam sinh', 7, 'change_simnamsinh'),
(27, 'Can delete sim nam sinh', 7, 'delete_simnamsinh'),
(28, 'Can view sim nam sinh', 7, 'view_simnamsinh'),
(29, 'Can add sim theo gia', 8, 'add_simtheogia'),
(30, 'Can change sim theo gia', 8, 'change_simtheogia'),
(31, 'Can delete sim theo gia', 8, 'delete_simtheogia'),
(32, 'Can view sim theo gia', 8, 'view_simtheogia'),
(33, 'Can add sim theo loai', 9, 'add_simtheoloai'),
(34, 'Can change sim theo loai', 9, 'change_simtheoloai'),
(35, 'Can delete sim theo loai', 9, 'delete_simtheoloai'),
(36, 'Can view sim theo loai', 9, 'view_simtheoloai'),
(37, 'Can add san pham', 10, 'add_sanpham'),
(38, 'Can change san pham', 10, 'change_sanpham'),
(39, 'Can delete san pham', 10, 'delete_sanpham'),
(40, 'Can view san pham', 10, 'view_sanpham'),
(41, 'Can add ctgh', 11, 'add_ctgh'),
(42, 'Can change ctgh', 11, 'change_ctgh'),
(43, 'Can delete ctgh', 11, 'delete_ctgh'),
(44, 'Can view ctgh', 11, 'view_ctgh'),
(45, 'Can add gio hang', 12, 'add_giohang'),
(46, 'Can change gio hang', 12, 'change_giohang'),
(47, 'Can delete gio hang', 12, 'delete_giohang'),
(48, 'Can view gio hang', 12, 'view_giohang'),
(49, 'Can add user', 13, 'add_customeruser'),
(50, 'Can change user', 13, 'change_customeruser'),
(51, 'Can delete user', 13, 'delete_customeruser'),
(52, 'Can view user', 13, 'view_customeruser'),
(53, 'Can add loai nguoi dung', 14, 'add_loainguoidung'),
(54, 'Can change loai nguoi dung', 14, 'change_loainguoidung'),
(55, 'Can delete loai nguoi dung', 14, 'delete_loainguoidung'),
(56, 'Can view loai nguoi dung', 14, 'view_loainguoidung'),
(57, 'Can add binh luan danh gia', 15, 'add_binhluandanhgia'),
(58, 'Can change binh luan danh gia', 15, 'change_binhluandanhgia'),
(59, 'Can delete binh luan danh gia', 15, 'delete_binhluandanhgia'),
(60, 'Can view binh luan danh gia', 15, 'view_binhluandanhgia'),
(61, 'Can add hoa don', 16, 'add_hoadon'),
(62, 'Can change hoa don', 16, 'change_hoadon'),
(63, 'Can delete hoa don', 16, 'delete_hoadon'),
(64, 'Can view hoa don', 16, 'view_hoadon'),
(65, 'Can add tin tuc', 17, 'add_tintuc'),
(66, 'Can change tin tuc', 17, 'change_tintuc'),
(67, 'Can delete tin tuc', 17, 'delete_tintuc'),
(68, 'Can view tin tuc', 17, 'view_tintuc'),
(69, 'Can add lien he', 18, 'add_lienhe'),
(70, 'Can change lien he', 18, 'change_lienhe'),
(71, 'Can delete lien he', 18, 'delete_lienhe'),
(72, 'Can view lien he', 18, 'view_lienhe'),
(73, 'Can add cau hinh seo', 19, 'add_cauhinhseo'),
(74, 'Can change cau hinh seo', 19, 'change_cauhinhseo'),
(75, 'Can delete cau hinh seo', 19, 'delete_cauhinhseo'),
(76, 'Can view cau hinh seo', 19, 'view_cauhinhseo'),
(77, 'Can add product', 20, 'add_product'),
(78, 'Can change product', 20, 'change_product'),
(79, 'Can delete product', 20, 'delete_product'),
(80, 'Can view product', 20, 'view_product'),
(81, 'Can add Site Tree', 21, 'add_tree'),
(82, 'Can change Site Tree', 21, 'change_tree'),
(83, 'Can delete Site Tree', 21, 'delete_tree'),
(84, 'Can view Site Tree', 21, 'view_tree'),
(85, 'Can add Site Tree Item', 22, 'add_treeitem'),
(86, 'Can change Site Tree Item', 22, 'change_treeitem'),
(87, 'Can delete Site Tree Item', 22, 'delete_treeitem'),
(88, 'Can view Site Tree Item', 22, 'view_treeitem'),
(89, 'Can add dau gia', 23, 'add_daugia'),
(90, 'Can change dau gia', 23, 'change_daugia'),
(91, 'Can delete dau gia', 23, 'delete_daugia'),
(92, 'Can view dau gia', 23, 'view_daugia');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cauhinh_cauhinhseo`
--

CREATE TABLE `cauhinh_cauhinhseo` (
  `id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `keyword` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `des` longtext COLLATE utf8mb4_bin NOT NULL,
  `favico` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `google` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `fb_app` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `robots` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `cauhinh_cauhinhseo`
--

INSERT INTO `cauhinh_cauhinhseo` (`id`, `title`, `keyword`, `des`, `favico`, `google`, `fb_app`, `robots`) VALUES
(1, 'Sim số đẹp - Thương hiệu sim số uy tín nhất việt nam', 'Mua sim ,bán sim , Sim số đẹp, sim tứ quý ,sim năm sinh', 'Sim số đẹp - Thương hiệu uy tín trong ngành sim số đẹp từ hơn 10 năm qua, giao sim Miễn phí,dịch vụ tốt nhất thị trường', '/favico.png', 'Mã google site', '123456767890', 'index,follow');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact_lienhe`
--

CREATE TABLE `contact_lienhe` (
  `id` int(11) NOT NULL,
  `HoTen` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `Email` longtext COLLATE utf8mb4_bin NOT NULL,
  `SDT` longtext COLLATE utf8mb4_bin NOT NULL,
  `TinNhan` longtext COLLATE utf8mb4_bin NOT NULL,
  `Date` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `daugia_daugia`
--

CREATE TABLE `daugia_daugia` (
  `id` int(11) NOT NULL,
  `MoTa` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `GiaDauGia` int(11) NOT NULL,
  `GiaTang` int(11) NOT NULL,
  `BatDau` datetime(6) DEFAULT NULL,
  `KetThuc` datetime(6) NOT NULL,
  `HienThi` tinyint(1) NOT NULL,
  `SanPham_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `daugia_daugia`
--

INSERT INTO `daugia_daugia` (`id`, `MoTa`, `GiaDauGia`, `GiaTang`, `BatDau`, `KetThuc`, `HienThi`, `SanPham_id`) VALUES
(1, 'ưefwef', 2, 5, '2019-11-29 15:22:25.000000', '2019-11-30 15:22:13.000000', 0, 1),
(2, 'ưefwgwe', 0, 0, '2019-11-29 15:27:44.000000', '2019-11-30 15:27:38.000000', 1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-11-27 07:38:54.035515', '1', 'Sim số đẹp - Thương hiệu sim số uy tín nhất việt nam', 1, '[{\"added\": {}}]', 19, 1),
(2, '2019-11-27 07:39:14.155632', '1', 'menu-header', 1, '[{\"added\": {}}]', 21, 1),
(3, '2019-11-27 07:39:28.523248', '1', 'Trang chủ', 1, '[{\"added\": {}}]', 22, 1),
(4, '2019-11-27 07:40:51.268685', '1', 'Sim trả góp', 1, '[{\"added\": {}}]', 9, 1),
(5, '2019-11-27 07:41:03.523805', '2', 'Sim giá rẻ', 1, '[{\"added\": {}}]', 9, 1),
(6, '2019-11-27 07:41:13.023709', '3', 'Sim trả sau', 1, '[{\"added\": {}}]', 9, 1),
(7, '2019-11-27 07:41:29.493218', '4', 'Sim VIP', 1, '[{\"added\": {}}]', 9, 1),
(8, '2019-11-27 07:41:56.659037', '1', 'Viettel', 1, '[{\"added\": {}}]', 6, 1),
(9, '2019-11-27 07:42:00.978203', '2', 'Mobifone', 1, '[{\"added\": {}}]', 6, 1),
(10, '2019-11-27 07:42:06.568101', '3', 'Vinaphone', 1, '[{\"added\": {}}]', 6, 1),
(11, '2019-11-27 07:42:10.703807', '4', 'Vietnamobile', 1, '[{\"added\": {}}]', 6, 1),
(12, '2019-11-27 07:42:17.447626', '5', 'GmobilG', 1, '[{\"added\": {}}]', 6, 1),
(13, '2019-11-27 07:42:33.191829', '5', 'Gmobile', 2, '[{\"changed\": {\"fields\": [\"title\"]}}]', 6, 1),
(14, '2019-11-27 07:43:15.778142', '1', 'Sim giá 1 triệu - 3 triệg', 1, '[{\"added\": {}}]', 8, 1),
(15, '2019-11-27 07:43:28.565378', '2', 'Sim dưới 500 nghìn', 1, '[{\"added\": {}}]', 8, 1),
(16, '2019-11-27 07:43:54.416036', '3', 'Sim giá 500 - 1 triệu', 1, '[{\"added\": {}}]', 8, 1),
(17, '2019-11-27 07:44:12.851288', '4', 'Sim giá 3 triệu - 5 triệu', 1, '[{\"added\": {}}]', 8, 1),
(18, '2019-11-27 07:44:30.629737', '5', 'Sim giá 10 - 50 triệu', 1, '[{\"added\": {}}]', 8, 1),
(19, '2019-11-27 07:45:02.337774', '6', 'Sim giá 5  - 10 triệu', 1, '[{\"added\": {}}]', 8, 1),
(20, '2019-11-27 07:52:09.470134', '1', '036.72.11111', 1, '[{\"added\": {}}]', 10, 1),
(21, '2019-11-27 07:53:25.808839', '1', '036.72.11111', 2, '[]', 10, 1),
(22, '2019-11-27 07:53:54.321552', '2', '0823.1111.08', 1, '[{\"added\": {}}]', 10, 1),
(23, '2019-11-27 07:55:03.555155', '1', 'Sim giá 1 triệu - 3 triệu', 2, '[{\"changed\": {\"fields\": [\"title\"]}}]', 8, 1),
(24, '2019-11-27 08:14:28.263054', '2', 'Đăng nhập', 1, '[{\"added\": {}}]', 22, 1),
(25, '2019-11-27 08:14:59.350392', '3', 'Đăng ký', 1, '[{\"added\": {}}]', 22, 1),
(26, '2019-11-27 08:15:08.030750', '2', 'Đăng nhập', 2, '[{\"changed\": {\"fields\": [\"url\"]}}]', 22, 1),
(27, '2019-11-27 08:18:13.193694', '4', 'Đăng xuất', 1, '[{\"added\": {}}]', 22, 1),
(28, '2019-11-27 08:18:57.021356', '2', 'Đăng nhập', 2, '[{\"changed\": {\"fields\": [\"access_guest\"]}}]', 22, 1),
(29, '2019-11-27 08:19:04.103077', '3', 'Đăng ký', 2, '[{\"changed\": {\"fields\": [\"access_guest\"]}}]', 22, 1),
(30, '2019-11-27 08:20:04.405139', '5', 'Thông tin tài khoản', 1, '[{\"added\": {}}]', 22, 1),
(31, '2019-11-27 08:20:15.856017', '1', 'menu-header', 2, '[]', 21, 1),
(32, '2019-11-27 10:43:07.588799', '2', 'ntxl12101', 2, '[{\"changed\": {\"fields\": [\"SDT\"]}}]', 13, 1),
(33, '2019-11-27 10:49:29.888669', '2', 'ntxl12101', 3, '', 13, 1),
(34, '2019-11-27 10:49:52.131409', '3', 'ntxl12102', 2, '[{\"changed\": {\"fields\": [\"SDT\"]}}]', 13, 1),
(35, '2019-11-27 10:55:12.060356', '4', 'ntxl12101', 2, '[{\"changed\": {\"fields\": [\"SDT\"]}}]', 13, 1),
(36, '2019-11-27 11:05:52.287551', '3', 'ntxl12102', 3, '', 13, 1),
(37, '2019-11-27 11:31:32.858649', '5', 'ntxl12102', 3, '', 13, 1),
(38, '2019-11-27 11:31:32.859646', '4', 'ntxl12101', 3, '', 13, 1),
(39, '2019-11-27 11:37:30.450040', '6', 'Xin chào {{ request.user }}', 1, '[{\"added\": {}}]', 22, 1),
(40, '2019-11-27 11:37:39.164138', '1', 'menu-header', 2, '[]', 21, 1),
(41, '2019-11-27 11:38:58.445354', '6', 'Xin chào {{ request.user. firstname }}', 2, '[{\"changed\": {\"fields\": [\"title\"]}}]', 22, 1),
(42, '2019-11-27 11:39:16.779704', '6', 'Xin chào {{ request.user.firstname }}', 2, '[{\"changed\": {\"fields\": [\"title\"]}}]', 22, 1),
(43, '2019-11-27 11:41:04.383780', '6', 'Xin chào {{ request.user.last_name}}', 2, '[{\"changed\": {\"fields\": [\"title\"]}}]', 22, 1),
(44, '2019-11-27 11:41:52.542105', '5', 'Thông tin tài khoản', 3, '', 22, 1),
(45, '2019-11-27 11:42:00.854730', '6', 'Xin chào {{ request.user.last_name}}', 2, '[{\"changed\": {\"fields\": [\"url\"]}}]', 22, 1),
(46, '2019-11-27 11:42:51.612109', '6', 'ntxl12101', 2, '[{\"changed\": {\"fields\": [\"SDT\"]}}]', 13, 1),
(47, '2019-11-27 11:48:27.699639', '7', 'ntxl12102', 2, '[{\"changed\": {\"fields\": [\"email\", \"SDT\"]}}]', 13, 1),
(48, '2019-11-27 14:05:45.302308', '7', 'Giỏ hàng', 1, '[{\"added\": {}}]', 22, 1),
(49, '2019-11-27 14:06:09.725596', '1', 'menu-header', 2, '[]', 21, 1),
(50, '2019-11-27 14:43:16.385671', '7', 'Giỏ hàng', 2, '[{\"changed\": {\"fields\": [\"url\"]}}]', 22, 1),
(51, '2019-11-27 17:46:18.812738', '8', 'Thanh toán', 1, '[{\"added\": {}}]', 22, 1),
(52, '2019-11-27 17:46:32.581947', '1', 'menu-header', 2, '[]', 21, 1),
(53, '2019-11-27 17:55:00.676527', '7', 'Giỏ hàng({{ request.session.cart_items }}', 2, '[{\"changed\": {\"fields\": [\"title\"]}}]', 22, 1),
(54, '2019-11-27 17:55:38.826808', '7', 'Giỏ hàng({{ request.session.cart_items }})', 2, '[{\"changed\": {\"fields\": [\"title\"]}}]', 22, 1),
(55, '2019-11-27 17:55:46.127744', '1', 'menu-header', 2, '[]', 21, 1),
(56, '2019-11-29 15:06:19.181005', '3', '0365.367.999', 1, '[{\"added\": {}}]', 10, 1),
(57, '2019-11-29 15:22:39.940787', '1', '1', 1, '[{\"added\": {}}]', 23, 1),
(58, '2019-11-29 15:23:00.682085', '1', '1', 2, '[{\"changed\": {\"fields\": [\"GiaDauGia\"]}}]', 23, 1),
(59, '2019-11-29 15:24:55.812108', '1', '1', 2, '[{\"changed\": {\"fields\": [\"GiaDauGia\"]}}]', 23, 1),
(60, '2019-11-29 15:26:58.170394', '1', '1', 2, '[{\"changed\": {\"fields\": [\"GiaDauGia\"]}}]', 23, 1),
(61, '2019-11-29 15:28:02.414380', '2', '2', 1, '[{\"added\": {}}]', 23, 1),
(62, '2019-11-29 15:28:50.133454', '2', '2', 2, '[{\"changed\": {\"fields\": [\"HienThi\"]}}]', 23, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'sanpham', 'nhamang'),
(7, 'sanpham', 'simnamsinh'),
(8, 'sanpham', 'simtheogia'),
(9, 'sanpham', 'simtheoloai'),
(10, 'sanpham', 'sanpham'),
(11, 'giohang', 'ctgh'),
(12, 'giohang', 'giohang'),
(13, 'user', 'customeruser'),
(14, 'user', 'loainguoidung'),
(15, 'user', 'binhluandanhgia'),
(16, 'hoadon', 'hoadon'),
(17, 'news', 'tintuc'),
(18, 'contact', 'lienhe'),
(19, 'CauHinh', 'cauhinhseo'),
(20, 'daugia', 'product'),
(21, 'sitetree', 'tree'),
(22, 'sitetree', 'treeitem'),
(23, 'daugia', 'daugia');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'CauHinh', '0001_initial', '2019-11-27 07:36:41.464955'),
(2, 'CauHinh', '0002_auto_20191125_2130', '2019-11-27 07:36:41.615962'),
(3, 'CauHinh', '0003_auto_20191127_1436', '2019-11-27 07:36:41.623566'),
(4, 'sanpham', '0001_initial', '2019-11-27 07:36:42.063339'),
(5, 'contenttypes', '0001_initial', '2019-11-27 07:36:44.188463'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-11-27 07:36:44.707013'),
(7, 'auth', '0001_initial', '2019-11-27 07:36:44.994411'),
(8, 'auth', '0002_alter_permission_name_max_length', '2019-11-27 07:36:46.182096'),
(9, 'auth', '0003_alter_user_email_max_length', '2019-11-27 07:36:46.206782'),
(10, 'auth', '0004_alter_user_username_opts', '2019-11-27 07:36:46.242069'),
(11, 'auth', '0005_alter_user_last_login_null', '2019-11-27 07:36:46.268214'),
(12, 'auth', '0006_require_contenttypes_0002', '2019-11-27 07:36:46.279113'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2019-11-27 07:36:46.307975'),
(14, 'auth', '0008_alter_user_username_max_length', '2019-11-27 07:36:46.335605'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2019-11-27 07:36:46.367657'),
(16, 'auth', '0010_alter_group_name_max_length', '2019-11-27 07:36:46.576680'),
(17, 'auth', '0011_update_proxy_permissions', '2019-11-27 07:36:46.623114'),
(18, 'user', '0001_initial', '2019-11-27 07:36:47.716699'),
(19, 'admin', '0001_initial', '2019-11-27 07:36:49.995763'),
(20, 'admin', '0002_logentry_remove_auto_add', '2019-11-27 07:36:50.606740'),
(21, 'admin', '0003_logentry_add_action_flag_choices', '2019-11-27 07:36:50.647919'),
(22, 'contact', '0001_initial', '2019-11-27 07:36:50.742961'),
(23, 'daugia', '0001_initial', '2019-11-27 07:36:50.945995'),
(24, 'daugia', '0002_auto_20191127_1432', '2019-11-27 07:36:50.975507'),
(25, 'daugia', '0003_auto_20191127_1435', '2019-11-27 07:36:51.007839'),
(26, 'daugia', '0004_auto_20191127_1436', '2019-11-27 07:36:51.035565'),
(27, 'giohang', '0001_initial', '2019-11-27 07:36:51.316773'),
(28, 'giohang', '0002_auto_20191125_2130', '2019-11-27 07:36:52.526444'),
(29, 'hoadon', '0001_initial', '2019-11-27 07:36:53.593938'),
(30, 'news', '0001_initial', '2019-11-27 07:36:54.072891'),
(31, 'sessions', '0001_initial', '2019-11-27 07:36:54.165698'),
(32, 'sitetree', '0001_initial', '2019-11-27 07:36:54.975459'),
(33, 'daugia', '0005_auto_20191127_1451', '2019-11-27 07:51:20.451512'),
(34, 'sanpham', '0002_auto_20191127_1451', '2019-11-27 07:51:20.858770'),
(35, 'CauHinh', '0004_auto_20191129_2221', '2019-11-29 15:22:05.157815'),
(36, 'auth', '0012_auto_20191129_2221', '2019-11-29 15:22:05.193603'),
(37, 'daugia', '0006_auto_20191129_2221', '2019-11-29 15:22:05.393672'),
(38, 'giohang', '0003_auto_20191129_2221', '2019-11-29 15:22:05.968833'),
(39, 'hoadon', '0002_auto_20191129_2221', '2019-11-29 15:22:06.022355'),
(40, 'user', '0002_auto_20191129_2221', '2019-11-29 15:22:06.218377'),
(41, 'daugia', '0007_auto_20191129_2226', '2019-11-29 15:26:31.299189'),
(42, 'sanpham', '0003_auto_20191129_2226', '2019-11-29 15:26:31.309162'),
(43, 'daugia', '0008_auto_20191129_2227', '2019-11-29 15:27:34.912298');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `session_data` longtext COLLATE utf8mb4_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('zg95t6hae1sct800rmshqbaozkf4kyri', 'M2EyMzkwMGU1MzdkYTExZjdjNjFiMDBiYTU0MWZkNmI4YzYwZjhmZjp7ImNhcnRfaXRlbXMiOjAsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGJkN2E0MDkyNzliOTYyNWU2MTQ5ZmQwOWZlNDllYWJkOTg3N2MzIiwiY2FydF9pZCI6NH0=', '2019-12-11 17:56:04.910805'),
('q7nuc7uvr914u9b84c2kmhe484cc9d4g', 'MTYzODkyMDU1NDFjNjk0ZGMxNzBkMGE1MTVjMTc3ZjNlMGZmZGVjOTp7InVzZXJfaWQiOjQsInJlcXVlc3RfaWQiOiJkMzljYTBmMjI4ZGI0NDY5ODYwMDNiYWM1MWQyMTcyMyJ9', '2019-12-11 10:52:25.628255'),
('0txes2k0tb12c1yozo410don9xquiz1q', 'YjM5ZTY1MmFhNTEwYTRkZmRkZTE4MTQwOGRkZDUxZTM2MTk4NzNkMTp7ImNhcnRfaWQiOjUsImNhcnRfaXRlbXMiOjIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGJkN2E0MDkyNzliOTYyNWU2MTQ5ZmQwOWZlNDllYWJkOTg3N2MzIn0=', '2019-12-13 15:29:25.915433');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang_ctgh`
--

CREATE TABLE `giohang_ctgh` (
  `id` int(11) NOT NULL,
  `DonGia` int(11) NOT NULL,
  `GH_id` int(11) DEFAULT NULL,
  `SP_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `giohang_ctgh`
--

INSERT INTO `giohang_ctgh` (`id`, `DonGia`, `GH_id`, `SP_id`) VALUES
(9, 10000000, 1, 2),
(10, 10000000, 2, 1),
(11, 10000000, 3, 2),
(13, 10000000, 5, 1),
(15, 10000000, 5, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang_giohang`
--

CREATE TABLE `giohang_giohang` (
  `id` int(11) NOT NULL,
  `TongTien` double NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `giohang_giohang`
--

INSERT INTO `giohang_giohang` (`id`, `TongTien`, `user_id`) VALUES
(1, 10000000, 1),
(2, 20000000, 1),
(3, 20000000, 1),
(4, 0, 1),
(5, 20000000, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang_giohang_sanphams`
--

CREATE TABLE `giohang_giohang_sanphams` (
  `id` int(11) NOT NULL,
  `giohang_id` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `giohang_giohang_sanphams`
--

INSERT INTO `giohang_giohang_sanphams` (`id`, `giohang_id`, `sanpham_id`) VALUES
(9, 1, 2),
(10, 2, 1),
(11, 3, 2),
(13, 5, 1),
(15, 5, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon_hoadon`
--

CREATE TABLE `hoadon_hoadon` (
  `id` int(11) NOT NULL,
  `NgayDatHang` datetime(6) NOT NULL,
  `ThanhToan` tinyint(1) NOT NULL,
  `GiaoHang` tinyint(1) NOT NULL,
  `TongTien` double NOT NULL,
  `GH_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `hoadon_hoadon`
--

INSERT INTO `hoadon_hoadon` (`id`, `NgayDatHang`, `ThanhToan`, `GiaoHang`, `TongTien`, `GH_id`) VALUES
(1, '2019-11-27 17:47:20.741261', 0, 0, 10000000, 1),
(2, '2019-11-27 17:51:23.852963', 1, 0, 20000000, 2),
(3, '2019-11-27 17:54:19.567998', 1, 0, 20000000, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news_tintuc`
--

CREATE TABLE `news_tintuc` (
  `id` int(11) NOT NULL,
  `Title` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `Short_Body` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `Body` longtext COLLATE utf8mb4_bin NOT NULL,
  `CoverImage` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `Date` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham_nhamang`
--

CREATE TABLE `sanpham_nhamang` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `slug` varchar(20) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `sanpham_nhamang`
--

INSERT INTO `sanpham_nhamang` (`id`, `title`, `slug`) VALUES
(1, 'Viettel', 'viettel'),
(2, 'Mobifone', 'mobifone'),
(3, 'Vinaphone', 'vinaphone'),
(4, 'Vietnamobile', 'vietnamobile'),
(5, 'Gmobile', 'gmobilg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham_sanpham`
--

CREATE TABLE `sanpham_sanpham` (
  `id` int(11) NOT NULL,
  `slug` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `TacVu` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `SoSim` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `Gia` int(11) NOT NULL,
  `Anh` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `NgayNhap` datetime(6) NOT NULL,
  `LoaiGia_id` int(11) DEFAULT NULL,
  `Mang_id` int(11) DEFAULT NULL,
  `NamSinh_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `sanpham_sanpham`
--

INSERT INTO `sanpham_sanpham` (`id`, `slug`, `TacVu`, `SoSim`, `Gia`, `Anh`, `NgayNhap`, `LoaiGia_id`, `Mang_id`, `NamSinh_id`) VALUES
(1, '0367211111', 'vip', '036.72.11111', 10000000, '/default.png', '2019-11-27 07:52:09.463569', 5, 1, NULL),
(2, '0823111108', 'vip', '0823.1111.08', 10000000, '/default.png', '2019-11-27 07:53:54.312133', 5, 2, NULL),
(3, '0365367999', 'thuong', '0365.367.999', 500000, '/default.png', '2019-11-29 15:06:19.120780', 3, 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham_sanpham_loaisims`
--

CREATE TABLE `sanpham_sanpham_loaisims` (
  `id` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL,
  `simtheoloai_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `sanpham_sanpham_loaisims`
--

INSERT INTO `sanpham_sanpham_loaisims` (`id`, `sanpham_id`, `simtheoloai_id`) VALUES
(1, 1, 4),
(2, 2, 4),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham_simnamsinh`
--

CREATE TABLE `sanpham_simnamsinh` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `slug` varchar(20) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham_simtheogia`
--

CREATE TABLE `sanpham_simtheogia` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `slug` varchar(20) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `sanpham_simtheogia`
--

INSERT INTO `sanpham_simtheogia` (`id`, `title`, `slug`) VALUES
(1, 'Sim giá 1 triệu - 3 triệu', 'sim-gia-1-trieu-3-tr'),
(2, 'Sim dưới 500 nghìn', 'sim-duoi-500-nghin'),
(3, 'Sim giá 500 - 1 triệu', 'sim-gia-500-1-trieu'),
(4, 'Sim giá 3 triệu - 5 triệu', 'sim-gia-3-trieu-5-tr'),
(5, 'Sim giá 10 - 50 triệu', 'sim-gia-10-50-trieu'),
(6, 'Sim giá 5  - 10 triệu', 'sim-gia-5-10-trieu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham_simtheoloai`
--

CREATE TABLE `sanpham_simtheoloai` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `slug` varchar(20) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `sanpham_simtheoloai`
--

INSERT INTO `sanpham_simtheoloai` (`id`, `title`, `slug`) VALUES
(1, 'Sim trả góp', 'sim-tra-gop'),
(2, 'Sim giá rẻ', 'sim-gia-re'),
(3, 'Sim trả sau', 'sim-tra-sau'),
(4, 'Sim VIP', 'sim-vip');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sitetree_tree`
--

CREATE TABLE `sitetree_tree` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `alias` varchar(80) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `sitetree_tree`
--

INSERT INTO `sitetree_tree` (`id`, `title`, `alias`) VALUES
(1, 'Menu', 'menu-header');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sitetree_treeitem`
--

CREATE TABLE `sitetree_treeitem` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `hint` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `urlaspattern` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `alias` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `inmenu` tinyint(1) NOT NULL,
  `inbreadcrumbs` tinyint(1) NOT NULL,
  `insitetree` tinyint(1) NOT NULL,
  `access_loggedin` tinyint(1) NOT NULL,
  `access_guest` tinyint(1) NOT NULL,
  `access_restricted` tinyint(1) NOT NULL,
  `access_perm_type` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `tree_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `sitetree_treeitem`
--

INSERT INTO `sitetree_treeitem` (`id`, `title`, `hint`, `url`, `urlaspattern`, `hidden`, `alias`, `description`, `inmenu`, `inbreadcrumbs`, `insitetree`, `access_loggedin`, `access_guest`, `access_restricted`, `access_perm_type`, `sort_order`, `parent_id`, `tree_id`) VALUES
(1, 'Trang chủ', '', '/', 0, 0, NULL, '', 1, 1, 1, 0, 0, 0, 1, 1, NULL, 1),
(2, 'Đăng nhập', '', '/user/dang-nhap', 0, 0, NULL, '', 1, 1, 1, 0, 1, 0, 1, 5, NULL, 1),
(3, 'Đăng ký', '', '/user/dang-ky', 0, 0, NULL, '', 1, 1, 1, 0, 1, 0, 1, 6, NULL, 1),
(4, 'Đăng xuất', '', '/user/dang-xuat', 0, 0, NULL, '', 1, 1, 1, 1, 0, 0, 1, 8, NULL, 1),
(8, 'Thanh toán', '', '/gio-hang/thanh-toan/', 0, 0, NULL, '', 1, 1, 1, 1, 0, 0, 1, 3, NULL, 1),
(7, 'Giỏ hàng({{ request.session.cart_items }})', '', '/gio-hang', 0, 0, NULL, '', 1, 1, 1, 0, 0, 0, 1, 2, NULL, 1),
(6, 'Xin chào {{ request.user.last_name}}', '', '/user/thong-tin-tai-khoan', 0, 0, NULL, '', 1, 1, 1, 1, 0, 0, 1, 7, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sitetree_treeitem_access_permissions`
--

CREATE TABLE `sitetree_treeitem_access_permissions` (
  `id` int(11) NOT NULL,
  `treeitem_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_binhluandanhgia`
--

CREATE TABLE `user_binhluandanhgia` (
  `id` int(11) NOT NULL,
  `NgayBL` datetime(6) NOT NULL,
  `NoiDung` longtext COLLATE utf8mb4_bin NOT NULL,
  `SoSao` int(11) NOT NULL,
  `MaKH_id` int(11) NOT NULL,
  `MaSP_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_customeruser`
--

CREATE TABLE `user_customeruser` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `SDT` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `DiaChi` longtext COLLATE utf8mb4_bin NOT NULL,
  `GioiTinh` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `NgaySinh` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `user_customeruser`
--

INSERT INTO `user_customeruser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `SDT`, `DiaChi`, `GioiTinh`, `NgaySinh`) VALUES
(1, 'pbkdf2_sha256$150000$VruTkKFGfhVW$rhmBQqwddoUo9BgpVvmga+NzJt0aKpfdXMYH3Ne7aa8=', '2019-11-29 13:55:24.272879', 1, 'ntxl1210', 'Nguyễn Trần', 'Lộc', 'ntxl1210@gmail.com', 1, 1, '2019-11-27 07:38:30.147090', '1231231231', 'ký túc xá khu A, làng đại học', '0', '2019-11-01'),
(7, 'pbkdf2_sha256$150000$OgVaEF0vkUGV$/UtnGSmdDIHDbQGQ7OzASRJlczO1M2MXmoYLbY8xsqM=', '2019-11-27 11:46:41.000000', 0, 'ntxl12102', 'Nguyễn Trần', 'Lộc', 'xathu17201@gmail.com', 0, 1, '2019-11-27 11:43:20.000000', '3242342342', 'ký túc xá khu A, làng đại học', '0', '2019-11-01'),
(6, 'pbkdf2_sha256$150000$DMNIQtYPksjb$LkF2H59QXxMZo/i8xhwTR9WjNFdml2J2arQ+jcEmo9g=', '2019-11-27 11:41:10.000000', 0, 'ntxl12101', 'Nguyễn Trần', 'Lộc', 'ntxl12110@gmail.com', 0, 1, '2019-11-27 11:31:50.000000', '2342342342', 'ký túc xá khu A, làng đại học', '0', '2019-11-02'),
(8, 'pbkdf2_sha256$150000$nHQSCK4Nl0F1$LydZZbQjFOYeOI/nksNyHGpHLfKPrWbWZ3d0uAbtPi8=', '2019-11-27 11:50:52.716576', 0, 'ntxl12103', 'Nguyễn Trần', 'Lộc', 'ntxl121023@gmail.com', 0, 1, '2019-11-27 11:48:59.890621', '0941313667', 'ký túc xá khu A, làng đại học', '0', '2019-11-27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_customeruser_groups`
--

CREATE TABLE `user_customeruser_groups` (
  `id` int(11) NOT NULL,
  `customeruser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_customeruser_user_permissions`
--

CREATE TABLE `user_customeruser_user_permissions` (
  `id` int(11) NOT NULL,
  `customeruser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  ADD KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  ADD KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`);

--
-- Chỉ mục cho bảng `cauhinh_cauhinhseo`
--
ALTER TABLE `cauhinh_cauhinhseo`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact_lienhe`
--
ALTER TABLE `contact_lienhe`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `daugia_daugia`
--
ALTER TABLE `daugia_daugia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `daugia_daugia_SanPham_id_4c32dbf9_uniq` (`SanPham_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `giohang_ctgh`
--
ALTER TABLE `giohang_ctgh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `giohang_ctgh_GH_id_39e1304c` (`GH_id`),
  ADD KEY `giohang_ctgh_SP_id_e88a9231` (`SP_id`);

--
-- Chỉ mục cho bảng `giohang_giohang`
--
ALTER TABLE `giohang_giohang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `giohang_giohang_user_id_b1f3a2fe` (`user_id`);

--
-- Chỉ mục cho bảng `giohang_giohang_sanphams`
--
ALTER TABLE `giohang_giohang_sanphams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `giohang_giohang_SanPhams_giohang_id_sanpham_id_1aeafb49_uniq` (`giohang_id`,`sanpham_id`),
  ADD KEY `giohang_giohang_SanPhams_giohang_id_9822f17f` (`giohang_id`),
  ADD KEY `giohang_giohang_SanPhams_sanpham_id_97cc8eed` (`sanpham_id`);

--
-- Chỉ mục cho bảng `hoadon_hoadon`
--
ALTER TABLE `hoadon_hoadon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hoadon_hoadon_GH_id_a4883223` (`GH_id`);

--
-- Chỉ mục cho bảng `news_tintuc`
--
ALTER TABLE `news_tintuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham_nhamang`
--
ALTER TABLE `sanpham_nhamang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sanpham_nhamang_slug_213833b3` (`slug`);

--
-- Chỉ mục cho bảng `sanpham_sanpham`
--
ALTER TABLE `sanpham_sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sanpham_sanpham_slug_4c90f652` (`slug`),
  ADD KEY `sanpham_sanpham_LoaiGia_id_606cfdf1` (`LoaiGia_id`),
  ADD KEY `sanpham_sanpham_Mang_id_26e6a4e6` (`Mang_id`),
  ADD KEY `sanpham_sanpham_NamSinh_id_4cd03f77` (`NamSinh_id`);

--
-- Chỉ mục cho bảng `sanpham_sanpham_loaisims`
--
ALTER TABLE `sanpham_sanpham_loaisims`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sanpham_sanpham_LoaiSims_sanpham_id_simtheoloai_id_f61635f1_uniq` (`sanpham_id`,`simtheoloai_id`),
  ADD KEY `sanpham_sanpham_LoaiSims_sanpham_id_2bc45051` (`sanpham_id`),
  ADD KEY `sanpham_sanpham_LoaiSims_simtheoloai_id_0c9323c5` (`simtheoloai_id`);

--
-- Chỉ mục cho bảng `sanpham_simnamsinh`
--
ALTER TABLE `sanpham_simnamsinh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sanpham_simnamsinh_slug_2768c551` (`slug`);

--
-- Chỉ mục cho bảng `sanpham_simtheogia`
--
ALTER TABLE `sanpham_simtheogia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sanpham_simtheogia_slug_f6f7eb3d` (`slug`);

--
-- Chỉ mục cho bảng `sanpham_simtheoloai`
--
ALTER TABLE `sanpham_simtheoloai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sanpham_simtheoloai_slug_5c796075` (`slug`);

--
-- Chỉ mục cho bảng `sitetree_tree`
--
ALTER TABLE `sitetree_tree`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Chỉ mục cho bảng `sitetree_treeitem`
--
ALTER TABLE `sitetree_treeitem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sitetree_treeitem_tree_id_alias_f597fbd9_uniq` (`tree_id`,`alias`),
  ADD KEY `sitetree_treeitem_url_b91ef35a` (`url`),
  ADD KEY `sitetree_treeitem_urlaspattern_ff432a51` (`urlaspattern`),
  ADD KEY `sitetree_treeitem_hidden_5de28c6e` (`hidden`),
  ADD KEY `sitetree_treeitem_alias_33dc5690` (`alias`),
  ADD KEY `sitetree_treeitem_inmenu_ccabc0b0` (`inmenu`),
  ADD KEY `sitetree_treeitem_inbreadcrumbs_ebb24448` (`inbreadcrumbs`),
  ADD KEY `sitetree_treeitem_insitetree_60c593a5` (`insitetree`),
  ADD KEY `sitetree_treeitem_access_loggedin_8a523197` (`access_loggedin`),
  ADD KEY `sitetree_treeitem_access_guest_09916132` (`access_guest`),
  ADD KEY `sitetree_treeitem_access_restricted_e9c87676` (`access_restricted`),
  ADD KEY `sitetree_treeitem_sort_order_93fd716c` (`sort_order`),
  ADD KEY `sitetree_treeitem_parent_id_88f6f9a4` (`parent_id`),
  ADD KEY `sitetree_treeitem_tree_id_038a4bc7` (`tree_id`);

--
-- Chỉ mục cho bảng `sitetree_treeitem_access_permissions`
--
ALTER TABLE `sitetree_treeitem_access_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sitetree_treeitem_access_treeitem_id_permission_i_a3224a96_uniq` (`treeitem_id`,`permission_id`),
  ADD KEY `sitetree_treeitem_access_permissions_treeitem_id_aedb7367` (`treeitem_id`),
  ADD KEY `sitetree_treeitem_access_permissions_permission_id_c6d1d87a` (`permission_id`);

--
-- Chỉ mục cho bảng `user_binhluandanhgia`
--
ALTER TABLE `user_binhluandanhgia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_binhluandanhgia_MaKH_id_18d97911` (`MaKH_id`),
  ADD KEY `user_binhluandanhgia_MaSP_id_6174b740` (`MaSP_id`);

--
-- Chỉ mục cho bảng `user_customeruser`
--
ALTER TABLE `user_customeruser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `user_customeruser_groups`
--
ALTER TABLE `user_customeruser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_customeruser_groups_customeruser_id_group_id_3d678a1c_uniq` (`customeruser_id`,`group_id`),
  ADD KEY `user_customeruser_groups_customeruser_id_91d892ca` (`customeruser_id`),
  ADD KEY `user_customeruser_groups_group_id_d0edfea3` (`group_id`);

--
-- Chỉ mục cho bảng `user_customeruser_user_permissions`
--
ALTER TABLE `user_customeruser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_customeruser_user_p_customeruser_id_permissi_0ae3e6b5_uniq` (`customeruser_id`,`permission_id`),
  ADD KEY `user_customeruser_user_permissions_customeruser_id_a1543949` (`customeruser_id`),
  ADD KEY `user_customeruser_user_permissions_permission_id_2f237c7d` (`permission_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT cho bảng `cauhinh_cauhinhseo`
--
ALTER TABLE `cauhinh_cauhinhseo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `contact_lienhe`
--
ALTER TABLE `contact_lienhe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `daugia_daugia`
--
ALTER TABLE `daugia_daugia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `giohang_ctgh`
--
ALTER TABLE `giohang_ctgh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `giohang_giohang`
--
ALTER TABLE `giohang_giohang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `giohang_giohang_sanphams`
--
ALTER TABLE `giohang_giohang_sanphams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `hoadon_hoadon`
--
ALTER TABLE `hoadon_hoadon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `news_tintuc`
--
ALTER TABLE `news_tintuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sanpham_nhamang`
--
ALTER TABLE `sanpham_nhamang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `sanpham_sanpham`
--
ALTER TABLE `sanpham_sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sanpham_sanpham_loaisims`
--
ALTER TABLE `sanpham_sanpham_loaisims`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sanpham_simnamsinh`
--
ALTER TABLE `sanpham_simnamsinh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sanpham_simtheogia`
--
ALTER TABLE `sanpham_simtheogia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `sanpham_simtheoloai`
--
ALTER TABLE `sanpham_simtheoloai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `sitetree_tree`
--
ALTER TABLE `sitetree_tree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sitetree_treeitem`
--
ALTER TABLE `sitetree_treeitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `sitetree_treeitem_access_permissions`
--
ALTER TABLE `sitetree_treeitem_access_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_binhluandanhgia`
--
ALTER TABLE `user_binhluandanhgia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_customeruser`
--
ALTER TABLE `user_customeruser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `user_customeruser_groups`
--
ALTER TABLE `user_customeruser_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_customeruser_user_permissions`
--
ALTER TABLE `user_customeruser_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
