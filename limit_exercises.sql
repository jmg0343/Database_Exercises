/* In your script, use DISTINCT to find the unique titles in the titles table. Your results should look like:

 Senior Engineer
 Staff
 Engineer
 Senior Staff
 Assistant Engineer
 Technique Leader
 Manager
Update the previous query to sort the results alphabetically.
*/
SELECT title FROM titles
GROUP BY title;

/* Find your QUERY FOR employees whose LAST NAMES START AND END WITH 'E'. UPDATE the QUERY find just the UNIQUE LAST NAMES that START AND END WITH 'E' USING GROUP BY. The results should be:

 Eldridge
 Erbe
 Erde
 Erie
 Etalle
UPDATE your previous QUERY TO now find UNIQUE combinations of FIRST AND LAST NAME WHERE the LAST NAME STARTS AND ENDS WITH 'E'. You should get 846 rows. 
*/
SELECT last_name FROM employees WHERE last_name LIKE 'e%e'
GROUP BY last_name;




/* Find the UNIQUE LAST NAMES WITH a 'q' but NOT 'qu'. You may USE either DISTINCT OR GROUP BY. Your results should be:

 Chleq
 Lindqvist
 Qiwen */
 
 SELECT last_name FROM employees WHERE last_name LIKE '%q%'
 	AND last_name NOT LIKE "%qu%"
 	GROUP BY last_name;
 	
 	
 	
 	
 	
 	
/*  CREATE a NEW SQL script called limit_exercises.sql. AFTER EACH step COMMIT your changes AND AT the END push TO GitHub.

LIST the FIRST 10 DISTINCT LAST NAME sorted IN descending order. Your result should look LIKE this:

 Zykh
 Zyda
 Zwicker
 Zweizig
 Zumaque
 Zultner
 Zucker
 Zuberek
 Zschoche
 Zongker
 */
SELECT DISTINCT last_name FROM employees 
ORDER BY last_name DESC
LIMIT 10; 



/* Find your QUERY FOR employees born ON Christmas AND hired IN the 90s FROM order_by_exercises.sql. UPDATE it TO find just the FIRST 5 employees. Their NAMES should be: *\/
 Khun Bernini
 Pohua Sudkamp
 Xiaopeng Uehara
 Irene Isaak
 Dulce Wrigley
  */
SELECT * FROM employees WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%-12-25'
	ORDER BY birth_date, hire_date DESC
	LIMIT 5;

  
/* Try TO think of your results AS batches, OR sets. The FIRST five results are your FIRST batch. The five AFTER that would be your SECOND batch, etc. UPDATE the QUERY TO find the tenth batch of results. The employee NAMES should be:

 Piyawadee Bultermann
 Heng Luft
 Yuqun Kandlur
 Basil Senzako
 Mabo Zobel	
  */
 SELECT * FROM employees WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%-12-25'
	ORDER BY birth_date, hire_date DESC
	LIMIT 5 OFFSET 45;