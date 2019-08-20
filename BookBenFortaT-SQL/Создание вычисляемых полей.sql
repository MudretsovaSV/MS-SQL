SELECT * FROM [dbo].[orderitems]
SELECT	[prod_id], 
		[quantity],
		[item_price],
		quantity*item_price AS expanded_price
FROM [dbo].[orderitems]
WHERE [order_num]=20005;
SELECT RTrim(LTrim('    abc   '));
SELECT GETDATE()
