use final_project;

DROP TABLE IF EXISTS uk_bank;
CREATE TABLE uk_bank(
Customer_ID int,
Name VARCHAR(255),
Surname VARCHAR(255),
Gender VARCHAR(10),
Age int,
Region VARCHAR(255),
Job_Classification VARCHAR(255),
Date_Joined VARCHAR(255),
Balance float
)
;
BEGIN;
 ALTER TABLE uk_bank 
  ADD COLUMN Date_Joined_Converted DATE;

 UPDATE uk_bank 
  SET Date_Joined_Converted = STR_TO_DATE(Date_Joined, '%d.%b.%Y');

 ALTER TABLE uk_bank 
  DROP COLUMN Date_Joined;

 ALTER TABLE uk_bank 
  CHANGE COLUMN Date_Joined_Converted Date_Joined DATE;
COMMIT;

BEGIN;
 ALTER TABLE uk_bank 
  ADD COLUMN Balance_Moved FLOAT;

 UPDATE uk_bank 
  SET Balance_Moved = Balance;

 ALTER TABLE uk_bank 
  DROP COLUMN Balance;

 ALTER TABLE uk_bank 
  CHANGE COLUMN Balance_Moved Balance FLOAT;
COMMIT;

SELECT * FROM uk_bank;
SELECT STR_TO_DATE(Date_Joined, '%d.%b.%Y')
FROM uk_bank;
LOAD DATA LOCAL INFILE 'C:/Users/kipsh/Desktop/UK-Bank-Customers.csv'
INTO TABLE uk_bank
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


show global variables like 'local_infile';
set global local_infile=true;

