-- Tạo bảng Student
CREATE TABLE Student (
                         RN INT PRIMARY KEY,
                         Name VARCHAR(20),
                         Age TINYINT
);

-- Chèn dữ liệu vào bảng Student
INSERT INTO Student (RN, Name, Age) VALUES
                                        (1, 'Nguyen Hong Ha', 20),
                                        (2, 'Truong Ngoc Anh', 30),
                                        (3, 'Tuan Minh', 25),
                                        (4, 'Dan Truong', 22);

-- Tạo bảng Test
CREATE TABLE Test (
                      TestID INT PRIMARY KEY,
                      Name VARCHAR(20)
);

-- Chèn dữ liệu vào bảng Test
INSERT INTO Test (TestID, Name) VALUES
                                    (1, 'EPC'),
                                    (2, 'DWMX'),
                                    (3, 'SQL1'),
                                    (4, 'SQL2');

-- Tạo bảng StudentTest
CREATE TABLE StudentTest (
                             RN INT,
                             TestID INT,
                             Date DATETIME,
                             Mark FLOAT,
                             FOREIGN KEY (RN) REFERENCES Student(RN),
                             FOREIGN KEY (TestID) REFERENCES Test(TestID)
);

-- Chèn dữ liệu vào bảng StudentTest
INSERT INTO StudentTest (RN, TestID, Date, Mark) VALUES
                                                     (1, 1, '2006-07-17', 8),
                                                     (1, 2, '2006-07-18', 5),
                                                     (1, 3, '2006-07-19', 7),
                                                     (2, 1, '2006-07-17', 7),
                                                     (2, 2, '2006-07-18', 4),
                                                     (2, 3, '2006-07-19', 2),
                                                     (3, 1, '2006-07-17', 10),
                                                     (3, 3, '2006-07-18', 1);
