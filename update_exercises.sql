USE codeup_test_db;
-- SELECT * FROM albums;
-- All albums in your table.
-- Make all the albums 10 times more popular (sales * 10)
SELECT 'Album Names' AS 'Info'\G
SELECT name FROM albums;
UPDATE albums
	SET sales = sales * 100;

-- All albums released before 1980
-- Move all the albums before 1980 back to the 1800s.
SELECT 'Albums release before 1980' AS 'Info'\G
SELECT name FROM albums WHERE release_date < 1980;
UPDATE albums
	SET release_date = release_date - 100;
	-- WHERE release_date < 1980;

-- All albums by Michael Jackson
-- Change "Michael Jackson" to "Peter Jackson"
SELECT "Michael Jackson Albums" AS 'Info'\G
SELECT name FROM albums WHERE artist = 'Michael Jackson';
UPDATE albums
	SET artist = "Peter Jackson"
	WHERE artist = "Michael Jackson";

SELECT * FROM albums;

