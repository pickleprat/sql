-- write a query to have amount classification for a liesure item, middle class and poor people item (CHEAP) 

SELECT pricetag, COUNT(pricetag) AS tagcount FROM  
(
	-- SELECT Category, Size, Amount, 
	-- IF(Amount > 700, "EXPENSIVE",
	-- 	IF( Amount > 200, 
	-- 		"MIDDLE CLASS", 
	-- 		"CHEAP")) AS pricetag 

	SELECT Category, Size, Amount, 
	CASE WHEN Amount > 700 THEN 'EXPENSIVE'
	     WHEN Amount > 200 THEN 'MIDDLE CLASS' 
	     WHEN Amount > 0 THEN 'CHEAP'
	     ELSE 'FREE' END AS pricetag 
FROM orders) x 
GROUP BY pricetag; 
