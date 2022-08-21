SELECT
	CAST(FORMAT(MIN(p.plan_value), 2) AS CHAR) AS faturamento_minimo,
    CAST(MAX(p.plan_value) AS CHAR) AS faturamento_maximo,
    CAST(ROUND(sum(p.plan_value) / count(u.user_plan), 2) AS CHAR) AS faturamento_medio,
	CAST((count(u.user_plan) * sum(p.plan_value) / count(u.idusers)) AS CHAR) AS faturamento_total
	FROM SpotifyClone.users u, SpotifyClone.plans p
    WHERE u.user_plan = p.idplan;