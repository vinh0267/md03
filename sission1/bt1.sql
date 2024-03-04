
use studentmanagement;

create  table if not exists Student(
id Int primary key not null,
name varchar(45) null,
age int null,
country varchar(45) null
);

create table if not exists class(
id Int auto_Increment primary key,
name varchar(255)
); 

CREATE TABLE IF NOT EXISTS Teacher (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    country VARCHAR(255)
);

