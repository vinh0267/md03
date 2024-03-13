CREATE DATABASE IF NOT EXISTS demo;

-- Sử dụng cơ sở dữ liệu demo
USE demo;

-- Xóa bảng nếu tồn tại
DROP TABLE IF EXISTS shopping_cart;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;


-- Tạo bảng users
CREATE TABLE users (
                       id INT NOT NULL AUTO_INCREMENT,
                       name VARCHAR(255),
                       address VARCHAR(255),
                       phone INT(11),
                       dateOfBirth DATETIME NOT NULL,
                       status VARCHAR(50),
                       PRIMARY KEY (id)
);

-- Tạo bảng products
CREATE TABLE products (
                          id INT NOT NULL AUTO_INCREMENT,
                          name VARCHAR(255),
                          price DECIMAL(10, 2),
                          stock INT,
                          status VARCHAR(50),
                          PRIMARY KEY (id)
);


-- Tạo bảng shopping_cart
CREATE TABLE shopping_cart (
                               id INT NOT NULL AUTO_INCREMENT,
                               user_id INT,
                               product_id INT,
                               quantity INT,
                               amount DECIMAL(10, 2),
                               PRIMARY KEY (id),
                               FOREIGN KEY (user_id) REFERENCES users (id),
                               FOREIGN KEY (product_id) REFERENCES products (id)
);


-- Thêm dữ liệu cho bảng users
INSERT INTO users (name, address, phone, dateOfBirth, status)
VALUES ('John Doe', '123 Main Street', 1234567890, '1990-01-01', 'Active'),
       ('Alice Smith', '456 Elm Street', 0987654321, '1992-05-15', 'Inactive'),
       ('Bob Johnson', '789 Oak Avenue', 1357924680, '1988-07-20', 'Active'),
       ('Emily Brown', '246 Pine Road', 2468013579, '1994-11-30', 'Inactive');

-- Thêm dữ liệu cho bảng products
INSERT INTO products (name, price, stock, status)
VALUES ('Product A', 29.99, 100, 'Available'),
       ('Product B', 39.99, 50, 'Available'),
       ('Product C', 19.99, 200, 'Available'),
       ('Product D', 49.99, 150, 'Out of stock');

-- Thêm dữ liệu cho bảng shopping_cart
INSERT INTO shopping_cart (user_id, product_id, quantity, amount)
VALUES (9, 1, 2, 59.98),
       (9, 2, 1, 39.99),
       (10, 1, 3, 89.97),
       (11, 3, 2, 39.98);



-- Tạo trigger
DELIMITER //
CREATE TRIGGER update_amount_after_price_change
    AFTER UPDATE ON products
    FOR EACH ROW
BEGIN
    DECLARE total_amount DECIMAL(10, 2);
   -- SET total_amount = NEW.price * (SELECT SUM(quantity) FROM shopping_cart WHERE product_id = OLD.id);

    UPDATE shopping_cart
    SET amount = quantity* NEW.price
    WHERE product_id = OLD.id;
END;
//
DELIMITER ;

-- Tạo trigger khi xóa product thì những dữ liệu ở bảng shopping_cart có chứa product bị xóa
-- thì cũng phải xóa theo

DELIMITER //

CREATE TRIGGER delete_from_shopping_cart_after_delete_product
    BEFORE DELETE ON products
    FOR EACH ROW
BEGIN
    DELETE FROM shopping_cart WHERE product_id = OLD.id;
END;
//

DELIMITER ;
-- BEFORE xóa th shopping cart trước . khi ta gọi th delete product thì BEFORE sẽ xóa th shopping cart trước sau đó
-- mới xóa product. còn after là xóa th product trước th khi đó shopping cart null gây ra lỗi

DELETE FROM products
WHERE id = 3;



-- Khi thêm một sp trong shopping_cart với số lượng n thì bên product cũng sẽ phải trừ đi số lượng n
-- Tạo trigger sau khi thêm shopping_cart
DELIMITER //
CREATE TRIGGER reduce_product_stock_after_insert_shopping_cart
    AFTER INSERT ON shopping_cart
    FOR EACH ROW
BEGIN
    DECLARE product_quantity INT;

    -- Lấy số lượng sản phẩm trong giỏ hàng mới được thêm
    SET product_quantity = NEW.quantity;                     --  giá trị của cột quantity từ hàng mới được thêm trong bảng shopping_cart
                                                             --  vào biến product_quantity.

    -- Giảm số lượng sản phẩm trong bảng products
    UPDATE products
    SET stock = stock - product_quantity
    WHERE id = NEW.product_id;               --  product_id : trong shopingcart = id sản phâm
END;
//
DELIMITER ;





