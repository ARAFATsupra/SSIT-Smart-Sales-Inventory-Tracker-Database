# 🛒 Smart Sales & Inventory Tracker (SSIT)

A **Database Management System (DBMS)** project built with **MySQL** and **phpMyAdmin (XAMPP)** for managing product sales, inventory and daily transactions of a product distribution company.

> Submitted to: **Daffodil International University**  
> Course: Database Management System (ITM 222)  
> Team: **Team Mega Evolution**  
> Semester: Spring 2025

---

## Project Overview

This project tracks the daily sales and inventory of **Pran** product distribution. The system replaces manual Excel sheets with a structured database that can:

- Track products in the warehouse
- Record shop orders and deliveries
- Track damaged goods and returns
- Calculate daily sales, buying amounts and profits
- Support multiple enterprises and companies

---

## Database Structure

The database `smart_sales_inventory_tracker` has **3 tables**:

### 1. `product`
| Column | Type | Description |
|--------|------|-------------|
| Product_ID | INT (PK) | Unique product identifier |
| Product_Name | VARCHAR(50) | Name of the product |
| Buying_Rate | FLOAT | Purchase price of the product |

### 2. `enterprise`
| Column | Type | Description |
|--------|------|-------------|
| Enterprise_ID | INT (PK) | Unique enterprise identifier |
| Enterprise_Name | VARCHAR(50) | Name of the enterprise |
| Company_Name | VARCHAR(50) | Associated company name |

### 3. `daily_transactions`
| Column | Type | Description |
|--------|------|-------------|
| Transaction_ID | INT (PK) | Unique transaction identifier |
| Enterprise_ID | INT (FK) | Links to enterprise table |
| Product_ID | INT (FK) | Links to product table |
| CORD_No | FLOAT | Cumulative order number |
| Trade_Discount_Progress | CHAR(20) | Trade discount details |
| Cumulative_Ordered_Total_Quantity | INT | Total ordered quantity |
| Buying_Amount | FLOAT | Total buying amount |
| Sales_Amount | FLOAT | Total sales amount |
| Delivered_Quantity | INT | Number of products delivered |
| Delivery_Order_Amount | FLOAT | Value of delivered products |
| Bought_and_Delivered_Quantity | INT | Quantity bought and delivered |
| Damaged_Quantity | INT | Number of damaged items |
| Damaged_Amount | INT | Cost of damaged items |
| Flat_Rate | FLOAT | Applied flat rate |
| Profit_Percentage | FLOAT | Profit percentage |
| Remarks | FLOAT | Additional notes |
| Working_Day_Date | DATE | Date of the transaction |

---

## Entity Relationship (ER) Summary

```
[Product] ──< [Daily_Transactions] >── [Enterprise]
```

- One **Product** can appear in many **Transactions**
- One **Enterprise** can have many **Transactions**

---

## Folder Structure

```
SSIT/
│
├── README.md                    ← You are here
│
├── sql/
│   ├── 01_create_database.sql   ← Create the database
│   ├── 02_create_tables.sql     ← Create all 3 tables
│   ├── 03_insert_data.sql       ← Insert sample data
│   └── 04_queries.sql           ← All SQL queries used in the project
│
└── docs/
    └── project_report.md        ← Summary of the project report
```

---

## How to Run This Project

### Requirements
- [XAMPP](https://www.apachefriends.org/) installed on your computer
- phpMyAdmin (comes with XAMPP)

### Steps

**1. Start XAMPP**
- Open XAMPP Control Panel
- Start **Apache** and **MySQL**

**2. Open phpMyAdmin**
- Go to your browser and visit: `http://localhost/phpmyadmin`

**3. Create the Database**
- Click **SQL** tab
- Copy and paste the contents of `sql/01_create_database.sql`
- Click **Go**

**4. Create the Tables**
- Make sure `smart_sales_inventory_tracker` database is selected
- Paste contents of `sql/02_create_tables.sql` → Click **Go**

**5. Insert the Data**
- Paste contents of `sql/03_insert_data.sql` → Click **Go**

**6. Run Queries**
- Paste any query from `sql/04_queries.sql` to explore the data

---

## Real-Life Context

Products from **Pran RFL Group** are brought to a warehouse. Company personnel collect orders from shops and deliver products. Daily records of sent products, returns and total revenue are maintained. This DBMS replaces the manual Excel tracking with a reliable database system.

**Enterprises covered:**
- ESRAT Enterprise → BD Foods Ltd, Pran RFL Group
- FARDOSHEY Enterprise → Atlas Toiletries Ltd, Fresh Noodles

---

## SQL Features Demonstrated

| Feature | Description |
|---------|-------------|
| DDL | CREATE, DROP, ALTER TABLE |
| DML | INSERT, UPDATE, DELETE |
| DQL | SELECT with various clauses |
| Joins | INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN |
| Aggregate Functions | MIN, MAX, COUNT, SUM, AVG |
| Clauses | WHERE, GROUP BY, ORDER BY, HAVING, LIMIT |
| Operators | AND, OR, NOT, BETWEEN, LIKE, ANY, ALL |
| Advanced | Subqueries, Stored Procedures, Views, UNION |
| Maintenance | ANALYZE, CHECK, CHECKSUM, OPTIMIZE TABLE |

---

## References

- [Project Website Prototype](https://sites.google.com/view/ssitab/home)
- [Prototype Slides](https://drive.google.com/file/d/1ogeyCHSwaETvNUo9XzJyeSE0o9AewWnz/view?usp=sharing)

---

> *This project was developed as part of the DBMS Lab course at Daffodil International University, Spring 2025.*
