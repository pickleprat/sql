 -- note that where clause is evaluated before the select state ment 
SELECT 
(3 * stdev + amt) as maxima, 
IF(amt - 3 * stdev > 0, amt - 3 * stdev, 0) as minima 
	FROM 
	( SELECT 
		std(amount) as stdev, avg(amount) as amt 
		FROM orders ) x;

-- FROM -> WHERE -> SELECT 
