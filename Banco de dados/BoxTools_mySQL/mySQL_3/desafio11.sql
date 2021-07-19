CREATE VIEW cancoes_premium AS
SELECT
can.cancoes_nm AS `nome`,
COUNT(his.usuario_id) AS `reproducoes`
FROM SpotifyClone.cancoes AS can
INNER JOIN SpotifyClone.historico AS his
ON can.cancoes_id = his.cancoes_id
INNER JOIN SpotifyClone.usuario AS us
ON us.usuario_id = his.usuario_id
WHERE us.plano_id IN (2,3)
GROUP BY `nome`
ORDER BY `nome`;
