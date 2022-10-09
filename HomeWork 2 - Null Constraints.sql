CREATE DATABASE university;
USE university;

CREATE TABLE Address (

Id INT NOT NULL AUTO_INCREMENT,
Country VARCHAR(20) NOT NULL DEFAULT 'Country',
County VARCHAR(20) NOT NULL,
City VARCHAR(20) NOT NULL,
Street VARCHAR(20) NOT NULL,
Number VARCHAR(10) NOT NULL,
PRIMARY KEY (Id)

);
INSERT INTO Address (Country, County, City, Street, Number) VALUES ('Kazakhstan', 'Almaty', 'Almaty', 'Abay', '24B');
INSERT INTO Address (Country, County, City, Street, Number) VALUES ('Kazakhstan', 'Turkestan', 'Shymkent', 'Seifullin', '110');
INSERT INTO Address (Country, County, City, Street, Number) VALUES ('Kazakhstan', 'Mangystau', 'Aktau', '12-microdiscrict', '55');
INSERT INTO Address (Country, County, City, Street, Number) VALUES ('Kazakhstan', 'Almaty', 'Almaty', 'Navoi', '91');
INSERT INTO Address (Country, County, City, Street, Number) VALUES ('Kazakhstan', 'Atyrau', 'Atyrau', 'Dostyk', '148A');



CREATE TABLE Person (

Id INT NOT NULL AUTO_INCREMENT,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
PhoneNumber VARCHAR(20) NOT NULL,
BirthDate DATE NOT NULL,
AddressId INT,
PRIMARY KEY (Id),
FOREIGN KEY (AddressId) REFERENCES Address(Id),
UNIQUE KEY (PhoneNumber)


);



INSERT INTO Person (FirstName, LastName, PhoneNumber, BirthDate, AddressId) VALUES ('Nursultan', 'Kipshakbayev', '+77072472321', '1992-07-02', 1);
INSERT INTO Person (FirstName, LastName, PhoneNumber, BirthDate, AddressId) VALUES ('Aslan', 'Tussupzhanov', '+77072203942', '1988-10-22', 2);
INSERT INTO Person (FirstName, LastName, PhoneNumber, BirthDate, AddressId) VALUES ('Maira', 'Romanova', '+77015748392', '1990-01-13', 3);
INSERT INTO Person (FirstName, LastName, PhoneNumber, BirthDate, AddressId) VALUES ('Asel', 'Sadvakasova', '+77773848574', '1997-11-19', 4);
INSERT INTO Person (FirstName, LastName, PhoneNumber, BirthDate, AddressId) VALUES ('Semen', 'Kairatov', '+77025324932', '1995-04-04', 5);

DELETE  FROM Person WHERE Id = 1;

CREATE TABLE Student (

Id INT NOT NULL AUTO_INCREMENT,
PersonId INT,
Description VARCHAR(50),
PRIMARY KEY (Id),
FOREIGN KEY (PersonId) REFERENCES Person(Id)

);
INSERT INTO Student (PersonId, Description) VALUES (1, 'Good');
INSERT INTO Student (PersonId, Description) VALUES (2, 'Excellent');
INSERT INTO Student (PersonId, Description) VALUES (3, 'Not good');
INSERT INTO Student (PersonId, Description) VALUES (4, 'Rare');
INSERT INTO Student (PersonId, Description) VALUES (5, 'Medium');



CREATE TABLE Teacher (

Id INT NOT NULL AUTO_INCREMENT,
Position VARCHAR(20) NOT NULL,
PersonId INT NOT NULL,
PRIMARY KEY (Id),
FOREIGN KEY (PersonId) REFERENCES Person(Id)

);

INSERT INTO Teacher (Position, PersonId) VALUES ('Professor', 1);
INSERT INTO Teacher (Position, PersonId) VALUES ('Professor Assistant', 2);
INSERT INTO Teacher (Position, PersonId) VALUES ('Professor', 3);
INSERT INTO Teacher (Position, PersonId) VALUES ('Assistant', 4);
INSERT INTO Teacher (Position, PersonId) VALUES ('PhD', 5);



CREATE TABLE Course (

Id INT NOT NULL AUTO_INCREMENT,
Name VARCHAR(10) NOT NULL,
Credits INT NOT NULL,
Description VARCHAR(20) DEFAULT 'Fill Description',
TeacherId INT NOT NULL,
PRIMARY KEY (Id),
FOREIGN KEY (TeacherId) REFERENCES Teacher(Id)

);

INSERT INTO Course (Name, Credits, Description, TeacherId) VALUES ('Management', 3, 'Interesting subject', 1);
INSERT INTO Course (Name, Credits, Description, TeacherId) VALUES ('Finance', 4, 'Hard to study', 2);
INSERT INTO Course (Name, Credits, Description, TeacherId) VALUES ('Economics', 3, 'Just Description', 3);
INSERT INTO Course (Name, Credits, Description, TeacherId) VALUES ('Philosophy', 4, 'Think yourself', 4);
INSERT INTO Course (Name, Credits, Description, TeacherId) VALUES ('Psychology', 5, 'Getting mad', 5);


SELECT * FROM Address;
SELECT * FROM Person;
SELECT * FROM Student;
SELECT * FROM Teacher;
SELECT * FROM Course;

DROP TABLE Address;
DROP TABLE Person;
DROP TABLE Student;
DROP TABLE Teacher;
DROP TABLE Course;


