SELECT * 
FROM products
SELECT avg(prod_price) as avg_price 
FROM products
WHERE vend_id=1003
SELECT COUNT(*) FROM customers
SELECT COUNT(cust_email) AS num_cust FROM customers;
SELECT Min(prod_price) as max_price 
FROM products;
SELECT Sum(quantity) as item_orders 
FROM orderitems
WHERE order_num=20005
SELECT Sum(item_price*quantity) as total_price 
FROM orderitems
WHERE order_num=20005
SELECT avg(DISTINCT prod_price) as avg_price 
FROM products
WHERE vend_id=1003
SELECT COUNT(*) AS num_items,
MIN(prod_price) AS price_min,
MAX(prod_price) AS price_max,
AVG(prod_price) AS price_avg
FROM products
WHERE vend_id=1003