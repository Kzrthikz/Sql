drop table INSTRUCTOR; 

CREATE TABLE INSTRUCTOR (
	ins_id INTEGER PRIMARY KEY NOT NULL, 
	lastname VARCHAR(15) NOT NULL, 
	firstname VARCHAR(15) NOT NULL, 
	city VARCHAR(15), 
	country CHAR(2)
); 

INSERT INTO INSTRUCTOR 
(ins_id, lastname, firstname, city, country) 
VALUES 
(1, 'Ahuja', 'Rav', 'Toronto', 'CA'); 

INSERT INTO INSTRUCTOR 
(ins_id, lastname, firstname, city, country) 
VALUES 
(2, 'Chong', 'Raul', 'Toronto', 'CA'),
(3, 'Vasudevan', 'Hima', 'Chicago', 'US'); 

Select * from INSTRUCTOR; 

select firstname, lastname, country from INSTRUCTOR 
WHERE city = 'Toronto'; 

UPDATE  INSTRUCTOR 
SET city = 'Markham'
WHERE ins_id = 1; 

Select * from INSTRUCTOR; 

DELETE FROM INSTRUCTOR 
WHERE ins_id in (2); 

Select * from INSTRUCTOR; 

