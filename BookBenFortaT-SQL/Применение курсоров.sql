--Создание и удаление курсоров
DECLARE orders_cursor CURSOR
FOR 
SELECT order_num
FROM orders
ORDER BY order_num;

DEALLOCATE orders_cursor;

--Открытие и закрытие курсоров
Open orders_cursor;
CLOSE orders_cursor;
--------------------------------
DECLARE orders_cursor CURSOR
FOR 
SELECT order_num FROM orders ORDER BY order_num;
OPEN orders_cursor;
CLOSE orders_cursor;
DEALLOCATE orders_cursor;

--Извлечение данных из курсора
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
--объявить локальные переменные
DECLARE @order_num INT; 
DECLARE @order_total MONEY; 
DECLARE @total MONEY;

--инициализировать переменную  @total
SET  @total=0

--объявить курсор
DECLARE orders_cursor CURSOR
FOR 
SELECT order_num FROM orders ORDER BY order_num;

--открыть курсор, чтобы извлечь из него данные
OPEN orders_cursor;

--Выполнить первую выборку данных(извлечь первую строку из таблицы)
FETCH NEXT FROM orders_cursor INTO @order_num;

--Проверить код состояния выборки из функции @@FETCH_STATUS, чтобы выяснить
--имеются ли еще строки для извлечения из курсора
WHILE @@FETCH_STATUS=0
BEGIN
	--Получить общую сумму данного заказа, включая налог
	EXECUTE ordertotal @order_num,1, @order_total OUTPUT

	--Прибавить общую сумму данного заказа к итоговой сумме
	SET @total=@total+@order_total

	--Получить следующую строку
	FETCH NEXT FROM orders_cursor INTO @order_num;
END

--Закрыть курсор
CLOSE orders_cursor;

--Удалить курсор
DEALLOCATE orders_cursor;

--отобразить вычисленную итоговую сумму
SELECT @total AS GrandTotal;