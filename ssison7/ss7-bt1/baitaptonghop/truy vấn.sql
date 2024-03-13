SELECT Book.Id       as Id,
       Book.Name     as Name,
       Book.Price    as Price,
       Book.Status   as Status,
       category.name as CategoryName,
       Author.name   as AuthorName,
       Book.CreatedDate = CreatedDate
from Book
         join baitaptonghop.category on book.CategoryId = Category.id
         join baitaptonghop.author on book.AuthorId = Author.Id
order by book.Price desc;


-- 2.	Lấy ra danh sách Category gồm: Id, Name, TotalProduct, Status (Trong đó cột Status nếu = 0, Ẩn, = 1 là Hiển thị )

select C.Id                               AS id,
       C.Name                             as name,
       count(c.Id)                        as totalProduct,

       IF(c.Status = 0, 'Ẩn', 'Hiển thị') AS Status

from category C
         join baitaptonghop.book b on C.Id = b.CategoryId
group by C.Id, C.Name;

-- 3. 3.	Truy vấn danh sách Customer gồm: Id, Name, Email, Phone, Address, CreatedDate, Gender, BirthDay, Age (Age là cột suy ra từ BirthDay, Gender nếu = 0 là Nam, 1 là Nữ,2 là khác )

SELECT Id,
       Name,
       Email,
       Phone,
       Address,
       CreatedDate,
       if(Gender = 0, 'nam', if(Gender = 1, 'nữ ', 'khác')) as Gender,
       BirthDay,
       DATEDIFF(CURDATE(), BirthDay) / 365                  AS Age
FROM Customer;

-- 4.	Truy vấn xóa Author chưa có sách nào
DELETE
FROM Author
WHERE NOT EXISTS (SELECT 1
                  FROM Book
                  WHERE Book.AuthorId = Author.Id);

-- 5.	Cập nhật Cột ToalBook trong bảng Auhor = Tổng số Book của mỗi Author theo Id của Author
UPDATE Author AS a
SET a.TotalBook = (SELECT COUNT(b.Id)
                   FROM Book AS b
                   WHERE b.AuthorId = a.Id)
where Id > 0;

--




