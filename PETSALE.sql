-- Drop the PETSALE table in case it exists
drop table PETSALE;
-- Create the PETSALE table 
create table PETSALE (
	ID INTEGER PRIMARY KEY NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	SALEPRICE DECIMAL(6,2),
	SALEDATE DATE
	);
-- Insert saple data into PETSALE table
insert into PETSALE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15');
	
	select * from PETSALE; 
	
	select SUM(SALEPRICE) from PETSALE; 
	select SUM(SALEPRICE) as SUM_OF_SALEPRICE from PETSALE; 
	select MAX(QUANTITY) from PETSALE; 
	select MIN(ID) from PETSALE where ANIMAL = 'Dog'; 
	select AVG(SALEPRICE) from PETSALE; 
	select AVG(SALEPRICE/QUANTITY) from PETSALE where ANIMAL = 'Dog'; 
	select ROUND(SALEPRICE) from PETSALE; 
	select LENGTH(ANIMAL) from PETSALE; 
	select UCASE(ANIMAL) from PETSALE; 
	select * from PETSALE where LCASE(ANIMAL) = 'cat' 
	select DISTINCT(UCASE(ANIMAL)) from PETSALE; 
	select DAY(SALEDATE) from PETSALE where ANIMAL = 'Cat'; 
	select COUNT(*) from PETSALE where MONTH(SALEDATE) = '05'; 
	select (SALEDATE + 3 DAYS) from PETSALE; 
	select(CURRENT_DATE - SALEDATE) from PETSALE; 
	
	