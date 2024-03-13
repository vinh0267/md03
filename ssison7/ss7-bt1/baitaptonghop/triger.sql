-- 1.	Tạo trigger tr_Check_total_book_author sao cho khi thêm Book
-- nếu Author đang tham chiếu có tổng số sách > 5 thì không cho thêm mới và thông báo
--  “Tác giả này có số lượng sách đạt tới giới hạn 5 cuốn, vui long chọn tác giả khác”

DELIMITER //

CREATE TRIGGER tr_Check_total_book_author
    BEFORE INSERT
    ON Book
    FOR EACH ROW
BEGIN
    DECLARE author_book_count INT;

    -- Đếm số lượng sách của tác giả
    SELECT COUNT(*)
    INTO author_book_count
    FROM Book
    WHERE AuthorId = NEW.AuthorId;

    -- Kiểm tra nếu số lượng sách của tác giả vượt quá 5
    IF author_book_count >= 5 THEN
        -- Ngăn việc thêm mới và thông báo lỗi
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tác giả này có số lượng sách đạt tới giới hạn 5 cuốn, vui lòng chọn tác giả khác';
    END IF;
END;
//

DELIMITER ;


-- 2.	Tạo trigger tr_Update_TotalBook khi thêm mới Book thì cập nhật cột TotalBook
-- trong bảng Author = tổng của Book theo AuthorId

DELIMITER //
CREATE TRIGGER tr_Update_TotalBook
    AFTER INSERT
    ON Book
    FOR EACH ROW
BEGIN

    -- Cập nhật tổng số sách của tác giả khi thêm mới một cuốn sách
    UPDATE Author
    SET TotalBook = (SELECT COUNT(*) FROM Book WHERE AuthorId = NEW.AuthorId)
    WHERE Id = NEW.AuthorId;

END;
//
DELIMITER ;
