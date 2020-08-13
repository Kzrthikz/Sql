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





--Lab 4

--Part A: Sub-Queries and Nested-Selects
--Query A1: Enter a failing (i.e. which gives an error) to retrieve all employees 
--whose salary is greater than the average salary
select * from employees where salary > AVG(salary)

--Query A2: Enter a working query using a sub-select to retrieve 
--all employees whose salary is greater than the average salary
select EMP_ID, F_NAME, L_NAME, SALARY from employees 
where SALARY < (select AVG(SALARY) from employees);

--Query A3: Enter a failing query (i.e.  that gives an error) 
--that retrieves all employees records and average salary in every row
select EMP_ID, SALARY, AVG(SALARY) AS AVG_SALARY from employees ;

--Query A4: Enter a Column Expression that retrieves all 
--employees records and average salary in every row
select EMP_ID, SALARY, ( select AVG(SALARY) from employees ) 
AS AVG_SALARY from employees ;

--Query A5: Enter a Table Expression that 
--retrieves only the columns  with non-sensitive employee data
select * from ( select EMP_ID, F_NAME, L_NAME, DEP_ID from employees) 
AS EMP4ALL ;


--Part B: Accessing Multiple Tables with Sub-Queries


--Query B1: Retrieve only the EMPLOYEES records that correspond 
--to departments in the DEPARTMENTS table
select * from employees where DEP_ID IN ( select DEPT_ID_DEP from departments );

--Query B2: Retrieve only the list of employees from location L0002
select * from employees where DEP_ID IN 
( select DEPT_ID_DEP from departments where LOC_ID = 'L0002' );

--Query B3: Retrieve the department ID and name for 
--employees who earn more than $70,000
select DEPT_ID_DEP, DEP_NAME from departments where DEPT_ID_DEP
IN ( select DEP_ID from employees where SALARY > 70000 ) ;

--Query B4: Specify 2 tables in the FROM clause
select * from employees, departments;


--Accessing Multiple Tables with Implicit Joins

--Query B5: Retrieve only the EMPLOYEES
-- records that correspond to departments in the DEPARTMENTS table
select * from employees, departments 
where employees.DEP_ID = departments.DEPT_ID_DEP;

--Query B6: Use shorter aliases for table names
select * from employees E, departments D where E.DEP_ID = D.DEPT_ID_DEP;

--Query B7: Retrieve only the Employee ID and Department name in the above query
select EMP_ID, DEP_NAME from employees E, departments D 
where E.DEP_ID = D.DEPT_ID_DEP;

--Query B8: In the above query specify the fully qualified column 
--names with aliases in the SELECT clause
select E.EMP_ID, D.DEP_NAME from employees E, departments D 
where E.DEP_ID = D.DEPT_ID_DEP 





                            
                            