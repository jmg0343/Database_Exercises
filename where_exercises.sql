-- Employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- Employees whose last name starts with 'E' — 7,330 rows.
SELECT * FROM employees WHERE last_name LIKE("e%");
-- Employees hired in the 90s — 135,214 rows.
SELECT * FROM employees WHERE hire_date LIKE "199%";
-- Employees born on Christmas — 842 rows.
SELECT * FROM employees WHERE birth_date LIKE "%-12-25";
-- Employees with a 'q' in their last name — 1,873 rows.
SELECT * FROM employees WHERE last_name LIKE "%q%";