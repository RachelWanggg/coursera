-- COUNT
-- Retrieve the number of rows from the "FilmLocations" table.
   SELECT COUNT(Locations) 
   FROM FilmLocations 
   WHERE Writer="James Cameron";
   
-- Retrieve the number of rows having a release year older than 1950 from the "FilmLocations" table.
   SELECT Count(*) FROM FilmLocations WHERE ReleaseYear<1950;
	
	
-- DISTINCT 
-- Retrieve the name of all films without any repeated titles.
   SELECT DISTINCT Title FROM FilmLocations;
	
-- Retrieve the number of release years of the films distinctly, produced by Warner Bros. Pictures.
   SELECT COUNT(DISTINCT ReleaseYear) FROM FilmLocations WHERE ProductionCompany="Warner Bros. Pictures";
	 
-- Retrieve the name of all unique films released in the 21st century and onwards, along with their release years.
   SELECT DISTINCT Title, ReleaseYear FROM FilmLocations WHERE ReleaseYear>=2001;
	
	
-- LIMIT
-- Retrieve first 10 film names distinctly released in 2015.
   SELECT DISTINCT Title FROM FilmLocations WHERE ReleaseYear=2015 LIMIT 10;
	 
-- Retrieve the next 3 film names distinctly after first 5 films released in 2015.
   SELECT DISTINCT Title FROM FilmLocations WHERE ReleaseYear=2015 LIMIT 3 OFFSET 5;
   
   
-- INSERT
-- Insert a new instructor record with id 4 for Sandip Saha who lives in Edmonton, CA into the "Instructor" table.
   INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
   VALUES(4, 'Saha', 'Sandip', 'Edmonton', 'CA');
   
-- Insert two new instructor records into the "Instructor" table. First record with id 5 for John Doe who lives in Sydney, AU. Second record with id 6 for Jane Doe who lives in Dhaka, BD.
   INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
   VALUES(5, 'Doe', 'John', 'Sydney', 'AU'), (6, 'Doe', 'Jane', 'Dhaka', 'BD');


-- UPDATE
-- Update the city for Sandip to Toronto.
   UPDATE Instructor 
   SET city='Toronto' 
   WHERE firstname="Sandip";
   
-- Update the city and country for Doe with id 5 to Dubai and AE respectively.
   UPDATE Instructor 
   SET city='Dubai', country='AE' 
   WHERE ins_id=5;


-- DELETE
-- Remove the instructor record of Doe whose id is 6.
   DELETE FROM instructor
   WHERE ins_id = 6;
   
   
   
   CREATE, ALTER, TRUNCATE, DROP tables
   
ALTER TABLE table_name
ADD COLUMN column_name data_type column_constraint;

ALTER TABLE table_name
DROP COLUMN column_name;

ALTER TABLE table_name
ALTER COLUMN column_name SET DATA TYPE data_type;

ALTER TABLE table_name
RENAME COLUMN current_column_name TO new_column_name;
   
   drop table COUNTRY
   create table COUNTRY (
       ID integer PRIMARY KEY NOT NULL,
	   CCODE char(2)
	   NAME varchar(60)
	   );
	   
	   
                         String Patterns
-- Retrieve all employees whose address is in Elgin,IL.
SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE ADDRESS LIKE '%Elgin,IL%';

-- Retrieve all employees in department 5 whose salary is between 60000 and 70000.
SELECT *
FROM EMPLOYEES
WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;

-- remove the '%' sign from the above result set for Average Student Attendance column
SELECT Name_of_School, REPLACE(Average_Student_Attendance, '%', '')
from SCHOOLS 
order by Average_Student_Attendance
fetch first 5 rows only


                         Sorting
-- Retrieve a list of employees ordered in descending order by department ID
-- and within each department ordered alphabetically in descending order by last name.
SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID DESC, L_NAME DESC;

-- In SQL problem 2 (Exercise 2 Problem 2), use department name instead of department ID. 
-- Retrieve a list of employees ordered by department name, 
-- and within each department ordered alphabetically in descending order by last name.
SELECT D.DEP_NAME , E.F_NAME, E.L_NAME
FROM EMPLOYEES as E, DEPARTMENTS as D
WHERE E.DEP_ID = D.DEPT_ID_DEP
ORDER BY D.DEP_NAME, E.L_NAME DESC;


                          Grouping
-- For each department ID retrieve the number of employees in the department.
SELECT DEP_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID;

-- For each department retrieve the number of employees in the department, 
-- and the average employee salary in the department.
SELECT DEP_ID, COUNT(*), AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEP_ID;

--Label the computed columns in the result set of SQL problem 2 
--(Exercise 3 Problem 2) as NUM_EMPLOYEES and AVG_SALARY,order the result set by Average Salary.
--limit the result to departments with fewer than 4 employees.
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING count(*) < 4
order by AVG_SALARY;


                FUNCTIONS
Aggregate Functions

Query A1: Enter a function that calculates the total cost of all animal rescues in the PETRESCUE table.
select SUM(COST) from PETRESCUE;

Query A2: Enter a function that displays the total cost of all animal rescues 
          in the PETRESCUE table in a column called SUM_OF_COST.
select SUM(COST) AS SUM_OF_COST from PETRESCUE;

Query A3: Enter a function that displays the maximum quantity of animals rescued.
select MAX(QUANTITY) from PETRESCUE;

Query A4: Enter a function that displays the average cost of animals rescued.
select AVG(COST) from PETRESCUE;

Query A5: Enter a function that displays the average cost of rescuing a dog.
select AVG(COST/QUANTITY) from PETRESCUE where ANIMAL = 'Dog';

Exercise 3 Solutions: Scalar and String Functions

Query B1: Enter a function that displays the rounded cost of each rescue.
select ROUND(COST) from PETRESCUE;

Query B2: Enter a function that displays the length of each animal name.
select LENGTH(ANIMAL) from PETRESCUE;

Query B3: Enter a function that displays the animal name in each rescue in uppercase.
select UCASE(ANIMAL) from PETRESCUE;

Query B4: Enter a function that displays the animal name in each rescue in uppercase without duplications.
select DISTINCT(UCASE(ANIMAL)) from PETRESCUE;

Query B5: Enter a query that displays all the columns from the PETRESCUE table, 
          where the animal(s) rescued are cats. Use cat in lower case in the query.
select * from PETRESCUE where LCASE(ANIMAL) = 'cat';

Exercise 4 Solutions: Date and Time Functions

Query C1: Enter a function that displays the day of the month when cats have been rescued.
select DAY(RESCUEDATE) from PETRESCUE where ANIMAL = 'Cat';

Query C2: Enter a function that displays the number of rescues on the 5th month.
select SUM(QUANTITY) from PETRESCUE where MONTH(RESCUEDATE)='05';

Query C3: Enter a function that displays the number of rescues on the 14th day of the month.
select SUM(QUANTITY) from PETRESCUE where DAY(RESCUEDATE)='14';

Query C4: Animals rescued should see the vet within three days of arrivals. 
          Enter a function that displays the third day from each rescue.
select (RESCUEDATE + 3 DAYS) from PETRESCUE;

Query C5: Enter a function that displays the length of time the animals have been rescued; 
          the difference between today’s date and the recue date.
select (CURRENT DATE - RESCUEDATE) from PETRESCUE;

            
	    Sub-queries and Nested SELECTs
	    
Execute a working query using a sub-select to retrieve all employees records whose salary is lower than the average salary.

Solution
select EMP_ID, F_NAME, L_NAME, SALARY 
from employees 
where SALARY < (select AVG(SALARY) 
                from employees);

Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.

Solution
select EMP_ID, SALARY, ( select MAX(SALARY) from employees ) AS MAX_SALARY 
from employees;

Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).

Solution
select * 
from ( select EMP_ID, F_NAME, L_NAME, DEP_ID from employees) AS EMP4ALL;



Exercise 1: Accessing Multiple Tables with Sub-Queries

Problem:
Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
Solution
select * 
from employees 
where JOB_ID IN (select JOB_IDENT from jobs);

Problem:
Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
Solution
select * 
from employees 
where JOB_ID IN (select JOB_IDENT from jobs where JOB_TITLE= 'Jr. Designer');

Problem:
Retrieve JOB information and who earn more than $70,000.
Solution
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
from jobs 
where JOB_IDENT IN (select JOB_ID from employees where SALARY > 70000 );

Problem:
Retrieve JOB information and whose birth year is after 1976.
Solution
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
from jobs 
where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 );

Problem:
Retrieve JOB information for female employees whose birth year is after 1976.
Solution
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
from jobs 
where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 and SEX='F' );


Exercise 2: Accessing Multiple Tables with Implicit Joins

Problem:
Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
Solution
select * from employees, jobs;

Problem:
Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
Solution
select * from employees, jobs where employees.JOB_ID = jobs.JOB_IDENT;

Problem:
Redo the previous query, using shorter aliases for table names.
Solution
select * from employees E, jobs J where E.JOB_ID = J.JOB_IDENT;

Problem:
Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.
Solution
select EMP_ID,F_NAME,L_NAME, JOB_TITLE from employees E, jobs J where E.JOB_ID = J.JOB_IDENT;

Problem:
Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.
Solution
select E.EMP_ID,E.F_NAME,E.L_NAME, J.JOB_TITLE from employees E, jobs J where E.JOB_ID = J.JOB_IDENT;

                   
		     
   
