create procedure addEmployeetInfo ( p_Name varchar(150),
                                    p_Email varchar(150),
                                    p_Phone varchar(150),
                                    p_Adress varchar(150),
                                    p_Gender TINYINT,
                                    p_BirthDay date,
                                    p_LevelId int,
                                    p_DepartmentId INT )
begin
INSERT INTO Employee (Name, Email, Phone, Address, Gender, BirthDay, LevelId, DepartmentId)
VALUES (p_Name, p_Email, p_Phone, p_Adress, p_Gender, p_BirthDay, p_LevelId, p_DepartmentId);
END;

DROP PROCEDURE IF EXISTS addEmployeetInfo;


CALL addEmployeetInfo('le van a', 'nam@gmail.com', '1234567898', 'nguyen chi thanh', 0, '1994-12-12', 2, 2);

-- 2.	Thủ tục getSalaryByEmployeeId hiển thị danh sách các bảng lương từng nhân viên theo id của nhân viên
CREATE PROCEDURE getSalaryByEmployeeId (IN p_EmployeeId INT)
BEGIN
    SELECT
        E.Id AS EmployeeId,
        E.Name AS EmployeeName,
        E.Phone,
        E.Email,
        L.BasicSalary,
        L.AllowanceSalary,
        S.BonusSalary,
        S.Insurrance,
        SUM(T.Value) AS TotalDay,
        (L.BasicSalary + L.AllowanceSalary + S.BonusSalary - S.Insurrance * 0.1 * (SUM(T.Value))) AS TotalSalary
    FROM
        Employee E
            INNER JOIN
        Timesheets T ON E.Id = T.EmployeeId
            INNER JOIN
        Salary S ON E.Id = S.EmployeeId
            INNER JOIN
        Levels L ON E.LevelId = L.Id
    WHERE
        E.Id = p_EmployeeId
    GROUP BY
        E.Id;
END;

-- 3.	Thủ tục getEmployeePaginate lấy ra danh sách nhân viên có phân trang
CREATE PROCEDURE getEmployeePaginate(IN p_limit INT, IN p_page INT)
BEGIN
    DECLARE offset_value INT DEFAULT 0;
    SET offset_value = (p_page - 1) * p_limit;

    SELECT
        Id,
        Name,
        Email,
        Phone,
        Address,
        CASE
            WHEN Gender = 0 THEN 'Nữ'
            WHEN Gender = 1 THEN 'Nam'
            ELSE 'Khác'
            END AS Gender,
        BirthDay
    FROM
        Employee
    LIMIT offset_value, p_limit;
END;

