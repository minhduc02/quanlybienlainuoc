

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlytiennuoc`
--
-- --------------------------------------------------------

-- CREATE SCHEMA `QuanLyTienNuoc`;
-- USE `QuanLyTienNuoc`;

--
-- Cấu trúc bảng cho bảng `KhachHang`
--

DROP TABLE IF EXISTS `KhachHang`;
CREATE TABLE IF NOT EXISTS `KhachHang` (
  `MaKH` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DiaChi` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CCCD` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NgaySinh` date NOT NULL,
  `SoDienThoai` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaKH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `NhanVien`
--

DROP TABLE IF EXISTS `NhanVien`;
CREATE TABLE IF NOT EXISTS `NhanVien` (
  `MaNV` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `TenNV` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ChucVu` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TaiKhoan` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `MatKhau` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MaNV`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Thang`
--

DROP TABLE IF EXISTS `Thang`;
CREATE TABLE IF NOT EXISTS `Thang` (
  `ThangID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `NgayDau` date NOT NULL,
  `NgayCuoi` date NOT NULL,
  PRIMARY KEY (`ThangID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
COMMIT;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ChiSoNuoc`
--

DROP TABLE IF EXISTS `ChiSoNuoc`;
CREATE TABLE IF NOT EXISTS `ChiSoNuoc` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `MaKH` int NOT NULL REFERENCES KhachHang(MaKH),
  `ThangID` int NOT NULL REFERENCES Thang(ThangID),
  `ChiSoCu` int NOT NULL,
  `ChiSoMoi` int NOT NULL,
  `NgayGhi` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `HoaDon`
--

DROP TABLE IF EXISTS `HoaDon`;
CREATE TABLE IF NOT EXISTS `HoaDon` (
  `MaHD` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `MaKH` int NOT NULL REFERENCES KhachHang(MaKH),
  `ThangID` int NOT NULL REFERENCES Thang(ThangID),
  `LuongNuocTieuThu` int DEFAULT NULL,
  `TongTien` decimal(20,0) DEFAULT NULL,
  `NgayLapPhieu` timestamp NULL DEFAULT NULL,
  `TinhTrang` boolean NOT NULL DEFAULT false,
  `MaNV` int NOT NULL REFERENCES NhanVien(MaNV),
  PRIMARY KEY (`MaHD`,`MaKH`,`ThangID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


ALTER TABLE `KhachHang` AUTO_INCREMENT = 100;

ALTER TABLE `NhanVien` AUTO_INCREMENT = 100;

ALTER TABLE `Thang` AUTO_INCREMENT = 1;

ALTER TABLE `HoaDon` AUTO_INCREMENT = 1000;

 
--
-- Đổ dữ liệu cho bảng `KhachHang`
--

INSERT INTO `KhachHang` (`MaKH`,`HoTen`, `DiaChi`, `CCCD`, `NgaySinh`, `SoDienThoai`) VALUES
(100, 'Lê Quang Việt',	'Số 347, tổ 1, đường Phúc Diễn, Xuân Phương, Nam Từ Liêm',	'034200010146',	'1981-07-30',	'0943840321'),
(101, 'Chu Trung Toàn',	'Số 2 đường Châu Văn Liêm, Phú Đô, Nam Từ Liêm',			'038152000048',	'1979-08-11',	'0977816239'),
(102, 'Triệu Văn Hiển',	'Số 48, Tổ 2, Xuân Phương, Nam Từ Liêm',					'001301019150',	'1998-12-03',	'0984719141'),
(103, 'Hoàng Trọng Chí',	'Số 39, đường 32, Phương Canh, Nam Từ Liêm',				'001088006676',	'1986-09-01',	'0962765326'),
(104, 'Đặng Sơn Tùng',		'Số 636, đường Phúc Diễn, Xuân Phương, Nam Từ Liêm',		'036198005051',	'1991-06-02',	'0919286506'),
(105, 'Lê Văn Hùng',		'Số 83 phố Nhổn, Xuân Phương, Nam Từ Liêm',					'110611332',	'1996-07-20',	'0986694740'),
(106, 'Ân Thị Hương',		'Số 95, ngõ 5, phố Mễ Trì, Mễ Trì, Nam Từ Liêm',			'1148002841',	'1993-12-14',	'0962234901'),
(107, 'Lê Thị Thu Hằng',	'Số 36, ngõ 80, phố Đại Linh, Trung Văn, Nam Từ Liêm',		'036085003921',	'1982-03-16',	'0988302858'),
(108, 'Nguyễn Văn Ninh',	'Số 1 Đình Thôn, Mỹ Đình 1, Nam Từ Liêm',					'110432858',	'1983-04-14',	'0912530992'),
(109, 'Hoàng Ngọc Bảo',	'Số 68, Tổ 6, Phú Đô, Nam Từ Liêm',							'034188004647',	'1995-10-01',	'0972669599'),
(110, 'lê Thu Trang',	'Số 93 ngõ 143, Xuân Phương, Nam Từ Liêm',					'038081004732',	'1983-03-13',	'0988302858'),
(111, 'Nguyễn Thái Thịnh',	'Số 66, tổ dân phố 2, Mễ Trì, Nam Từ Liêm',					'001185018699',	'1997-07-15',	'0977552795');

--
-- Đổ dữ liệu cho bảng `NhanVien`
--

INSERT INTO `NhanVien`(`MaNV`, `TenNV`, `ChucVu`, `TaiKhoan`, `MatKhau`) VALUES 
(100,	'Nguyễn Thành Nam',	'QuanLy',	'admin',	MD5('admin')	),
(101,	'Nguyễn Ngọc Thạch', 'QuanLy',	'quanly',	MD5('quanly')	),
(102,	'Vũ Minh Đức',		'QuanLy',	'quanly',	MD5('quanly')	),
(103,	'Hoàng Công Chất',	'NVNuoc',	'nvnuoc2',	MD5('123456')	),
(104,	'Lê Văn Cháy',		'NVNuoc',	'nvnuoc3',	MD5('1234567')	),
(105,	'Nguyễn Thu Ngân',	'ThuTien',	'thutien1',	MD5('12345')	),
(106,	'Hoàng Thị Kim',	'ThuTien',	'thutien2',	MD5('123456789'));

--
-- Đổ dữ liệu cho bảng `Thang`
--

INSERT INTO `Thang`(`ThangID`, `NgayDau`, `NgayCuoi`) VALUES 
(1,	'2023-01-22',	'2023-02-21'),
(2,	'2023-02-22',	'2023-03-21'),
(3,	'2023-03-22',	'2023-04-21');

--
-- Đổ dữ liệu cho bảng `ChiSoNuoc`
--

INSERT INTO `ChiSoNuoc`(`MaKH`, `ThangID`, `ChiSoCu`, `ChiSoMoi`, `NgayGhi`) VALUES 
(100,1,568,580,'2023-02-21'),
(101,1,450,475,'2023-02-21'),
(102,1,152,195,'2023-02-21'),
(103,1,340,360,'2023-02-21'),
(104,1,100,120,'2023-02-21'),
(105,1,1200,1250,'2023-02-21'),
(106,1,7600,7900,'2023-02-21'),

(100,2,580,599,'2023-03-21'),
(101,2,475,496,'2023-03-21'),
(102,2,195,210,'2023-03-21'),
(103,2,360,390,'2023-03-21'),
(104,2,120,150,'2023-03-21'),
(105,2,125,135,'2023-03-21'),
(106,2,790,820,'2023-03-21'),

(100,3,599,620,'2023-04-21'),
(101,3,496,519,'2023-04-21'),
(102,3,210,220,'2023-04-21'),
(103,3,390,450,'2023-04-21'),
(104,3,150,170,'2023-04-21'),
(105,3,135,180,'2023-04-21'),
(106,3,820,860,'2023-04-21');


--
-- Đổ dữ liệu cho bảng `HoaDon`
--



INSERT INTO `HoaDon`(`MaHD`, `MaKH`, `ThangID`, `LuongNuocTieuThu`, `TongTien`, `NgayLapPhieu`, `TinhTrang`, `MaNV`) VALUES 
(1001,100,1,580-568,(580-568)*12000,'2023-02-25',true,105),
(1002,101,1,475-450,(475-450)*12000,'2023-02-28',true,105),
(1003,102,1,195-152,(195-152)*12000,'2023-02-26',true,106),
(1004,103,1,360-340,(360-340)*12000,'2023-02-25',true,106),
(1005,104,1,120-100,(120-100)*12000,'2023-02-28',true,106),
(1006,105,1,125-120,(125-120)*12000,'2023-02-25',true,105),
(1007,106,1,790-760,(790-760)*12000,'2023-02-28',true,105),

(1008,100,2,599-580,(599-580)*12000,'2023-03-25',true,106),
(1009,101,2,496-475,(496-475)*12000,'2023-03-25',true,105),
(1010,102,2,210-195,(210-195)*12000,'2023-03-26',true,106),
(1011,103,2,390-360,(390-360)*12000,'2023-03-28',true,106),
(1012,104,2,150-120,(150-120)*12000,'2023-03-25',true,106),
(1013,105,2,135-125,(135-125)*12000,'2023-03-25',true,105),
(1014,106,2,820-790,(820-790)*12000,'2023-03-28',true,105),

(1015,100,3,620-599,(620-599)*12000,'2023-04-26',true,105),
(1016,101,3,519-496,(519-496)*12000,'2023-04-30',true,106),
(1018,103,3,450-390,(450-390)*12000,'2023-04-27',true,106),
(1020,105,3,180-135,(180-135)*12000,'2023-02-26',true,106);
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
