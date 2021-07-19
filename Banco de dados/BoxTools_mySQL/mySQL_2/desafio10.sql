SELECT
prod.ProductName AS `Produto`,
MIN(ordet.Quantity) AS 'Mínima',
MAX(ordet.Quantity) AS 'Máxima',
ROUND(AVG(ordet.Quantity),2) AS `Média`
FROM w3schools.products AS prod
INNER JOIN w3schools.order_details AS ordet
ON ordet.ProductID = prod.ProductID
GROUP BY `Produto`
HAVING  `Média` > 20
ORDER BY `Média`, `Produto`;
