/* 1. List the product id, product name, unit price and category name of all products.
Order by category name and within that, by product name. */
SELECT 
	ProductID, ProductName, UnitPrice, CategoryName
From
	northwind. products p
JOIN 
	northwind. categories c
    ON c.CategoryID = p.CategoryID
ORDER BY
	c.CategoryName, p.ProductName;
        
/* 2. List the product id, product name, unit price and supplier name of all products
that cost more than $75. Order by product name. */
SELECT
	ProductID, ProductName, UnitPrice, CompanyName
FROM
	northwind. products p
JOIN
	northwind. suppliers s
    ON s.SupplierID = p.SupplierID
WHERE
	UnitPrice > 75
ORDER BY
	ProductName;
    
/* 3. List the product id, product name, unit price, category name, and supplier name
of every product. Order by product name. */
SELECT
	ProductID,
    ProductName,
    UnitPrice,
    CategoryName,
    CompanyName
FROM
	northwind. products p
JOIN
	northwind. categories c
	ON c.CategoryID = p.CategoryID
JOIN
	northwind. suppliers s
    ON s.SupplierID = p.SupplierID
ORDER BY
	ProductName;
    
/* 4. What is the product name(s) and categories of the most expensive products?
HINT: Find the max price in a subquery and then use that in your more complex
query that joins products with categories. */
SELECT
	ProductName,
    CategoryName
FROM
	northwind. products p
JOIN
	northwind. categories c
    ON c.CategoryID = p.CategoryID
WHERE
	UnitPrice IN (SELECT MAX(UnitPrice)
    FROM northwind. products);
    
/* 5. List the order id, ship name, ship address, and shipping company name of every
order that shipped to Germany. */
SELECT
	*
FROM
	northwind. orders o
JOIN
	northwind. shippers s
    ON s.CompanyName = CompanyName
WHERE
	ShipCountry = "Germany";

/* 6. List the order id, order date, ship name, ship address of all orders that ordered
"Sasquatch Ale"? */
SELECT
	OrderID,
    OrderDate,
    ShipName,
    ShipAddress
FROM
	northwind. orders o
JOIN
	northwind. products p
    ON p.ProductName = ProductName
WHERE
	ProductName = "Sasquatch Ale";