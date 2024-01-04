/*
Student name: Raisa Rahman            
Student username: addd937    
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

create table addd937Customer
(
unique_shopper_ID integer (15) primary key,
first_name varchar(15),
last_name varchar(15),
age integer (2),
gender char(1),
date_of_visit integer (6)
);

create table addd937Store
(
store_ID varchar (3) primary key,
name varchar (15),
category_of_item_sold varchar (15)
);

create table addd937Transaction
(
transaction_ID integer (15) primary key,
number_of_items_bought integer(15),
amount_spent decimal(6,2),
method_of_payment varchar(15),
time_of_day integer (4),
customer_unique_shopper_ID integer (15),
store_bought varchar (3),
foreign key (customer_unique_shopper_ID) references addd937Customer (unique_shopper_ID),
foreign key (store_bought) references addd937Store (store_ID)
);

create table addd937Item 
(
barcode integer (15) primary key,
name_of_item varchar (20), 
price_of_item decimal(10,2) ,
store_ID varchar(3),
transaction_ID integer (15),
foreign key (store_ID) references addd937Store (store_ID),
foreign key (transaction_ID) references addd937Transaction (transaction_ID)
);

create table addd937Feedback_Form
(
feedback_form_ID integer (15) primary key,
customer_unique_shopper_ID integer (15),
store_visited char (15),
satisfaction_rate integer (15),
foreign key (store_visited) references addd937Store(store_ID),
foreign key (customer_unique_shopper_ID) references addd937Customer (unique_shopper_ID)
);

/* SECTION 2 - INSERT STATEMENTS */

insert into addd937Customer values
(001, "Raisa", "Rose", 19, 'F', 221210),
(002, "Harry", "Styles", 28, NULL, 221211),
(003, "Jeffery", "Dahmer", 34, 'M', 221212),
(004, "Marie", "Curie", 66, 'F', 221213),
(005, "Lionel", "Messi", 35, NULL, 221214),
(006, "Jennifer", "Lawrence", 32, 'F' , 221215),
(007, "Jenna", "Ortega", 20, NULL, 221210),
(008, "Joshua", "Bassett", 21, NULL , 221211),
(009, "Bob", "Ross", 52, 'M' , 221212),
(010, "Cristiano", "Ronaldo", 38, NULL, 221213);

insert into addd937Store values 
("PRI", "Primark", "Clothing"),
("IKE", "Ikea", "Furniture"),
("LID", "Lidl", "Grocery"),
("GAI", "Gail's", "Bakery"),
("ZAR", "Zara", "Clothing"),
("HEA", "Heal's", "Furniture"),
("ALD", "Aldi", "Grocery"),
("GRE", "Gregg's", "Bakery"),
("ASO", "Asos", "Clothing");

insert into addd937Feedback_Form VALUES
(001, 001, "PRI", 6),
(002, 002, "IKE", 5),
(003, 003, "LID", 3),
(004, 004, "GAI", 2),
(005, 005, "ZAR", 10),
(006, 006, "HEA", 2),
(007, 007, "ALD", 3),
(008, 008, "GRE", 5),
(009, 009, "ASO", 4),
(010, 010, "PRI", 1),
(011, 001, "IKE", 2),
(012, 002, "LID", 7),
(013, 003, "GAI", 8),
(014, 004, "ZAR", 2),
(015, 005, "HEA", 9);

insert into addd937Transaction values 
(001, 1, 2.66, "card", 1530, 001, "PRI"),
(002, 1, 50.50, "cash", 1340, 002, "IKE"),
(003, 1, 100.40, "card", 1450, 003, "LID"),
(004, 2, 300.50, "voucher", 2021, 004, "GAI"),
(005, 1, 5.00, "cash", 1132, 005, "ZAR"),
(006, 1, 1.00, "card", 1512, 006, "HEA"),
(007, 4, 1000.00, "card", 1630, 007, "ALD"),
(008, 1, 29.99, "cash", 1330, 008, "GRE"),
(009, 1, 15.60, "cash", 1230, 009, "ASO"),
(010, 2, 400.50, "card", 1340, 010, "PRI"),
(011, 1, 50.00, "voucher", 1730, 001, "IKE"),
(012, 1, 20.66, "card", 1520, 002, "LID"),
(013, 1, 20.54, "cash", 2020, 003, "GAI"),
(014, 1, 34.22, "card", 1220, 004, "ZAR"),
(015, 1, 50.00, "voucher", 1620, 005, "HEA");


insert into addd937Item VALUES
(001, "Brush", 298.84, "PRI", 007),
(002, "Sofa", 499.50, "IKE", 007),
(003, "Baked Beans", 100, "LID", 007),
(004, "Pan au Chocolat", 198.84, "GAI", 007),
(005, "Shirt", 200.49, "ZAR", 004),
(006, "Cushion", 100.01, "HEA", 004),
(007, "Hummus", 200.25, "ALD", 010),
(008, "Vegan Sausage Roll", 200.25, "GRE", 010),
(009, "Dress", 2.66, "ASO", 001),
(010, "Bag", 50.50, "PRI", 002),
(011, "Chair", 100.40, "IKE", 003),
(012, "Bread", 5.00, "LID", 005),
(013, "Croissant", 1.00, "GAI", 006),
(014, "Trousers", 29.99, "ZAR", 008),
(015, "Pillow", 15.60, "HEA", 009),
(016, "Yoghurt", 50.00, "ALD", 011),
(017, "Cheese Bake", 20.66, "GRE", 012),
(018, "Top", 20.54, "ASO", 013),
(019, "Jeans", 34.22, "PRI", 014),
(020, "Bed", 50.00, "IKE", 015);
                     
/* SECTION 3 - UPDATE STATEMENTS */
/*1*/
UPDATE addd937Customer SET last_name = 'Rahman'
WHERE unique_shopper_ID = 001;

/*2*/
UPDATE addd937Store
SET category_of_item_sold = "Home Decor"
WHERE store_ID = "HEA";

/* SECTION 4 - SINGLE TABLE SELECT STATEMENTS */

/* 1) List the number of transactions made by card between 12pm and 4pm. */

SELECT COUNT(*) as "Total Transactions"
FROM addd937Transaction
WHERE time_of_day BETWEEN 1200 AND 1600
AND method_of_payment = "card";

/* 2) List the details of all customers who visited between the 10th of December 2022 and 13th of December 2022, list the dates in chronological order. */

SELECT *
FROM addd937Customer 
WHERE date_of_visit >= 221210 
AND date_of_visit <= 221213
ORDER BY date_of_visit;



/* 3) List the names of all customers whose first names begin with 'J'.  */

SELECT * 
FROM addd937Customer
WHERE first_name LIKE 'J%';


/* 4) How many different shops were given feedback from the feedback form? . */

SELECT COUNT(DISTINCT store_visited)
FROM addd937Feedback_Form;


/* 5) List top 3 highest transactions */

SELECT amount_spent 
FROM addd937Transaction
WHERE amount_spent
ORDER BY amount_spent DESC LIMIT 3;


/* 6) What was the average amount spent in a single transaction? */

SELECT ROUND(AVG(amount_spent), 2) 
AS average_amount_spent
FROM addd937Transaction;


/* SECTION 5 MULTIPLE TABLE SELECT StATEMENTS */


/* 1) List the details of the feedback form filled out by Bob Ross. */ 

select *
from addd937Feedback_Form
where customer_unique_shopper_ID =
(select unique_shopper_ID
from addd937Customer
where first_name = "Bob"
AND last_name = "Ross");


/* 2) List the details of the feedback form for the customers who did not include their gender in the feedback form and visited the shopping centre from the 10th of December 2022 and 12th of December 2022. Order this in alphabetic order according to thier first name.*/


SELECT DISTINCT c.unique_shopper_ID, c.first_name, c.last_name, c.age, f.feedback_form_ID, f.satisfaction_rate 
FROM addd937Customer c 
INNER JOIN addd937Feedback_Form f 
ON c.unique_shopper_ID = f.customer_unique_shopper_ID 
WHERE c.date_of_visit 
BETWEEN 221210
AND 221212 
AND c.gender 
IS NULL
ORDER BY first_name;


/* 3) State the category of items which has sold the least and how many items they have sold. */

SELECT category_of_item_sold, 
COUNT(*) AS num_sold
FROM addd937Store s
JOIN addd937Transaction t ON s.store_ID = t.store_bought
GROUP BY category_of_item_sold
ORDER BY num_sold ASC
LIMIT 1;

/* 4) List the names, ages and items that customers between the ages of 20 and 40 have bought. List the names in alphabetical order according to thier first name */

SELECT c.first_name, c.last_name, c.age, i.name_of_item
FROM addd937Item i
JOIN addd937Transaction t ON i.transaction_ID = t.transaction_ID
JOIN addd937Customer c ON t.customer_unique_shopper_ID = c.unique_shopper_ID
WHERE c.age BETWEEN 20 AND 40
ORDER BY first_name;

/* 5) List the items bought from Gail's and who bought them*/
SELECT c.first_name, c.last_name, i.name_of_item
FROM addd937Item i
JOIN addd937Transaction t ON i.transaction_ID = t.transaction_ID
JOIN addd937Customer c ON t.customer_unique_shopper_ID = c.unique_shopper_ID
JOIN addd937Store s ON i.store_ID = s.store_ID
WHERE s.name = "Gail's";


/* 6) Display a receipt for Cristiano Ronaldo (list what he bought, how much each item was, where he bought the item, and list his total expenditure )*/

SELECT i.name_of_item, i.price_of_item, s.name, t.amount_spent
FROM addd937Transaction t
JOIN addd937Item i ON t.transaction_ID = i.transaction_ID
JOIN addd937Store s ON i.store_ID = s.store_ID
JOIN addd937Customer c ON t.customer_unique_shopper_ID = c.unique_shopper_ID
WHERE c.first_name = 'Cristiano' AND c.last_name = 'Ronaldo'
GROUP BY i.name_of_item, i.price_of_item, s.name




/* SECTION 6 - DELETE ROWS (make sure the SQL is commented out in this section)

DELETE FROM addd937Item
WHERE store_ID 
IN (
    SELECT store_visited 
    FROM addd937Feedback_Form 
    WHERE satisfaction_rate < 3);
    
DELETE FROM addd937Transaction
WHERE transaction_ID IN (SELECT transaction_ID
                        FROM addd937Item
                        WHERE price_of_item > 50 
                        AND store_ID IN (SELECT store_ID
                                        FROM addd937Store
                                        WHERE category_of_item_sold = 'Clothing'))
                        AND amount_spent > 100;
    
*/

/* SECTION 7 - DROP TABLES (make sure the SQL is commented out in this section)

DROP TABLE addd937Feedback_Form;
DROP TABLE addd937Item;
DROP TABLE addd937Transaction;
DROP TABLE addd937Store;
DROP TABLE addd937Customer;

*/