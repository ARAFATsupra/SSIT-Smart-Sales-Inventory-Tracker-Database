# SSIT Project Report Summary

## Project Title
**Smart Sales & Inventory Tracker (SSIT)**  
Database Management System Lab Report

---

## Institution
Daffodil International University  
Department of Information Technology & Management (ITM)  
Faculty of Science and Information Technology

---

## Course Information
- **Course:** Database Management System
- **Course Code:** ITM 222
- **Submitted To:** Ms. Nusrat Jahan (Assistant Professor & Head)
- **Semester:** Spring 2025
- **Batch:** 8th | **Section:** A
- **Submission Date:** 17th April 2025

---

## Team Members
- Esrat Jahan Bristy — 232-51-002
- Kazi Arafat Hossain — 232-51-008

---

## Real-Life Problem

Products from **Pran Company** are brought to a warehouse. Personnel collect orders from shops and deliver products. Daily records were being maintained manually in Excel sheets — tracking products sent to market, products returned, and total revenue.

**Problem:** Manual Excel tracking is slow and error-prone.  
**Solution:** Replace Excel with a proper DBMS.

---

## Normalization

### UNF → 1NF → 2NF → 3NF

**3NF Final Tables:**

1. **Product Table** — Product_ID (PK), Product_Name, Buying_Rate  
2. **Enterprise Table** — Enterprise_ID (PK), Enterprise_Name, Company_Name  
3. **Daily Transactions Table** — Transaction_ID (PK), Enterprise_ID (FK), Product_ID (FK), + all transaction fields

---

## Key System Features

- **Multi-Enterprise Support** — Manages ESRAT and FARDOSHEY enterprises
- **Order & Delivery Tracking** — Tracks ordered, delivered, and damaged quantities
- **Profit & Revenue Tracking** — Calculates buying vs sales amounts automatically
- **Daily Records** — Replaces Excel with structured database entries
- **Flexible** — Supports products from Pran RFL Group, BD Foods Ltd, Atlas Toiletries Ltd

---

## SQL Concepts Covered

| # | Topic |
|---|-------|
| 1 | CREATE / DROP DATABASE & TABLES |
| 2 | INSERT data |
| 3 | SELECT — specific columns |
| 4 | ALTER TABLE — ADD / DROP / MODIFY columns |
| 5 | WHERE with AND, OR, NOT |
| 6 | BETWEEN operator |
| 7 | Aggregate: MIN, MAX, COUNT, SUM |
| 8 | GROUP BY clause |
| 9 | ORDER BY (ASC / DESC) |
| 10 | HAVING clause |
| 11 | LIMIT clause |
| 12 | LIKE operator with JOIN |
| 13 | FULL OUTER JOIN with UNION |
| 14 | INNER JOIN |
| 15 | Subqueries + AVG + Stored Procedures |
| 16 | SQL VIEWS |
| 17 | ANY operator |
| 18 | ALL operator |
| 19 | UPDATE |
| 20 | DELETE |
| 21 | Export / Import CSV |
| 22 | Table Maintenance (ANALYZE, CHECK, CHECKSUM, OPTIMIZE) |

---

## Tools Used

- **MySQL** — Database engine
- **XAMPP** — Local server environment
- **phpMyAdmin** — Database GUI management tool

---

## Conclusion

The SSIT database system successfully replaces manual Excel tracking with a structured, reliable DBMS. It saves time, reduces human error, and provides clear reports on sales, deliveries, and profits — helping the company make better business decisions.
