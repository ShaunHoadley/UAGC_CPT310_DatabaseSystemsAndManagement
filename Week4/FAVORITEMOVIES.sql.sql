drop database Favoritemovies;
create database Favoritemovies;
use Favoritemovies;

CREATE TABLE tbldvdtitles (
    asin VARCHAR(15) PRIMARY KEY,
    title VARCHAR(100),
    price DOUBLE(5 , 2 )
);

CREATE TABLE tbldvdActors (
    actorID INT(5) AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(20),
    lname VARCHAR(20)
);

CREATE TABLE tbldvdrelation (
    actorID INT(5),
    asin VARCHAR(15),
    PRIMARY KEY (asin , actorID),
    CONSTRAINT FOREIGN KEY (asin)
        REFERENCES tbldvdtitles (asin),
    CONSTRAINT FOREIGN KEY (actorID)
        REFERENCES tbldvdActors (actorID)
);
insert into tbldvdtitles  values('B01MYN2XY8', 'Furious_7', '9.23');
insert into tbldvdtitles  values('B001CEE1WG', 'The_Dark_Knight', '12.49');
insert into tbldvdtitles  values('B07894WWW9', 'The_Sandlot', '5.99');
insert into tbldvdtitles  values('B07442LM17', 'Iron_Man_2', '16.99');
insert into tbldvdtitles values('B07442MJF5', 'Iron_Man', '16.99');

insert into tbldvdActors values(null, 'Paul', 'Walker');
insert into tbldvdActors values(null, 'Robert', 'Downey');
insert into tbldvdActors values(null, 'Daniel', 'Zacapa');
insert into tbldvdActors values(null, 'Chris', 'Bale');
insert into tbldvdActors values(null, 'Gwyneth', 'Paltrow');

SELECT 
    *
FROM
    tbldvdtitles;
SELECT 
    *
FROM
    tbldvdactors;

UPDATE tbldvdactors 
SET 
    lname = 'Gamboa',
    fname = 'Jose'
WHERE
    actorID = 5;

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