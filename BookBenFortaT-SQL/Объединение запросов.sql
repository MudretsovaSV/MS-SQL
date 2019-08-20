SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price<=5
UNION
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN (1001,1002);

SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price<=5
or vend_id IN (1001,1002);

SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price<=5
UNION ALL
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN (1001,1002);

SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price<=5
UNION
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN (1001,1002)
ORDER BY vend_id, prod_price;