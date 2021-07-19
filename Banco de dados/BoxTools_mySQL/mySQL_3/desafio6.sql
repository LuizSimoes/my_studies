CREATE VIEW faturamento_atual AS
SELECT
ROUND(MIN(plan.plano_vl), 2) AS faturamento_minimo,
ROUND(MAX(plan.plano_vl), 2) AS faturamento_maximo,
ROUND(AVG(plan.plano_vl), 2) AS faturamento_medio,
ROUND(SUM(plan.plano_vl), 2) AS faturamento_total
FROM SpotifyClone.usuario AS us
INNER JOIN SpotifyClone.plano AS plan
ON plan.plano_id = us.plano_id;
