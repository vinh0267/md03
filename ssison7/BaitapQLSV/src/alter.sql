-- Thêm ràng buộc dữ liệu cho cột age với giá trị thuộc khoảng: 15-55
alter table Student
-- Thêm ràng buộc kiểm tra CHECK cho cột Age trong bảng Student
    ALTER TABLE Student
    ADD CONSTRAINT chk_AgeRange
CHECK (Age BETWEEN 15 AND 55);


-- Thêm giá trị mặc định cho cột mark trong bảng StudentTest là 0
alter table StudentTest
    alter column Mark set default 0;


-- Thêm khóa chính cho bảng StudentTest là (RN, TestID)
ALTER TABLE StudentTest
    ADD PRIMARY KEY (RN, TestID);


-- Thêm ràng buộc duy nhất cho cột Name trên bảng Test
ALTER TABLE Test
    ADD CONSTRAINT unique_name UNIQUE (Name);

-- Xóa ràng buộc duy nhất (unique) trên bảng Test
alter table Test
drop INDEX unique_name;


