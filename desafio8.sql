SELECT 
ar.artist_name as artista,
al.album_name AS album
FROM SpotifyClone.album al, SpotifyClone.artist ar
WHERE al.idartist = ar.idartist AND ar.idartist = 3
;