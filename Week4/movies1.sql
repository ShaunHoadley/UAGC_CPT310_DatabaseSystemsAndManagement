/* deletes old copy if it exists */
DROP DATABASE shaun_hoadley_week4_interactive; 
/* create new database */
CREATE DATABASE shaun_hoadley_week4_interactive;
/* set as active database */ 
USE shaun_hoadley_week4_interactive; 

/* Create the tables tbldvdtitles, tbldvdactors, and tbldvdrelationships */
	CREATE TABLE tbldvdtitles (
    	asin varchar(15) PRIMARY KEY,
    	title varchar(100),
    	price DOUBLE(5,2)
	);

    CREATE TABLE tbldvdactors (
        actorID INT(5) PRIMARY KEY AUTO_INCREMENT,
        fname varchar(20),
        lname varchar(20)
    );
    
    CREATE TABLE tbldvdrelationships (
        asin varchar(15),
        actorID INT(5),
		PRIMARY KEY (asin, actorID),
		CONSTRAINT FOREIGN KEY (asin)
        REFERENCES tbldvdtitles (asin),
    CONSTRAINT FOREIGN KEY (actorID)
        REFERENCES tbldvdActors (actorID)
    );
	
/*	populate the tables tbldvdactors and tbldvdtitles	*/
insert into tbldvdtitles  
	values	('B003GQSXOU', 'Oceans Eleven', '38.83'),
			('B003VDC0EM', 'Three Kings', '18.72'),
			('B01M5EEGPH', 'Shooter', '5.99'),
			('B06XWGRTKR', 'DOGMA', '22.95')
;

insert into tbldvdActors 
	values	(null, 'George', 'Clooney'),
			(null, 'Matt', 'Damon'),
			(null, 'Mark', 'Wahlburgh'),
			(null, 'George', 'Carlin')
;

/*	display tables	*/
SELECT *
	FROM tbldvdtitles;
	
SELECT *
	FROM tbldvdactors;
	
/*	change last actor name	*/
UPDATE tbldvdactors 
	SET 
		lname = 'Affleck',
		fname = 'Ben'
	WHERE
		actorID = 4;
SELECT * 
	FROM tbldvdactors;
	
/*	delete the first actor from database	*/
DELETE FROM tbldvdactors 
WHERE
    actorID = 1;
SELECT 
    *
FROM
    tbldvdactors;

SELECT 
    *
FROM
    tbldvdrelation
        JOIN
    tbldvdtitles USING (asin)
        JOIN
    tbldvdActors USING (actorID);
    
select asin, actorID from tbldvdtitles, tbldvdactors;