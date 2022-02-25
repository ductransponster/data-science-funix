-- III. Tạo Trigger
-- 3.1. Bảng ChuDe
CREATE TRIGGER Trigger_ChuDe_NgayTao
ON ChuDe
AFTER INSERT
AS 
BEGIN
	DECLARE @NgayTao DATETIME
	SELECT @NgayTao = NgayTao 
	FROM Inserted 
	IF @NgayTao > Getdate()
		BEGIN
			PRINT N'Ngày tạo không hợp lệ'
			ROLLBACK TRANSACTION
		END
END
GO

-- 3.2. Bảng ChuyenMuc
CREATE TRIGGER Trigger_ChuyenMuc_NgayTao
ON ChuyenMuc
AFTER INSERT
AS 
BEGIN
	DECLARE @NgayTao DATETIME
	SELECT @NgayTao = NgayTao 
	FROM Inserted 
	IF @NgayTao > Getdate()
		BEGIN
			PRINT N'Ngày tạo không hợp lệ'
			ROLLBACK TRANSACTION
		END
END
GO

-- 3.3. Bảng BaiBao
CREATE TRIGGER Trigger_BaiBao_NgayCapNhat
ON BaiBao
AFTER INSERT
AS 
BEGIN
	DECLARE @NgayCapNhat DATETIME
	SELECT @NgayCapNhat = NgayCapNhat 
	FROM Inserted 
	IF @NgayCapNhat > Getdate()
		BEGIN
			PRINT N'Ngày cập nhật không hợp lệ'
			ROLLBACK TRANSACTION
		END
END
GO
