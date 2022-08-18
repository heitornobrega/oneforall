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
