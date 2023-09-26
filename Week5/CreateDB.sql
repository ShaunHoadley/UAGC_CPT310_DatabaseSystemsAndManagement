/* 	
	Final Project
	Shaun Hoadley
	CPT310 Database Systems and Management
	Austine Ohwobete
	November 30, 2020
	CreateDB.sql
*/

DROP DATABASE online_food_ordering;
CREATE DATABASE online_food_ordering;
USE online_food_ordering;

CREATE TABLE tbl_department (
	dep_ID INT(6) PRIMARY KEY NOT NULL,
    dep_name VARCHAR(50),
    dep_head VARCHAR (100),
    dep_location VARCHAR (100)
);

CREATE TABLE tbl_employees (
    emp_ID INT(6) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    emp_name varchar(100),
    emp_gender varchar(10),
    emp_salary double(10,2),
    dep_ID int(6),
    FOREIGN KEY (dep_ID) REFERENCES tbl_department(dep_ID)
);

CREATE TABLE tbl_menu (
	men_ID VARCHAR(10) PRIMARY KEY NOT NULL,
	men_name varchar(20) NOT NULL,
	men_price int(11) NOT NULL
);
  
CREATE TABLE tbl_customers (
    cus_ID INT(6) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cus_fname VARCHAR(50),
    cus_lname varchar(50),
    ord_ID VARCHAR(20) not null,
    cus_email varchar(50)
);

CREATE TABLE tbl_orders (
	ord_ID INT(6) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cus_ID INT(6),
    men_ID VARCHAR(20),
    ord_total double(5,2),
    FOREIGN KEY (cus_ID) REFERENCES tbl_customers(cus_ID),
	FOREIGN KEY (men_ID) REFERENCES tbl_menu(men_ID)
);

CREATE TABLE employee_audit (audit_ID INT(6) NOT NULL AUTO_INCREMENT, 
	log_time TIMESTAMP NOT NULL, Audit_Data VARCHAR(200) NOT NULL , PRIMARY KEY (audit_ID)) ENGINE = InnoDB;

CREATE TRIGGER `Audit_Add` AFTER INSERT ON `tbl_employees` 
FOR EACH ROW INSERT INTO employee_audit VALUES (NOT NULL, NOW(), 'has been added on employees table');

CREATE TRIGGER `Audit_Update` AFTER UPDATE ON `tbl_employees` 
FOR EACH ROW INSERT INTO employee_audit VALUES (NOT NULL, NOW(), 'has been updated on employees table');

CREATE TRIGGER `Audit_Delete` AFTER DELETE ON `tbl_employees` 
FOR EACH ROW INSERT INTO employee_audit VALUES (NOT NULL, NOW(), 'has been deleted on employees table');

CREATE VIEW largest_orders AS
SELECT cus_fname, cus_lname, ord_total
FROM tbl_customers, tbl_orders
WHERE ord_total > 50;
