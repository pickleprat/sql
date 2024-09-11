-- equi join 
SELECT (average + 3 * stdev) AS rubi_max, 
CASE (average - 3 * stdev) 
WHEN (average - 3 * stdev) > 0 THEN (average - 3 * stdev)  
ELSE 0 END AS rubi_min FROM (
SELECT STD(unit_price) AS stdev, AVG(unit_price) AS average FROM (
	SELECT c.customer_name, c.contact_no, 
	       t.unit, t.unit_price, t.quantity, 
	       CAST(CONCAT(tm.year, "-", tm.month, "-", tm.day) AS DATE) 
	AS date_of_transaction 
	FROM (
		SELECT customer_key, time_key, unit, unit_price, quantity 
		FROM Transactions 
	) t, Customers c, Time tm 

	WHERE t.customer_key = c.customer_key AND 
	      tm.time_key = t.time_key AND 
	      c.customer_key LIKE 'C000939'
) d) x;  
