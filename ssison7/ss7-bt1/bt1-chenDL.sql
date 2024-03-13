use test2;

INSERT INTO students (stundentName, age, mail) VALUES
('Nguyen Quang An', 18, 'an@yahoo.com'),
('Nguyen Cong Vinh', 20, 'vinh@gmail.com'),
('Nguyen Van Quyen', 19, 'quyen'),
('Pham Thanh Binh', 25, 'binh@com'),
('Nguyen Van Tai Em',30, 'taiem@sport.vn');


INSERT INTO subjects (subjectName) VALUES
('SQL'),
('JAVA'),
('C'),
('VSCODE');

INSERT INTO classes (classesName) VALUES
('C0706L'),
('C0708G');

INSERT INTO marks (mark, subjecID, stundentID) VALUES
(8, 1, 1),
(4, 2, 1),
(9, 1, 1),
(7, 1, 3),
(3, 1, 4),
(5, 2, 5),
(8, 3, 3),
(1, 3, 1),
(3, 3, 3),
(2, 2, 4);

INSERT INTO classStudent (stundentID, classesID) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 2);