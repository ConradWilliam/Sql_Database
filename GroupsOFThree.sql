--@Block
CREATE DATABASE GroupsOFThree;

--@Block
CREATE TABLE salesman(
    salesman_id INT PRIMARY KEY,
    name VARCHAR(20),
    city VARCHAR(20),
    commission FLOAT

)

--@Block
CREATE TABLE customer(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(20),
    city VARCHAR(20),
    grade INT,
    salesman_id INT
)

--@Block
CREATE TABLE `order` (
    order_no INT PRIMARY KEY,
    purch_amt FLOAT,
    order_date DATE,
    customer_id INT,
    salesman_id INT
);

--@Block
-- Add foreign key constraint to the customer table
ALTER TABLE customer
ADD CONSTRAINT fk_salesman
FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id);

-- Add foreign key constraint to the order table
ALTER TABLE `order`
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
ADD CONSTRAINT fk_salesman
FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id);

--@Block
INSERT INTO salesman(salesman_id, name, city, commission) VALUES (5001, James Hoog, New York, 0.15)
INSERT INTO salesman(salesman_id, name, city, commission) VALUES (5002, Nail Knite, Paris, 0.13)
INSERT INTO salesman(salesman_id, name, city, commission) VALUES (5005, Pit Alex, London, 0.11)
INSERT INTO salesman(salesman_id, name, city, commission) VALUES (5006, Mc Lyon, Paris, 0.14)
INSERT INTO salesman(salesman_id, name,commission) VALUES (5003, Lauson Hen, 0.12)
INSERT INTO salesman(salesman_id, name, city, commission) VALUES (5007, Paul Adam, Rome, 0.13)

--@Block
INSERT INTO customer(customer_id, customer_name, city, grade, salesman_id) VALUES (3002, Nick Rimando, New York, 100, 5001)
INSERT INTO customer(customer_id, customer_name, city, grade, salesman_id) VALUES (3005, Graham Zusi, California, 200, 5002)
INSERT INTO customer(customer_id, customer_name, city) VALUES (3001, Brad Guran, London )
INSERT INTO customer(customer_id, customer_name, city, grade, salesman_id) VALUES (3004, Fabian Johns, Paris, 300, 5006)
INSERT INTO customer(customer_id, customer_name, city, grade, salesman_id) VALUES (3007, Brad Davis, New York, 200, 5001)
INSERT INTO customer(customer_id, customer_name, city, grade) VALUES (3009, Geoff Camero, Berlin, 100)
INSERT INTO customer(customer_id, customer_name, city, grade, salesman_id) VALUES (3008, Juliam Green, London, 300, 5002)
INSERT INTO customer(customer_id, customer_name, city, grade, salesman_id) VALUES (3003, Jory Altidor, Moscow, 200, 5007)

--@Block
INSERT INTO `order`(order_no,purch_amt,order_date,customer_id,salesman_id) VALUES (70001,150.5,'2016-10-05',3005,5002)
INSERT INTO `order`(order_no,purch_amt,order_date,customer_id) VALUES (70009,270.65,'2016-09-10',3001)
INSERT INTO `order`(order_no,purch_amt,order_date,customer_id,salesman_id) VALUES(70002,65.26,'2016-10-05',3002,5001)
INSERT INTO `order`(order_no,purch_amt,order_date,customer_id) VALUES (70004,110.5,'2016-08-17',3009)
INSERT INTO `order`(order_no,purch_amt,order_date,customer_id,salesman_id) VALUES (70007,948.5,'2016-09-10',3005,5002)
INSERT INTO `order`(order_no,purch_amt,order_date,customer_id,salesman_id) VALUES (70005,2400.6,'2016-07-27',3007,5001)
INSERT INTO `order`(order_no,purch_amt,order_date,customer_id,salesman_id) VALUES (70008,5760,'2016-09-10',3002,5001)
INSERT INTO `order`(order_no,purch_amt,order_date,customer_id,salesman_id) VALUES (70010,1983.43,'2016-10-10',3004,5006)
INSERT INTO `order`(order_no,purch_amt,order_date,customer_id) VALUES(70003,2480.4,'2016-10-10',3009)
INSERT INTO `order`(order_no,purch_amt,order_date,customer_id,salesman_id) VALUES (70012,250.45,'2016-06-27',3008,5002),
INSERT INTO `order`(order_no,purch_amt,order_date,customer_id,salesman_id) VALUES (70011,75.29,'2016-08-17',3003,5007)
;





--@Block--Query 1
SELECT name, commission
FROM salesman;

--@Block--Query 2--retrieve salesman_id of all salesmen from orders table without any repeats
SELECT DISTINCT salesman_id
FROM orders;

--@Block--Query 3--Display names and city of salesmen who belong to the city Paris
SELECT name, city
FROM salesman
WHERE city = 'Paris';



--@Block--Query4--Display all the information for those customers with a grade of 200
SELECT *
FROM customer
WHERE grade = 200;

--@BLOCK--Query 5--Display the order number, order date and the purchase amount for order(s)  which will be delivered by the salesman with ID 5001
SELECT order_no, order_date, purch_amt
FROM `order`
WHERE salesman_id = 5001;

--@Block--Query6--Display all the customers who are either belongs to the city of New York or not had a grade above 100
SELECT *
FROM customer
WHERE city = 'New York' OR grade <= 100;

--@Block--Query7--Find those salesmen with all information who gets the commission within a range of 0.12 and 0.14
SELECT *
FROM salesman
WHERE commission BETWEEN 0.12 AND 0.14;
