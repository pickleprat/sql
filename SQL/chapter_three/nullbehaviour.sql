CREATE TABLE IF NOT EXISTS source (main_id INT ); 
INSERT INTO source VALUES (10), (20), (30), (40); 

CREATE TABLE IF NOT EXISTS target ( target_id INT); 
INSERT INTO target VALUES (20), (50), (null); 

-- results in an empty set when it should result 10, 30, 40
SELECT main_id FROM source WHERE main_id NOT IN (
	SELECT target_id FROM target 
); 

-- the reason is behaviour of nulls in mysql 
-- anything compared with null returns a null 
-- True or Null returns True 
-- False or null returns Null 
-- True And Null returns a Null 
-- False and Null returns a False 
-- Not Null is Null 

-- when you run the above query you are essentially running this 
SELECT main_id FROM source WHERE NOT (
	main_id = 20 OR -- 20 = 20 => True  
	main_id = 50 OR -- 20 = 50 => False  
	main_id = NULL -- always null => Null  
); 

-- NOT ( True Or False Or Null ) 
-- Not (True Or Null) => Not (True)  
-- False 
-- which is fair, since 20 exists inside the target  


SELECT main_id FROM source WHERE NOT (
	main_id = 20 OR -- 30 = 20 => False 
	main_id = 50 OR -- 30 = 50 => False  
	main_id = NULL -- always null => Null  
); 


-- NOT ( False Or False Or Null ) 
-- Not (False Or Null) => Not (Null)  
-- Null 
-- which isn't true which means it won't select this element either 
-- therefore it returns an empty set 

-- to remedy this you can either use coalesce 
SELECT main_id FROM source WHERE main_id NOT IN (
	SELECT COALESCE(target_id, 0) FROM target 
); 

-- but this would create a fake 0 in the target_id column, which won't really be a problem unless there's a 0 in the main_id and 
-- not in the target ids. You can always make sure that the target_id is being coalesced with a value that doesn't exist in the main_id 

-- you could also do 
SELECT main_id FROM source WHERE main_id NOT IN (
	SELECT target_id FROM target WHERE target_id 
	IS NOT NULL 
); 

-- but a more appropirate way to do it is as follows: 
SELECT main_id FROM source src WHERE main_id NOT EXISTS (
	SELECT target_id FROM target tgt WHERE 
	src.main_id = tgt.target_id
)
-- this method is called a correlated subquery in which each value in the outer query 
-- is iteratively referenced in the correlated subquery 




