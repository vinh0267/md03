
# Hiển thị số lượng sinh viên ở từng nơi
SELECT Address, COUNT(StudentId) AS 'Số lượng học viên'
FROM Student
GROUP BY Address;


# Tính điểm trung bình các môn học của mỗi học viên
SELECT S.StudentId, S.StudentName, AVG(M.Mark) AS 'Điểm trung bình'

FROM Student S JOIN Mark M ON S.StudentId = M.StudentId

GROUP BY S.StudentId;



# Hiển thị những bạn học viên có điểm trung bình các môn học lớn hơn 12
SELECT S.StudentId, S.StudentName, AVG(M.Mark) AS 'Điểm trung bình'
FROM Student S JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY S.StudentId
HAVING AVG(M.Mark) > 12;


# Hiển thị thông tin các học viên có điểm trung bình lớn nhất
SELECT S.StudentId, S.StudentName, AVG(M.Mark) AS 'Điểm trung bình'
FROM Student S JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName

HAVING AVG(M.Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);
