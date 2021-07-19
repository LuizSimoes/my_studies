CREATE VIEW top_3_artistas AS
SELECT
art.artista_nm AS `artista`,
COUNT(seg.usuario_id) AS `seguidores`
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.artista_usuario AS seg
ON art.artista_id = seg.artista_id
GROUP BY `artista`
ORDER BY `seguidores` DESC LIMIT 3;
