-- V. Tạo Stored Procedure, Function, Index, Transaction
-- 5.1. Tạo Stored Procedure
-- Tìm ra top 5 bài báo có nhiều lượt xem nhất
CREATE PROCEDURE Top5_BaiBao
AS
BEGIN
	SELECT TOP(5) BaiBao.TieuDe AS N'Tiêu đề', BaiBao.NoiDungTomTat AS N'Nội dung tóm tắt', BaiBao.NgayXuatBan AS N'Ngày xuất bản', 
	BaiBao.NgayCapNhat AS N'Lần cập nhất gần nhất', ChuyenMuc.TenChuyenMuc AS N'Chuyên mục', ChuDe.TenChuDe AS N'Chủ đề',
	PhongVien.HoTen AS N'Tác giả bài viết', BaiBao.SoLuotXem AS N'Số lượt xem'
	FROM BaiBao 
	INNER JOIN PhongVien
	ON BaiBao.ID_PhongVien = PhongVien.ID_PhongVien
	INNER JOIN ChuyenMuc
	ON BaiBao.ID_ChuyenMuc = ChuyenMuc.ID_ChuyenMuc
	INNER JOIN ChuDe
	ON ChuyenMuc.ID_ChuDe = ChuDe.ID_ChuDe
	ORDER BY SoLuotXem DESC
END
GO
--EXECUTE Top5_BaiBao


-- 5.2. Tạo Function
-- Tìm những bài báo một phóng viên đã viết thông qua mã phóng viên
CREATE FUNCTION Tim_BaiBao(@ID_PhongVien INT)
RETURNS TABLE
AS
RETURN 
	(SELECT BaiBao.TieuDe AS N'Tiêu đề', BaiBao.NoiDungTomTat AS N'Nội dung tóm tắt', BaiBao.NoiDungDayDu AS N'Nội dung đầy đủ', 
	BaiBao.NgayXuatBan AS N'Ngày Xuất Bản', BaiBao.NgayCapNhat AS N'Lần cập nhật mới nhất', BaiBao.SoLuotXem AS N'Số lượt xem',
	ChuyenMuc.TenChuyenMuc AS N'Chuyên mục', ChuDe.TenChuDe AS N'Chủ đề'
	FROM BaiBao
	INNER JOIN ChuyenMuc
	ON BaiBao.ID_ChuyenMuc = ChuyenMuc.ID_ChuyenMuc
	INNER JOIN ChuDe
	ON ChuyenMuc.ID_ChuDe = ChuDe.ID_ChuDe
	WHERE @ID_PhongVien = BaiBao.ID_PhongVien)
GO
--SELECT * FROM Tim_BaiBao(1)


-- 5.3. Tạo Index
-- Tăng tốc độ truy vấn tìm kiếm dựa trên ngày tháng năm sinh của Biên tập viên và Phóng Viên
CREATE INDEX Idx_BienTapVien_NTNS ON BienTapVien(NgayThangNamSinh)
GO
CREATE INDEX Idx_PhongVien_NTNS ON PhongVien(NgayThangNamSinh)
GO
-- 5.4. Tạo Transaction

BEGIN TRANSACTION Transaction_Insert_BaiBao
	INSERT INTO BaiBao (TieuDe, NoiDungTomTat, NoiDungDayDu, NgayXuatBan, NgayCapNhat, SoLuotXem, ID_ChuyenMuc, ID_PhongVien, ID_BienTapVien)
	VALUES (N'Tiêu đề 21', N'Nội dung tóm tắt 21', N'Nội dung đầy đủ 21', '20210617', '20210617',4567, 1, 1, 1)
COMMIT TRANSACTION Transaction_Insert_BaiBao
GO
