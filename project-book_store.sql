CREATE TABLE book_store(
Book_ID	INTEGER	PRIMARY KEY,
Title	VARCHAR(100),	
Author	VARCHAR(100),	
Genre	VARCHAR(100),	
Published_Year	INTEGER,	
Price	NUMERIC(10,2),	
Stock	NUMERIC(10,2)	
);

SELECT * FROM book_store;

ALTER TABLE book_store
RENAME TO books;

SELECT * FROM books;

CREATE TABLE customers(
Customer_ID	INTEGER	PRIMARY KEY,
Customer_name VARCHAR(100),	
Email	VARCHAR(100),	
Phone	VARCHAR(15),	
City	VARCHAR(100),	
Country	VARCHAR(100)	
);

SELECT * FROM customers;

CREATE TABLE orders(
Order_ID	INTEGER	PRIMARY KEY,
Customer_ID	INTEGER,	
Book_ID	INTEGER,	
Order_Date	DATE,	
Quantity	NUMERIC(10,2),	
Total_Amount	NUMERIC(10,2)	
);

SELECT * FROM orders;