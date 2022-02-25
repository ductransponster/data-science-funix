-- IV. Chèn dữ liêu
-- 4.1. Bảng ChuDe
SELECT * FROM ChuDe
GO
INSERT INTO ChuDe (TenChuDe, MoTa, NgayTao)
VALUES
	(N'Thời sự', N'Đây là chủ đề Thời sự', '20210101'),
	(N'Kinh doanh', N'Đây là chủ đề Kinh doanh', '20210101'),
	(N'Khoa học', N'Đây là chủ đề Khoa học', '20210105'),
	(N'Giải trí', N'Đây là chủ đề Giải trí', '20210107'),
	(N'Thể thao', N'Đây là chủ đề Thể thao', '20210221'),
	(N'Giáo dục', N'Đây là chủ đề Giáo dục', '20210225'),
	(N'Sức khỏe', N'Đây là chủ đề Sức khỏe', '20210301'),
	(N'Đời sống', N'Đây là chủ đề Đời sống', '20210401'),
	(N'Du lịch', N'Đây là chủ đề Du lịch', '20210601'),
	(N'Số hóa', N'Đây là chủ đề Số hóa', '20210627')
GO

-- 4.2. Bảng ChuyenMuc
SELECT * FROM ChuyenMuc
GO
INSERT INTO ChuyenMuc (TenChuyenMuc, MoTa, NgayTao, ID_ChuDe)
VALUES
	(N'Chính trị', N'Đây là chuyên mục Chính trị', '20210101', 1),
	(N'Giao thông', N'Đây là chuyên mục Giao thông', '20210101',1 ),
	(N'Chứng khoán', N'Đây là chuyên mục Chứng khoán', '20210101', 2),
	(N'Bất động sản', N'Đây là chuyên mục Bất động sản', '20210101', 2),
	(N'Phát minh', N'Đây là chuyên mục Phát minh', '20210105', 3),
	(N'Ứng dụng', N'Đây là chuyên mục Ứng dụng', '20210105', 3),
	(N'Ngôi sao', N'Đây là chuyên mục Ngôi sao', '20210107', 4),
	(N'Âm nhạc', N'Đây là chuyên mục Âm nhạc', '20210107', 4),
	(N'Bóng đá', N'Đây là chuyên mục Bóng đá', '20210221', 5),
	(N'Bóng cười', N'Đây là chuyên mục Bóng cười', '20210221', 5),
	(N'Đại học', N'Đây là chuyên mục Đại học', '20210225', 6),
	(N'Du học', N'Đây là chuyên mục Du học', '20210225', 6),
	(N'Dinh dưỡng', N'Đây là chuyên mục Dinh dưỡng', '20210301', 7),
	(N'Tư vấn', N'Đây là chuyên mục Tư vấn', '20210301', 7),
	(N'Nhà cửa', N'Đây là chuyên mục Nhà cửa', '20210401', 8),
	(N'Bài học', N'Đây là chuyên mục Bài học', '20210401', 8),
	(N'Trong nước', N'Đây là chuyên mục Trong nước', '20210601', 9),
	(N'Quốc tế', N'Đây là chuyên mục Quốc tế', '20210601', 9),
	(N'Công nghệ', N'Đây là chuyên mục Công nghệ', '20210627', 10),
	(N'Sản phẩm', N'Đây là chuyên mục Sản phẩm', '20210627', 10)
GO

-- 4.3. Bảng BienTapVien
SELECT * FROM BienTapVien
GO
INSERT INTO BienTapVien (Email, MatKhau, HoTen, GioiTinh, NgayThangNamSinh, AnhDaiDien, NgayThamGia)
VALUES
	('btv0102@gmail.com', 'password', N'Biên tập viên 0102', N'Nam', '19700101', 'linkanh', '20210101'),
	('btv0304@gmail.com', 'password', N'Biên tập viên 0304', N'Nam', '19850101', 'linkanh', '20210101'),
	('btv0506@gmail.com', 'password', N'Biên tập viên 0506', N'Nữ', '19720101', 'linkanh', '20210105'),
	('btv0708@gmail.com', 'password', N'Biên tập viên 0708', N'Nam', '19900101', 'linkanh', '20210107'),
	('btv0910@gmail.com', 'password', N'Biên tập viên 0910', N'Nữ', '19820101', 'linkanh', '20210221'),
	('btv1112@gmail.com', 'password', N'Biên tập viên 1112', N'Nam', '19890101', 'linkanh', '20210225'),
	('btv1314@gmail.com', 'password', N'Biên tập viên 1314', N'Nữ', '19690101', 'linkanh', '20210301'),
	('btv1516@gmail.com', 'password', N'Biên tập viên 1516', N'Nữ', '19670101', 'linkanh', '20210401'),
	('btv1718@gmail.com', 'password', N'Biên tập viên 1718', N'Nữ', '19880101', 'linkanh', '20210601'),
	('btv1920@gmail.com', 'password', N'Biên tập viên 1920', N'Nam', '19790101', 'linkanh', '20210627')
GO

-- 4.4. Bảng PhongVien
SELECT * FROM PhongVien
GO
INSERT INTO Phongvien (Email, MatKhau, HoTen, GioiTinh, NgayThangNamSinh, AnhDaiDien, NgayThamGia, ID_BienTapVien)
VALUES
	('pv1@gmail.com', 'password', N'Phóng viên 1', N'Nam', '19700101', 'linkanh', '20210101', 1),
	('pv2@gmail.com', 'password', N'Phóng viên 2', N'Nam', '19850101', 'linkanh', '20210101', 1),
	('pv3@gmail.com', 'password', N'Phóng viên 3', N'Nữ', '19720101', 'linkanh', '20210101', 2),
	('pv4@gmail.com', 'password', N'Phóng viên 4', N'Nam', '19900101', 'linkanh', '20210101', 2),
	('pv5@gmail.com', 'password', N'Phóng viên 5', N'Nữ', '19820101', 'linkanh', '20210105', 3),
	('pv6@gmail.com', 'password', N'Phóng viên 6', N'Nam', '19890101', 'linkanh', '20210105', 3),
	('pv7@gmail.com', 'password', N'Phóng viên 7', N'Nữ', '19690101', 'linkanh', '20210107', 4),
	('pv8@gmail.com', 'password', N'Phóng viên 8', N'Nữ', '19670101', 'linkanh', '20210107', 4),
	('pv9@gmail.com', 'password', N'Phóng viên 9', N'Nữ', '19880101', 'linkanh', '20210221', 5),
	('pv10@gmail.com', 'password', N'Phóng viên 10', N'Nam', '19790101', 'linkanh', '20210221', 5),
	('pv11@gmail.com', 'password', N'Phóng viên 11', N'Nữ', '19700101', 'linkanh', '20210225', 6),
	('pv12@gmail.com', 'password', N'Phóng viên 12', N'Nữ', '19850101', 'linkanh', '20210225', 6),
	('pv13@gmail.com', 'password', N'Phóng viên 13', N'Nam', '19720101', 'linkanh', '20210301', 7),
	('pv14@gmail.com', 'password', N'Phóng viên 14', N'Nữ', '19900101', 'linkanh', '20210301', 7),
	('pv15@gmail.com', 'password', N'Phóng viên 15', N'Nam', '19820101', 'linkanh', '20210401', 8),
	('pv16@gmail.com', 'password', N'Phóng viên 16', N'Nữ', '19890101', 'linkanh', '20210401', 8),
	('pv17@gmail.com', 'password', N'Phóng viên 17', N'Nam', '19690101', 'linkanh', '20210601', 9),
	('pv18@gmail.com', 'password', N'Phóng viên 18', N'Nam', '19670101', 'linkanh', '20210601', 9),
	('pv19@gmail.com', 'password', N'Phóng viên 19', N'Nam', '19880101', 'linkanh', '20210627', 10),
	('pv20@gmail.com', 'password', N'Phóng viên 20', N'Nữ', '19790101', 'linkanh', '20210627', 10)
GO

-- 4.5. Bảng NguoiDoc
SELECT * FROM NguoiDoc
GO
INSERT INTO NguoiDoc (Email, MatKhau, HoTen, AnhDaiDien, NgayThamGia)
VALUES
	('nd1@gmail.com', 'password', N'Người đọc 1', 'linkanh', '20210101'),
	('nd2@gmail.com', 'password', N'Người đọc 2', 'linkanh', '20210201'),
	('nd3@gmail.com', 'password', N'Người đọc 3', 'linkanh', '20210301'),
	('nd4@gmail.com', 'password', N'Người đọc 4', 'linkanh', '20210401'),
	('nd5@gmail.com', 'password', N'Người đọc 5', 'linkanh', '20210501'),
	('nd6@gmail.com', 'password', N'Người đọc 6', 'linkanh', '20210601'),
	('nd7@gmail.com', 'password', N'Người đọc 7', 'linkanh', '20210101'),
	('nd8@gmail.com', 'password', N'Người đọc 8', 'linkanh', '20210201'),
	('nd9@gmail.com', 'password', N'Người đọc 9', 'linkanh', '20210301'),
	('nd10@gmail.com', 'password', N'Người đọc 10', 'linkanh', '20210401')
GO

-- 4.6. Bảng BaiBao
SELECT * FROM BaiBao
GO
INSERT INTO BaiBao (TieuDe, NoiDungTomTat, NoiDungDayDu, NgayXuatBan, NgayCapNhat, SoLuotXem, ID_ChuyenMuc, ID_PhongVien, ID_BienTapVien)
VALUES
	(N'Tiêu đề 1', N'Nội dung tóm tắt 1', N'Nội dung đầy đủ 1', '20210101', '20210101',100, 1, 1, 1),
	(N'Tiêu đề 2', N'Nội dung tóm tắt 2', N'Nội dung đầy đủ 2', '20210101','20210101',1001, 2, 2, 1),
	(N'Tiêu đề 3', N'Nội dung tóm tắt 3', N'Nội dung đầy đủ 3', '20210101', '20210101',2247, 3, 3, 2),
	(N'Tiêu đề 4', N'Nội dung tóm tắt 4', N'Nội dung đầy đủ 4', '20210101', '20210101',9999, 4, 4, 2),
	(N'Tiêu đề 5', N'Nội dung tóm tắt 5', N'Nội dung đầy đủ 5', '20210105', '20210105',1111, 5, 5, 3),
	(N'Tiêu đề 6', N'Nội dung tóm tắt 6', N'Nội dung đầy đủ 6', '20210105', '20210105',2137, 6, 6, 3),
	(N'Tiêu đề 7', N'Nội dung tóm tắt 7', N'Nội dung đầy đủ 7', '20210107', '20210107',8645, 7, 7, 4),
	(N'Tiêu đề 8', N'Nội dung tóm tắt 8', N'Nội dung đầy đủ 8', '20210107', '20210107',1178, 8, 8, 4),
	(N'Tiêu đề 9', N'Nội dung tóm tắt 9', N'Nội dung đầy đủ 9', '20210221', '20210221',7749, 9, 9, 5),
	(N'Tiêu đề 10', N'Nội dung tóm tắt 10', N'Nội dung đầy đủ 10', '20210221', '20210221',8864, 10, 10, 5),
	(N'Tiêu đề 11', N'Nội dung tóm tắt 11', N'Nội dung đầy đủ 11', '20210225', '20210225',9872, 11, 11, 6),
	(N'Tiêu đề 12', N'Nội dung tóm tắt 12', N'Nội dung đầy đủ 12', '20210225', '20210225',2234, 12, 12, 6),
	(N'Tiêu đề 13', N'Nội dung tóm tắt 13', N'Nội dung đầy đủ 13', '20210301', '20210301',6666, 13, 13, 7),
	(N'Tiêu đề 14', N'Nội dung tóm tắt 14', N'Nội dung đầy đủ 14', '20210301', '20210301',7777, 14, 14, 7),
	(N'Tiêu đề 15', N'Nội dung tóm tắt 15', N'Nội dung đầy đủ 15', '20210401', '20210401',1117, 15, 15, 8),
	(N'Tiêu đề 16', N'Nội dung tóm tắt 16', N'Nội dung đầy đủ 16', '20210401', '20210401',8960, 16, 16, 8),
	(N'Tiêu đề 17', N'Nội dung tóm tắt 17', N'Nội dung đầy đủ 17', '20210601', '20210601',5478, 17, 17, 9),
	(N'Tiêu đề 18', N'Nội dung tóm tắt 18', N'Nội dung đầy đủ 18', '20210601', '20210601',4141, 18, 18, 9),
	(N'Tiêu đề 19', N'Nội dung tóm tắt 19', N'Nội dung đầy đủ 19', '20210627', '20210627',3238, 19, 19, 10),
	(N'Tiêu đề 20', N'Nội dung tóm tắt 20', N'Nội dung đầy đủ 20', '20210627', '20210627',8897, 20, 20, 10)
GO

-- 4.7. Bảng HinhAnh
SELECT * FROM HinhAnh
GO
INSERT INTO HinhAnh (ID_BaiBao,TenAnh, Anh)
VALUES
	(1, N'Tên ảnh 1', 'linkanh'),
	(2, N'Tên ảnh 2', 'linkanh'),
	(3, N'Tên ảnh 3', 'linkanh'),
	(4, N'Tên ảnh 4', 'linkanh'),
	(5, N'Tên ảnh 5', 'linkanh'),
	(6, N'Tên ảnh 6', 'linkanh'),
	(7, N'Tên ảnh 7', 'linkanh'),
	(8, N'Tên ảnh 8', 'linkanh'),
	(9, N'Tên ảnh 9', 'linkanh'),
	(10, N'Tên ảnh 10', 'linkanh'),
	(11, N'Tên ảnh 11', 'linkanh'),
	(12, N'Tên ảnh 12', 'linkanh'),
	(13, N'Tên ảnh 13', 'linkanh'),
	(14, N'Tên ảnh 14', 'linkanh'),
	(15, N'Tên ảnh 15', 'linkanh'),
	(16, N'Tên ảnh 16', 'linkanh'),
	(17, N'Tên ảnh 17', 'linkanh'),
	(18, N'Tên ảnh 18', 'linkanh'),
	(19, N'Tên ảnh 19', 'linkanh'),
	(20, N'Tên ảnh 20', 'linkanh')
GO

-- 4.8. Bảng Video
SELECT * FROM Video
GO
INSERT INTO Video (ID_BaiBao, TenVideo, Video)
VALUES
	(1, N'Tên video 1-1', 'linkvideo'),
	(1, N'Tên video 1-2', 'linkvideo'),
	(3, N'Tên video 3-3', 'linkvideo'),
	(5, N'Tên video 5-4', 'linkvideo'),
	(7, N'Tên video 7-5', 'linkvideo'),
	(9, N'Tên video 9-6', 'linkvideo'),
	(9, N'Tên video 9-7', 'linkvideo'),
	(9, N'Tên video 9-8', 'linkvideo'),
	(15, N'Tên video 15-9', 'linkvideo'),
	(19, N'Tên video 19-10', 'linkvideo')
GO

-- 4.9. Bảng BinhLuan
SELECT * FROM BinhLuan
GO
INSERT INTO BinhLuan (ID_NguoiDoc, ID_BaiBao, ThoiDiemBinhLuan, NoiDung)
VALUES
	(1, 4, '20210505', N'Nội dung bình luận 1-4-1'),
	(1, 4, '20210506', N'Nội dung bình luận 1-4-2'),
	(1, 4, '20210507', N'Nội dung bình luận 1-4-3'),
	(1, 4, '20210508', N'Nội dung bình luận 1-4-4'),
	(2, 4, '20210509', N'Nội dung bình luận 2-4-5'),
	(3, 9, '20210505', N'Nội dung bình luận 3-9-6'),
	(4, 13, '20210506', N'Nội dung bình luận 4-13-7'),
	(4, 15, '20210507', N'Nội dung bình luận 4-15-8'),
	(8, 7, '20210508', N'Nội dung bình luận 8-7-9'),
	(9, 9, '20210509', N'Nội dung bình luận 9-9-10')
GO