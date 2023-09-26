/* 	
	Final Project
	Shaun Hoadley
	CPT310 Database Systems and Management
	Austine Ohwobete
	November 30, 2020
	PopulateData.sql
*/
USE online_food_ordering;

INSERT INTO tbl_department (dep_ID, dep_name, dep_head, dep_location)
	VALUES 	(1, 'Management', 'Store Manager', 'Store Office'),
			(2, 'Customer Service', 'Lead CSR', 'Store Counter'),
			(3, 'Kitchen', 'Lead Cook', 'Store Kitchen'),
			(4, 'Delivery Drivers', 'Store Manager', 'Delivery Station');
			
INSERT INTO tbl_employees (emp_ID, emp_name, emp_gender, emp_salary, dep_ID)
	VALUES	(NOT NULL, 'Hopkins, Sheila', 'Female', 1200, 1),
			(NOT NULL, 'Baker, Mike', 'Male', 600, 3),
			(NOT NULL, 'Nichols, Cynthia', 'Female', 500, 2),
			(NOT NULL, 'Daniels, Harlan', 'Male', 1500, 1),
			(NOT NULL, 'Simpson, Dana', 'Female', 800, 4);
			
INSERT INTO tbl_menu (men_ID, men_name, men_price)
	VALUES	('CK1', 'Baked Chicken', 6.00),
			('BF1', 'Meatloaf', 5.50),
			('SF1', 'Smoked Salmon', 7.50);
			
INSERT INTO tbl_orders (ord_ID, cus_ID, men_ID, ord_total)
	VALUES	(NOT NULL, 1, 'SF1', 7.50),
			(NOT NULL, 2, 'BF1', 5.50);

INSERT INTO tbl_customers (cus_ID, cus_fname, cus_lname, ord_ID, cus_email)
	VALUES	(NOT NULL, 'Jackie', 'Williams', 1, 'j.will@nomail.com'),
			(NOT NULL, 'Sammy', 'Cooks', 2, 'samcook@nomail.com');