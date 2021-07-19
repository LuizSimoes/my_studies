CREATE VIEW perfil_artistas AS
SELECT
art.artista_nm AS `artista`,
alb.album_nm AS `album`,
COUNT(seg.usuario_id) AS `seguidores`
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.artista_usuario AS seg
ON art.artista_id = seg.artista_id
INNER JOIN SpotifyClone.album AS alb
ON art.artista_id = alb.artista_id
GROUP BY `artista`, `album`
ORDER BY `seguidores` DESC, `artista`, `album`;
