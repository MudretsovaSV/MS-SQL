SELECT vend_name, prod_name,prod_price
FROM vendors,products
WHERE vendors.vend_id=products.vend_id
ORDER BY vend_name, prod_name;

SELECT vend_name, prod_name,prod_price
FROM vendors,products
ORDER BY vend_name, prod_name;

SELECT customers.cust_id, customers.cust_name
FROM customers, orders
WHERE DATEDIFF(MONTH,order_date,'2016-01-09')=0
	AND customers.cust_id=orders.cust_id;

SELECT customers.cust_id, customers.cust_name
FROM customers INNER JOIN orders ON	customers.cust_id=orders.cust_id
WHERE DATEDIFF(MONTH,order_date,'2016-01-09')=0
	AND customers.cust_id=orders.cust_id;
	
SELECT prod_name, vend_name, prod_price, quantity
FROM orderitems, products, vendors 
WHERE products.vend_id=vendors.vend_id
	AND orderitems.prod_id=products.prod_id
	AND order_num=20005;

SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN (SELECT cust_id
					FROM orders
					WHERE order_num IN (SELECT order_num
											FROM orderitems
											WHERE prod_id='TNT2'))
SELECT cust_name, cust_contact
FROM customers, orders, orderitems
WHERE customers.cust_id=orders.cust_id
AND orderitems.order_num=orders.order_num
AND prod_id='TNT2';
