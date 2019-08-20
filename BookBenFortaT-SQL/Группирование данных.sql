SELECT COUNT(*) AS num_products
FROM products
WHERE vend_id=1003
SELECT vend_id, COUNT(*) AS num_products
FROM products
GROUP BY vend_id
SELECT cust_id, COUNT(*) AS orders
FROM orders
GROUP BY cust_id
HAVING COUNT(*)>=2
SELECT vend_id, COUNT(*) AS num_prods
FROM products
WHERE prod_price>=10
GROUP BY vend_id
HAVING COUNT(*)>=2;
SELECT vend_id, COUNT(*) AS num_prods
FROM products
GROUP BY vend_id
HAVING COUNT(*)>=2;
SELECT order_num, Sum(quantity*item_price) AS ordertotal
FROM orderitems
GROUP BY order_num
HAVING Sum(quantity*item_price)>=2;
SELECT order_num, Sum(quantity*item_price) AS ordertotal
FROM orderitems
GROUP BY order_num
HAVING Sum(quantity*item_price)>=50
ORDER BY ordertotal;
SELECT * FROM orderitems