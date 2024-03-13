INSERT INTO Category (Name, Status) VALUES
                                        ('Fiction', 1),
                                        ('Science', 1),
                                        ('History', 1),
                                        ('Biography', 1),
                                        ('Cooking', 1);

INSERT INTO Author (Name, TotalBook) VALUES
                                         ('Stephen King', 30),
                                         ('J.K. Rowling', 25),
                                         ('George Orwell', 20),
                                         ('Agatha Christie', 35),
                                         ('Haruki Murakami', 40);

INSERT INTO Book (Name, Status, Price, CreatedDate, CategoryId, AuthorId) VALUES
                                                                              ('Book A', 1, 150000, '2024-03-04', 1, 1),
                                                                              ('Book B', 1, 200000, '2024-03-05', 2, 2),
                                                                              ('Book C', 1, 180000, '2024-03-06', 1, 3),
                                                                              ('Book D', 1, 220000, '2024-03-07', 3, 4),
                                                                              ('Book E', 1, 170000, '2024-03-08', 2, 5),
                                                                              ('Book F', 1, 190000, '2024-03-09', 1, 1),
                                                                              ('Book G', 1, 210000, '2024-03-10', 3, 2),
                                                                              ('Book H', 1, 240000, '2024-03-11', 2, 3),
                                                                              ('Book I', 1, 260000, '2024-03-12', 1, 4),
                                                                              ('Book J', 1, 230000, '2024-03-13', 3, 5),
                                                                              ('Book K', 1, 200000, '2024-03-14', 2, 1),
                                                                              ('Book L', 1, 180000, '2024-03-15', 1, 2),
                                                                              ('Book M', 1, 250000, '2024-03-16', 3, 3),
                                                                              ('Book N', 1, 210000, '2024-03-17', 2, 4),
                                                                              ('Book O', 1, 230000, '2024-03-18', 1, 5);


INSERT INTO Customer (Name, Email, Phone, Address, CreatedDate, Gender, BirthDay) VALUES
                                                                                      ('John Doe', 'john.doe@gmail.com', '123456789', '123 Main Street', '2024-03-04', 0, '1990-01-01'),
                                                                                      ('Alice Smith', 'alice.smith@gmail.com', '987654321', '456 Elm Street', '2024-03-05', 1, '1992-05-15'),
                                                                                      ('Bob Johnson', 'bob.johnson@gmail.com', '246801357', '789 Oak Avenue', '2024-03-06', 0, '1988-07-20');


INSERT INTO Ticket (CustomerId, Status, TicketDate) VALUES
                                                        (1, 1, NOW()),
                                                        (2, 1, NOW()),
                                                        (3, 1, NOW());

INSERT INTO Ticket (CustomerId, Status, TicketDate)
VALUES (1, 1, '2024-03-04 09:00:00'),                    -- Phiếu mượn 1, khách hàng John Doe
       (2, 1, '2024-03-05 10:00:00'),                    -- Phiếu mượn 2, khách hàng Alice Smith
       (3, 1, '2024-03-06 11:00:00');                    -- Phiếu mượn 3, khách hàng Bob Johnson


-- Phiếu mượn 1: mượn 2 cuốn sách
INSERT INTO TicketDetail (TicketId, BookId, Quantity, DeposiPrice, RentCost)
VALUES (16, 1, 2, 50000, 100000), -- Mượn 2 cuốn sách Book A
       (17, 2, 1, 60000, 120000); -- Mượn 1 cuốn sách Book B

-- Phiếu mượn 2: mượn 2 cuốn sách
INSERT INTO TicketDetail (TicketId, BookId, Quantity, DeposiPrice, RentCost)
VALUES (18, 3, 1, 70000, 140000), -- Mượn 1 cuốn sách Book C
       (18, 4, 2, 60000, 120000); -- Mượn 2 cuốn sách Book D

-- Phiếu mượn 3: mượn 3 cuốn sách
INSERT INTO TicketDetail (TicketId, BookId, Quantity, DeposiPrice, RentCost)
VALUES (19, 5, 1, 50000, 100000), -- Mượn 1 cuốn sách Book E
       (19, 6, 1, 60000, 120000), -- Mượn 1 cuốn sách Book F
       (19, 7, 1, 70000, 140000); -- Mượn 1 cuốn sách Book G

