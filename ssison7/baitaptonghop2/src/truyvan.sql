-- 1.	Lấy ra danh sách Employee có sắp xếp tăng dần

SELECT e.Id                                       AS Id,
       e.Name                                     AS Name,
       e.Email                                    AS Email,
       e.Phone                                    AS Phone,
       e.Address                                  AS Address,
       CASE
           WHEN e.Gender = 0 THEN 'Nam'
           WHEN e.Gender = 1 THEN 'Nữ'
           ELSE 'Khác'
           END                                    AS Gender,
       e.BirthDay                                 AS BirthDay,
       TIMESTAMPDIFF(YEAR, e.BirthDay, CURDATE()) AS Age,
       d.Name                                     AS DepartmentName,
       l.Name                                     AS LevelName
FROM Employee AS e
         INNER JOIN
     Department AS d ON e.DepartmentId = d.Id
         INNER JOIN
     Levels AS l ON e.LevelId = l.Id
ORDER BY e.Name ASC;

-- 2.	Lấy ra danh sách Salary
SELECT s.Id                                                               AS SalaryId,
       e.Name                                                             AS EmployeeName,
       e.Phone,
       e.Email,
       l.BasicSalary,
       l.AllowanceSalary,
       s.BonusSalary,
       s.Insurrance,
       (l.BasicSalary + l.AllowanceSalary + s.BonusSalary - s.Insurrance) AS TotalSalary
FROM Salary s
         JOIN Employee e ON s.EmployeeId = e.Id
         JOIN Levels l ON e.LevelId = l.Id;


-- 3.	Truy vấn danh sách Department gồm: Id, Name, TotalEmployee
SELECT d.Id        AS DepartmentId,
       d.Name,
       COUNT(e.Id) AS TotalEmployee
FROM Department d
         LEFT JOIN Employee e ON e.DepartmentId = d.Id
GROUP BY d.Id, d.Name;


-- 4.	Cập nhật cột BonusSalary lên 10% cho tất cả các Nhân viên có số ngày công >= 20 ngày trong tháng 10 năm 2020
UPDATE Salary AS s
SET s.BonusSalary = s.Insurrance * 0.1
WHERE s.EmployeeId IN (SELECT t.EmployeeId
                       FROM Timesheets AS t
                       WHERE YEAR(t.AttendanceDate) = 2020
                         AND MONTH(t.AttendanceDate) = 10
                       GROUP BY t.EmployeeId
                       HAVING SUM(t.Value) >= 20);

--	Truy vấn xóa Phòng ban chưa có nhân viên nào
DELETE
FROM Department
WHERE Id NOT IN ( -- id này là của phòng ban -- NOT IN : loại trừ
    SELECT DISTINCT DepartmentId -- Truy vấn này lấy ra tất cả các giá trị DepartmentId khác nhau từ bảng.
    -- Nó đảm bảo rằng mỗi DepartmentId chỉ xuất hiện một lần trong kết quả.
    FROM Employee);



