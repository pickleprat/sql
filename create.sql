CREATE TABLE IF NOT EXISTS Payments (
	payment_key VARCHAR(100) PRIMARY KEY,  
	transaction_type VARCHAR(10), 
	bank_name VARCHAR(10) 
);

CREATE TABLE IF NOT EXISTS Customers (
	customer_key VARCHAR(100) PRIMARY KEY, 
	customer_name VARCHAR(100), 
	contact_no VARCHAR(100), 
	nid VARCHAR(100) 
);  

CREATE TABLE IF NOT EXISTS Items (
	item_key VARCHAR(100) PRIMARY KEY, 
	item_name VARCHAR(100), 
	description VARCHAR(100), 
	unit_price DECIMAL(10, 2),  
	man_country VARCHAR(100), 
	supplier VARCHAR(100), 
	unit VARCHAR(100) 
);  

CREATE TABLE IF NOT EXISTS Store(
	store_key VARCHAR(100) PRIMARY KEY, 
	division VARCHAR(100), 
	district VARCHAR(100), 
	upazilla VARCHAR(100) 
); 

CREATE TABLE IF NOT EXISTS Time (
	time_key VARCHAR(100) PRIMARY KEY, 
	date DATETIME, 
	hour INTEGER, 
	day INTEGER, 
	week VARCHAR(50), 
	month INTEGER, 
	quarter ENUM("Q1", "Q2", "Q3", "Q4"), \
	year INTEGER
);  

CREATE TABLE IF NOT EXISTS Transactions (
	payment_key VARCHAR(100), 
	customer_key VARCHAR(100), 
	time_key VARCHAR(100), 
	store_key VARCHAR(100), 
	item_key VARCHAR(100), 
	quantity INTEGER, 
	unit VARCHAR(50), 
	uniy_price DECIMAL(10, 2), 
	total_price DECIMAL(10, 2) 
);  
