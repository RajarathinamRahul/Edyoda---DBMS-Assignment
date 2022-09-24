DROP DATABASE IF EXISTS sales;
CREATE DATABASE sales;
USE sales;
CREATE TABLE salespeople(
Snum INT PRIMARY KEY,
Sname VARCHAR(25) UNIQUE,
City VARCHAR(25),
Comm INT
);

INSERT INTO salespeople(Snum,Sname,City,Comm) VALUES (1001, "Peel", "London", 12);

INSERT INTO salespeople(Snum,Sname,City,Comm) VALUES (1002, "Serres", "Sanjose", 13);

INSERT INTO salespeople(Snum,Sname,City,Comm) VALUES (1004, "Motika", "London", 11);

INSERT INTO salespeople(Snum,Sname,City,Comm) VALUES (1007, "Rifkin", "Barcelona", 15);

INSERT INTO salespeople(Snum,Sname,City,Comm) VALUES (1003, "Axelrod", "Newyork", 10);

SELECT * FROM salespeople;

CREATE TABLE customers(
Cnum INT PRIMARY KEY,
Cname VARCHAR(25),
City VARCHAR(25) NOT NULL,
Snum INT,
FOREIGN KEY (Snum) REFERENCES salespeople (Snum)
);

INSERT INTO CUSTOMERS(Cnum,Cname,City,Snum) VALUES(2001, "Hoffman", "London", 1001);

INSERT INTO CUSTOMERS(Cnum,Cname,City,Snum) VALUES(2002,  "Giovanni", "Rome", 1003);

INSERT INTO CUSTOMERS(Cnum,Cname,City,Snum) VALUES(2003,  "Liu", "Sanjose", 1002);

INSERT INTO CUSTOMERS(Cnum,Cname,City,Snum) VALUES(2004,  "Grass", "Berlin", 1002);

INSERT INTO CUSTOMERS(Cnum,Cname,City,Snum) VALUES(2006, "Clemens", "London", 1001);

INSERT INTO CUSTOMERS(Cnum,Cname,City,Snum) VALUES(2008, "Cisneros", "Sanjose", 1007);

INSERT INTO CUSTOMERS(Cnum,Cname,City,Snum) VALUES(2007, "Pereira", "Rome", 1004);

SELECT * FROM customers;

CREATE TABLE orders(
Onum INT PRIMARY KEY,
Amt float,
Odate date,
Cnum INT,
FOREIGN KEY (Cnum) REFERENCES customers (Cnum),
Snum INT,
FOREIGN KEY (Snum) REFERENCES salespeople (Snum)
);

INSERT INTO orders(Onum,Amt,Odate,Cnum,Snum) VALUES (3001, 18.69, '1990-10-03', 2008, 1007);
INSERT INTO orders(Onum,Amt,Odate,Cnum,Snum) VALUES (3003, 767.19, '1990-10-03', 2001, 1001);
INSERT INTO orders(Onum,Amt,Odate,Cnum,Snum) VALUES (3002, 1900.10, '1990-10-03', 2007, 1004);
INSERT INTO orders(Onum,Amt,Odate,Cnum,Snum) VALUES (3005,  5160.45, '1990-10-03', 2003, 1002);
INSERT INTO orders(Onum,Amt,Odate,Cnum,Snum) VALUES (3006,  1098.16, '1990-10-03', 2008, 1007);
INSERT INTO orders(Onum,Amt,Odate,Cnum,Snum) VALUES (3009, 1713.23, '1990-10-04', 2002, 1003);
INSERT INTO orders(Onum,Amt,Odate,Cnum,Snum) VALUES (3007,  75.75, '1990-10-04', 2004, 1002);
INSERT INTO orders(Onum,Amt,Odate,Cnum,Snum) VALUES (3008,  4273.00, '1990-10-05', 2006, 1001);
INSERT INTO orders(Onum,Amt,Odate,Cnum,Snum) VALUES (3010,  1309.95, '1990-10-06', 2004, 1002);
INSERT INTO orders(Onum,Amt,Odate,Cnum,Snum) VALUES (3011,  9891.88, '1990-10-06', 2006, 1001);

SELECT * FROM orders;

# 1. Count the number of Salesperson whose name begin with ‘a’/’A’.

SELECT COUNT(Sname) AS number_of_employee_name_starts_with_A FROM salespeople
WHERE Sname LIKE 'A%';

/* 2. Display all the Salesperson whose all orders worth is more than Rs. 2000. */

-- SELECT Sname,amt 
-- FROM salespeople,orders
-- WHERE amt>2000
-- GROUP BY Sname;
SELECT orders.snum,orders.amt, salespeople.sname 
FROM orders 
INNER JOIN salespeople 
ON orders.snum=salespeople.snum 
WHERE orders.amt>2000;

/* 3. Count the number of Salesperson belonging to Newyork. */
SELECT Count(*) FROM salespeople
WHERE salespeople.City = "Newyork"; 

/* 4. Display the number of Salespeople belonging to London and belonging to Paris   */

SELECT Sname, City 
FROM salespeople
WHERE City = "London" OR "Paris";


/* 5. Display the number of orders taken by each Salesperson and their date of orders. */

SELECT  Sname,Odate,COUNT(*) 
FROM salespeople,orders
WHERE salespeople.Snum = orders.Snum 
GROUP BY Sname,Odate;