SELECT
UCASE(CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME)) AS `Nome completo`,
jh.START_DATE AS `Data de início`,
e.SALARY AS 'Salário'
FROM hr.employees AS e
INNER JOIN hr.job_history AS jh
ON jh.EMPLOYEE_ID = e.EMPLOYEE_ID
WHERE MONTH(jh.START_DATE) = 01 || MONTH(jh.START_DATE) = 02 || MONTH(jh.START_DATE) = 03
ORDER BY `Nome completo`, `Data de início`;
