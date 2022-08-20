DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans(
	idplan INT NOT NULL PRIMARY KEY AUTO_INCREMENT UNIQUE,
	plan_value DOUBLE,
	plan_name VARCHAR(45)
);

CREATE TABLE SpotifyClone.users(
	idusers INT NOT NULL PRIMARY KEY AUTO_INCREMENT UNIQUE,
	user_age INT NOT NULL,
	user_name VARCHAR(45) NOT NULL,
	user_plan INT,
	data_assinatura DATE,
	FOREIGN KEY (user_plan) REFERENCES SpotifyClone.plans(idplan)
);

CREATE TABLE SpotifyClone.artist(
idartist INT NOT NULL PRIMARY KEY AUTO_INCREMENT UNIQUE,
artist_name VARCHAR(45) NOT NULL
);

CREATE TABLE SpotifyClone.followed_artist(
	user_id INT NOT NULL,
	artist_id INT,
	CONSTRAINT PRIMARY KEY(artist_id, user_id),
	FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist (idartist),
	FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (idusers)
);

CREATE TABLE SpotifyClone.album(
	album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT UNIQUE,
    idartist INT,
    album_name VARCHAR(45),
    release_year YEAR,
    FOREIGN KEY (idartist) REFERENCES SpotifyClone.artist(idartist)
    );

CREATE TABLE SpotifyClone.songs(
	song_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT UNIQUE,
    artist_id INT,
    album_id INT,
    song_name VARCHAR(45),
    length INT,
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(idartist),
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
);

CREATE TABLE SpotifyClone.historico(
	idusers INT,
    played_song INT,
    played_on DATETIME,
    CONSTRAINT PRIMARY KEY(idusers, played_song),
	FOREIGN KEY (idusers) REFERENCES SpotifyClone.users(idusers),
    FOREIGN KEY (played_song) REFERENCES SpotifyClone.songs(song_id)
    
);

  INSERT INTO SpotifyClone.plans(idplan, plan_value, plan_name)
	  VALUES
		(1, 0.00, 'gratuito'),
		(2, 7.99, 'familiar'),
		(3, 6.99, 'pessoal'),
		(4, 5.99, 'universitario');

  INSERT INTO SpotifyClone.users(user_age, user_name, user_plan, data_assinatura)
	  VALUES
		(82, 'Barbara Liskov', 1, '2019-10-20'),
		(58, 'Robert Cecil Martin', 1, '2017-01-06'),
		(37, 'Ada Lovelace', 2, '2017-12-30'),
		(46, 'Martin Fowler', 2, '2017-01-17'),
		(58, 'Sandi Metz', 2, '2018-04-29'),
		(19, 'Paulo Freire', 4, '2018-02-14'),
		(26, 'Bell Hooks', 4, '2018-01-05'),
		(85, 'Christopher Alexander', 3, '2019-06-05'),
		(45, 'Judith Butler', 3, '2020-05-13'),
		(58, 'Jorge Amado', 3, '2017-02-17');

INSERT INTO SpotifyClone.artist(artist_name)
	VALUES
		('Beyoncé'),
		('Queen'),
		('Elis Regina'),
		('Baco Exu do Blues'),
		('Blind Guardian'),
		('Nina Simone');

INSERT INTO SpotifyClone.followed_artist(user_id, artist_id)
	VALUES
		(1, 1),
        (1, 2),
        (1, 3),
        (2, 1),
        (2, 3),
        (3, 2),
        (4, 4),
        (5, 5),
        (5, 6),
        (6, 6),
        (6, 1),
        (7, 6),
        (9, 3),
        (10, 2);

INSERT INTO SpotifyClone.album(idartist, album_name, release_year)
	VALUES
		(1, 'Renaissance', '2022'),
        (2, 'Jazz', '1978'),
        (2, 'Hot Space', '1982'),
        (3, 'Falso Brilhante', '1998'),
        (3, 'Vento de Maio', '2001'),
        (4, 'QVVJFA?', '2003'),
        (5, 'Somewhere Far Beyond', '2007'),
        (6, 'I Put A Spell On You', '2012');

INSERT INTO SpotifyClone.songs(artist_id, album_id, song_name, length)
	VALUES
		(1, 1, 'BREAK MY SOUL', 279),
        (1, 1, 'VIRGO’S GROOVE', 369),
        (1, 1, 'ALIEN SUPERSTAR', 116),
        (2, 2, 'Don’t Stop Me Now', 203),
        (2, 3, 'Under Pressure', 152),
        (3, 4, 'Como Nossos Pais', 105),
        (3, 5, 'O Medo de Amar é o Medo de Ser Livre', 207),
        (4, 6, 'Samba em Paris', 267),
        (5, 7, 'The Bard’s Song', 244),
        (6, 8, 'Feeling Good', 100);
INSERT INTO SpotifyClone.historico(idusers, played_song, played_on)
	VALUES
		(1, 8, '2022-02-28 10:45:55'),
        (1, 2, '2020-05-02 05:30:35'),
        (1, 10, '2020-03-06 11:22:33'),
        (2, 10, '2022-08-05 08:05:17'),
        (2, 7, '2020-01-02 07:40:33'),
        (3, 10, '2020-11-13 16:55:13'),
        (3, 2, '2020-12-05 18:38:30'),
        (4, 8, '2021-08-15 17:10:10'),
        (5, 8, '2022-01-09 01:44:33'),
        (5, 5, '2020-08-06 15:23:43'),
        (6, 7, '2017-01-24 00:31:17'),
        (6, 1, '2017-10-12 12:35:20'),
        (7, 4, '2011-12-15 22:30:49'),
        (8, 4, '2012-03-17 14:56:41'),
        (9, 9, '2022-02-24 21:14:22'),
        (10, 3, '2015-12-13 08:30:22');
