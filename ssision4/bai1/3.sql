-- Hiển thị danh sách tất cả các học viên
SELECT *
FROM Student;

-- Hiển thị danh sách các học viên đang theo học
select  *
from  student
where  Status = 1;

-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ
SELECT *
FROM Subject
WHERE Credit < 10;

-- Hiển thị danh sách học viên lớp A1
SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S
         JOIN Class C ON S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

-- Hiển thị điểm môn CF của các học viên
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S
         JOIN Mark M ON S.StudentId = M.StudentId

         JOIN Subject Sub ON M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';
