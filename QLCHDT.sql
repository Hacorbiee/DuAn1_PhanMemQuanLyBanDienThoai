-- TAO DATABASE
create database QLCHDT
use QLCHDT

--TAO BANG MAUSAU
create table MAUSAC (
	ID int IDENTITY(1,1) Primary Key,
	MAMAU VARCHAR(50) not null,
	TENMAU NVARCHAR(50) not null,
)

--TAO BANG HANG
create table HANG (
	ID int IDENTITY(1,1) Primary Key,
	MAHANG VARCHAR(50) not null,
	TENHANG NVARCHAR(50) not null,
)

--TAO BANG CHIP
create table CHIP (
	ID int IDENTITY(1,1) Primary Key,
	MACHIP VARCHAR(50) not null,
	TENCHIP NVARCHAR(50) not null,
)
--TAO BANG RAM
create table RAM (
	ID int IDENTITY(1,1) Primary Key,
	MARAM VARCHAR(50) not null,
	DUNGLUONG int not null,
)
--TAO BANG ROM
create table ROM (
	ID int IDENTITY(1,1) Primary Key,
	MAROM VARCHAR(50) not null,
	DUNGLUONG int not null,
)
--TAO BANG PIN
create table PIN (
	ID int IDENTITY(1,1) Primary Key,
	MAPIN VARCHAR(50) not null,
	TENPIN NVARCHAR(50) not null,
)
--TAO BANG SANPHAM
create table SANPHAMCT (
	ID int IDENTITY(1,1) Primary Key,
	MASP VARCHAR(50) not null,
	TENSP VARCHAR(50) not null,
	DONGIA MONEY,
	MOTA VARCHAR(50),
	URLANH VARCHAR(50),
	SOLUONG int,
	TRANGTHAI int,
	IDMS int FOREIGN KEY REFERENCES MAUSAC(ID),
	IDPIN int FOREIGN KEY REFERENCES PIN(ID),
	IDRAM int FOREIGN KEY REFERENCES RAM(ID),
	IDROM int FOREIGN KEY REFERENCES ROM(ID),
	IDCHIP int FOREIGN KEY REFERENCES CHIP(ID),
	IDHANG int FOREIGN KEY REFERENCES HANG(ID)
)
create table SP (
	ID int IDENTITY(1,1) Primary Key,
	MaSP VARCHAR(50) not null,
	TENSP VARCHAR(50) not null,
	LoaiSP int,
	IDspct int FOREIGN KEY REFERENCES SanPhamCT(ID)
)
create table NhaCungCap (
	ID int IDENTITY(1,1) Primary Key,
	MaNCC VARCHAR(50) not null,
	TENNCC VARCHAR(50) not null,
	IDspct int FOREIGN KEY REFERENCES SanPhamCT(ID)
)

--TAO BANG IMEI
create table IMEI (
	ID int IDENTITY(1,1) Primary Key,
	MAIMEI VARCHAR(50) not null,
	IMEI VARCHAR(50) not null,
	TRANGTHAI int,
	IDSP int FOREIGN KEY REFERENCES SANPHAMCT(ID),
)

--TAO BANG NHANVIEN
create table NHANVIEN (
	ID int IDENTITY(1,1) Primary Key,
	MANV VARCHAR(50) not null,
	TEN NVARCHAR(50) not null,
	GIOITINH INT,
	CHUCVU INT, -- 0: MANAGER, 1 STAFF
	EMAIL NVARCHAR(50),
	TAIKHOAN VARCHAR(50),
	MATKHAU VARCHAR(50),
	QUEQUAN VARCHAR(50),
	TRANGTHAI int,
	NGAYSINH DATE
)
INSERT INTO NHANVIEN(MANV,TEN,GIOITINH,CHUCVU,EMAIL,TAIKHOAN,MATKHAU,QUEQUAN,NGAYSINH) VALUES
('NV1', 'Nguyen Manh Ha', 0 ,0, 'nguyenmanhha4003@gmail.com', 'nguyenmanha4003','12345678','Tuyen Quang','2003-04-11')

--TAO BANG KHACHHANG
create table KHACHHANG (
	ID int IDENTITY(1,1) Primary Key,
	MAKH VARCHAR(50) not null,
	TEN NVARCHAR(50) not null,
	GIOITINH INT,
	EMAIL NVARCHAR(50),
	QUEQUAN VARCHAR(50),
	NGAYSINH DATE,
	SDT NVARCHAR(50)
)

--TAO BANG HOADON
create table HOADON (
	ID int IDENTITY(1,1) Primary Key,
	MAHD VARCHAR(50) not null,
	TRANGTHAI int,
	IDNV int FOREIGN KEY REFERENCES NHANVIEN(ID),
	IDKH int FOREIGN KEY REFERENCES KHACHHANG(ID),
	IDKM int FOREIGN KEY REFERENCES KhuyenMai(ID),
	TONGTIEN MONEY,
	NgayMua date,
	Mota nvarchar(50)
)

--TAO BANG HOADONCHITIET
create table HDCT (
	ID int IDENTITY(1,1) Primary Key,
	SOLUONG int,
	IDHD int FOREIGN KEY REFERENCES HOADON(ID),
	IDSP int FOREIGN KEY REFERENCES SANPHAMCT(ID),
	DONGIA MONEY,
	TrangThai int
	
)

--TAO BANG KhuyenMai
create table KhuyenMai (
	ID int IDENTITY(1,1) Primary Key,
	MAKM VARCHAR(50) not null,
	TEN NVARCHAR(50) not null,
	NGAYBD DATE,
	NGAYKT DATE,
	LOAIGIAMGIA int,
	HINHTHUCGIAMGIA int,
	GIATRIGIAM int,
	TrangThai int
)

--TAO BANG SPSALE
create table SPKM (
	ID int IDENTITY(1,1) Primary Key,
	IDSP int FOREIGN KEY REFERENCES SANPHAMCT(ID),
	IDKM int FOREIGN KEY REFERENCES KhuyenMai(ID),
)












