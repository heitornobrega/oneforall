SELECT user_name AS usuario, COUNT(user_name) AS qt_de_musicas_ouvidas, ROUND(SUM(length)/60, 2) AS total_minutos
	FROM SpotifyClone.users u, SpotifyClone.songs s, SpotifyClone.historico h
    WHERE u.idusers = h.idusers AND h.played_song = s.song_id
    GROUP BY u.user_name
    ORDER BY u.user_name;