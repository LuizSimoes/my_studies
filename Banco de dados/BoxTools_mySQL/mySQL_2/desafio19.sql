USE hr;
DELIMITER $$

CREATE FUNCTION exibir_quantidade_pessoas_contratadas_por_mes_e_ano(mes INT, ano INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE resultado INT;
SELECT
COUNT(EMPLOYEE_ID)
FROM hr.employees
WHERE YEAR(HIRE_DATE) = ano
AND
MONTH(HIRE_DATE) = mes INTO resultado;
RETURN resultado;
END $$

DELIMITER ;

SELECT exibir_quantidade_pessoas_contratadas_por_mes_e_ano(6,1987);
