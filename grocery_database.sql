create database grocery;
use grocery;
show tables;

CREATE TABLE customer (
    customer_ID integer PRIMARY KEY,
    customer_First VARCHAR(40) NOT NULL,
    customer_Last VARCHAR(40) NOT NULL,
    customer_Street VARCHAR(200),
    customer_City VARCHAR(30),
    customer_State CHAR(2),
    customer_Zip CHAR(5),
    customer_Country CHAR(3),
    gender CHAR(1),
    customer_Borough VARCHAR(20),
    customer_Account VARCHAR(25),
    customer_Password VARCHAR(25),
    customer_Phone CHAR(12),
    customer_email VARCHAR(40),
    cust_credit_card varchar(25),
    credit_exp_date DATE 
);
INSERT INTO customer
VALUES
    (1, 'Larissa', 'Jay', 'Greentree Rd', 'Louis', 'NJ', '12345', 'USA', 'F', 'Brooklyn', 'ljay', 'password1', '516-123-4567', 'ehaller@gmail.com', '1234567890123456', '2025-12-31'),
    (2, 'Bob', 'Seger', 'Pine Rd', 'New York City', 'NY', '13456', 'USA', 'F', 'Staten Island', 'bseger', 'password2', '516-123-4568', 'bs@gmail.com', '2345678901234567', '2024-11-30'),
    (3, 'Sara', 'Abi', 'Yellow Rd', 'Hewlett', 'OH', '11562', 'USA', 'F', 'Queens', 'ehaller', 'password3', '516-123-4569', 'sa@gmail.com', '3456789012345678', '2026-08-31'),
    (4, 'Jack', 'Raya', 'Green Rd', 'Hewlett', 'OH', '11562', 'USA', 'M', 'Staten Island', 'jraya', 'password4', '516-123-4561', 'jr@gmail.com', '4567890123456789', '2027-05-31'),
    (5, 'Kay', 'Wil', 'Red Rd', 'Hewlett', 'OH', '11562', 'USA', 'F', 'Brooklyn', 'kwila', 'password5', '516-123-4562', 'kw@gmail.com', '5678901234567890', '2023-02-28'),
    (6, 'Lea', 'Sandler', 'Orange Rd', 'Hempstead', 'NY', '11500', 'USA', 'F', 'Queens', 'lsand', 'password6', '516-123-4563', 'ls@gmail.com', '6789012345678901', '2028-09-30'),
    (7, 'Jonathan', 'Haller', 'Blue Rd', 'Newville', 'NY', '13456', 'USA', 'M', 'Queens', 'jhall', 'password7', '516-123-4564', 'jh@gmail.com', '7890123456789012', '2029-07-31'),
    (8, 'Cindy', 'Rothman', 'Green Rd', 'Far Rockaway', 'NY', '11523', 'USA', 'F', 'Brooklyn', 'croth', 'password8', '516-123-4565', 'cr@gmail.com', '8901234567890123', '2023-12-31'),
    (9, 'Matthew', 'Reese', 'Pink Rd', 'Cedarhurst', 'VA', '11678', 'USA', 'M', 'Queens', 'mreese', 'password9', '516-123-4566', 'mr@gmail.com', '9012345678901234', '2025-10-31'),
    (10, 'Ezra', 'Clark', 'Gray Rd', 'New York City', 'NY', '11987', 'USA', 'M', 'Brooklyn', 'eclark', 'password10', '516-123-4512', 'ec@gmail.com', '0123456789012345', '2024-04-30'),
    (11, 'David', 'Lehman', 'Black Rd', 'Los Angeles', 'CA', '11218', 'USA', 'M', 'Queens', 'dlehman', 'password11', '516-123-4562', 'dl@gmail.com', '1234567890123456', '2027-03-31'),
    (12, 'Daniel', 'Clinton', 'Black Rd', 'San Francisco', 'CA', '11212', 'USA', 'M', 'Brooklyn', 'dclinton', 'password12', '516-123-4523', 'dc@gmail.com', '2345678901234567', '2026-06-30');

select * 
from customer;

CREATE TABLE customer_ratings (
    rating_ID integer PRIMARY KEY,
    prod_ID integer,
    customer_ID integer,
    rating_Date date,
    rating_Comments varchar(250), /*open ended narrtive text*/
    FOREIGN KEY(prod_ID) REFERENCES product(prod_ID),
    FOREIGN KEY(customer_ID) REFERENCES customer(customer_ID)
);

insert into customer_ratings
values
    (1, 1, 6, "2019-11-25", "bad product"),
    (2, 1, 7, "2018-10-24", "awesome product"),
    (3, 1, 8, "2018-10-23", "was great"),
    (4, 2, 9, "2018-10-22", "amazing"),
    (5, 3, 10, "2018-10-21", "ok"),
    (6, 4, 11, "2018-10-20", "horrible"),
    (7, 5, 12, "2018-10-19", "astonishing"),
    (8, 5, 6, "2018-10-18", "really horrible"),
    (9, 5, 7, "2018-10-17", "really bad");

select * 
from customer_ratings;

CREATE TABLE customer_surveys ( /*customer can only complete one survery for each order*/
    survey_ID integer PRIMARY KEY,
    customer_ID integer,
    survey_Date date,
    survey_Method varchar(20),
    survey_Comments varchar(250),
    delivery_ID integer,
	FOREIGN KEY(customer_ID) REFERENCES customer(customer_ID),
    FOREIGN KEY(delivery_ID) REFERENCES delivery(delivery_ID)
);

INSERT INTO customer_surveys
VALUES 
    (3, 1, "2018-10-22", "number", NULL, 1), 
    (4, 1, "2020-04-20", "stars", NULL, 2), 
    (5, 1, "2021-01-23", "letter grade", "my email is eh@gmail.com", 3), 
    (6, 1, "2024-03-10", "number", "really really bad", 4), 
    (7, 2, "2020-02-09", "number", "good delivery", 5), 
    (8, 2, "2023-05-13", "number", "ok delivery", 6), 
    (9, 3, "2022-01-16", "number", "came broken in delivery", 7), 
    (10, 4, "2023-01-16", "stars", "great delivery", 8), 
    (11, 5, "2024-02-13", "stars", "smooth delivery", 1), 
    (12, 6, "2022-05-13", "stars", "amazing delivery",2), 
    (13, 7, "2022-05-13", "stars", "bad", 3), 
    (14, 7, "2023-10-23", "stars", "good", 4), 
    (15, 8, "2022-12-15", "letter grade", NULL, 5), 
    (16, 9, "2017-09-18", "letter grade", NULL, 6), 
    (17, 10, "2022-04-21", "letter grade", NULL, 7), 
    (18, 11, "2023-06-13", "letter grade", "my address is 931 Northfield Rd", 8), 
    (19, 11, "2023-11-13", "letter grade", "delivery was bad", 1), 
    (20, 12, "2023-01-13","letter grade", "delivery was good", 2);

select * 
from candidate_campaigns;

CREATE TABLE staff (
    staff_ID integer PRIMARY KEY,
    staff_First VARCHAR(40) NOT NULL,
    staff_Last VARCHAR(40) NOT NULL,
    staff_Street VARCHAR(200),
    staff_City VARCHAR(30),
    staff_State CHAR(2),
    staff_Zip CHAR(5),
    staff_Country CHAR(3)
);

insert into staff
values
    (1, "Nancy", "Drew", "Lay Rd", "Lawrence", "NJ", "11597","USA"),
    (2, "Barbara", "Blay", "Lay Rd", "Lawrence", "NJ", "11597","USA"),
    (3, "Mandy", "Saty", "Bill Rd", "Lawrence", "NJ", "11597","USA"),
    (4, "Kevin", "Bry", "Ray Rd", "Louisville", "NY", "11598","USA"),
    (5, "Adin", "Lad", "Ray Rd", "Louisville", "NY", "11598","USA"),
    (6, "Ilana", "Candy", "Get Rd", "Hewlett", "NY", "11596","USA"),
    (7, "Lester", "Bare", "Bye Rd", "New York City", "NY", "11987","USA"),
    (8, "Shaina", "Dave", "Sat Rd", "Lawrence", "NJ", "11597","USA"),
    (9, "Tova", "Kaplan", "Bat Rd", "Far Rockaway", "NY", "11523", "USA"),
    (10, "Andrew", "Dahan", "Hat Rd", "Far Rockaway", "NY", "11523","USA"),
    (11, "Chani", "Rab", "May Rd", "Lawrence", "NJ", "11597","USA"),
    (12, "Claudia", "Cho", "June Rd", "Lawrence", "NJ", "11597","USA"),
    (13, "Jacob", "Bou", "July Rd", "New York City", "NY", "11987","USA"),
    (14, "Joseph", "Schuh", "August Rd", "Lawrence", "NJ", "11597","USA"),
    (15, "Isaac", "Baker", "September Rd", "Lawrence", "NJ", "11597","USA"),
    (16, "Eli", "Hassid", "October Rd", "New York City", "NY", "11987","USA"),
    (17, "Eitan", "Eich", "November Rd", "Levittown", "NJ", "11587","USA"),
    (18, "Eden", "Feld", "December Rd", "Lawrence", "NJ", "11597","USA"),
    (19, "Dov", "Wein", "January Rd", "Lawrence", "NJ", "11597","USA"),
    (20, "Dean", "Abe", "February Rd", "Lawrence", "NJ", "11597","USA");

select *
from staff;

CREATE TABLE staff_department (
    staff_dept_ID integer auto_increment PRIMARY KEY,
    staff_ID integer,
    dept_Name varchar(50), 
    FOREIGN KEY(staff_ID) REFERENCES staff(staff_ID)
);

insert into staff_department(staff_ID, dept_Name)
values 
    (1, "Shoes department"),
    (1, "clothing department"),
    (1, "food department"),
    (2, "shoes department"),
    (3, "clothing department"),
    (4, "shoes department"),
    (5, "furniture department"),
    (5, "shoes department"),
    (5, "clothing deparment");

select *
from staff_departments;
    
CREATE TABLE staff_job (
    staff_job_ID integer auto_increment PRIMARY KEY,
    staff_ID integer,
    staff_job_title VARCHAR(30),
    staff_job_salary decimal(10,2), 
    -- date_of_job date,
    FOREIGN KEY(staff_ID) REFERENCES staff(staff_ID)
);

insert into staff_job(staff_ID,staff_job_title,staff_job_salary)
values
    (1, "head manager", 100.50),
    (1, "organizer", 200.50),
    (1, "cashier", 10),
    (2, "cashier", 10),
    (3, "cashier", 5),
    (4, "cashier", 5),
    (5, "manager", 10),
    (5, "organizer", 20),
    (5, "cashier", 20);

select *
from staff_jobs;

CREATE TABLE delivery (
    delivery_ID integer PRIMARY KEY,
    staff_ID integer,
    delivery_Date date,
    delivery_Street VARCHAR(200),
    delivery_City VARCHAR(30),
    delivery_State CHAR(2),
    delivery_Zip CHAR(5),
    delivery_Country CHAR(3),
    FOREIGN KEY (staff_ID) REFERENCES staff(staff_ID)
);

INSERT INTO delivery
VALUES
    (1, 1,"2024-04-25",  "Greentree Rd", "Louisville", "NY", "12345","USA"),
    (2, 1, "2024-05-13", "Pine Rd", "New York City", "NY", "11598","USA"),
    (3, 2, "2022-02-09", "Yellow Rd", "Hewlett", "OH", "11562","USA"),
    (4, 3, "2024-04-16","Red Rd", "Hewlett", "OH", "11562", "USA"),
    (5, 4, "2024-04-15","Blue Rd", "Louisville", "NY", "12345","USA"), 
    (6, 5, "2019-10-16", "Orange Rd", "Hempstead", "NY", "11500","USA"),
    (7, 6, "2023-04-21", "Pink Rd", "Cedar", "VA", "11678","USA"),
    (8, 7, "2023-10-13", "Green Rd", "Rockaway", "NY", "11523","USA"),
    (9, 7, "2023-12-13", "Green Rd", "Louisville", "NY", "12345","USA"),
    (10, 6, "2023-04-21", "Pink Rd", "Cedarhurst", "VA", "11678","USA"),
    (11, 6, "2023-10-13", "You Rd", "Far Rockaway", "NY", "11523","USA"),
    (12, 6, "2023-11-13", "Me Rd", "Louisville", "NY", "12345","USA"),
    (13, 1, "2023-12-13", "Them Rd", "Louisville", "NY", "11562","USA"),
    (14, 6, "2023-04-21", "Cake Rd", "Cedarhurst", "VA", "11678","USA"),
    (15, 7, "2023-10-13", "Pie Rd", "Far Rockaway", "NY", "11523","USA"),
    (16, 7, "2023-12-13", "Rude Rd", "Louisville", "NY", "11562","USA"),
    (17, 6, "2023-04-21", "Rye Rd", "Cedarhurst", "VA", "11678","USA"),
    (18, 6, "2023-10-13", "Filler Rd", "Far Rockaway", "NY", "11523","USA"),
    (19, 6, "2023-11-13", "Thing Rd", "Louisville", "NY", "12345","USA"),
    (20, 1, "2023-12-13", "Time Rd", "Louisville", "NY", "12345","USA");
    
select *
from delivery;


CREATE TABLE product (
    prod_ID integer PRIMARY KEY,
    prod_Name VARCHAR(25),
    prod_Type VARCHAR(20),
    prod_calories integer, 
    prod_sodium integer,
    prod_quantity integer,
    prod_exp_date date,
    prod_status varchar(20),
    restock_date date
);

insert into product
values
    (1, "Tesla", "car", 100, 50, 20, "2025-06-12", "available", NULL),
    (2, "chex", "cereal",50, 10, 10, "2025-06-12", "available", NULL),
    (3, "oranges", "produce",50, 10, 10, "2025-06-12", "available", NULL),
    (4, "apples", "produce",50, 10, 10, "2025-06-12", "available", NULL),
    (5, "carrots", "produce",50, 10, 10, "2025-06-12", "available", NULL),
    (6, "celery", "produce",50, 10, 10, "2025-06-12", "available", NULL),
    (7,  "tomatoes", "produce",50, 10, 10, "2025-06-12", "not available", "2025-06-17"),
    (8,  "peppers", "produce",50, 10, 10, "2025-06-12", "not available", "2025-06-17"),
    (9,  "salmon", "fish",50, 10, 10, "2025-06-12", "available", NULL),
    (10, "talapia", "fish",50, 10, 0, "2025-06-12", "not available", "2025-06-17"),
    (11, "tuna", "fish", 50, 10, 0, "2025-06-12", "not available","2025-06-17"),
    (12, "lettuce", "produce",50, 10, 10, "2025-06-12", "available", NULL),
    (13, "ribs", "meat",50, 10, 10, "2023-06-12", "available", NULL),
    (14, "lamb", "meat",50, 10, 10, "2023-06-12", "available", NULL),
    (15, "steak", "meat",50, 10, 10, "2023-06-12", "available", NULL),
    (16, "veal", "meat",50, 10, 10, "2023-06-12", "available", NULL),
    (17, "chocolate", "dairy",50, 10, 10, "2023-06-12", "available", NULL),
    (18, "whole milk", "dairy",50, 10, 10, "2023-06-12", "available", NULL),
    (19, "milk", "dairy",50, 10, 10, "2023-06-12", "available", NULL),
    (20, "cheese", "dairy",50, 10, 10, "2023-06-12", "available", NULL);
    
select * 
from product;

CREATE TABLE product_warehouses (
    warehouse_ID integer PRIMARY KEY,
    warehouse_Type VARCHAR(40),
    warehouse_status VARCHAR(10),
    warehouse_Street VARCHAR(200),
    warehouse_City VARCHAR(30),
    warehouse_State CHAR(2),
    warehouse_Zip CHAR(5),
    warehouse_Country CHAR(3),
    prod_ID integer,
    FOREIGN KEY(prod_ID) references product(prod_ID)
);

insert into product_warehouses
values
    (1, "refrigerated", "open", "Lay Rd", "Lawrence", "NJ", "11597","USA", 1),
    (2, "refrigerated", "closed", "barn Rd", "Louisville", "NJ", "12345",1),
    (3, "refrigerated", "closed", "Bill Rd", "Lawrence", "NJ", "11597","USA",2),
    (4, "not refrigerated", "open", "layer Rd", "Louisville", "NY", "12345","USA" ,2),
    (5, "kitchen used", "open", "Ray Rd", "Louisville", "NY", "12345","USA", 3),
    (6, "kitchen used", "open", "Get Rd", "Hewlett", "NY", "11596","USA",3),
    (7, "kitchen used", "open", "Bye Rd", "New York City", "NY", "11987","USA",4),
    (8, "kitchen used", "open", "Sat Rd", "Lawrence", "NJ", "11597","USA",5),
    (9, "refrigerated", "open", "Bat Rd", "Far Rockaway", "NY", "11523", "USA", 6),
    (10, "refrigerated", "open", "Hat Rd", "Far Rockaway", "NY", "11523","USA",7),
    (11, "refrigerated", "open", "May Rd", "Lawrence", "NJ", "11597","USA",8),
    (12, "refrigerated", "open", "June Rd", "Lawrence", "NJ", "11597","USA",9),
    (13, "refrigerated", "open", "July Rd", "New York City", "NY", "11987","USA", 10),
    (14, "refrigerated", "open", "August Rd", "Lawrence", "NJ", "11597","USA",11),
    (15, "refrigerated", "open", "September Rd", "Lawrence", "NJ", "11597","USA", 12),
    (16, "refrigerated", "open", "October Rd", "New York City", "NY", "11987","USA", 13),
    (17, "refrigerated", "closed", "November Rd", "Levittown", "NJ", "11587","USA",14),
    (18, "refrigerated", "open", "December Rd", "Lawrence", "NJ", "11597","USA",15),
    (19, "refrigerated", "open", "January Rd", "Lawrence", "NJ", "11597","USA",16),
    (20, "kitchen used", "open", "February Rd", "Lawrence", "NJ", "11597","USA", 17),
    (21, "kitchen used", "open", "February Rd", "Lawrence", "NJ", "11597","USA", 18),
    (22, "kitchen used", "open", "February Rd", "Lawrence", "NJ", "11597","USA", 19),
    (23, "kitchen used", "open", "February Rd", "Lawrence", "NJ", "11597","USA", 20);
    
select * 
from product_warehouses;


CREATE TABLE purchase (
    purchase_ID integer PRIMARY KEY,
    staff_ID integer,
    purchase_price decimal(10,2),
    purchase_date date,
    customer_ID integer,
    delivery_ID integer,
    prod_ID integer,
    payment_method varchar(15),
    FOREIGN KEY(staff_ID) REFERENCES staff(staff_ID),
    FOREIGN KEY(customer_ID) REFERENCES customer(customer_ID),
    FOREIGN KEY(delivery_ID) REFERENCES delivery(delivery_ID),
    FOREIGN KEY(prod_ID) REFERENCES product(prod_ID)
);
INSERT INTO purchase
VALUES
    (1, 1, 230.45, '2023-12-14', 1, 1, 1, "credit card"),
    (2, 1, 100.20, '2023-04-14', 1, 2, 2, "credit card"),
    (3, 1, 2500, '2023-05-14', 2, 3, 1, "credit card"),
    (4, 2, 10, '2023-12-14', 2, 4, 2, "credit card"),
    (5, 2, 200, '2022-06-14', 3, 5, 1, "credit card"),
    (6, 3, 100, '2024-07-14', 3, 6, 3, "cash"),
    (7, 3, 100, '2024-08-14', 4, 7, 4, "cash"),
    (8, 4, 100, '2024-03-14', 4, 8, 5, "cash"),
    (9, 4, 20, '2024-03-15', 5, 9, 6, "cash"),
    (10, 5, 20, '2023-03-14', 6, 10, 7, "cash"),
    (11, 5, 20, '2024-01-14', 7, 11, 8, "cash"),
    (12, 6, 10, '2023-02-14', 8, 12, 9, "cash"),
    (13, 6, 10, '2024-10-14', 9, 13, 10, "cash"),
    (14, 7, 10, '2024-11-14', 9, 14, 11, "cash"),
    (15, 7, 10, '2023-12-14', 10, 15, 12, "cash"),
    (16, 8, 100.20, '2020-10-14', 10, 16, 13, "credit card"),
    (17, 8, 100.50, '2021-11-14', 10, 17, 14, "credit card"),
    (18, 9, 100.50, '2020-12-14', 11, 18, 15, "credit card"),
    (19, 9, 300, '2017-08-14', 12, 19, 16,"credit card"),
    (20, 10, 500, '2016-03-14', 12, 20, 17, "credit card");

update purchase
set purchase_date="2024-03-14"
where purchase_ID=4;

select * 
from purchase;

/* 1. Identify customers who have not completed a purchase/delivery survey in the last year. 
Display the customer name and email. Use a nested select to answer this question */
select c.customer_first, c.customer_last, c.customer_email 
from customer c
where customer_ID not in (select customer_id from customer_surveys where survey_date>="2023-12-22"); 

/* 2. Identify the most popular product purchased in the last 2 years. Display four columns: 
warehouse, product name, product type and number of orders. Display one distinct row for each 
warehouse, product and product type. Display the product with the most orders first. */
select pw.warehouse_ID, pr.prod_name, pr.prod_type, count(1) "Number of orders"
from product_warehouses pw, product pr, purchase pu
where pr.prod_ID=pu.prod_ID AND pw.prod_ID=pr.prod_ID AND purchase_date>="2022-04-22"
group by pw.warehouse_ID, pr.prod_name, pr.prod_type
order by 4 desc;

/* 3. Identify customers with the most purchases of produce in the last 2 years by customer 
location. Display five rows in your output – one row for each borough. Display three columns: 
borough, number of orders, total dollar amount of order. The borough with the most orders is 
displayed first. You may need multiple SQL to answer this question */
select c.customer_Borough, count(1) " number of orders", sum(pu.purchase_price) "$ amount of order"
from customer c, product pr, purchase pu 
where pu.purchase_date>="2022-04-22" AND pr.prod_type="produce" AND c.customer_ID=pu.customer_ID AND pr.prod_ID=pu.prod_ID
group by c.customer_Borough
order by count(2) desc;

-- 4. Identify customers with no comments in the product survey. Display the customer name
select c.customer_first, c.customer_last
from customer c, customer_surveys cs
where c.customer_ID=cs.customer_ID AND cs.survey_comments is NULL;

/* 5. Search the open-ended narrative text/comments in the product and delivery comments to identify personally identifiable information (PII). This includes any data that could potentially be
used to identify a person. For instance, examples of PII include email address, date of birth, Social Security number, bank account number, home address, and full name. 
Display the customer who created the comment, date of comment and the comment. Order the output by customer name */
select c.customer_first, c.customer_last, cs.survey_date, cs.survey_comments
from customer c, customer_surveys cs
where c.customer_ID=cs.customer_ID AND (cs.survey_comments like '%@gmail.com%' or cs.survey_comments like '%@yahoo.com%' or  cs.survey_comments like '%@aol.com%' or  cs.survey_comments like '%@outlook%' or  cs.survey_comments like '%rd%' or  cs.survey_comments like '%dr%' or  cs.survey_comments like '%ct%' or  cs.survey_comments like '%@st%' or  cs.survey_comments like '%ave%' or  cs.survey_comments like '%blvd%'  or  cs.survey_comments like '%sq%');

/* 6.Customers can view, but not change past orders. Create SQL to implement. Demonstrate your implementation will not edit past orders by attempting to change data.*/
create user 'customer'@'localhost' identified by 'password';
grant select on grocery.purchase to 'customer'@'localhost';


/*7. Using purchases made in the last 5 years, identify customers with Teslas. Display the 
customer name and email. Order the output by customer name. Replace children with other 
demographic characteristics. For instance, dog owners, seniors, vegetarians, Tesla car owners, etc.*/
select c.customer_first, c.customer_last, c.customer_email
from customer c, purchase pu, product pr
where c.customer_id=pu.customer_id AND pu.prod_ID=pr.prod_ID AND pr.prod_name="tesla" AND pu.purchase_date>="2019-05-22"
order by c.customer_first, c.customer_last;

/* 8.. Identify staff with the most deliveries in the last year. Display two columns: staff and 
number of deliveries. Display one row for each distinct staff. Display the staff with the most 
deliveries first.*/
select s.staff_first, s.staff_last, count(1) "Number of deliveries"
from staff s, delivery d
where delivery_date>="2023-05-22" AND s.staff_ID=d.staff_ID
group by s.staff_first, s.staff_last
order by 3 desc;

/* 9. Staff are restricted from accessing customer credit card number and expiration dates. 
Create SQL to implement. Demonstrate your implementation will prevent staff from viewing 
customer credit card data */
create user 'staff'@'localhost' identified by 'password2';

create view staffView
as select customer_ID, customer_First, customer_Last, customer_Street, customer_City, customer_State, customer_Zip, customer_Country, gender, customer_Borough, customer_Account, customer_Password, customer_Phone, customer_email-- cust_credit_card, credit_exp_date
from customer;

grant select on grocery.staffView to 'staff'@'localhost';

/*10. Staff can’t delete purchases after they are entered in the database. Create SQL to 
implement. Demonstrate your implementation will prevent staff from deleting purchases. */ 
grant select, update, alter, insert, delete on grocery.purchase to 'staff'@'localhost';
revoke delete on grocery.purchase from 'staff'@'localhost';

/* 11.The product Chex is no longer being offered by the grocery store and being available for 3 
years. Identify the SQL to implement. */
update product
set prod_quantity=0
where prod_name="Chex" AND prod_ID=2;

update product
set prod_status="not available"
where prod_name="Chex" AND prod_ID=2;

update product 
set restock_date="2027-05-22"
where prod_name="Chex" AND prod_ID=2;

select *
from product;

-- 12. Display the structure for all tables
describe customer;
describe customer_ratings; 
describe customer_surveys;
describe staff;
describe staff_department;
describe staff_job;
describe delivery;
describe product;
describe product_warehouses;
describe purchase;

-- 13. Display the version of mySQL
select version ();

