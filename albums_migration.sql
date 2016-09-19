USE codeup_test_db;
-- deletes table named albums if it exists
DROP TABLE IF EXISTS albums;
-- creates table named albums
CREATE TABLE albums(
	-- assigns an id that is an integer, positive number, and will automatically increment
	id INT UNSIGNED AUTO_INCREMENT NOT NULL,
	-- creates an artist column that will have a character max of 50
	artist VARCHAR(50),
	-- creates an album name column
	name VARCHAR(50),
	-- creates a column that shows the release date in 4-digit year format
	release_date INT UNSIGNED,
	-- creates a column that shows the sales as a float integer
	sales FLOAT,
	-- creates a column that shows the genre that has a 50 character max
	genre VARCHAR(50),
	-- referenced id
	PRIMARY KEY (id)
);