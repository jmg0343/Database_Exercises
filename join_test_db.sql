CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null),
("Tupac", "iLiveInCuba@gmail.com", NULL),
("Biggie", "tenCrackCommandments@aol.com", 2),
("Wu-Tang", "cream@yahoo.com", 2),
("Joey", "jmg0343@gmail.com", 2);


-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson
SELECT users.name AS NAME, roles.name AS ROLE
FROM users
LEFT JOIN roles 
ON users.role_id = roles.id;

/*
	Although NOT explicitly covered IN the lesson, AGGREGATE functions LIKE count can be used WITH JOIN queries. USE count AND the appropriate JOIN TYPE TO get a LIST of roles along WITH the number of users 		that has the role. Hint: You will also need TO USE GROUP BY IN the query. 
*/
SELECT roles.name AS 'Role Name', count(users.name) AS "Number of Users"
FROM users
LEFT JOIN roles
ON users.role_id = roles.id
GROUP BY roles.name;


-- write a query that shows each department along with the name of the current manager for that department.
SELECT d.dept_name AS "Department", CONCAT(e.first_name, ' ', e.last_name) AS "Department Manager"
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE now() BETWEEN dm.from_date AND dm.to_date;

-- Find the name of all departments currently managed by women.
SELECT d.dept_name AS "Department", CONCAT(e.first_name, ' ', e.last_name) AS "Department Manager"
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE now() BETWEEN dm.from_date AND dm.to_date 
	AND e.gender = 'F';

-- Find the current titles of employees currently working in the Customer Service department.
SELECT DISTINCT t.title AS "Title", COUNT(*) AS "Count"
FROM employees AS e
JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no
JOIN titles AS t
	ON t.emp_no = de.emp_no
WHERE d.dept_name = "Customer Service"
	AND now() BETWEEN t.from_date AND t.to_date		-- filter current title
	AND now() BETWEEN de.from_date AND de.to_date	-- filter current employee
GROUP BY t.title;
 
--  Find the current salary of all current managers.
SELECT d.dept_name AS "Department Name", CONCAT(e.first_name, " ", e.last_name) AS "Manager Name", s.salary AS "Salary"
FROM departments AS d
JOIN dept_manager AS dm
	ON dm.dept_no = d.dept_no
JOIN employees AS e
	ON e.emp_no = dm.emp_no
JOIN salaries AS s
	ON s.emp_no = e.emp_no
WHERE now() BETWEEN s.from_date AND s.to_date
	AND now() BETWEEN dm.from_date AND dm.to_date;
	
-- Find the names of all current employees, their department name, and their current manager's name.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', d.dept_name AS 'Department Name', CONCAT(dme.first_name, ' ', dme.last_name) AS 'Manager''s Name'
FROM employees AS e
JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
JOIN departments AS d
	ON de.dept_no = d.dept_no
JOIN dept_manager AS dm
	ON dm.dept_no = d.dept_no
JOIN employees AS dme
	ON dme.emp_no = dm.emp_no
WHERE de.to_date = '9999-01-01'
	AND dm.to_date = '9999-01-01';
	
