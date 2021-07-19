USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(user_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE resultado INT;
SELECT
COUNT(user_id)
FROM SpotifyClone.historico AS his
WHERE his.usuario_id = user_id INTO resultado;
RETURN resultado;
END $$

DELIMITER ;

SELECT quantidade_musicas_no_historico(3);
