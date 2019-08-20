UPDATE customers
SET cust_email='elmer@fudd.com'
WHERE cust_id=10005;

UPDATE customers
SET cust_name='The Fudds',
	cust_email='elmer@fudd.com'
WHERE cust_id=10005;

UPDATE customers
SET cust_email=Null
WHERE cust_id=10005;

DELETE FROM customers
WHERE cust_id=10006;

UPDATE customers
SET cust_state=Upper(cust_state)
OUTPUT DELETED.*;