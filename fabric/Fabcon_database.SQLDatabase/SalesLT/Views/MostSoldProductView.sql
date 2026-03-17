CREATE VIEW SalesLT.MostSoldProductView AS
SELECT TOP 1 p.Name AS MostSoldProduct, SUM(sod.OrderQty) AS TotalQuantitySold
FROM SalesLT.SalesOrderDetail sod
JOIN SalesLT.Product p ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalQuantitySold DESC;

GO

