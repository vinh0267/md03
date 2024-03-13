use test2;

SELECT *
FROM students;
SELECT *
FROM subjects;
SELECT *
FROM classes;
SELECT *
FROM marks;
SELECT *
FROM classStudent;


# không dk trùng
alter table students
    add constraint unique_stMail unique (mail);


# tính điểm trung bình từng học viên
SELECT s.stundentName, AVG(m.mark) AS average_mark -- hiển thị
FROM students s
         JOIN marks m ON s.stundentID = m.stundentID
GROUP BY s.stundentID;
-- on : điều kiện


-- Hiển thị môn học nào sinh viên có điểm thi cao nhất.
select s.stundentName, sb.subjectName, m.mark
from marks m
         join students s on m.stundentID = s.stundentID # markjoin student

         join subjects sb on m.subjecID = sb.subjecID # mark join subjec

         join
     (select stundentID, max(mark) as max_mark -- tìm max mark
      from marks
      group by stundentID) as max_mark_per_student
     on m.stundentID = max_mark_per_student.stundentID and m.mark = max_mark_per_student.max_mark;


-- Đánh số thứ tự của điểm TB theo chiều giảm dần.
SELECT s.stundentName, sb.subjectName, AVG(m.mark) AS average_mark
FROM students s
         JOIN marks m ON s.stundentID = m.stundentID
         join subjects sb ON m.subjecID = sb.subjecID

GROUP BY s.stundentID, sb.subjectName
ORDER BY average_mark DESC;
-- sắp xếp điểm TB theo DESC


-- Đánh số thứ tự của điểm theo chiều giảm dần.
select marks.stundentID, marks.subjecID, marks.mark, row_number() over (order by marks.mark desc ) as rankMark
from marks;

-- Thay đổi kiểu dữ liệu của cột SubjectName trong bảng Subjects thành varchar(max).
ALTER TABLE Subjects
    MODIFY COLUMN SubjectName LONGTEXT;

-- Cập  nhật thêm dòng chữ “ Đây là môn học “  vào trước các bản ghi trên cột SubjectName trong bảng Subjects.
UPDATE Subjects
SET SubjectName = CONCAT('Đây là môn học ', SubjectName);


-- Viết Check Constraint để kiểm tra độ tuổi nhập vào trong bảng Student yêu cầu Age >15 và Age < 50.
ALTER TABLE students -- thay đổi : ALTER
    ADD CONSTRAINT chk_student_age -- ràng buộc
        CHECK (age > 15 AND age < 50);

-- xóa học viên id =1
delete
from students
where stundentID = 1;

-- Trong bảng Student thêm một column Status có kiểu dữ liệu là Bit và có giá trị Default là 1.
alter table students
    add Status BIT DEFAULT 1;

-- Cập nhật giá trị Status trong bảng Student thành 0.
update students
set students.Status =0
where students.Status > 0;
