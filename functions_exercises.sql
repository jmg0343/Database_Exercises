-- Employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
SELECT * FROM employees WHERE first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya';
-- Now add a condition to find everybody with those names who is also male — 441 rows.
SELECT * FROM employees WHERE gender = "M"
	AND (
		first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya');
-- MODIFY your FIRST QUERY TO ORDER BY FIRST name. The FIRST result should be Irena Majewski AND the LAST result should be Vidya Schaft.
SELECT * FROM employees WHERE gender = 'M'
	AND (
		first_name IN ('Irena', 'Vidya', 'Maya')
	)
	ORDER BY first_name;
-- UPDATE the QUERY TO ORDER BY FIRST NAME AND THEN LAST name. The FIRST result should now be Irena Acton AND the LAST should be Vidya Zweizig.
SELECT * FROM employees WHERE gender = 'M'
	AND (
		first_name IN ('Irena', 'Vidya', 'Maya')
	)
	ORDER BY first_name, last_name;	
-- CHANGE the ORDER BY clause so that you ORDER BY LAST NAME BEFORE FIRST name. Your FIRST result should still be Irena Acton but now the LAST result should be Maya Zyda.
SELECT * FROM employees WHERE gender = 'M'
	AND (
		first_name IN ('Irena', 'Vidya', 'Maya')
	)
	ORDER BY last_name, first_name;
/* Update your query for 'Irena', 'Vidya', or 'Maya'. Use count(*) and GROUP BY to find the number of employees for each gender with those names. Your results should be:

 441 M
 268 F */
SELECT CONCAT(COUNT(*), " ", gender) FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya')
	GROUP BY gender;
	
	
	
-- Employees whose last name starts with 'E' — 7,330 rows.
SELECT * FROM employees WHERE last_name LIKE("e%");
-- Find all employees whose last name starts or ends with 'E' — 30,723 rows.
SELECT * FROM employees WHERE last_name LIKE "e%"
	OR last_name LIKE "%e";
-- Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.
SELECT * FROM employees WHERE last_name LIKE '%e'
	AND last_name LIKE 'e%';
-- UPDATE your queries FOR employees WITH 'E' IN their LAST NAME TO sort the results BY their employee number. Your results should NOT CHANGE!
SELECT * FROM employees WHERE last_name LIKE '%e'
	AND last_name LIKE 'e%'
	ORDER BY emp_no;
-- Now reverse the sort order FOR BOTH queries.
SELECT * FROM employees WHERE last_name LIKE '%e'
	AND last_name LIKE 'e%'
	ORDER BY emp_no DESC;
-- UPDATE your queries FOR employees whose NAMES START AND END WITH 'E'. USE concat() TO combine their FIRST AND LAST NAME together AS a single COLUMN IN your results.
SELECT CONCAT(first_name, " ", last_name) FROM employees WHERE last_name LIKE '%e'
	AND last_name LIKE 'e%'
	ORDER BY emp_no DESC;
		

-- Employees hired in the 90s — 135,214 rows.
SELECT * FROM employees WHERE hire_date LIKE "199%";
-- Employees born on Christmas — 842 rows.
SELECT * FROM employees WHERE birth_date LIKE "%-12-25";
-- Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT * FROM employees WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%-12-25';
-- CHANGE the QUERY FOR employees hired IN the 90s AND born ON Christmas such that the FIRST result IS the oldest employee who was hired last. It should be Khun Bernini.
SELECT * FROM employees WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%-12-25'
	ORDER BY birth_date, hire_date DESC;
-- FOR your QUERY of employees born ON Christmas AND hired IN the 90s, USE datediff() TO find how many days they have been working AT the company (Hint: You will also need TO USE now() OR curdate())
SELECT DATEDIFF(NOW(), hire_date) FROM employees WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%-12-25'
	ORDER BY birth_date, hire_date DESC;


-- Employees with a 'q' in their last name — 1,873 rows.
SELECT * FROM employees WHERE last_name LIKE "%q%";
-- Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
SELECT * FROM employees WHERE last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%';
-- ADD a GROUP BY clause TO your QUERY FOR LAST NAMES WITH 'q' AND NOT 'qu' TO find the DISTINCT combination of FIRST AND LAST names. You will find there were SOME DUPLICATE FIRST AND LAST NAME pairs IN your previous results. ADD a count() TO your results AND USE ORDER BY TO make it easier TO find employees whose unusual NAME IS shared WITH others.
SELECT last_name, COUNT(last_name) AS 'Count of Last Name'
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

	
-- -------------------------------------------------------------------------------------------------------

/* USE the employees database.

RETURN 10 employees IN a result SET named "full_name" IN the format of "lastname, firstname" FOR EACH employee. */
SELECT CONCAT(last_name, ", ", first_name) AS 'Full Name' FROM employees
LIMIT 10;



-- ADD the DATE of birth FOR EACH employee AS "DOB" TO the query.
SELECT CONCAT(last_name, ", ", first_name) AS 'Full Name', birth_date AS 'DOB' FROM employees
LIMIT 10;


/* UPDATE the QUERY TO format FULL NAME TO include the employee number so it IS formatted AS "employee number - lastname, firstname".
The final result should look LIKE this:
 +-----------------------------+------------+
 | full_name                   | DOB        |
 +-----------------------------+------------+
 | 10001 - Facello, Georgi     | 1953-09-02 |
 | 10002 - Simmel, Bezalel     | 1964-06-02 |
 | 10003 - Bamford, Parto      | 1959-12-03 |
 | 10004 - Koblick, Chirstian  | 1954-05-01 |
 | 10005 - Maliniak, Kyoichi   | 1955-01-21 |
 | 10006 - Preusig, Anneke     | 1953-04-20 |
 | 10007 - Zielinski, Tzvetan  | 1957-05-23 |
 | 10008 - Kalloufi, Saniya    | 1958-02-19 |
 | 10009 - Peac, Sumant        | 1952-04-19 |
 | 10010 - Piveteau, Duangkaew | 1963-06-01 |
 +-----------------------------+------------+
 10 ROWS IN SET (0.00 sec) */
SELECT CONCAT(emp_no, " - ", last_name, ", ", first_name) AS 'full_name', birth_date AS 'DOB' FROM employees
LIMIT 10;