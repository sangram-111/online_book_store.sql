SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;

--BASIC QUERIES
--1 ALL BOOKS IN THE 'FRICTION' GENRE
SELECT * FROM books
WHERE genre='Fiction';

--2 BOOKS PUBLISHED AFTER THE YEAR 1971
SELECT book_id,title FROM books
WHERE published_year>1971;

--3 ALL CUSTOMERS FROM 'Israel'
SELECT * FROM customers
WHERE country= 'Israel';

--4 ORDERS PLACED IN NOVEMBER 2023
SELECT * FROM orders
WHERE order_date >= '2023-11-01' AND order_date < '2023-12-01';

--5 THE TOTAL STOCK OF BOOKS AVAILABLE
SELECT SUM(stock) AS total_stock_available 
FROM books;

--6 DETAILS OF THE MOST EXPENSIVE 5 BOOKS
SELECT * FROM books
ORDER BY price DESC LIMIT 5;

--ADDING REFERRENCES OF CUSTOMER_ID AND BOOK_ID TO THE ORDERS TABLE 
SELECT customer_id FROM orders
WHERE customer_id NOT IN (SELECT customer_id FROM customers);

SELECT book_id FROM orders
WHERE book_id NOT IN (SELECT book_id FROM books);

ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE orders
ADD CONSTRAINT fk_book
FOREIGN KEY (book_id)
REFERENCES books(book_id);

--7 CUSTOMERS WHO ORDERED MORE THAN 7 QUATITY OF A BOOK
SELECT * FROM orders
WHERE quantity>7;

--8 ORDERS WHERE THE TOTAL AMOUNT EXCEEDS $50
SELECT * FROM orders
WHERE total_amount>50;

--9 ALL THE GENRES AVAILABLE 
SELECT DISTINCT genre 
FROM books;

--10 BOOK WITH THE LOWEST STOCK
SELECT * FROM books ORDER BY stock ASC LIMIT 1;

--TOTAL REVENUE GENERATED 
SELECT SUM (total_amount) AS revenue
FROM orders;


SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;

--TOTAL BOOKS FOR EACH GENRE
SELECT  b.Genre,SUM(o.Quantity) AS total_books
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre;

--AVERAGE PRICE ON BOOKS IN 'ROMANCE' GENRE
SELECT AVG(price) AS average_price
FROM books
WHERE genre= 'Romance'

-- CUSTOMERS WHO PLACED ATLEAST 3 ORDERS
SELECT c.customer_name, o.customer_id, COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY o.customer_id,c.customer_name
HAVING COUNT (o.order_id) >=3 ORDER BY order_count DESC;

-- 10 MOST FREQUENTLY ORDERED BOOKS
SELECT b.title, COUNT(o.book_id) AS total_orders
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.title ORDER BY total_orders DESC LIMIT 10 ;

-- TOP 5 MOST EXPENSIVE 'NON-FICTION' BOOKS
SELECT title,price,genre
FROM books
WHERE genre='Non-Fiction'
ORDER BY price DESC LIMIT 5;

--TOTAL QUANTITY OF BOOKS SOLD BY EACH AUTHOR
SELECT b.author, SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN books b ON b.book_id = o.book_id
GROUP BY (o.book_id,b.author)
ORDER BY total_books_sold DESC;

--CITIES WHERE CUSTOMERS SPEND MORE THAN $50
SELECT DISTINCT c.city,SUM(o.total_amount) AS total_money_spent 
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city
HAVING SUM(o.total_amount)>50 ORDER BY total_money_spent DESC;

-- TOP 10 CUSTOMERS WHO SPENT MOST 
SELECT c.customer_name, SUM(o.total_amount) AS money_spent
FROM orders o 
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.customer_name ORDER BY money_spent DESC LIMIT 10;

-- REMAINING STOCK AFTER ORDERS
SELECT b.title, (b.stock - COALESCE(SUM(o.quantity), 0)) AS remaining_stock
FROM books b
LEFT JOIN orders o ON b.book_id = o.book_id
GROUP BY b.title, b.stock
ORDER BY remaining_stock DESC;




















