select [vend_name], UPPER(vend_name) AS vend_name_upcase
FROM vendors
ORDER BY vend_name;

select [cust_name],[cust_contact]
FROM [dbo].[customers]
WHERE Soundex(cust_contact)=Soundex('Y.Lie');

select [order_num],
DATEPART(WEEKDAY, order_date) AS weekday
FROM orders

select [order_num],
DATENAME(WEEKDAY, order_date) AS weekday
FROM orders

select [order_num]
FROM orders
where DATEPART(MONTH, order_date) = 10;

select [order_num]
FROM orders
where MONTH(order_date) = 1;

select cust_id, order_num
FROM orders
Where order_date='2016-09-01'

select cust_id, order_num
FROM orders
Where datediff(day,order_date,'2016-09-01')=0;

select cust_id, order_num
FROM orders
Where  YEAR(order_date)=2016
and MONTH(order_date)=9
and DAY(order_date)=1

select cust_id, order_num
FROM orders
Where datediff(MONTH, order_date, '2016-09-01') = 0;

select cust_id, order_num
FROM orders
Where YEAR(order_date)=2016 and MONTH(order_date)=9;