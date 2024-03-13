-- hiển thị danh sách các học viên đã tham gia thi, các môn thi được thi bởi các học viên đó, điểm thi và ngày thi
select s.name as studentname, t.name as testname, st.mark, st.date
from student s
         join studenttest st on s.rn = st.rn
         join test t on st.testid = t.testid;

-- hiển thị danh sách các bạn học viên chưa thi môn nào
select s.name as studentname, s.rn as rn, s.age as age
from student s
         left join studenttest st on s.rn = st.rn
where st.rn is null;

-- hiển thị danh sách học viên phải thi lại
select s.name as studentsname, t.name as testname, s2.mark as mark, s2.date
from student s
         join qlsv.studenttest s2 on s.rn = s2.rn
         join qlsv.test t on t.testid = s2.testid
where s2.mark < 5;

-- hiển thị danh sách học viên và điểm trung bình(average) của các môn đã thi
select s.name as studentname, avg(st.mark) as averagemark
from student s
         left join studenttest st on s.rn = st.rn
group by s.name
order by averagemark desc;

-- hiển thị tên và điểm trung bình của học viên có điểm trung bình lớn nhất

select s.name as studentname, avg(st.mark) as averagemark
from student s
         left join studenttest st on s.rn = st.rn
group by s.name
order by averagemark desc
limit 1;


-- hiển thị điểm thi cao nhất của từng môn học
select max(st.mark) as maxmark, t.name as testname
from studenttest st
         join qlsv.test t on t.testid = st.testid
group by testname;


-- hiển thị danh sách tất cả các học viên và môn học mà các học viên đó đã thi
-- nếu học viên chưa thi môn nào thì phần tên môn học để null

select s.name, t.name as testname
from student s
         left join qlsv.studenttest s2 on s.rn = s2.rn
         left join qlsv.test t on t.testid = s2.testid;

-- sửa (update) tuổi của tất cả các học viên mỗi người lên một tuổi.
update student
set Age = Age + 1;

-- Thêm trường tên là Status có kiểu Varchar(10) vào bảng Student.
alter table student
    add column status varchar(10);

-- p nhật(Update) trường Status sao cho những học viên nhỏ hơn 30 tuổi sẽ nhận giá trị ‘Young’, trường hợp còn lại nhận giá trị ‘Old’
update student
set status = IF(Age < 30, 'Young', 'Old')
where Age > 0;

-- Hiển thị các thông tin sinh viên có tên bắt đầu bằng ký tự ‘T’ và điểm thi trung bình >4.5.
-- Thông tin bao gồm Tên sinh viên, tuổi, điểm trung bình.
select s.Name,s.Age, avg(s2.Mark)
from student s join qlsv.studenttest s2 on s.RN = s2.RN
group by s.Name, s.Age
having Name LIKE 'T%' AND AVG(Mark) > 4.5;

-- Hiển thị các thông tin sinh viên (Mã, tên, tuổi, điểm trung bình, xếp hạng).
-- Trong đó, xếp hạng dựa vào điểm trung bình của học viên, điểm trung bình cao nhất thì xếp hạng 1.
SELECT
    s.RN AS Student_ID,
    s.Name AS Student_Name,
    s.Age AS Age,
    AVG(Mark) AS Average_Mark,
    RANK() OVER (ORDER BY AVG(Mark) DESC) AS Ranking
FROM
    StudentTest st join qlsv.student s on s.RN = st.RN
GROUP By s.RN, s.Name, s.Age;


-- Cập nhật (sử dụng phương thức write) cột name trong bảng student với yêu cầu sau:
-- Nếu tuổi >20 -> thêm ‘Old’ vào trước tên (cột name)
-- Nếu tuổi <=20 thì thêm ‘Young’ vào trước tên (cột name)

UPDATE Student
SET Name = CASE
               WHEN Age > 20 THEN CONCAT('Old ', Name)
               WHEN Age <= 20 THEN CONCAT('Young ', Name)
    END;

-- Hiển thị dữ liệu sau khi cập nhật
SELECT * FROM Student;

