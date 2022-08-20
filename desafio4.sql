select
	user_name AS usuario,
    IF(MAX(played_on) > '2021-01-01 00:00:00', 'Usuário ativo', 'Usuário inativo') AS status_usuario
 FROM SpotifyClone.users u, SpotifyClone.historico h
 WHERE u.idusers = h.idusers
 GROUP BY u.user_name
 ORDER BY u.user_name;