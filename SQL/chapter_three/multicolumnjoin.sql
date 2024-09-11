CREATE OR REPLACE VIEW V AS (
	SELECT date, status, category, size, qty 
	FROM orders ORDER BY rand() LIMIT 10 ); 

SELECT v.date, v.status, v.category, v.size, v.qty, 
       o.Amount, o.FulfilledBy
FROM V v JOIN orders o ON (
	v.date = o.date AND 
	v.status = o.status AND 
	v.category = o.category AND 
	v.size = o.size AND 
	v.qty = o.qty ); 

--- you could also do 

SELECT date, status, category, size, qty, amount, fulfilledby 
FROM orders WHERE (date, status, category, size, qty) IN (
	SELECT date, status, category, size, qty FROM orders 
	INTERSECT 
	SELECT date, status, category, size, qty FROM V
);  
