--�������� � �������� ��������
DECLARE orders_cursor CURSOR
FOR 
SELECT order_num
FROM orders
ORDER BY order_num;

DEALLOCATE orders_cursor;

--�������� � �������� ��������
Open orders_cursor;
CLOSE orders_cursor;
--------------------------------
DECLARE orders_cursor CURSOR
FOR 
SELECT order_num FROM orders ORDER BY order_num;
OPEN orders_cursor;
CLOSE orders_cursor;
DEALLOCATE orders_cursor;

--���������� ������ �� �������
DECLARE @order_num INT; 
DECLARE orders_cursor CURSOR
FOR 
SELECT order_num FROM orders ORDER BY order_num;
OPEN orders_cursor;
FETCH NEXT FROM orders_cursor INTO @order_num;
CLOSE orders_cursor;
DEALLOCATE orders_cursor;

------------------------------------------------------
DECLARE @order_num INT; 
DECLARE orders_cursor CURSOR
FOR 
SELECT order_num FROM orders ORDER BY order_num;
OPEN orders_cursor;
FETCH NEXT FROM orders_cursor INTO @order_num;
WHILE @@FETCH_STATUS=0
BEGIN
	FETCH NEXT FROM orders_cursor INTO @order_num;
END
CLOSE orders_cursor;
DEALLOCATE orders_cursor;

----------------------------------------------------------
--�������� ��������� ����������
DECLARE @order_num INT; 
DECLARE @order_total MONEY; 
DECLARE @total MONEY;

--���������������� ����������  @total
SET  @total=0

--�������� ������
DECLARE orders_cursor CURSOR
FOR 
SELECT order_num FROM orders ORDER BY order_num;

--������� ������, ����� ������� �� ���� ������
OPEN orders_cursor;

--��������� ������ ������� ������(������� ������ ������ �� �������)
FETCH NEXT FROM orders_cursor INTO @order_num;

--��������� ��� ��������� ������� �� ������� @@FETCH_STATUS, ����� ��������
--������� �� ��� ������ ��� ���������� �� �������
WHILE @@FETCH_STATUS=0
BEGIN
	--�������� ����� ����� ������� ������, ������� �����
	EXECUTE ordertotal @order_num,1, @order_total OUTPUT

	--��������� ����� ����� ������� ������ � �������� �����
	SET @total=@total+@order_total

	--�������� ��������� ������
	FETCH NEXT FROM orders_cursor INTO @order_num;
END

--������� ������
CLOSE orders_cursor;

--������� ������
DEALLOCATE orders_cursor;

--���������� ����������� �������� �����
SELECT @total AS GrandTotal;