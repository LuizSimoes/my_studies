CREATE VIEW historico_reproducao_usuarios AS
SELECT
us.usuario_nm AS `usuario`,
can.cancoes_nm AS `nome`
FROM SpotifyClone.historico
INNER JOIN SpotifyClone.usuario AS us
ON us.usuario_id = historico.usuario_id
INNER JOIN SpotifyClone.cancoes AS can
ON can.cancoes_id = historico.cancoes_id
ORDER BY `usuario`, `nome`;
