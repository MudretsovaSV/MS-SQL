CREATE TRIGGER newproduct_trigger ON products
AFTER INSERT
AS
SELECT 'Product added';

DROP TRIGGER newproduct_trigger;

--��� ���������� ��������� ���������� ALTER TRIGGER. 
--� ������ ������� �� ����� ������� �������, � ����� ����� �������.

--����������� � �������������� ���������
DISABLE TRIGGER newproduct_trigger ON products; --��������������

ENABLE TRIGGER newproduct_trigger ON products; --�����������

--��������� ����������� ���������
SP_HELPTRIGGER products;

--���������� ���������
--�������� ���� INSERT � ����������� ����� ���������� ��������� INSERT. 
--� ��� ���� ����� ���������� � ����������� ������� INSERTED ��� ������� � �������, �������� � �������.
USE LearnSQL;
GO
CREATE TRIGGER neworder_trigger ON orders
AFTER INSERT
AS
SELECT @@IDENTITY AS order_num; --������� order_num ����������� �������������
INSERT INTO orders (order_date,cust_id)
VALUES (GETDATE(),10001)

--�������� ���� DELETE � ����������� ����� ���������� ��������� DELETE. 
--� ��� ���� ����� ���������� � ����������� ������� DELETED ��� ������� � �������, ��������� �� �������.
--������ ��� ���������� ��������� ����� � �������� �������
USE LearnSQL;
GO
CREATE TRIGGER deleteorder_trigger ON orders
AFTER DELETE
AS
BEGIN
	INSERT INTO orders_archive(order_num, order_date, cust_id)
	SELECT order_num, order_date, cust_id FROM DELETED;
END;
--�������� ���� UPDATE � ����������� ����� ���������� ��������� UPDATE. 
USE LearnSQL;
GO
CREATE TRIGGER vendor_trigger ON vendors
AFTER INSERT, UPDATE
AS
BEGIN
	UPDATE vendors
	SET vend_state=UPPER(vend_state)
	WHERE vend_id IN (SELECT vend_id FROM INSERTED);
END;