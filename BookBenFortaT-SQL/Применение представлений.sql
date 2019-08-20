SELECT cust_name, cust_contact
FROM customers, orders, orderitems
WHERE customers.cust_id=orders.cust_id
	AND orderitems.order_num=orders.order_num
	AND prod_id='TNT2';



SELECT cust_name, cust_contact
FROM productcustomers
WHERE prod_id='TNT2';

CREATE VIEW productcustomers AS
SELECT cust_name, cust_contact, prod_id
FROM customers, orders, orderitems
WHERE customers.cust_id=orders.cust_id
	AND orderitems.order_num=orders.order_num;

SELECT * FROM productcustomers;

SELECT RTRIM(vend_name)+'('+RTRIM(vend_country)+')'
	AS vend_title
FROM vendors
ORDER BY vend_name;

CREATE VIEW vendorlocations AS
SELECT RTRIM(vend_name)+'('+RTRIM(vend_country)+')'
	AS vend_title
FROM vendors;

SELECT * FROM vendorlocations
ORDER BY vend_title;

CREATE VIEW customermaillist AS
SELECT cust_id, cust_name,cust_email
FROM customers
WHERE cust_email IS NOT NULL;

SELECT * FROM customermaillist; 

SELECT prod_id,
		quantity,
		item_price,
		quantity*item_price AS expanded_price
FROM orderitems
WHERE order_num=20005;

CREATE VIEW orderitemsexpanded AS
SELECT	order_num,
		prod_id,
		quantity,
		item_price,
		quantity*item_price AS expanded_price
FROM orderitems;

SELECT * FROM orderitemsexpanded 
WHERE order_num=20005;
