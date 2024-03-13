-- 1.	Tạo trigger tr_Check_ Insurrance_value sao cho khi thêm hoặc sửa trên bảng Salary
-- nếu cột Insurrance có giá trị != 10% của BasicSalary thì không cho thêm mới hoặc chỉnh sửa
-- và in thông báo ‘Giá trị cảu Insurrance phải = 10% của BasicSalary’

CREATE TRIGGER tr_Check_Insurrance_value
    BEFORE INSERT ON Salary
    FOR EACH ROW
BEGIN
    DECLARE basic_salary FLOAT;

    -- Lấy giá trị của BasicSalary từ bảng Levels dựa trên LevelId của nhân viên
    SELECT BasicSalary INTO basic_salary
    FROM Levels
    WHERE Id = NEW.LevelId;

    -- Kiểm tra giá trị của Insurrance
    IF NEW.Insurrance != basic_salary * 0.1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Giá trị của Insurrance phải bằng 10% của BasicSalary';
END IF;
END;

--2.	Tạo trigger tr_check_basic_salary khi thêm mới hoặc chỉnh sửa bảng Levels nếu giá trị cột
-- BasicSalary > 10000000 thì tự động dưa về giá trị 10000000 và
-- thông báo ‘Lương cơ bản không vượt quá 10 triệu’

CREATE TRIGGER tr_check_basic_salary
    BEFORE INSERT ON Levels
    FOR EACH ROW
BEGIN
    -- Kiểm tra nếu giá trị của BasicSalary vượt quá 10 triệu
    IF NEW.BasicSalary > 10000000 THEN
        -- Đặt giá trị của BasicSalary về 10 triệu
        SET NEW.BasicSalary = 10000000;

        -- In thông báo
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lương cơ bản không vượt quá 10 triệu';
END IF;
END;
