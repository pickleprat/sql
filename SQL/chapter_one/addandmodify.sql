ALTER TABLE orders ADD COLUMN pricetag VARCHAR(20); 

UPDATE orders 
SET pricetag = CASE WHEN Amount > 700 THEN 'EXPENSIVE'
     WHEN Amount > 200 THEN 'MIDDLE CLASS' 
     WHEN Amount > 0 THEN 'CHEAP'
     ELSE 'FREE' END;  
