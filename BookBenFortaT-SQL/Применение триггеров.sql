CREATE TRIGGER newproduct_trigger ON products
AFTER INSERT
AS
SELECT 'Product added';

DROP TRIGGER newproduct_trigger;

--для обновления триггеров используют ALTER TRIGGER. 
--С другой стороны их можно сначала удалить, а затем снова создать.

--Активизация и дезактивизация триггеров
DISABLE TRIGGER newproduct_trigger ON products; --дезактивизация

ENABLE TRIGGER newproduct_trigger ON products; --активизация

--Выявление назначенных триггеров
SP_HELPTRIGGER products;

--Применение триггеров
--Триггеры типа INSERT – запускаются после выполнения оператора INSERT. 
--В его коде можно обращаться к виртуальной таблице INSERTED для доступа к строкам, вводимым в таблицу.
USE LearnSQL;
GO
CREATE TRIGGER neworder_trigger ON orders
AFTER INSERT
AS
SELECT @@IDENTITY AS order_num; --столбец order_num формируется автоматически
INSERT INTO orders (order_date,cust_id)
VALUES (GETDATE(),10001)

--Триггеры типа DELETE – запускаются после выполнения оператора DELETE. 
--В его коде можно обращаться к виртуальной таблице DELETED для доступа к строкам, удаляемым из таблицы.
--Пример для сохранения удаляемых строк в архивной таблице
USE LearnSQL;
GO
CREATE TRIGGER deleteorder_trigger ON orders
AFTER DELETE
AS
BEGIN
	INSERT INTO orders_archive(order_num, order_date, cust_id)
	SELECT order_num, order_date, cust_id FROM DELETED;
END;
--Триггеры типа UPDATE – запускаются после выполнения оператора UPDATE. 
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