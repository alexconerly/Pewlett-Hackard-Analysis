-- Challenge 7 Deliverable 1
-- 1.  Retrieve the emp_no, first_name, and last_name 
--        columns from the Employees table.
-- 2.  Retrieve the title, from_date, and to_date 
--        columns from the Titles table.
-- 3.  Create a new table using the INTO clause.
-- 4.  AND join both tables on the primary key.
-- 5.  Filter the data on the birth_date column to 
--       retrieve the employees who were born between 1952 and 1955. 
--       Then, order by the employee number.
-- 6.  Export the Retirement Titles table from the previous step as 
--        retirement_titles.csv and save it to your Data folder 
--        in the Pewlett-Hackard-Analysis folder.
SELECT e.emp_no, 
	   e.first_name, 
	   e.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO retirement_titles
FROM employees as e
	INNER JOIN titles as ti
		ON (e.emp_no = ti.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no

-- 8.  Copy the query from the Employee_Challenge_starter_code.sql 
--         and add it to your Employee_Database_challenge.sql file.
-- 9.  Retrieve the employee number, first and last name, and title 
--      columns from the Retirement Titles table.
--              - These columns will be in the new table that will 
--                hold the most recent title of each employee.
-- 10.  Use the DISTINCT ON statement to retrieve the first occurrence 
--         of the employee number for each set of rows defined by 
--         the ON () clause.
-- 11.  Create a Unique Titles table using the INTO clause.
-- 12.  Sort the Unique Titles table in ascending order by the 
--        employee number and descending order by the last date 
--        (i.e. to_date) of the most recent title.
-- 13.   Export the Unique Titles table as unique_titles.csv and 
--         save it to your Data folder in the Pewlett-Hackard-Analysis folder.

SELECT DISTINCT ON (emp_no) emp_no, 
first_name, 
last_name, 
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- 15.  Write another query in the Employee_Database_challenge.sql 
--        file to retrieve the number of employees by their most 
--        recent job title who are about to retire.
-- 16.  First, retrieve the number of titles from the Unique Titles table.
-- 17.  Then, create a Retiring Titles table to hold the 
--           required information.
-- 18.  Group the table by title, then sort the count 
--         column in descending order.
-- 19.  Export the Retiring Titles table as retiring_titles.csv 
--        and save it to your Data folder in the 
--        Pewlett-Hackard-Analysis folder.


SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;


-- DELIVERABLE 2

-- 1.  Retrieve the emp_no, first_name, last_name, and birth_date 
--         columns from the Employees table.
-- 2.  Retrieve the from_date and to_date columns from the Department Employee table.
-- 3.  Retrieve the title column from the Titles table.
-- 4.  Use a DISTINCT ON statement to retrieve the first 
--         occurrence of the employee number for each set of 
--         rows defined by the ON () clause.
-- 5.  Create a new table using the INTO clause.
-- 6.  Join the Employees and the Department Employee tables on the primary key.
-- 7.  Join the Employees and the Titles tables on the primary key.
-- 8.  Filter the data on the to_date column to get current 
--         employees whose birth dates are between 
--         January 1, 1965 and December 31, 1965.
-- 9.  Order the table by the employee number.
-- 10. Export the Mentorship Eligibility table as mentorship_eligibilty.csv 
--         and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

SELECT DISTINCT ON (emp_no)
	   e.emp_no, 
	   e.first_name, 
	   e.last_name, 
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   ti.title
INTO mentorship_eligibility
FROM employees as e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles as ti
		ON (e.emp_no = ti.emp_no)
WHERE (ti.to_date = ('9999-01-01')) AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;