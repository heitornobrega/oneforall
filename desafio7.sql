SELECT 
    a.artist_name AS artista,
    al.album_name AS album,
    CAST(COUNT(f.artist_id) AS float) AS seguidores
    FROM 
    SpotifyClone.followed_artist f,
    SpotifyClone.artist a,
    SpotifyClone.album al
    WHERE a.idartist = f.artist_id AND al.idartist = a.idartist
    GROUP BY al.album_id
    ORDER BY seguidores DESC, artista, album;