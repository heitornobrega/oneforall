SELECT
song_name AS cancao,
COUNT(*) AS reproducoes
FROM  SpotifyClone.songs s, SpotifyClone.historico h
WHERE  h.played_song = s.song_id
GROUP BY played_song
ORDER BY reproducoes DESC, cancao
LIMIT 2;