/* 1. Add a new supplier. */
INSERT INTO
	northwind. suppliers(SupplierID, CompanyName, ContactTitle, Address)
VALUES
	(null, 'TacoDeli', 'Team Lead', '1878 Sylvan Ave');

/* 2. Add a new product provided by that supplier */
INSERT INTO
	northwind. products(ProductID, ProductName, SupplierID)
VALUES
	(null,'Taco', 30);

/* 3. List all products and their suppliers */
SELECT
	ProductName,
    CompanyName AS Supplier
FROM
	northwind. products p
JOIN
	northwind. suppliers s
    ON s.SupplierID = p.SupplierID;

/* 4. Raise the price of your new product by 15%. */
-- Had to give an initial price since increasing 0 by 15% will still result in being 0
UPDATE northwind. products p
SET UnitPrice = 3.00
WHERE ProductID = 80;

-- This part of the script is what will increase the UnitPrice by 15%
UPDATE
	northwind. products p
SET
	UnitPrice = UnitPrice + (UnitPrice * 0.15)
WHERE
	ProductID = 80;

/* 5. List the products and prices of all products from that supplier. */
SELECT
	CompanyName AS Supplier,
	ProductName,
    UnitPrice
FROM
	northwind. products p
JOIN
	northwind. suppliers s
    ON s.SupplierID = p.SupplierID
WHERE
	CompanyName = "TacoDeli";
    
/* 6. Delete the new product. */
DELETE FROM 
	northwind. products p
WHERE
	ProductID = 80;
    
/* 7. Delete the new supplier. */
DELETE FROM 
	northwind. suppliers s
WHERE
	SupplierID = 30;
    
/* 8. List all products. */
SELECT
	ProductName
FROM
	northwind. products
ORDER BY
	ProductName;
    
/* 9. List all suppliers. */
SELECT
	CompanyName AS Suppliers
FROM
	northwind. suppliers
ORDER BY
	Suppliers;