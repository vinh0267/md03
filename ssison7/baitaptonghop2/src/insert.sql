

-- Thêm dữ liệu vào bảng Department
INSERT INTO Department (Name) VALUES
                                  ('Human Resources'),
                                  ('Finance'),
                                  ('Marketing');


-- Thêm dữ liệu vào bảng Levels
INSERT INTO Levels (Name, BasicSalary) VALUES
                                           ('Intern', 3500000),
                                           ('Junior', 4000000),
                                           ('Senior', 4500000);



-- Thêm dữ liệu vào bảng Employee
INSERT INTO Employee (Name, Email, Phone, Address, Gender, BirthDay, LevelId, DepartmentId) VALUES
                                                                                                ('John Doe', 'john.doe@example.com', '123456789', '123 Main Street', 0, '1990-01-01', 1, 1),
                                                                                                ('Alice Smith', 'alice.smith@example.com', '987654321', '456 Elm Street', 1, '1992-05-15', 2, 2),
                                                                                                ('Bob Johnson', 'bob.johnson@example.com', '246801357', '789 Oak Avenue', 0, '1988-07-20', 3, 3);
-- Thêm 7 nhân viên mới vào bảng Employee
INSERT INTO Employee (Name, Email, Phone, Address, Gender, BirthDay, LevelId, DepartmentId)
VALUES
    ('Nguyễn Văn G', 'nguyenvang@gmail.com', '0987654321', '123 Đường ABC', 0, '1995-02-10', 3, 1),
    ('Trần Thị H', 'tranthih@gmail.com', '0123456789', '456 Đường XYZ', 1, '1990-05-20', 2, 2),
    ('Lê Văn I', 'levani@gmail.com', '0976543210', '789 Đường KLM', 0, '1988-08-15', 3, 3),
    ('Phạm Thị K', 'phamthik@gmail.com', '0345678901', '234 Đường DEF', 1, '1993-11-25', 2, 1),
    ('Hồ Văn L', 'hovanl@gmail.com', '0890123456', '567 Đường PQR', 0, '1987-04-05', 3, 2),
    ('Mai Thị M', 'maithim@gmail.com', '0567890123', '890 Đường UVW', 1, '1991-09-30', 2, 3),
    ('Lý Văn N', 'lyvann@gmail.com', '0456789012', '678 Đường GHI', 0, '1997-07-18', 3, 1);


-- Thêm 30 bản ghi dữ liệu phù hợp vào bảng Timesheets
INSERT INTO Timesheets (AttendanceDate, EmployeeId, Value)
VALUES
    ('2024-01-01', 1, 1),
    ('2024-01-02', 2, 0.5),
    ('2024-01-03', 3, 1),
    ('2024-01-04', 4, 0.5),
    ('2024-01-05', 5, 1),
    ('2024-01-06', 6, 0.5),
    ('2024-01-07', 7, 1),
    ('2024-01-08', 8, 0.5),
    ('2024-01-09', 9, 1),
    ('2024-01-10', 10, 0.5),
    ('2024-01-11', 1, 1),
    ('2024-01-12', 2, 0.5),
    ('2024-01-13', 3, 1),
    ('2024-01-14', 4, 0.5),
    ('2024-01-15', 5, 1),
    ('2024-01-16', 6, 0.5),
    ('2024-01-17', 7, 1),
    ('2024-01-18', 8, 0.5),
    ('2024-01-19', 9, 1),
    ('2024-01-20', 10, 0.5),
    ('2024-01-21', 1, 1),
    ('2024-01-22', 2, 0.5),
    ('2024-01-23', 3, 1),
    ('2024-01-24', 4, 0.5),
    ('2024-01-25', 5, 1),
    ('2024-01-26', 6, 0.5),
    ('2024-01-27', 7, 1),
    ('2024-01-28', 8, 0.5),
    ('2024-01-29', 9, 1),
    ('2024-01-30', 10, 0.5);




-- Thêm dữ liệu vào bảng Salary (3 bản ghi phù hợp)
INSERT INTO Salary (EmployeeId, Insurrance)
SELECT Id, 0.1 * (SELECT BasicSalary FROM Levels WHERE Id = e.LevelId)
FROM Employee e
    LIMIT 3;






