SELECT
prod.ProductName AS `Produto`,
prod.Price AS `Preço`
FROM w3schools.products AS prod
INNER JOIN w3schools.order_details AS ordet
ON ordet.ProductID = prod.ProductID
WHERE  ordet.Quantity > 80
ORDER BY `Produto`;
