------------------------------------------
--DDL statement for table 'HR' database--
--------------------------------------------

CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
                            
  CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
 drop table JOBS
 CREATE TABLE JOBS (
                            JOB_IDENT CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(30) ,
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));

--Query 1: Retrieve all employees whose address is in Elgin,IL     
--[Hint: Use the LIKE operator to find similar strings]                       
 select * from EMPLOYEES
 where ADDRESS like '%Elgin,IL'; 
 
 --Query 2: Retrieve all employees who were born during the 1970's.
 --[Hint: Use the LIKE operator to find similar strings]
 select * from EMPLOYEES
 where B_DATE like '%197%'; 
 
-- Query 3: Retrieve all employees in department 5 whose salary is between 60000 and 70000 .
-- [Hint: Use the keyword BETWEEN for this query ]
select * from EMPLOYEES 
where DEP_ID  = 5 AND (SALARY between 60000 and 70000); 

--Query 4A: Retrieve a list of employees ordered by department ID.
--[Hint: Use the ORDER BY clause for this query]
select F_NAME, L_NAME, DEP_ID  from EMPLOYEES 
order by DEP_ID; 

--****Query 4B: Retrieve a list of employees ordered in descending order by department ID
-- and within each department ordered alphabetically in descending order by last name.
select F_NAME, L_NAME, DEP_ID  from EMPLOYEES 
order by DEP_ID desc,  L_NAME desc; 

--Query 5A: For each department ID retrieve the number of employees in the department.
--[Hint: Use COUNT(*) to retrieve the total count of a column, and then GROUP BY]
select  DEP_ID, count(*)  from EMPLOYEES    
group by DEP_ID; 

--Query 5B: For each department retrieve the number of employees in the department, 
--and the average employees salary in the department
--[Hint: Use COUNT(*) to retrieve the total count of a column, 
--and AVG() function to compute average salaries, and then group]
select DEP_ID, count(*) , AVG(SALARY) from EMPLOYEES
group by DEP_ID ; 

--Query 5C: Label the computed columns in the result set of 
--Query 5B as “NUM_EMPLOYEES” and “AVG_SALARY”.
--[Hint: Use AS “LABEL_NAME” after the column name]
select DEP_ID, count(*) as NUM_EMPLOYEES , 
AVG(SALARY)  as AVG_SALARY from EMPLOYEES
group by DEP_ID ; 

--Query 5D: In Query 5C order the result set by Average Salary.
--[Hint: Use ORDER BY after the GROUP BY]
select DEP_ID, count(*) as "NUM_EMPLOYEES" , 
AVG(SALARY)  as "AVG_SALARY" from EMPLOYEES
group by DEP_ID 
order by "AVG_SALARY"; 

--Query 5E: In Query 5D limit the result to departments with fewer than 4 employees.
--[Hint: Use HAVING after the GROUP BY, 
--and use the count() function in the HAVING clause instead of the column label.
--Note: WHERE clause is used for filtering the entire result set 
--whereas the HAVING clause is used for filtering the result of the grouping]
select DEP_ID, count(*) as "NUM_EMPLOYEES" , 
AVG(SALARY)  as "AVG_SALARY" from EMPLOYEES
group by DEP_ID 
having count(*) < 4 
order by "AVG_SALARY"; 

--Query 6: Similar to 4B but instead of department ID use department name. 
--Retrieve a list of employees ordered by department name, and within each 
--department ordered alphabetically in descending order by last name.
select D.DEP_NAME , E.F_NAME, E.L_NAME
from EMPLOYEES as E, DEPARTMENTS as D
where E.DEP_ID = D.DEPT_ID_DEP
order by D.DEP_NAME, E.L_NAME desc ;


                            
                            