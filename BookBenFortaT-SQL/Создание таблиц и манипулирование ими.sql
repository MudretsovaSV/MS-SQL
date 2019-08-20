 CREATE TABLE customers1	--следует указывать им€ еще не существующей таблицы 
(							--или сначала удалить существующую вручную, а затем создать снова 
cust_id INT NOT NULL IDENTITY(1,1),
cust_name NCHAR(50) NOT NULL,
cust_address NCHAR(50) NULL,
cust_city NCHAR(50) NULL,
cust_state NCHAR(5) NULL,
cust_zip NCHAR(10) NULL,
cust_country NCHAR(50) NULL,
cust_contact NCHAR(50) NULL,
cust_email NCHAR(255) NULL,
PRIMARY KEY (cust_id)	--значение первичного ключа должно быть однозначным
);

CREATE TABLE orders1
(
order_num  INT NOT NULL IDENTITY(1,1),
order_date DATETIME NOT NULL,
cust_id INT NOT NULL,
PRIMARY KEY (order_num)
);

CREATE TABLE orderitems1
(
order_num INT NOT NULL,
order_item INT NOT NULL,
prod_id NCHAR(10) NOT NULL,
quantity INT NOT NULL,
ITEM_PRICE MONEY NOT NULL,
PRIMARY KEY (order_num, order_item)
);

CREATE TABLE orderitems2
(
order_num INT NOT NULL,
order_item INT NOT NULL,
prod_id NCHAR(10) NOT NULL,
quantity INT NOT NULL DEFAULT 1,
ITEM_PRICE MONEY NOT NULL,
PRIMARY KEY (order_num, order_item)
); 

CREATE TABLE orders3
(
order_num  INT NOT NULL IDENTITY(1,1),
order_date DATETIME NOT NULL DEFAULT GETDATE(),
cust_id INT NOT NULL,
PRIMARY KEY (order_num)
);

CREATE TABLE products1
(
prod_id NCHAR(10) NOT NULL,
vend_id INT NOT NULL IDENTITY(1,1),
prod_name NCHAR(255) NOT NULL,
prod_price MONEY NOT NULL,
prod_desc NTEXT NULL
PRIMARY KEY (prod_id)
);
select * from products2
ALTER TABLE vendors
ADD vend_phone char(20); --введение столбца

ALTER TABLE vendors
DROP COLUMN vend_phone; --удаление столбца
--------------------------------------------
--определение внешних ключей
ALTER TABLE [dbo].[orderitems1]
ADD CONSTRAINT fk_orderitems1_orders1 FOREIGN KEY (order_num)
REFERENCES orders1 (order_num);

ALTER TABLE orderitems1
ADD CONSTRAINT fk_orderitems1_products1 FOREIGN KEY (prod_id)
REFERENCES products1 (prod_id);

ALTER TABLE orders1
ADD CONSTRAINT fk_orders1_customers1 FOREIGN KEY (cust_id)
REFERENCES customers1 (cust_id);

ALTER TABLE products
ADD CONSTRAINT fk_products_vendors1 FOREIGN KEY (vend_id)
REFERENCES vendors (vend_id);

ALTER TABLE productnotes
ADD CONSTRAINT fk_productnotes_products1 FOREIGN KEY (prod_id)
REFERENCES products (prod_id);

DROP TABLE orderitems2; --“јЅЋ»÷ј ”ƒјЋя≈“—я(при условии, что она существует) Ѕ≈«¬ќ«¬–ј“Ќќ

EXEC sp_rename 'orders3', 'orders2';
