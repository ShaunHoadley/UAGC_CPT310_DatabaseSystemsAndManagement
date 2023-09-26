drop database online_food_ordering;
create database online_food_ordering;
use online_food_ordering;

CREATE TABLE Customers (
    cus_ID INT PRIMARY KEY,
    cus_fname VARCHAR(50),
    cus_lname varchar(50),
    ord_ID int foreign key,
    cus_email varchar(50)
);

CREATE TABLE orders (
    ord_ID INT PRIMARY KEY,
    cus_ID INT FOREIGN KEY,
    men_ID INT FOREIGN KEY,
    ord_qty INT,
    ord_total double(5,2),
    ord_date datetime
);

CREATE TABLE items (
  id int(10) NOT NULL,
  name varchar(20) NOT NULL,
  price int(11) NOT NULL,
  deleted int(4) NOT NULL DEFAULT '0'
);

CREATE TABLE employees (
    emp_ID INT primary key,
    emp_gender varchar(20),
    emp_salary double(10,2),
    emp_annual_salary double(10,2),
    dept_name varchar(20),
    dept_location varchar(20),
    dept_head varchar(20)
);
    
INSERT INTO items (id, name, price, deleted) VALUES
(1, 'Item 1', 25, 1),
(2, 'Item 2', 45, 0),
(3, 'Item 3', 20, 0),
(4, 'Item 4', 15, 1),
(5, 'Item 5', 20, 0);

insert into Customers  values(null, 'Jose', 'Gamboa', null, 'jose.i.gamboa@ashforduniversity.com');
insert into Customers  values(null, 'Frank', 'Smith', null, 'frank@noemail.com');
insert into Customers  values(null, 'Karen', 'Garcia', null, 'karen@gmail.com');

create table employee_audit(
	ID int auto_increment primary key,
    audit_data varchar(100)
    );
    
create trigger employee_insert
before insert on employees
for each row
insert into employee_audit
set action = 'insert';

drop trigger if exists employee_insert;

show triggers in online_food_db;

create trigger ins_employee
before insert on employees for each row 
INSERT INTO employee_audit
VALUES (emp_id);

INSERT INTO online_food_db.employees (emp_ID, emp_name, emp_gender, emp_salary, emp_annual_salary, dept_name, dept_location, dept_head) 
VALUES ('4', 'Gisselle Gamboa', 'F', '12.00', '24960.00', 'customer service', 'ks', 'Tammy');

drop trigger if exists employee_insert;

create trigger employee_insert
before insert on employees for each row
values (emp_ID);

INSERT INTO online_food_db.employees (emp_ID, emp_name, emp_gender, emp_salary, emp_annual_salary, dept_name, dept_location, dept_head) 
VALUES ('4', 'Gisselle Gamboa', 'F', '12.00', '24960.00', 'customer service', 'ks', 'Tammy');

drop trigger if exists employee_insert;

delimiter //
create trigger new_employee
      before insert on employees
      for each row
      begin
      insert into employee_audit values (ID, audit_data);
      end; // 

create trigger del_employee
      before delete on employees
      for each row
      begin
      insert into employee_audit values (ID, audit_data);
      end; // 

INSERT INTO online_food_db.employees (emp_ID, emp_name, emp_gender, emp_salary, emp_annual_salary, dept_name, dept_location, dept_head) 
VALUES ('4', 'Gisselle Gamboa', 'F', '12.00', '24960.00', 'customer service', 'ks', 'Tammy');

DELETE FROM employees
WHERE employeeID = 1;