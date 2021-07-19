SELECT
CONCAT(empl.FirstName, ' ', empl.LastName) AS `Nome completo`,
COUNT(ord.EmployeeID) AS `Total de pedidos`
FROM w3schools.orders AS ord
INNER JOIN w3schools.employees AS empl
ON ord.EmployeeID = empl.EmployeeID
GROUP BY `Nome completo`
ORDER BY `Total de pedidos`;
