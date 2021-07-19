USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(artista VARCHAR(50))
BEGIN
SELECT
art.artista_nm AS `artista`,
alb.album_nm AS `album`
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb
ON art.artista_id = alb.artista_id
WHERE art.artista_nm = artista
ORDER BY `album`;
END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
