USE [master]
GO
/**** uhjhhjhuhuada
CREATE DATABASE [DBMYPHAM2]
GO
USE [DBMYPHAM2]
GO
CREATE TABLE [dbo].[Admin](
	[NameUser] [varchar](50) NOT NULL,
	[PwdUser] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[NameUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
go
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[TaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[DiaChiKH] [nvarchar](100) NULL,
	[DienThoaiKH] [varchar](11) NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [int] NOT NULL,
	[TenNSX] [nvarchar](100) NOT NULL,
	[DiaChiNSX] [nvarchar](200) NULL,
 CONSTRAINT [PK_TenNSX] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TenLoai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[GiaBan] [bigint] NULL,
	[MoTa] [text] NULL,
	[HinhAnh] [varchar](100) NULL,
	[NgayCapNhat] [datetime] NULL,
	[SoLuongTon] [int] NULL,
	[MaNSX] [int] NULL,
	[MaLoai] [int] NULL,
	[Admin] [varchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [date] NULL,
	[MaKH] [int] NULL,
	[DaThanhToan] [bit] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[Tongtien] [bigint] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
CREATE TABLE [dbo].[ChiTietDDH](
	[MaDH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[Dongia] [int] NULL,
 CONSTRAINT [PK_ChiTietDDH] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


INSERT [dbo].[Admin] ([NameUser], [PwdUser], [HoTen]) VALUES (N'admin', N'123', N'AnhB')
INSERT [dbo].[Admin] ([NameUser], [PwdUser], [HoTen]) VALUES (N'user', N'user', N'TamYen')



SET IDENTITY_INSERT [dbo].[KhachHang] ON 
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [TaiKhoan], [MatKhau], [Email], [DiaChiKH], [DienThoaiKH], [NgaySinh]) VALUES (5, N'Dương Thành Phết', N'thayphet.net', N'123456', N'phetcm@hgmail.com', N'12 Trần Huy Liệu', N'0918062755', CAST(N'1976-08-20 00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [TaiKhoan], [MatKhau], [Email], [DiaChiKH], [DienThoaiKH], [NgaySinh]) VALUES (6, N'Nguyễn Tiến Luân', N'thang', N'123456', N'ntluan@hcmuns.edu.vn', N'21 Quận 6', N'0917654310', CAST(N'1990-10-15 00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [TaiKhoan], [MatKhau], [Email], [DiaChiKH], [DienThoaiKH], [NgaySinh]) VALUES (7, N'Đặng Quốc Hòa', N'dqhoa', N'hoa', N'dqhoa@hcmuns.edu.vn', N'32 Sư Vạn Hạnh', N'098713245', CAST(N'1991-05-21 00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [TaiKhoan], [MatKhau], [Email], [DiaChiKH], [DienThoaiKH], [NgaySinh]) VALUES (8, N'Ngô Ngọc Ngân', N'nnngan', N'ngan', N'nnngan@hcmuns.edu.vn', N'12 Khu chung cư', N'0918544699', CAST(N'1986-10-12 00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [TaiKhoan], [MatKhau], [Email], [DiaChiKH], [DienThoaiKH], [NgaySinh]) VALUES (9, N's', N's', N'ss', N'a', N'a', N'a', CAST(N'2018-03-27 00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [TaiKhoan], [MatKhau], [Email], [DiaChiKH], [DienThoaiKH], [NgaySinh]) VALUES (10, N'noname', N'noname', N'noname', N'noname@gmail.com', N'678/99 abc', N'0909911009', CAST(N'1999-09-09 00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [TaiKhoan], [MatKhau], [Email], [DiaChiKH], [DienThoaiKH], [NgaySinh]) VALUES (11, N'ko', N'ko', N'ko', N'ko', N'ko', N'0909090909', CAST(N'1990-08-09 00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [TaiKhoan], [MatKhau], [Email], [DiaChiKH], [DienThoaiKH], [NgaySinh]) VALUES (12, N'tên', N'ten', N'ten', N'', N'nha ngta', N'0099009900', CAST(N'2000-11-12 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF

INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChiNSX]) VALUES (1, N'3CE', N'124 Nguyễn Văn Cừ Q.1 Tp.HCM')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChiNSX]) VALUES (2, N'MAYBELINE', N'Đồng Nai')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChiNSX]) VALUES (3, N'INNISFREE', N'Tp.HCM')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChiNSX]) VALUES (4, N'QUALITY FIRST', N'Tp.HCM')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChiNSX]) VALUES (5, N'LANEIGE', N'Đà Nẵng')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChiNSX]) VALUES (6, N'BELE', N'Bình Dương')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChiNSX]) VALUES (7, N'BIOREl', N'Tp.HCM')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChiNSX]) VALUES (8, N'NIVIA', N'Hà Nội')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChiNSX]) VALUES (9, N'MVC', N'hutech')

SET IDENTITY_INSERT [dbo].[SanPham] ON 
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnh], [NgayCapNhat], [SoLuongTon], [MaNSX], [MaLoai], [Admin]) VALUES (83, N'sad', 333, N'<p>M&ocirc; t? s?n ph?m</p>', N'neutrogena.jpg', CAST(N'2018-04-27 03:57:33.213' AS DateTime), 0, 1, 4, N'admin')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnh], [NgayCapNhat], [SoLuongTon], [MaNSX], [MaLoai], [Admin]) VALUES (84, N'f', 9, N'<p>M&ocirc; t? s?n ph?m</p>', N'5-1.png', CAST(N'2018-04-27 08:47:41.007' AS DateTime), 10, 1, 4, N'admin')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnh], [NgayCapNhat], [SoLuongTon], [MaNSX], [MaLoai], [Admin]) VALUES (85, N'<50 ký tự, ko ký tự đặc biệt', 1, N'<p>M&ocirc; t? s?n ph?m</p>', N'olay.jpg', CAST(N'2019-03-27 13:10:06.950' AS DateTime), 0, 1, 4, N'user')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnh], [NgayCapNhat], [SoLuongTon], [MaNSX], [MaLoai], [Admin]) VALUES (86, N'abc', 9000, N'<p>M&ocirc; t? s?n ph?m</p>', N'cc.jpg', CAST(N'2019-03-27 13:53:10.233' AS DateTime), 0, 7, 13, N'user')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnh], [NgayCapNhat], [SoLuongTon], [MaNSX], [MaLoai], [Admin]) VALUES (87, N'san pham tao lao', 80000, N'<p>M&ocirc; t? s?n ph?m</p>', N'n.jpg', CAST(N'2019-03-27 13:53:39.083' AS DateTime), 0, 2, 10, N'user')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnh], [NgayCapNhat], [SoLuongTon], [MaNSX], [MaLoai], [Admin]) VALUES (88, N'tao lao', 80000, N'<p>M&ocirc; t? s?n ph?m</p>', N'replay.png', CAST(N'2019-03-27 13:54:18.143' AS DateTime), 1, 8, 9, N'user')
SET IDENTITY_INSERT [dbo].[SanPham] OFF

SET IDENTITY_INSERT [dbo].[DonDatHang] ON 
INSERT [dbo].[DonDatHang] ([MaDH], [NgayDat], [NgayGiao], [MaKH], [DaThanhToan], [TinhTrangGiaoHang], [Tongtien]) VALUES (1, CAST(N'2018-04-03 17:06:41.677' AS DateTime), CAST(N'2018-04-04' AS Date), 9, 1, 1, NULL)
INSERT [dbo].[DonDatHang] ([MaDH], [NgayDat], [NgayGiao], [MaKH], [DaThanhToan], [TinhTrangGiaoHang], [Tongtien]) VALUES (4, CAST(N'2018-04-03 17:15:53.433' AS DateTime), CAST(N'2018-04-04' AS Date), 9, 1, 1, NULL)
INSERT [dbo].[DonDatHang] ([MaDH], [NgayDat], [NgayGiao], [MaKH], [DaThanhToan], [TinhTrangGiaoHang], [Tongtien]) VALUES (6, CAST(N'2018-04-03 23:00:26.007' AS DateTime), NULL, 9, 1, 1, NULL)
INSERT [dbo].[DonDatHang] ([MaDH], [NgayDat], [NgayGiao], [MaKH], [DaThanhToan], [TinhTrangGiaoHang], [Tongtien]) VALUES (8, CAST(N'2018-04-03 23:34:14.257' AS DateTime), CAST(N'2018-04-04' AS Date), 9, 1, 1, NULL)
INSERT [dbo].[DonDatHang] ([MaDH], [NgayDat], [NgayGiao], [MaKH], [DaThanhToan], [TinhTrangGiaoHang], [Tongtien]) VALUES (9, CAST(N'2018-04-22 15:45:14.873' AS DateTime), CAST(N'2018-04-23' AS Date), 5, 1, 1, NULL)
INSERT [dbo].[DonDatHang] ([MaDH], [NgayDat], [NgayGiao], [MaKH], [DaThanhToan], [TinhTrangGiaoHang], [Tongtien]) VALUES (10, CAST(N'2018-04-22 16:27:41.933' AS DateTime), CAST(N'2018-04-25' AS Date), 5, 1, 1, 139999)
INSERT [dbo].[DonDatHang] ([MaDH], [NgayDat], [NgayGiao], [MaKH], [DaThanhToan], [TinhTrangGiaoHang], [Tongtien]) VALUES (11, CAST(N'2018-04-22 16:30:41.063' AS DateTime), CAST(N'2018-04-27' AS Date), 5, 1, 1, 279999)
INSERT [dbo].[DonDatHang] ([MaDH], [NgayDat], [NgayGiao], [MaKH], [DaThanhToan], [TinhTrangGiaoHang], [Tongtien]) VALUES (12, CAST(N'2018-04-22 16:31:19.973' AS DateTime), CAST(N'2018-04-26' AS Date), 6, 1, 1, 40000)
INSERT [dbo].[DonDatHang] ([MaDH], [NgayDat], [NgayGiao], [MaKH], [DaThanhToan], [TinhTrangGiaoHang], [Tongtien]) VALUES (13, CAST(N'2018-04-22 17:16:24.950' AS DateTime), CAST(N'2018-05-02' AS Date), 11, 1, 1, 179999)
INSERT [dbo].[DonDatHang] ([MaDH], [NgayDat], [NgayGiao], [MaKH], [DaThanhToan], [TinhTrangGiaoHang], [Tongtien]) VALUES (14, CAST(N'2018-04-24 02:21:11.740' AS DateTime), CAST(N'2018-04-25' AS Date), 6, 1, 1, 1108776)
INSERT [dbo].[DonDatHang] ([MaDH], [NgayDat], [NgayGiao], [MaKH], [DaThanhToan], [TinhTrangGiaoHang], [Tongtien]) VALUES (15, CAST(N'2018-04-24 02:49:46.183' AS DateTime), CAST(N'2018-04-26' AS Date), 6, 1, 1, 6792655)
INSERT [dbo].[DonDatHang] ([MaDH], [NgayDat], [NgayGiao], [MaKH], [DaThanhToan], [TinhTrangGiaoHang], [Tongtien]) VALUES (16, CAST(N'2018-04-24 03:01:55.620' AS DateTime), CAST(N'2018-04-20' AS Date), 6, 0, 0, 140000)
INSERT [dbo].[DonDatHang] ([MaDH], [NgayDat], [NgayGiao], [MaKH], [DaThanhToan], [TinhTrangGiaoHang], [Tongtien]) VALUES (20, CAST(N'2019-03-27 13:45:06.717' AS DateTime), CAST(N'2019-03-26' AS Date), 12, 0, 0, 9)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF

ALTER TABLE [dbo].[ChiTietDDH]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDDH_DonDatHang] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonDatHang] ([MaDH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDDH] CHECK CONSTRAINT [FK_ChiTietDDH_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietDDH]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDDH_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDDH] CHECK CONSTRAINT [FK_ChiTietDDH_SanPham]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSP]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaSanXuat]
