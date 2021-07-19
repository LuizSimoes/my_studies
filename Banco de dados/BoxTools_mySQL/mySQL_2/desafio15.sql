USE hr;
DELIMITER $$

CREATE PROCEDURE buscar_media_por_cargo(cargo varchar(50)) -- parâmetros
BEGIN
SELECT ROUND(AVG(e.SALARY), 2) AS 'Média salarial' FROM
employees AS e
INNER JOIN jobs AS j
ON j.JOB_ID = e.JOB_ID
WHERE j.JOB_TITLE = cargo;
END $$

DELIMITER ;

CALL buscar_media_por_cargo('Programmer');
