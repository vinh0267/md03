create database baitaptonghop;
use baitaptonghop;

CREATE TABLE Category
(
    Id     INT          NOT NULL AUTO_INCREMENT,
    Name   VARCHAR(100) NOT NULL,
    Status TINYINT DEFAULT 1,
    PRIMARY KEY (Id)
);

CREATE TABLE Author
(
    Id        INT          NOT NULL AUTO_INCREMENT,
    Name      VARCHAR(100) NOT NULL,
    TotalBook INT DEFAULT 0,
    PRIMARY KEY (Id)
);


CREATE TABLE Book
(
    Id          INT          NOT NULL AUTO_INCREMENT,
    Name        VARCHAR(150) NOT NULL,
    Status      TINYINT   DEFAULT 1 CHECK (Status IN (0, 1)),
    Price       FLOAT        NOT NULL CHECK (Price >= 100000),
    CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP(),
    CategoryId  INT          NOT NULL,
    AuthorId    INT          NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (CategoryId) REFERENCES Category (Id),
    FOREIGN KEY (AuthorId) REFERENCES Author (Id)
);

CREATE TABLE if not exists Customer
(
    Id          INT   AUTO_INCREMENT,
    Name        VARCHAR(150) NOT NULL,
    Email       VARCHAR(150) NOT NULL UNIQUE,
    Phone       VARCHAR(50)  NOT NULL UNIQUE,
    Address     VARCHAR(255),
    CreatedDate datetime DEFAULT current_timestamp,
    Gender      TINYINT      NOT NULL CHECK (Gender IN (0, 1, 2)),
    BirthDay    DATE         NOT NULL,
    PRIMARY KEY (Id)
);





CREATE TABLE Ticket
(
    Id         INT NOT NULL AUTO_INCREMENT,
    CustomerId INT NOT NULL,
    Status     TINYINT  DEFAULT 1,
    TicketDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (Id),
    FOREIGN KEY (CustomerId) REFERENCES Customer (Id)
);






CREATE TABLE TicketDetail
(
    TicketId    INT   NOT NULL,
    BookId      INT   NOT NULL,
    Quantity    INT   NOT NULL CHECK (Quantity > 0),
    DeposiPrice FLOAT NOT NULL,
    RentCost    FLOAT NOT NULL,
    PRIMARY KEY (TicketId, BookId),
    FOREIGN KEY (TicketId) REFERENCES Ticket (Id),
    FOREIGN KEY (BookId) REFERENCES Book (Id)
);
