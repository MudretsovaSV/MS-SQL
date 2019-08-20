SELECT order_num
FROM orderitems
WHERE prod_id='TNT2';
SELECT cust_id
FROM orders
WHERE order_num IN (20005,20007);
SELECT cust_id
FROM orders
WHERE order_num IN (SELECT order_num
					FROM orderitems
					WHERE prod_id='TNT2');
SELECT cust_name,cust_contact
FROM customers
WHERE cust_id IN (10001,10004);
SELECT cust_name,cust_contact
FROM customers
WHERE cust_id IN (SELECT cust_id
					FROM orders
					WHERE order_num IN (SELECT order_num
										FROM orderitems
										WHERE prod_id='TNT2'));
SELECT COUNT(*) AS ORDERS
FROM orders
WHERE cust_id=10001;

SELECT  cust_name,
		cust_state,
		(SELECT COUNT(*) 
			FROM orders
			WHERE orders.cust_id=customers.cust_id) AS orders
FROM customers
ORDER BY cust_name;

SELECT  cust_id,
		cust_name
FROM customers
WHERE cust_id IN (SELECT cust_id 
			FROM orders
			WHERE DATEDIFF(MONTH,order_date,'2016-01-09')=0
			AND  customers.cust_id=orders.cust_id);

SELECT  cust_id,
		cust_name
FROM customers
WHERE EXISTS(SELECT *
			FROM orders
			WHERE DATEDIFF(MONTH,order_date,'2016-01-09')=0
			AND  customers.cust_id=orders.cust_id);