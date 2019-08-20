DECLARE @age INT;
DECLARE @firstName CHAR(20), @lastName CHAR(20);

SET @lastName='Forta';
SET @firstName='Ben';
SET @age=21;

DECLARE @age INT;
DECLARE @firstName CHAR(20), @lastName CHAR(20);
SELECT @age=21, @lastName='Forta', @firstName='Ben';

PRINT RTrim(@lastName)+', '+@firstName;
PRINT 'Age: '+Convert(char,@age); --�������������� ���������� � ���������� ������
SELECT @age, @lastName, @firstName;

SELECT cust_name, cust_email
FROM customers
WHERE cust_id=10001;

SELECT order_num, order_date
FROM orders
WHERE cust_id=10001
ORDER BY order_date;

-- �������� ���������� @cust_id
DECLARE @cust_id INT;
SET @cust_id=10001;
--�������� ��� ��������� � ����� ��� ����������� �����
SELECT cust_name, cust_email
FROM customers
WHERE cust_id=@cust_id;
--�������� ����������� ������� ���������
SELECT order_num, order_date
FROM orders
WHERE cust_id=@cust_id
ORDER BY order_date;

DatePart(dw,GetDate())

--�������� ����������
DECLARE @open BIT
--������� ������� ����?
If DatePart(dw,GetDate())=1
	SET @open=0
ELSE 
	SET @open=1
--������� ���������
SELECT @open AS OpenForBusiness

--�������� ����������
DECLARE @dow INT
DECLARE @open BIT
--�������� ���� ������
SET @dow=DatePart(dw,GetDate());
--������� ������� ����?
IF @dow=1 or @dow=7
	SET @open=0
ELSE 
	SET @open=1
--������� ���������
SELECT @open AS OpenForBusiness

IF DatePart(dw,GetDate())=1 OR DatePart(dw,GetDate())=7

--�������� ����������
DECLARE @dow INT
DECLARE @open BIT, @process BIT
--�������� ���� ������
SET @dow=DatePart(dw,GetDate());
--������� ������� ����?
IF @dow=1 or @dow=7
	BEGIN
		SET @open=0
		SET @process=0
	END
ELSE 
	BEGIN
		SET @open=1
		SET @process=1
	END
--������� ���������
SELECT @open AS OpenForBusiness

IF DatePart(dw,GetDate())=1 OR DatePart(dw,GetDate())=7

DECLARE @counter INT
SET @counter=1

While @counter<=10
BEGIN
	PRINT @counter
	SET @counter=@counter+1;
END
