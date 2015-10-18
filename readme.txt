This is the README for project 1b by Markus Notti and Andrew Kennedy

In this project, we designed and implemented the mySQL database which will be the backbone of our IMDB like web service (soon to come).  The database contains 9 different relations (Movie, Actor, Director, MovieActor, MovieDirector, MovieGenre, Review, MaxPersonID, MaxMovieID).  Using these relations, it is simple to query the system for pretty much any data you can think of.

The database includes several primary key constraints to keep the ids of actors, movies, and directors unique.
It also includes several foreign key reference constraints to ensure that the ids of actors, movies, and directors referred to by various relations are first included in the Movie, Actor, and Director relations.
A few CHECK constraints are also included to illustrate the point that there should be certain checks on some of the values submitted to the DB, however, since the CHECK constraint is not supported by the version of mySQL that we are running, they are simply ignored.

In addition to the mySQL DB, we also created a web interface using php which allows you to input mySQL queries to our system and displays the results of the queries.

create.sql -> creates the relations
load.sql -> loads the initial data from the 'data' directory
query.php -> web interface for querying database
queries.sql -> some sample queries
violations.sql -> sample queries that would violate the database constraints

