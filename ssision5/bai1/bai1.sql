-- Tạo cơ sở dữ liệu demo
CREATE DATABASE IF NOT EXISTS demo;

-- Sử dụng cơ sở dữ liệu demo
USE demo;

-- Tạo bảng Products
CREATE TABLE IF NOT EXISTS Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50) UNIQUE,
    productName VARCHAR(255),
    productPrice DECIMAL(10,2),
    productAmount INT,
    productDescription TEXT,
    productStatus VARCHAR(50)
    );

-- Chèn dữ liệu mẫu cho bảng Products
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
    ('P001', 'Product 1', 10.50, 100, 'Description for Product 1', 'Active'),
    ('P002', 'Product 2', 15.75, 150, 'Description for Product 2', 'Active'),
    ('P003', 'Product 3', 20.00, 200, 'Description for Product 3', 'Inactive');

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
    ('P008', 'Product 8', 10.90, 110, 'Description for Product 8', 'Active'),
    ('P007', 'Product 7', 15.85, 120, 'Description for Product 7', 'Active'),
    ('P006', 'Product 6', 20.70, 230, 'Description for Product 6', 'Inactive');


-- Tạo Unique Index trên cột productCode
CREATE UNIQUE INDEX idx_productCode ON Products(productCode);

-- xóa P006,P007 , P008
DELETE FROM Products WHERE productCode IN ('P006', 'P007', 'P008');

-- Tạo Composite Index trên cột productName và productPrice
CREATE INDEX idx_productName_productPrice ON Products(productName, productPrice);


-- Sử dụng câu lệnh EXPLAIN để biết cách thực thi của câu truy vấn và so sánh trước và sau khi tạo index
-- Câu lệnh trước khi tạo index
EXPLAIN SELECT * FROM Products WHERE productName = 'Product 1';

-- Câu lệnh sau khi tạo index
EXPLAIN SELECT * FROM Products WHERE productName = 'Product 1' AND productPrice > 10.00;


-- Tạo view lấy thông tin productCode, productName, productPrice, productStatus từ bảng products
CREATE VIEW ProductView AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

-- Sửa đổi view: thêm cột productAmount vào view
ALTER VIEW ProductView AS
SELECT productCode, productName, productPrice, productAmount, productStatus
FROM Products;

-- Xoá view
DROP VIEW IF EXISTS ProductView;


-- Tạo stored procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng products
DELIMITER $$
CREATE PROCEDURE GetAllProducts()    -- tạo một thủ tục lưu trữ có tên GetAllProducts.
BEGIN
    SELECT * FROM Products;
END$$
DELIMITER ;

-- gọi
CALL GetAllProducts();


-- Tạo stored procedure thêm một sản phẩm mới
DELIMITER $$
CREATE PROCEDURE AddNewProduct(  p_productCode VARCHAR(50),
                                 p_productName VARCHAR(255),
                                 p_productPrice DECIMAL(10,2),
                                 p_productAmount INT,
                                 p_productDescription TEXT,
                                 p_productStatus VARCHAR(50) )
BEGIN
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
END$$
DELIMITER ;


-- Tạo stored procedure sửa thông tin sản phẩm theo id
DELIMITER $$
CREATE PROCEDURE UpdateProduct(
    IN p_id INT,
    IN p_productName VARCHAR(255),
    IN p_productPrice DECIMAL(10,2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(50)
)
BEGIN
UPDATE Products
SET productName = p_productName,
    productPrice = p_productPrice,
    productAmount = p_productAmount,
    productDescription = p_productDescription,
    productStatus = p_productStatus
WHERE Id = p_id;
END$$
DELIMITER ;


-- Tạo stored procedure xoá sản phẩm theo id
DELIMITER $$
CREATE PROCEDURE DeleteProduct(
    IN p_id INT
)
BEGIN
DELETE FROM Products WHERE Id = p_id;
END$$
DELIMITER ;
