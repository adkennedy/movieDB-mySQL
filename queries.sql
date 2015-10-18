
/* Actors In 'Die Another Day'*/
SELECT CONCAT_WS(' ',first, last) 
FROM Actor 
WHERE id IN
	(SELECT aid 
		FROM MovieActor 
		WHERE mid = 
			(SELECT id 
				FROM Movie 
				WHERE title = 'Die Another Day'
				)
	);

/*Count of actors in multiple movies*/
SELECT count(*)
FROM
(SELECT aid 
FROM MovieActor
GROUP BY aid
HAVING count(*) > 1) multActors;

/*Directors who directed rated R movies*/
SELECT first, last 
FROM Director
WHERE id in
(SELECT did 
	FROM MovieDirector
	WHERE mid IN
		(SELECT id
			FROM Movie 
			WHERE rating = 'R'));