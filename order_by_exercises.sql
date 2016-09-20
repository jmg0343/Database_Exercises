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


-- Employees with a 'q' in their last name — 1,873 rows.
SELECT * FROM employees WHERE last_name LIKE "%q%";
-- Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
SELECT * FROM employees WHERE last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%';
	
	
