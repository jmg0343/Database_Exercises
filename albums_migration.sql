USE codeup_test_db;
DROP TABLE IF EXISTS albums;

CREATE TABLE albums(
	id INT UNSIGNED AUTO_INCREMENT NOT NULL,
	artist VARCHAR(50) NOT NULL,
	release_date YEAR(4),
	sales FLOAT,
	genre VARCHAR(50),
	PRIMARY KEY (id)
);