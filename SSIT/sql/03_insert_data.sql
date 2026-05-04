-- ============================================================
-- SSIT: Smart Sales & Inventory Tracker
-- File 3: Insert Sample Data
-- Team: Mega Evolution | Daffodil International University
-- ============================================================

USE smart_sales_inventory_tracker;

-- ----------------------------
-- Insert into enterprise
-- ----------------------------
INSERT INTO enterprise (Enterprise_Name, Enterprise_ID, Company_Name)
VALUES
    ('ESRAT Enterprise',     1, 'BD FOODS LTD'),
    ('ESRAT Enterprise',     2, 'PRAN RFL GROUP'),
    ('FARDOSHEY Enterprise', 3, 'ATLAS TOILETRIES LTD'),
    ('FARDOSHEY Enterprise', 4, 'FRESH NOODLES');

-- ----------------------------
-- Insert into product
-- ----------------------------
INSERT INTO product (Product_Name, Product_ID, Buying_Rate)
VALUES
    ('CHILLI POWDER-100g',          1, 2726.40),
    ('CANACUR-300g',                2, 1807.30),
    ('LACHCHA-165g',                3, 2100.00),
    ('DAL MIX 24p',                 4, 1129.00),
    ('NEO ACTIVE PLUS-500g',        5, 3069.00),
    ('DISH WASH LIQUID-500ml',      6, 2040.00),
    ('NOODLES MASALA-16 Pcs-992g',  7, 1443.84),
    ('NOODLES CHACKEN-CUP-408-48g', 8, 1064.16);

-- ----------------------------
-- Insert into daily_transactions
-- ----------------------------
INSERT INTO daily_transactions (
    Transaction_ID, Enterprise_ID, Product_ID, CORD_No,
    Trade_Discount_Progress, Cumulative_Ordered_Total_Quantity,
    Buying_Amount, Sales_Amount, Delivered_Quantity,
    Delivery_Order_Amount, Bought_and_Delivered_Quantity,
    Damaged_Quantity, Damaged_Amount, Flat_Rate,
    Profit_Percentage, Remarks, Working_Day_Date
)
VALUES
    (001, 1, 1, 0,       '48;4',    52, 47.5846,  78,      0,     0,       0,  0, 0,     51.55, 6.33,   0, '2023-01-01'),
    (002, 1, 2, 0,       '24p;2p',  24, 68.97,    73,      0,     0,       1,  0, 0,     66.05, 4.97,   0, '2023-01-01'),
    (003, 2, 3, 32517,   '60p:4p',  60, 32.6125,  34.7812, 0,     0,       0,  0, 0,     0,     0.0672, 0, '2023-01-01'),
    (004, 2, 4, 47756,   '288p;12', 12, 90.32,    95.74,   0,     0,       0,  0, 0,     0,     0.0684, 0, '2023-01-01'),
    (005, 3, 5, 51142,   'NEW',     60, 51.15,    47.7576, 0,     0,       0, 55, 6,     7.53,  3403.8, 96,'2023-01-01'),
    (006, 3, 6, 0,       '1897',    28, 67.75,    61.71,   0,     0,       0, 62, 8,     8.01,  1060,   0, '2023-01-01'),
    (007, 4, 7, 1584,    '24;1',     6, 240.6333, 255.07,  42, 10106.6,   24,  0, 0,     0,     0,      0, '2023-01-01'),
    (008, 4, 8, 1064.16, '24;1',    48, 20.46,    21.6876,  0,     0,       0,  0, 0,     0,     0,      0, '2023-01-01');
