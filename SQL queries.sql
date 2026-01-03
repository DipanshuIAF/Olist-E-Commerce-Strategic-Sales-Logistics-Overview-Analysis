-- customer table
SELECT * 
FROM customers
LIMIT 5;

SELECT count(*)
FROM customers;

-- geolocation table 
SELECT * 
FROM geolocation
LIMIT 5;

SELECT count(*)
FROM geolocation;

-- leads closed table 
SELECT * 
FROM leads_closed
LIMIT 5;

SELECT count(*)
FROM leads_closed;

-- leads qualified table 
SELECT * 
FROM leads_qualified
LIMIT 5;

SELECT count(*)
FROM leads_qualified;

-- order items table 
SELECT * 
FROM order_items
LIMIT 5;

SELECT count(*)
FROM order_items;

-- order payments
SELECT * 
FROM order_payments
LIMIT 5;

SELECT count(*)
FROM order_payments;

-- order reviews table 
SELECT * 
FROM order_reviews
LIMIT 5;

SELECT count(*)
FROM order_reviews;

-- orders table 
SELECT * 
FROM orders
LIMIT 5;

SELECT count(*)
FROM orders;

-- product_category_name_translation table 
SELECT * 
FROM product_category_name_translation
LIMIT 5;

SELECT count(*)
FROM product_category_name_translation;

-- products table 
SELECT * 
FROM products
LIMIT 5;

SELECT count(*)
FROM products;

-- sellers table 
SELECT * 
FROM sellers
LIMIT 5;

SELECT count(*)
FROM sellers;

-- creating orders_enriched table
SELECT 
o.order_id,
DATE(o.order_purchase_timestamp) AS order_purchase_date, 
o.order_purchase_timestamp,
o.customer_id,
c.customer_state,
oi.product_id,
t.product_category_name_english AS product_category_name, 
oi.price,
oi.freight_value,
op.payment_type,
op.payment_value,
o.order_status
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN order_payments op ON o.order_id = op.order_id
LEFT JOIN product_category_name_translation t ON p.product_category_name = t.product_category_name
WHERE o.order_status != 'canceled' AND o.order_status != 'unavailable';

-- creating monthly sales table
SELECT 
strftime('%Y-%m', o.order_purchase_timestamp) AS year_month,
COUNT(o.order_id) AS total_orders,
SUM(op.payment_value) AS total_revenue,
SUM(op.payment_value) * 1.0 / COUNT(o.order_id) AS avg_order_value
FROM orders o
JOIN order_payments op ON o.order_id = op.order_id
WHERE o.order_status != 'canceled' AND o.order_status != 'unavailable'
GROUP BY 1
ORDER BY 1;

-- creating category_performance table
SELECT 
t.product_category_name_english AS product_category_name,
COUNT(DISTINCT oi.order_id) AS total_orders,
COUNT(oi.product_id) AS total_items,
SUM(oi.price) AS total_revenue,
AVG(oi.price) AS avg_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN product_category_name_translation t ON p.product_category_name = t.product_category_name
GROUP BY 1
ORDER BY 4 DESC
LIMIT 10;

-- creating state_performance table 
SELECT 
c.customer_state,
COUNT(DISTINCT c.customer_unique_id) AS unique_customers,
COUNT(DISTINCT o.order_id) AS total_orders,
SUM(op.payment_value) AS total_revenue,
SUM(op.payment_value) * 1.0 / COUNT(DISTINCT o.order_id) AS avg_order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_payments op ON o.order_id = op.order_id
WHERE o.order_status != 'canceled' AND o.order_status != 'unavailable'
GROUP BY 1
ORDER BY 4 DESC;

-- creating delivery_summary_by_state table 
SELECT 
c.customer_state,
AVG(julianday(order_delivered_customer_date) - julianday(order_purchase_timestamp)) AS avg_delivery_time_days,
AVG(julianday(order_estimated_delivery_date) - julianday(order_purchase_timestamp)) AS avg_estimated_delivery_days
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY 1;




