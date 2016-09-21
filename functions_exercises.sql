ALTER TABLE albums
ADD UNIQUE (`name`, artist);

/* USE your codeup_test_db database.
Add an index to make sure all album names combined with the artist are unique. Try to add duplicates to test the constraint.
*/

DESCRIBE albums;

