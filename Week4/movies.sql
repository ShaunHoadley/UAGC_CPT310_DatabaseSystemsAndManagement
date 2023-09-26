DROP DATABASE week4interaciveshaunhoadley;
CREATE DATABASE week4interaciveshaunhoadley;
USE week4interaciveshaunhoadley;

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
insert into tbldvdtitles  values('B003GQSXOU', 'Oceans Eleven', '38.83');
insert into tbldvdtitles  values('B003VDC0EM', 'Three Kings', '18.72');
insert into tbldvdtitles  values('B01M5EEGPH', 'Shooter', '5.99');
insert into tbldvdtitles  values('B06XWGRTKR', 'DOGMA', '22.95');


insert into tbldvdActors values(null, 'George', 'Clooney');
insert into tbldvdActors values(null, 'Matt', 'Damon');
insert into tbldvdActors values(null, 'Mark', 'Wahlburgh');
insert into tbldvdActors values(null, 'George', 'Carlin');


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
    lname = 'Pitt',
    fname = 'Brad'
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