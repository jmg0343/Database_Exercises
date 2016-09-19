USE codeup_test_db;



SELECT 'Albums released after 1991' AS 'Info'\G
DELETE FROM albums WHERE release_date > 1991;

SELECT 'Disco albums' AS 'Info'\G
DELETE FROM albums where genre LIKE '%disco%';

SELECT 'Madonna albums' AS 'Info'\G
DELETE FROM albums WHERE artist = 'Madonna';

SELECT * FROM albums;

-- Convert the SELECT statements to DELETE.
-- Use the MySQL command line client to make sure your records really were removed.