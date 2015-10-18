/*FOREIGN KEY REFERENCE VIOLATIONS*/
INSERT INTO MovieGenre(mid,genre) values
(123412341234124, 'Mystery'); -- shouldn't be allowed due to the foreign key reference in MovieGenre

INSERT INTO MovieActor(mid, aid, role) values
(123423523452345, 68635, 'Stunt Man'); -- this tries to create a tuple with a mid which is not in Movie... therefore it is in violation of the foreign key reference constraint

INSERT INTO MovieActor(mid, aid, role) values
(4734, 6888888888, 'Farmer'); -- this tries to create a tuple with a aid which is not in Actor... therefore it is in violation of the foreign key reference constraint

INSERT INTO MovieDirector(mid, did) values
(4734, 6888888888); -- this tries to create a tuple with a did which is not in Director... therefore it is in violation of the foreign key reference constraint

INSERT INTO MovieDirector(mid, did) values
(6888809098098, 68605); -- this tries to create a tuple with a mid which is not in Movie... therefore it is in violation of the foreign key reference constraint

INSERT INTO Review(name, time, mid, rating, comment) values
('Jaws', '2008-01-01 00:00:01', 6565656565656, 5, 'This movie was pretty deeec'); -- this tries to create a tuple with a mid which is not in Movie... therefore it is in violation of the foreign key reference constraint

/*PRIMARY KEY CONSTRAINT VIOLATIONS*/
INSERT INTO Movie(id, title, year, rating, company) values
(4734, 'Explosions and Hot Women 3!!!', 2015, 'R', 'We Make Hit Movies Inc.'); -- this is a violation because I am trying to add a new Movie with an id which already exists in the Movie table (and using id as a primary key prevents this)

INSERT INTO Actor(id, last, first, sex, dob, dod) values
(68635, 'Hopkins', 'John', 'M', '1991-05-11', NULL); -- this is a violation becuase I am trying to add an Actor with an id that already exists in the Actor table (and using id as a primary key prevents this)

INSERT INTO Director(id, last, first, dob, dod) values
(68605, 'Director', 'Some Famous', '1935-06-05', '1998-03-10'); -- this is a violation because I am trying to add a director with an id that already exists in the Director table (and using id as a primary key prevents this)

/*ERROR MESSAGES RETURNED AFTER THIS SCRIPT IS RUN*/
/*
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`TEST`.`MovieGenre`, CONSTRAINT `MovieGenre_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`TEST`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`TEST`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `Actor` (`id`))
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`TEST`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_2` FOREIGN KEY (`did`) REFERENCES `Director` (`id`))
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`TEST`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`TEST`.`Review`, CONSTRAINT `Review_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
ERROR 1062 (23000): Duplicate entry '4734' for key 'PRIMARY'
ERROR 1062 (23000): Duplicate entry '68635' for key 'PRIMARY'
ERROR 1062 (23000): Duplicate entry '68605' for key 'PRIMARY'
*/

/*CHECK CONSTRAINT VIOLATIONS*/
INSERT INTO Movie(id, title, year, rating, company) values
(4735, 'Explosions and Hot Women 3!!!', 1873, 'R', 'We Make Hit Movies Inc.'); -- this is a violation because the Movie I am trying to add was made before movies were even made (the check constraint makes sure it can't be added)

INSERT INTO Actor(id, last, first, sex, dob, dod) values
(68636, 'Hopkins', 'John', 'Hype', '1991-05-11', NULL); -- this is a violation of the check constraint that sex must be either 'M' or 'F' ... this is there to make sure that no invalid input is added to the DB which doesn't make any sense. In this case 'hype' doens't make much sense

INSERT INTO Review(name, time, mid, rating, comment) values
('Markus', '2008-01-01 00:00:01', 4699, 7, 'This movie was OFF THE HIZZLE!!!'); -- this is a violation because the rating 7 doesn't fall between 1 and 5, and is therefore in violation of the check constraint placed on the rating var in the Review Table