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