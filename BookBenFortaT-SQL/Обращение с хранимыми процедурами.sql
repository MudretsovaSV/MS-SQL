--выполнение хранимых процедур
EXECUTE productpricing	@cheap OUTPUT,
						@expensive OUTPUT,
						@average OUTPUT

CREATE PROCEDURE productpricing AS
BEGIN
	SELECT Avg(prod_price) AS priceaverage
	FROM products;
END;

EXECUTE productpricing;
--удаление хранимых процедур
DROP PROCEDURE productpricing;

--Обращение с параметрами хранимых процедур
CREATE PROCEDURE productpricing
	@price_min MONEY OUTPUT,
	@price_max MONEY OUTPUT,
	@price_avg MONEY OUTPUT
AS
BEGIN
	SELECT @price_min=MIN(prod_price)
	FROM products;
	SELECT @price_max=MAX(prod_price)
	FROM products;
	SELECT @price_avg=Avg(prod_price)
	FROM products;
END;

DECLARE @cheap  MONEY
DECLARE	@expensive  MONEY
DECLARE @average  MONEY

EXECUTE productpricing	@cheap OUTPUT,
						@expensive OUTPUT,
						@average OUTPUT
SELECT @cheap Cheap, @expensive Expensive, @average Average;
-------------------------------------------------------------------
CREATE PROCEDURE ordertotal
	@order_num INT,
	@order_total MONEY OUTPUT
AS
BEGIN
	SELECT @order_total = Sum(item_price*quantity)
	FROM orderitems
	WHERE order_num = @order_num;
END;

DECLARE @order_total  MONEY
EXECUTE ordertotal 20005, @order_total OUTPUT
SELECT @order_total

DECLARE @order_total  MONEY
EXECUTE ordertotal 20009, @order_total OUTPUT
SELECT @order_total

DROP PROCEDURE ordertotal;
--Создание логически развитых хранимых процедур
CREATE PROCEDURE ordertotal
	@order_num INT,
	@taxable BIT,
	@order_total MONEY OUTPUT
AS
BEGIN
DECLARE @total  MONEY;
DECLARE @taxrate INT;
SET @taxrate=6;

SELECT @total = Sum(item_price*quantity)
FROM orderitems
WHERE order_num = @order_num;

IF @taxable = 1
SET @total=@total+(@total/100*@taxrate);
SELECT @order_total=@total;
END;


DECLARE @order_total  MONEY
EXECUTE ordertotal 20005,0, @order_total OUTPUT
SELECT @order_total

DECLARE @order_total  MONEY
EXECUTE ordertotal 20005, 1, @order_total OUTPUT
SELECT @order_total