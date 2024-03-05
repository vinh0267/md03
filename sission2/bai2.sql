
-- Tạo cơ sở dữ liệu QuanLyBanHang
CREATE DATABASE IF NOT EXISTS QuanLyBanHang;
USE QuanLyBanHang;

-- Tạo bảng Customer
CREATE TABLE IF NOT EXISTS Customer (
    cID INT AUTO_INCREMENT PRIMARY KEY,
    cName VARCHAR(255),
    cAge INT
);

create table IF NOT exists ODER (
oID INT auto_increment primary key,
cID int(255),
oDATE DATE,
oTotalPrice decimal(10,2),
primary key(oID,cID),
FOREIGN key (cID) REFERENCES customer (cID)
);

create table IF NOT exists OrderDetails  (
oID int,
pID int,
odQTY int,
primary key (oID, pID),
FOREIGN key (oID) REFERENCES oder (oID),
FOREIGN key (pID) REFERENCES product (pID)
);


create table IF NOT exists Product  (
pID int AUTO_INCREMENT PRIMARY KEY , 
pName VARCHAR(255),
pPrice DECIMAL(10, 2)    
);