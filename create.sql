CREATE TABLE Movie
(
id int NOT NULL, -- movie's id must be unique and non-null (to differentiate from other Movies)
title varchar(100) NOT NULL, -- title must not be null (needs at least something to make it worth storing in the DB)
year int,
rating varchar(10),
company varchar(50),
PRIMARY KEY(id), -- id is used as a primary key to ensure no 2 movies have the same id
CHECK (year > 1890) -- the first movies ever made were in the 1890s, so year before that would be invalid
);

CREATE TABLE Actor
(
id int NOT NULL, -- actor's id must be non null (to differentiate from other actors)
last varchar(20) NOT NULL, -- actor must have at least a last name to give him some representation in the DB besides the id
first varchar(20),
sex varchar(6),
dob date,
dod date,
PRIMARY KEY(id), -- primary so that no two actors can have the same id (must be able to differentiate between actors)
CHECK (sex = 'M' || sex = 'F') -- to keep input out that doesn't make sense in the context of gender (like 'HFDE') or other random input
);

CREATE TABLE Director
(
id int NOT NULL, -- id cannot be NULL, because every director needs at least some kind of identifier
last varchar(20) NOT NULL, -- last name cannot be null because every director should logically have at least a name
first varchar(20),
dob date,
dod date,
PRIMARY KEY(id) -- primary so that no two actors can have the same id (must be able to differentiate between actors)
);

CREATE TABLE MovieGenre
(
mid int NOT NULL, -- movie id should not be null, because otherwise the genre would be tied to nothing and serve no purpose
genre varchar(20) NOT NULL, -- if there is no genre entered, there is no point in this tuple
FOREIGN KEY (mid) references Movie(id) -- the movie being referred to by this tuple must exist in the Movie table
) ENGINE=INNODB;

CREATE TABLE MovieActor
(
mid int NOT NULL, -- if the mid were null, there would be no link to the movie the actor was in
aid int NOT NULL, -- if the aid were null, there would be no link to the actor in the movie 
role varchar(50),
FOREIGN KEY (mid) references Movie(id), -- for the movie to be listed in this table, the movie should first exist in the Movie table
FOREIGN KEY (aid) references Actor(id) -- for the actor to be listed in this table, the actor should first exist in the Actor table
)ENGINE=INNODB;

CREATE TABLE MovieDirector
(
mid int NOT NULL, -- the point of this table is to link directors to the movies they directed, therefore it wouldn't make sense if there were no mid in this table
did int NOT NULL, -- ...therefore it would also not make sense if the movie had no director in this table but had a movie
FOREIGN KEY (mid) references Movie(id), -- before the tuple can appear in this table, the movie should first appear in the Movie relation
FOREIGN KEY (did) references Director(id) -- before the tuple can appear in this table, the director should first appear in the Director relation
)ENGINE=INNODB;

CREATE TABLE Review
(
name varchar(20),
time timestamp,
mid int,
rating int NOT NULL, -- every review should at least have a rating ... everything else should be optional
comment varchar(500),
FOREIGN KEY (mid) references Movie(id),
CHECK (rating >= 1 AND rating <= 5) -- every rating should be from 1-5 to keep some sort of standardized rating system
)ENGINE=INNODB;


CREATE TABLE MaxPersonID
(
id int
);

CREATE TABLE MaxMovieID
(
id int
);












