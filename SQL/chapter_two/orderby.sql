SELECT * FROM (
	SELECT Category, Size, Qty, Amount, pricetag 
	FROM orders ORDER BY rand() 
	LIMIT 10 
) ORDER BY pricetag DESC, Qty; 

-- you can also run 
-- SELECT * FROM (
-- 	SELECT Category, Size, Qty, Amount, pricetag 
-- 	FROM orders ORDER BY rand() 
-- 	LIMIT 10 
-- ) ORDER BY 5 DESC, 3 ASC; 
--
