CREATE PROCEDURE addBookInfo(
    p_Name VARCHAR(150),
    p_Status TINYINT,
    p_Price FLOAT,
    p_CreatedDate DATE,
    p_CategoryId INT,
    p_AuthorId INT
)
BEGIN
    INSERT INTO Book (Name, Status, Price, CreatedDate, CategoryId, AuthorId)
    VALUES (p_Name, p_Status, p_Price, p_CreatedDate, p_CategoryId, p_AuthorId);
END;


CALL addBookInfo('de men', 1, 100000, NOW(), 3, 5);
--

CREATE PROCEDURE getTicketByCustomerId( IN p_CustomerId INT )
BEGIN
    SELECT T.Id                       AS TicketId,
           T.TicketDate,
           T.Status,
           SUM(TD.Quantity * B.Price) AS TotalAmount,
           CASE T.Status
               WHEN 0 THEN 'Chưa trả'
               WHEN 1 THEN 'Đã trả'
               WHEN 2 THEN 'Quá hạn'
               WHEN 3 THEN 'Đã hủy'
               ELSE 'Unknown'
               END                    AS StatusDescription
    FROM Ticket AS T
             INNER JOIN TicketDetail AS TD ON T.Id = TD.TicketId
             INNER JOIN Book AS B ON TD.BookId = B.Id
    WHERE T.CustomerId = p_CustomerId
    GROUP BY T.Id, T.TicketDate, T.Status;
END;


call getTicketByCustomerId(2);
-- 2.	Thủ tục getBookPaginate lấy ra danh sách sản phẩm có phân trang gồm: Id, Name, Price, Sale_price, Khi gọi thủ tuc truyền vào limit và page

CREATE PROCEDURE getBookPaginate(
    IN p_Limit INT,
    IN p_Page INT
)
BEGIN
    DECLARE start_index INT DEFAULT p_Limit * (p_Page - 1);

    SELECT Id,
           Name,
           Price,
           book.Price + (Price * 0.1) as Sale_price
    FROM Book
    LIMIT start_index, p_Limit;
END;

call getBookPaginate(10,2);
