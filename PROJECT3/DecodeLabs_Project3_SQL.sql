
USE decodelabs_project3;


SELECT COUNT(*) AS missing_coupon_codes
FROM orders
WHERE CouponCode IS NULL
   OR TRIM(CouponCode) = '';
   
select count(distinct orderID) as uniqueorderIDCOUNT
from orders;

SELECT OrderID, COUNT(*) AS order_count
FROM orders
GROUP BY OrderID
HAVING COUNT(*) > 1;

SELECT
    SUM(OrderID IS NULL OR TRIM(OrderID) = '') AS missing_orderid,
    SUM(Date IS NULL) AS missing_date,
    SUM(CustomerID IS NULL OR TRIM(CustomerID) = '') AS missing_customerid,
    SUM(Product IS NULL OR TRIM(Product) = '') AS missing_product,
    SUM(Quantity IS NULL) AS missing_quantity,
    SUM(UnitPrice IS NULL) AS missing_unitprice,
    SUM(PaymentMethod IS NULL OR TRIM(PaymentMethod) = '') AS missing_paymentmethod,
    SUM(OrderStatus IS NULL OR TRIM(OrderStatus) = '') AS missing_orderstatus,
    SUM(TotalPrice IS NULL) AS missing_totalprice
FROM orders;

SELECT *
FROM orders
LIMIT 5;

SELECT Product, TotalPrice
FROM orders;

SELECT
    OrderID,
    Date,
    Product,
    Quantity,
    TotalPrice
FROM orders
LIMIT 10;

SELECT
    OrderID AS Order_ID,
    Product AS Product_Name,
    Quantity AS Qty,
    TotalPrice AS Sales_Amount
FROM orders
LIMIT 10;

SELECT Qty 
FROM orders
WHERE Qty>1;

SELECT *
FROM orders
WHERE Quantity > 1;

SELECT
    OrderID,
    Product,
    Quantity,
    TotalPrice
FROM orders
WHERE Quantity > 1
LIMIT 10;

SELECT
    OrderID,
    Date,
    Product,
    Quantity,
    TotalPrice
FROM orders
WHERE Product = 'Laptop';

SELECT
    OrderID,
    Date,
    Product,
    Quantity,
    TotalPrice
FROM orders
WHERE Product = 'Laptop'
  AND Quantity > 1;

SELECT
    OrderID,
    Date,
    Product,
    Quantity,
    TotalPrice
FROM orders
WHERE Product = 'Laptop'
  AND Quantity > 1;
  
  SELECT
    OrderID,
    Date,
    Product,
    Quantity,
    TotalPrice
FROM orders
WHERE Product = 'Laptop'
  AND Quantity > 1;
  
  
  SELECT COUNT(*) AS laptop_orders_qty_gt_1
FROM orders
WHERE Product = 'Laptop'
  AND Quantity > 1;
  
SELECT
    OrderID,
    Date,
    Product,
    Quantity,
    TotalPrice
FROM orders
WHERE Product = 'Laptop'
   OR Product = 'Phone';
   

SELECT
    OrderID,
    Date,
    Product,
    Quantity,
    TotalPrice
FROM orders
WHERE TotalPrice BETWEEN 500 AND 1000;


SELECT
    OrderID,
    Date,
    Product,
    Quantity,
    TotalPrice
FROM orders
WHERE TotalPrice BETWEEN 500 AND 1000;


SELECT
    OrderID,
    Date,
    Product,
    Quantity,
    TotalPrice
FROM orders
WHERE Date BETWEEN '2024-01-01' AND '2024-12-31';

SELECT
    OrderID,
    Product,
    Quantity,
    TotalPrice
FROM orders
ORDER BY TotalPrice DESC;


SELECT
    OrderID,
    Date,
    Product,
    Quantity,
    TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 10


SELECT
    OrderID,
    Product,
    Quantity,
    TotalPrice
FROM orders
ORDER BY TotalPrice DESC, Quantity DESC
LIMIT 15;


SELECT COUNT(*) AS total_orders
FROM orders;


SELECT
    Product,
    COUNT(*) AS total_orders
FROM orders
GROUP BY Product;


SELECT
    Product,
    COUNT(*) AS total_orders
FROM orders
GROUP BY Product
ORDER BY total_orders DESC;


SELECT
    Product,
    COUNT(*) AS total_orders
FROM orders
GROUP BY Product
ORDER BY total_orders DESC;


SELECT
    COUNT(DISTINCT CustomerID) AS unique_customers
FROM orders;


SELECT
    SUM(TotalPrice) AS total_sales
FROM orders;


SELECT
    Product,
    SUM(TotalPrice) AS total_sales
FROM orders
GROUP BY Product;


SELECT
    Product,
    SUM(TotalPrice) AS total_sales
FROM orders
GROUP BY Product
ORDER BY total_sales DESC;


SELECT
    AVG(TotalPrice) AS average_order_value
FROM orders;



SELECT
    Product,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY Product;


SELECT
    Product,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY Product;


SELECT
    Product,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY Product
ORDER BY total_sales DESC;


SELECT
    Product,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY Product
HAVING COUNT(*) > 150
ORDER BY total_orders DESC;



SELECT
    Product,
    SUM(TotalPrice) AS total_sales,
    ROUND(
        SUM(TotalPrice) /
        (SELECT SUM(TotalPrice) FROM orders) * 100,
        2
    ) AS sales_contribution_pct
FROM orders
GROUP BY Product
ORDER BY sales_contribution_pct DESC;



SELECT
    PaymentMethod,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales
FROM orders
GROUP BY PaymentMethod
ORDER BY total_sales DESC;


SELECT
    OrderStatus,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales
FROM orders
GROUP BY OrderStatus
ORDER BY total_orders DESC;


SELECT
    CustomerID,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_spent
FROM orders
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;


SELECT
    CustomerID,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_spent
FROM orders
GROUP BY CustomerID
HAVING COUNT(*) > 1
ORDER BY total_orders DESC;


SELECT
    CustomerID,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_spent,
    CASE
        WHEN COUNT(*) = 1 THEN 'One-Time Customer'
        WHEN COUNT(*) BETWEEN 2 AND 3 THEN 'Repeat Customer'
        ELSE 'Frequent Customer'
    END AS customer_segment
FROM orders
GROUP BY CustomerID
ORDER BY total_orders DESC;


SELECT
    customer_segment,
    COUNT(*) AS total_customers,
    SUM(total_spent) AS segment_sales
FROM (
    SELECT
        CustomerID,
        COUNT(*) AS total_orders,
        SUM(TotalPrice) AS total_spent,
        CASE
            WHEN COUNT(*) = 1 THEN 'One-Time Customer'
            WHEN COUNT(*) BETWEEN 2 AND 3 THEN 'Repeat Customer'
            ELSE 'Frequent Customer'
        END AS customer_segment
    FROM orders
    GROUP BY CustomerID
) AS customer_summary
GROUP BY customer_segment
ORDER BY segment_sales DESC;



SELECT
    ReferralSource,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY ReferralSource
ORDER BY total_sales DESC;


SELECT
    YEAR(Date) AS order_year,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY YEAR(Date)
ORDER BY order_year;



SELECT
    YEAR(Date) AS order_year,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY YEAR(Date)
ORDER BY order_year;



SELECT
    DATE_FORMAT(Date, '%Y-%m') AS order_month,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY DATE_FORMAT(Date, '%Y-%m')
ORDER BY order_month;


SELECT
    OrderID,
    Date,
    CustomerID,
    Product,
    Quantity,
    UnitPrice,
    TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 10;


SELECT
    CustomerID,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_spent,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;


SELECT
    Product,
    OrderStatus,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales
FROM orders
GROUP BY Product, OrderStatus
ORDER BY Product, total_orders DESC;



SELECT
    Product,
    PaymentMethod,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales
FROM orders
GROUP BY Product, PaymentMethod
ORDER BY Product, total_sales DESC;


SELECT
    CASE
        WHEN CouponCode IS NULL OR TRIM(CouponCode) = '' THEN 'No Coupon'
        ELSE 'Coupon Used'
    END AS coupon_status,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    AVG(TotalPrice) AS average_order_value
FROM orders
GROUP BY
    CASE
        WHEN CouponCode IS NULL OR TRIM(CouponCode) = '' THEN 'No Coupon'
        ELSE 'Coupon Used'
    END
ORDER BY total_sales DESC;


SELECT
    CouponCode,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    AVG(TotalPrice) AS average_order_value
FROM orders
WHERE CouponCode IS NOT NULL
  AND TRIM(CouponCode) <> ''
GROUP BY CouponCode
ORDER BY total_sales DESC;


SELECT
    PaymentMethod,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    ROUND(
        SUM(TotalPrice) /
        (SELECT SUM(TotalPrice) FROM orders) * 100,
        2
    ) AS sales_contribution_pct
FROM orders
GROUP BY PaymentMethod
ORDER BY sales_contribution_pct DESC;



SELECT
    PaymentMethod,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    ROUND(
        SUM(TotalPrice) /
        (SELECT SUM(TotalPrice) FROM orders) * 100,
        2
    ) AS sales_contribution_pct
FROM orders
GROUP BY PaymentMethod
ORDER BY sales_contribution_pct DESC;



SELECT
    OrderStatus,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    ROUND(
        SUM(TotalPrice) /
        (SELECT SUM(TotalPrice) FROM orders) * 100,
        2
    ) AS sales_contribution_pct
FROM orders
GROUP BY OrderStatus
ORDER BY sales_contribution_pct DESC;



SELECT
    Product,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value,
    ROUND(
        SUM(TotalPrice) /
        (SELECT SUM(TotalPrice) FROM orders) * 100,
        2
    ) AS sales_contribution_pct
FROM orders
GROUP BY Product
ORDER BY total_sales DESC;


SELECT
    Product,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value
FROM orders
GROUP BY Product
ORDER BY average_order_value DESC
LIMIT 1;


SELECT
    Product,
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value
FROM orders
GROUP BY Product
ORDER BY total_orders DESC
LIMIT 1;


SELECT
    Product,
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value
FROM orders
GROUP BY Product
ORDER BY total_sales DESC, total_orders DESC;


SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value,
    COUNT(DISTINCT CustomerID) AS unique_customers
FROM orders;


SELECT
    Product,
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value,
    ROUND(
        SUM(TotalPrice) /
        (SELECT SUM(TotalPrice) FROM orders) * 100,
        2
    ) AS sales_contribution_pct
FROM orders
GROUP BY Product
ORDER BY total_sales DESC;


SELECT
    OrderStatus,
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value,
    ROUND(
        SUM(TotalPrice) /
        (SELECT SUM(TotalPrice) FROM orders) * 100,
        2
    ) AS sales_contribution_pct
FROM orders
GROUP BY OrderStatus
ORDER BY total_sales DESC;


SELECT
    CustomerID,
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_spent,
    ROUND(AVG(TotalPrice), 2) AS average_order_value
FROM orders
GROUP BY CustomerID
ORDER BY total_spent DESC;



SELECT
    ReferralSource,
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value,
    ROUND(
        SUM(TotalPrice) /
        (SELECT SUM(TotalPrice) FROM orders) * 100,
        2
    ) AS sales_contribution_pct
FROM orders
GROUP BY ReferralSource
ORDER BY total_sales DESC;


SELECT
    CouponCode,
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value,
    ROUND(
        SUM(TotalPrice) /
        (SELECT SUM(TotalPrice) FROM orders) * 100,
        2
    ) AS sales_contribution_pct
FROM orders
WHERE CouponCode IS NOT NULL
  AND TRIM(CouponCode) <> ''
GROUP BY CouponCode
ORDER BY total_sales DESC;


SELECT
    YEAR(Date) AS order_year,
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value
FROM orders
GROUP BY YEAR(Date)
ORDER BY order_year;


 SELECT
    DATE_FORMAT(Date, '%Y-%m') AS order_month,
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value
FROM orders
GROUP BY DATE_FORMAT(Date, '%Y-%m')
ORDER BY total_sales DESC
LIMIT 1;



SELECT
    DATE_FORMAT(Date, '%Y-%m') AS order_month,
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value
FROM orders
GROUP BY DATE_FORMAT(Date, '%Y-%m')
ORDER BY total_orders DESC
LIMIT 1;


SELECT
    DATE_FORMAT(Date, '%Y-%m') AS order_month,
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value
FROM orders
GROUP BY DATE_FORMAT(Date, '%Y-%m')
ORDER BY total_sales DESC;


SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice), 2) AS total_sales,
    ROUND(AVG(TotalPrice), 2) AS average_order_value,
    COUNT(DISTINCT CustomerID) AS unique_customers
FROM orders;









   
   
  
  
  
  
