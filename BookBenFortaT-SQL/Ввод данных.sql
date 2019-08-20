INSERT INTO customers
VALUES (10006,
	'Pep E. LaPew',
	'100 Main Street',
	'Los Angeles',
	'CA',
	'90046',
	'USA',
	NULL,
	NULL);

INSERT INTO customers(cust_name,
		cust_address,
		cust_city,
		cust_state,
		cust_zip,
		cust_country,
		cust_contact,
		cust_email)
VALUES ('Pep E. LaPew',
	'100 Main Street',
	'Los Angeles',
	'CA',
	'90046',
	'USA',
	NULL,
	NULL);

INSERT INTO customers(cust_id,
		cust_name,
		cust_contact,
		cust_email,
		cust_address,
		cust_city,
		cust_state,
		cust_zip,
		cust_country)
VALUES (10006,
	'Pep E. LaPew',
	NULL,
	NULL,
	'100 Main Street',
	'Los Angeles',
	'CA',
	'90046',
	'USA');

CREATE TABLE custnew
( cust_id INT NOT NULL IDENTITY(1,1),
cust_name NCHAR(50) NOT NULL,
cust_address NCHAR(50) NULL,
cust_city NCHAR(50) NULL,
cust_state NCHAR(5) NULL,
cust_zip NCHAR(10) NULL,
cust_country NCHAR(50) NULL,
cust_contact NCHAR(50) NULL,
cust_email NCHAR(255) NULL,
PRIMARY KEY (cust_id)
);
 INSERT INTO customers(cust_contact,
		cust_email,
		cust_name,
		cust_address,
		cust_city,
		cust_state,
		cust_zip,
		cust_country)
SELECT cust_contact,
		cust_email,
		cust_name,
		cust_address,
		cust_city,
		cust_state,
		cust_zip,
		cust_country
FROM custnew;

SELECT cust_contact,
		cust_email,
		cust_name,
		cust_address,
		cust_city,
		cust_state,
		cust_zip,
		cust_country
INTO customersExport
FROM customers;

INSERT INTO customers(cust_contact,
		cust_email,
		cust_name,
		cust_address,
		cust_city,
		cust_state,
		cust_zip,
		cust_country)
OUTPUT INSERTED.*
SELECT cust_contact,
		cust_email,
		cust_name,
		cust_address,
		cust_city,
		cust_state,
		cust_zip,
		cust_country
FROM custnew;