drop database online_food_ordering;
create database online_food_ordering;
use online_food_ordering;

CREATE TABLE tbldepartmenthead (
	dep_ID INT PRIMARY KEY NOT NULL,
    dep_name VARCHAR(50),
    dep_head VARCHAR (20),
    dep_location VARCHAR (20)
);

CREATE TABLE tblemployees (
    emp_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    emp_name varchar(40),
    emp_gender varchar(20),
    emp_salary double(10,2),
    emp_annual_salary double(10,2),
    dep_ID int(20),
    FOREIGN KEY (dep_ID) REFERENCES tbldepartmenthead(dep_ID)
);

CREATE TABLE tblmenu (
  men_ID VARCHAR(10) PRIMARY KEY NOT NULL,
  men_name varchar(20) NOT NULL,
  men_price int(11) NOT NULL
);
  
  CREATE TABLE tblcustomers (
    cus_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    cus_fname VARCHAR(50),
    cus_lname varchar(50),
    ord_ID VARCHAR(20) not null,
    cus_email varchar(50)
);

CREATE TABLE tblorders (
	ord_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    cus_ID VARCHAR(20),
    men_ID VARCHAR(20),
    ord_total double(5,2),
    ord_date date,
    FOREIGN KEY (cus_ID) REFERENCES tblcustomers(cus_ID)
);

CREATE TABLE `online_food_ordering`.`employee_audit` ( `ID` INT(3) NOT NULL auto_increment, `Audit_Data` VARCHAR(200) NOT NULL , PRIMARY KEY (`ID`)) ENGINE = InnoDB;

CREATE TRIGGER `Audit_Add` AFTER INSERT ON `tblemployees` 
FOR EACH ROW INSERT INTO employee_audit VALUES (ID, 'has been added on employees table');

CREATE TRIGGER `Audit_Update` AFTER UPDATE ON `tblemployees` 
FOR EACH ROW INSERT INTO employee_audit VALUES (ID, 'has been updated on employees table');

CREATE TRIGGER `Audit_Delete` AFTER DELETE ON `tblemployees` 
FOR EACH ROW INSERT INTO employee_audit VALUES (ID, 'has been deleted on employees table');

CREATE VIEW biggest_orders AS
SELECT cus_fname, cus_lname, ord_total
FROM tblcustomers, tblorders
WHERE ord_total > 50;
