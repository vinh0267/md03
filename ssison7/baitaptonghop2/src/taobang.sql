create database baitaptonghop2;
use baitaptonghop2;

CREATE TABLE Department
(
    Id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE CHECK (LENGTH(Name) >= 6)
);


CREATE TABLE Levels
(
    Id              INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name            VARCHAR(100) NOT NULL UNIQUE,
    BasicSalary     FLOAT        NOT NULL CHECK (BasicSalary >= 3500000),
    AllowanceSalary FLOAT DEFAULT 500000
);

CREATE TABLE Employee
(
    Id           INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name         VARCHAR(150) NOT NULL,
    Email        VARCHAR(150) NOT NULL UNIQUE,
    Phone        VARCHAR(50)  NOT NULL UNIQUE,
    Address      VARCHAR(255),
    Gender       TINYINT      NOT NULL CHECK (Gender IN (0, 1, 2)),
    BirthDay     DATE         NOT NULL,
    LevelId      INT          NOT NULL,
    DepartmentId INT          NOT NULL,
    FOREIGN KEY (LevelId) REFERENCES Levels (Id),
    FOREIGN KEY (DepartmentId) REFERENCES Department (Id)
);


CREATE TABLE Salary
(
    Id          INT   NOT NULL AUTO_INCREMENT PRIMARY KEY,
    EmployeeId  INT   NOT NULL,
    BonusSalary FLOAT DEFAULT 0,
    Insurrance  FLOAT NOT NULL,
    FOREIGN KEY (EmployeeId) REFERENCES Employee (Id)
);
