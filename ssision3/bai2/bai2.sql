drop database SS03_bt2_quanlybanhang;
create database SS03_bt2_quanlybanhang;
use SS03_bt2_quanlybanhang;
create table Customer(
	cID int primary key,
    Name varchar(25) not null,
    cAge tinyint
);

insert into Customer() values(1,'Minh Quan', 10);
insert into Customer() values(2,'Ngoc Oanh', 20);
insert into Customer() values(3,'Hong Ha', 50);

create table Orders(
	oID int primary key,
    cID int ,
    oDate datetime,
    oTotalPrice int,
    foreign key(cID) references Customer(cID)
);
insert into Orders(oID, cID,oDate) values(1,1,'2006-3-21');
insert into Orders(oID, cID,oDate) values(2,2,'2006-3-23');
insert into Orders(oID, cID,oDate) values(3,1,'2006-3-16');

create table Product(
	pID int primary key,
    pName varchar(25),
    pPrice int
);

insert into Product() values(1,'May Giat',3);
insert into Product() values(2,'Tu Lanh',5);
insert into Product() values(3,'Dieu Hoa',7);
insert into Product() values(4,'Quat',1);
insert into Product() values(5,'Bep Dien',2);

create table OrderDetail(
	oID int,
    pID int,
    odQTY int,
    foreign key(oID) references Orders(oID),
    foreign key(pID) references Product(pID)
);

insert into OrderDetail() values(1,1,3);
insert into OrderDetail() values(1,3,7);
insert into OrderDetail() values(1,4,2);
insert into OrderDetail() values(2,1,1);
insert into OrderDetail() values(3,1,8);
insert into OrderDetail() values(2,5,4);
insert into OrderDetail() values(2,3,3);

--  Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID,cID,oDate from Orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT C.cID, C.Name AS CustomerName, O.oID, P.pName AS ProductName, OD.odQTY
FROM Customer C
INNER JOIN Orders O ON C.cID = O.cID
INNER JOIN OrderDetail OD ON O.oID = OD.oID
INNER JOIN Product P ON OD.pID = P.pID;

--  Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select C.cID, C.Name, C.cAge from Customer C
left join Orders O on O.cID = C.cID
where O.oID is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
select O.oID , O.odate, sum((Od.odQTY * P.pPrice)) AS Price from Orders O
inner join OrderDetail Od on Od.oID = O.oID
inner join Product P on P.pID = Od.pID
group by O.oID , O.odate;