-- use the union all command to stack tables atop each other in view 

(SELECT Category, Amount FROM orders ORDER BY rand() LIMIT 10)   
UNION ALL 
(SELECT '----------------------------', null FROM orders LIMIT 1) 
UNION ALL
(SELECT pricetag, Amount FROM orders ORDER BY rand() LIMIT 10); 
