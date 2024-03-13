-- 1.	View v_getEmployeeInfo thực hiện lấy ra danh sách Employee
create view v_getEmployeeInfo as
select e.Id as Id,
       e.Name as Name,
       e.Email as Email,
       e.Phone as Phone,
       e.Address as Address,
       case
           when e.Gender = 0 then 'nữ'
           when e.Gender = 1 then 'nam'
           else 'khác'
           end as Gender,
       BirthDay,
       d.Name  as DepartmentName,
       l.Name  as LevelName

from employee e
         join baitaptonghop2.department d on d.Id = e.DepartmentId
         join baitaptonghop2.levels l on l.Id = e.LevelId;


-- 2.	View v_getEmployeeSalaryMax hiển thị danh sách nhân viên có số ngày công trong một tháng bất kỳ > 18
CREATE VIEW v_getEmployeeSalaryMax AS
SELECT
    e.Id,
    e.Name,
    e.Email,
    e.Phone,
    e.BirthDay,
    SUM(t.Value) AS TotalDay
FROM
    Employee e
        JOIN
    Timesheets t ON e.Id = t.EmployeeId
GROUP BY
    e.Id
HAVING
    TotalDay > 18;




