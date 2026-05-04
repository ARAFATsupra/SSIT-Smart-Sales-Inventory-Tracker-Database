-- ============================================================
-- SSIT: Smart Sales & Inventory Tracker
-- File 2: Create Tables
-- Team: Mega Evolution | Daffodil International University
-- ============================================================

USE smart_sales_inventory_tracker;

-- ----------------------------
-- Table 1: product
-- ----------------------------
CREATE TABLE IF NOT EXISTS product (
    Product_ID   INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(50) NOT NULL,
    Buying_Rate  FLOAT NOT NULL
);

-- ----------------------------
-- Table 2: enterprise
-- ----------------------------
CREATE TABLE IF NOT EXISTS enterprise (
    Enterprise_ID   INT PRIMARY KEY AUTO_INCREMENT,
    Enterprise_Name VARCHAR(50) NOT NULL,
    Company_Name    VARCHAR(50) NOT NULL
);

-- ----------------------------
-- Table 3: daily_transactions
-- ----------------------------
CREATE TABLE IF NOT EXISTS daily_transactions (
    Transaction_ID                  INT PRIMARY KEY AUTO_INCREMENT,
    Enterprise_ID                   INT,
    Product_ID                      INT,
    CORD_No                         FLOAT NOT NULL,
    Trade_Discount_Progress         CHAR(20) NOT NULL,
    Cumulative_Ordered_Total_Quantity INT NOT NULL,
    Buying_Amount                   FLOAT NOT NULL,
    Sales_Amount                    FLOAT NOT NULL,
    Delivered_Quantity              INT NOT NULL,
    Delivery_Order_Amount           FLOAT NOT NULL,
    Bought_and_Delivered_Quantity   INT NOT NULL,
    Damaged_Quantity                INT NOT NULL,
    Damaged_Amount                  INT NOT NULL,
    Flat_Rate                       FLOAT NOT NULL,
    Profit_Percentage               FLOAT NOT NULL,
    Remarks                         FLOAT NOT NULL,
    Working_Day_Date                DATE,
    FOREIGN KEY (Enterprise_ID) REFERENCES enterprise(Enterprise_ID),
    FOREIGN KEY (Product_ID)    REFERENCES product(Product_ID)
);

-- ----------------------------
-- Drop commands (use only if needed)
-- ----------------------------
-- DROP TABLE daily_transactions;
-- DROP TABLE product;
-- DROP TABLE enterprise;
-- DROP DATABASE smart_sales_inventory_tracker;
