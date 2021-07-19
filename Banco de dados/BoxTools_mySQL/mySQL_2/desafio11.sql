SELECT
a.ContactName AS 'Nome',
a.Country AS 'País',
COUNT(b.Country) AS 'Número de compatriotas'
FROM w3schools.customers AS a, w3schools.customers AS b
WHERE a.Country = b.Country
AND a.ContactName <> b.ContactName
GROUP BY a.CustomerID
ORDER BY a.ContactName;
