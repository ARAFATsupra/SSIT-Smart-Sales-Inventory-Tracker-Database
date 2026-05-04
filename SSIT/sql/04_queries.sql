-- ============================================================
-- SSIT: Smart Sales & Inventory Tracker
-- File 4: All SQL Queries
-- Team: Mega Evolution | Daffodil International University
-- ============================================================

USE smart_sales_inventory_tracker;

-- ============================================================
-- 1. SHOW ALL TABLES
-- ============================================================
SHOW TABLES;


-- ============================================================
-- 2. SELECT ALL DATA FROM EACH TABLE
-- ============================================================
SELECT * FROM product;
SELECT * FROM enterprise;
SELECT * FROM daily_transactions;


-- ============================================================
-- 3. RETRIEVE SPECIFIC COLUMNS
-- Find Transaction ID, Buying Amount, Sales Amount,
-- Profit Percentage, Working Day Date
-- ============================================================
SELECT Transaction_ID, Buying_Amount, Sales_Amount,
       Profit_Percentage, Working_Day_Date
FROM daily_transactions;


-- ============================================================
-- 4. ALTER TABLE: ADD & DROP COLUMN
-- ============================================================

-- Add Expire_Date column to product table
ALTER TABLE product
ADD Expire_Date DATE;

-- Drop Expire_Date column from product table
ALTER TABLE product
DROP COLUMN Expire_Date;


-- ============================================================
-- 5. MODIFY COLUMN DATA TYPE
-- ============================================================

-- Change Working_Day_Date from DATE to CHAR
ALTER TABLE daily_transactions
MODIFY COLUMN Working_Day_Date CHAR(20);

-- Change it back to DATE
ALTER TABLE daily_transactions
MODIFY COLUMN Working_Day_Date DATE;


-- ============================================================
-- 6. WHERE CLAUSE WITH AND, OR, NOT + JOIN
-- ============================================================

-- Q: Products where Flat Rate > 30 AND Delivery Order Amount = 0
SELECT P.Product_ID, P.Product_Name, D.Flat_Rate, D.Delivery_Order_Amount
FROM product P
JOIN daily_transactions D ON P.Product_ID = D.Product_ID
WHERE Flat_Rate > 30 AND Delivery_Order_Amount = 0;

-- Q: Products where Buying Rate > 1000 OR Damaged Amount = 0
SELECT P.Product_ID, P.Product_Name, P.Buying_Rate, D.Damaged_Amount
FROM product P
JOIN daily_transactions D ON P.Product_ID = D.Product_ID
WHERE Buying_Rate > 1000 OR Damaged_Amount = 0;

-- Q: Products where Profit Percentage is NOT equal to 6.00
SELECT P.Product_ID, P.Product_Name, D.Profit_Percentage
FROM product P
JOIN daily_transactions D ON P.Product_ID = D.Product_ID
WHERE NOT Profit_Percentage = 6.00;


-- ============================================================
-- 7. BETWEEN OPERATOR
-- ============================================================

-- Q: Products with Buying Rate between 1000 and 5000
SELECT Product_Name, Buying_Rate
FROM product
WHERE Buying_Rate BETWEEN 1000 AND 5000;


-- ============================================================
-- 8. AGGREGATE FUNCTIONS
-- ============================================================

-- MIN: Find minimum buying rate
SELECT MIN(Buying_Rate), Product_Name, Product_ID
FROM product;

-- MAX: Find maximum buying and sales amount
SELECT Transaction_ID, Enterprise_ID, Product_ID,
       MAX(Buying_Amount), MAX(Sales_Amount)
FROM daily_transactions;

-- COUNT with AS: Total number of products
SELECT COUNT(Product_Name) AS Total_Products
FROM product;

-- SUM with AS: Total buying and sales amount
SELECT SUM(Buying_Amount)  AS Total_Buying_Amount,
       SUM(Sales_Amount)   AS Total_Sales_Amount
FROM daily_transactions;


-- ============================================================
-- 9. GROUP BY CLAUSE
-- ============================================================

-- Q: Group products by Buying and Sales Amount with Product ID
SELECT Buying_Amount, Sales_Amount, Product_ID
FROM daily_transactions
GROUP BY Product_ID, Buying_Amount, Sales_Amount;


-- ============================================================
-- 10. ORDER BY CLAUSE
-- ============================================================

-- Ascending by Product ID
SELECT * FROM product
ORDER BY Product_ID ASC;

-- Descending by Buying Rate
SELECT * FROM product
ORDER BY Buying_Rate DESC;


-- ============================================================
-- 11. HAVING CLAUSE
-- ============================================================

-- Total products if count >= 7
SELECT COUNT(Product_Name) AS Total_Products
FROM product
HAVING COUNT(*) >= 7;

-- Total enterprises if count <= 10
SELECT COUNT(Enterprise_Name) AS Total_Enterprises
FROM enterprise
HAVING COUNT(*) <= 10;


-- ============================================================
-- 12. LIMIT CLAUSE
-- ============================================================

-- Q: Show only first 5 products
SELECT Product_ID, Product_Name, Buying_Rate
FROM product
LIMIT 5;


-- ============================================================
-- 13. LIKE OPERATOR WITH JOIN
-- ============================================================

-- a) Products starting with 'C'
SELECT P.Product_Name, D.Profit_Percentage
FROM product P
JOIN daily_transactions D ON P.Product_ID = D.Product_ID
WHERE Product_Name LIKE 'C%';

-- b) Enterprises where 2nd character is 'S'
SELECT E.Enterprise_Name, E.Company_Name,
       D.Product_ID, D.Buying_Amount, D.Sales_Amount
FROM enterprise E
JOIN daily_transactions D ON E.Enterprise_ID = D.Enterprise_ID
WHERE Enterprise_Name LIKE '_S%';

-- c) Enterprises starting with 'E' and ending with 'E'
SELECT E.Enterprise_ID, E.Enterprise_Name, D.Working_Day_Date
FROM enterprise E
JOIN daily_transactions D ON E.Enterprise_ID = D.Enterprise_ID
WHERE Enterprise_Name LIKE 'E%E';


-- ============================================================
-- 14. FULL OUTER JOIN WITH UNION
-- ============================================================

-- Q: Enterprise info with transaction, product and profit
SELECT E.Enterprise_ID, E.Enterprise_Name, E.Company_Name,
       D.Transaction_ID, D.Product_ID, D.Profit_Percentage
FROM enterprise AS E
LEFT JOIN daily_transactions AS D ON E.Enterprise_ID = D.Enterprise_ID
UNION
SELECT E.Enterprise_ID, E.Enterprise_Name, E.Company_Name,
       D.Transaction_ID, D.Product_ID, D.Profit_Percentage
FROM enterprise AS E
RIGHT JOIN daily_transactions AS D ON E.Enterprise_ID = D.Enterprise_ID;


-- ============================================================
-- 15. INNER JOIN
-- ============================================================

-- Q: Find DAL MIX 24p with its buying and sales amount
SELECT Product_Name, Buying_Amount, Sales_Amount
FROM daily_transactions D
INNER JOIN product P ON P.Product_ID = D.Product_ID
WHERE Product_Name = 'DAL MIX 24P';


-- ============================================================
-- 16. STORED PROCEDURES WITH SUBQUERY AND AVG
-- ============================================================

DELIMITER //

-- Products where Buying Amount > average Buying Amount
CREATE PROCEDURE Above_Average_Buying()
BEGIN
    SELECT Product_Name, Buying_Amount, Sales_Amount
    FROM product P
    JOIN daily_transactions D ON P.Product_ID = D.Product_ID
    WHERE Buying_Amount > (SELECT AVG(Buying_Amount) FROM daily_transactions);
END //

-- Products where Sales Amount < average Sales Amount
CREATE PROCEDURE Below_Average_Selling()
BEGIN
    SELECT Product_Name, Buying_Amount, Sales_Amount
    FROM product P
    JOIN daily_transactions D ON P.Product_ID = D.Product_ID
    WHERE Sales_Amount < (SELECT AVG(Sales_Amount) FROM daily_transactions);
END //

DELIMITER ;

-- Call the stored procedures
CALL Above_Average_Buying();
CALL Below_Average_Selling();


-- ============================================================
-- 17. SQL VIEWS
-- ============================================================

-- Q: View of products with Buying Rate > 1000
CREATE VIEW SSIT AS
SELECT * FROM product
WHERE Buying_Rate > 1000;

-- View the created view
SELECT * FROM ssit;


-- ============================================================
-- 18. ANY OPERATOR WITH SUBQUERY
-- ============================================================

-- Q: Products where Buying Rate > 2500
SELECT * FROM product
WHERE Buying_Rate = ANY (
    SELECT Buying_Rate FROM product WHERE Buying_Rate > 2500
);


-- ============================================================
-- 19. ALL OPERATOR WITH LIMIT AND SUBQUERY
-- ============================================================

-- Q: Products matching the first Buying Rate > 1500
SELECT ALL Product_Name, Buying_Rate
FROM product
WHERE Buying_Rate = (
    SELECT Buying_Rate FROM product WHERE Buying_Rate > 1500 LIMIT 1
);


-- ============================================================
-- 20. UPDATE
-- ============================================================

-- Q: Update Buying Rate of LACHCHA to 2000
UPDATE product
SET Buying_Rate = 2000
WHERE Product_Name = 'LACHCHA-165g';


-- ============================================================
-- 21. DELETE
-- ============================================================

-- Q: Delete all data from product table
-- ⚠️ WARNING: This removes all rows. Use carefully.
-- DELETE FROM product;


-- ============================================================
-- 22. TABLE MAINTENANCE
-- ============================================================

ANALYZE  TABLE enterprise;
ANALYZE  TABLE product;
ANALYZE  TABLE daily_transactions;

CHECK    TABLE product;
CHECK    TABLE enterprise;
CHECK    TABLE daily_transactions;

CHECKSUM TABLE product;
CHECKSUM TABLE enterprise;
CHECKSUM TABLE daily_transactions;

OPTIMIZE TABLE product;
OPTIMIZE TABLE enterprise;
OPTIMIZE TABLE daily_transactions;
