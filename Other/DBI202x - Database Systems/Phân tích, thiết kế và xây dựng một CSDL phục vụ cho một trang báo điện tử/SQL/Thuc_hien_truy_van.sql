-- VI. Thực hiện truy vấn
-- 6.1. Truy vấn đơn giản trên CSDL đã tạo
-- * Truy vấn trên một bảng
SELECT * FROM ChuyenMuc
GO

-- * Truy vấn có sử dụng ORDER BY
SELECT * FROM BaiBao ORDER BY SoLuotXem 
GO

-- * Truy vấn sử dụng toán tử Like và các so sánh xâu ký tự
SELECT * FROM ChuDe WHERE TenChuDe LIKE 'T%'
GO

-- * Truy vấn liên quan tới điều kiện về thời gian
SELECT * FROM PhongVien WHERE YEAR(NgayThangNamSinh) < 1970
GO

-- 6.2. Truy vấn lấy dữ liệu từ nhiều bảng trên CSDL đã tạo
-- * Truy vấn dữ liệu từ nhiều bảng sử dụng INNER JOIN
SELECT BaiBao.TieuDe, BaiBao.NoiDungDayDu, BaiBao.SoLuotXem, NguoiDoc.HoTen AS NguoiBinhLuan, BinhLuan.NoiDung AS NoiDungBinhLuan, BinhLuan.ThoiDiemBinhLuan 
FROM BaiBao
INNER JOIN BinhLuan 
ON BaiBao.ID_BaiBao = BinhLuan.ID_BaiBao
INNER JOIN NguoiDoc 
ON BinhLuan.ID_NguoiDoc = NguoiDoc.ID_NguoiDoc
GO

-- * Truy vấn dữ liệu sử dụng SELF JOIN
SELECT A.ID_ChuDe, A.TenChuyenMuc, B.TenChuyenMuc 
FROM ChuyenMuc A, ChuyenMuc B
WHERE A.ID_ChuDe = B.ID_ChuDe AND A.ID_ChuyenMuc < B.ID_ChuyenMuc 
ORDER BY A.ID_ChuDe
GO

-- * Truy vấn dữ liệu sử dụng OUTER JOIN
SELECT PV.ID_PhongVien, PV.HoTen, BB.TieuDe, BB.NgayXuatBan 
FROM PhongVien PV
LEFT OUTER JOIN BaiBao BB
ON PV.ID_PhongVien = BB.ID_PhongVien
GO

-- * Truy vấn dữ liệu sử dụng UNION, INTERSECT, EXCEPT
-- UNION
SELECT ID_BaiBao, TieuDe
FROM BaiBao

UNION

SELECT Video.ID_BaiBao, BaiBao.TieuDe
FROM Video
INNER JOIN BaiBao
ON Video.ID_BaiBao = BaiBao.ID_BaiBao
GO
-- INTERSECT
SELECT ID_BaiBao, TieuDe
FROM BaiBao

INTERSECT

SELECT Video.ID_BaiBao, BaiBao.TieuDe
FROM Video
INNER JOIN BaiBao
ON Video.ID_BaiBao = BaiBao.ID_BaiBao
GO
-- EXCEPT
SELECT ID_BaiBao, TieuDe
FROM BaiBao

EXCEPT

SELECT Video.ID_BaiBao, BaiBao.TieuDe
FROM Video
INNER JOIN BaiBao
ON Video.ID_BaiBao = BaiBao.ID_BaiBao
GO

-- 6.3. Truy vấn lấy dữ liệu từ nhiều bảng trên CSDL đã tạo
-- * Truy vấn dữ liệu sử dụng truy vấn con
-- Trong mệnh đề WHERE
SELECT ID_BaiBao, TieuDe
FROM BaiBao
WHERE ID_BaiBao IN (SELECT ID_BaiBao FROM BinhLuan)
-- Trong mệnh đề FROM
SELECT DISTINCT TruyVanCon.ID_BaiBao, BaiBao.TieuDe
FROM (SELECT ID_BaiBao FROM BinhLuan) TruyVanCon, BaiBao
WHERE TruyVanCon.ID_BaiBao = BaiBao.ID_BaiBao
GO

-- * Truy vấn sử dụng WITH
WITH BaiBao_BinhLuan(TieuDe, SoLuongBinhLuan)  
AS  
(  
    SELECT BaiBao.TieuDe, COUNT(BinhLuan.ID_BaiBao) AS SoLuongBinhLuan
	FROM BaiBao
	INNER JOIN BinhLuan
	ON BaiBao.ID_BaiBao = BinhLuan.ID_BaiBao
	GROUP BY BaiBao.TieuDe

)  
SELECT TOP(1) * FROM BaiBao_BinhLuan ORDER BY SoLuongBinhLuan DESC
GO

-- 6.4 Truy vấn có dùng phân nhóm (sử dụng GROUP BY, HANGVING) trên CSDL đã tạo
SELECT CD.TenChuDe, COUNT(BB.TieuDe) AS SoLuongBaiBao
FROM ChuyenMuc CM
INNER JOIN	ChuDe CD
ON CM.ID_ChuDe = CD.ID_ChuDe
INNER JOIN BaiBao BB
ON CM.ID_ChuyenMuc = BB.ID_ChuyenMuc
GROUP BY CD.TenChuDe
HAVING CD.TenChuDe LIKE 'K%'
GO

-- 6.5. Truy vấn sử dụng Function đã viết ở mục trước
SELECT * FROM Tim_BaiBao(1)
GO