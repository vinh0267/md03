create database test2;
use test2;

create table subjects
(
    subjecID    int primary key auto_increment,
    subjectName varchar(255)
);

create table classes
(
    classesID   int primary key auto_increment,
    classesName varchar(255)
);

create table students
(
    stundentID   int primary key auto_increment,
    stundentName varchar(50),
    age          int(4),
    mail         varchar(100)
);

create table marks
(
    mark       int(4),
    subjecID   int(4),
    stundentID int(4),

    foreign key (subjecID) references subjects (subjecID),
    foreign key (stundentID) references students (stundentID)
);

create table classStudent
(
    stundentID int(4),
    classesID  int(4),

    foreign key (stundentID) references students (stundentID),
    foreign key (classesID) references classes (classesID)
);