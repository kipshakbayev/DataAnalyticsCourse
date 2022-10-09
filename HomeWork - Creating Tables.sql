CREATE DATABASE family ;
USE family;
CREATE TABLE FamilyMembers (

member_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
status VARCHAR (10) NOT NULL,
member_name VARCHAR(20) NOT NULL,
birthdate DATE NOT NULL

);
CREATE TABLE Payments (

payment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
good_name VARCHAR(20) NOT NULL,
amount INT NOT NULL,
date DATE NOT NULL

);

CREATE TABLE FamilyFriends (

friend_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
friend_name VARCHAR(20) NOT NULL,
member_name VARCHAR(20) NOT NULL,
friend_age INT NOT NULL

);


DROP TABLE FamilyMembers;
DROP TABLE Payments;
DROP TABLE FamilyFriends;
