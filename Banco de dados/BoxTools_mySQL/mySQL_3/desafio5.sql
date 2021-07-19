CREATE VIEW top_2_hits_do_momento AS
SELECT
can.cancoes_nm AS `cancao`,
COUNT(his.cancoes_id) AS `reproducoes`
FROM SpotifyClone.cancoes AS can
INNER JOIN SpotifyClone.historico AS his
ON can.cancoes_id = his.cancoes_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
