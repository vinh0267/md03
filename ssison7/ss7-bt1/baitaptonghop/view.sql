-- 1.	View v_getBookInfo thực hiện lấy ra danh sách các Book được mượn nhiều hơn 3 cuốn

# Yêu cầu 2 ( Sử dụng lệnh SQL tạo View )
# View v_getBookInfo thực hiện lấy ra danh sách các Book được mượn nhiều hơn 3 cuốn


CREATE VIEW v_getBookInfo AS
SELECT b.*
FROM Book AS b
         JOIN TicketDetail AS td ON b.Id = td.BookId
GROUP BY b.Id
HAVING SUM(td.Quantity) > 1;



create view v_getTicketList  as
select t.Id as TicketId,
       t.TicketDate,
       t.Status,
       C.Name,
       C.Email,
       C.Phone,
       sum(td.Quantity * b.Price) as totalMount,
       case T.Status
           when 0 then 'chua tra'
           when 1 then 'da tra'
           when 2 then 'qua han'
           when 3 then 'da huy'
           else 'unknown'
           end     as StatusDescription
from ticket as T
         join customer as C on T.CustomerId = C.Id
         join ticketdetail td join baitaptonghop.ticket t2 on t2.Id = td.TicketId
         join book b join baitaptonghop.book b2 on b2.Id = td.BookId
group by t.Id ;

