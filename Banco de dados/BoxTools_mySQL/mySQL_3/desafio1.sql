DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE plano(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  plano_nm VARCHAR(45) NOT NULL,
  plano_vl DECIMAL(4, 2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE usuario(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_nm VARCHAR(45) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
) ENGINE = InnoDB;

CREATE TABLE artista(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  artista_nm VARCHAR(45) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE album(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_nm VARCHAR(100) NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS cancoes (
  cancoes_id INT PRIMARY KEY AUTO_INCREMENT,
  cancoes_nm VARCHAR(200) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES album(album_id)
) ENGINE = InnoDB;

CREATE TABLE historico(
  usuario_id INT NOT NULL,
  cancoes_id INT NOT NULL,
  -- Aqui peguei duas FK como PK e como não existia dava erro(estudar)
  FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
  FOREIGN KEY (cancoes_id) REFERENCES cancoes(cancoes_id),
  PRIMARY KEY (usuario_id, cancoes_id)
) ENGINE = InnoDB;

CREATE TABLE artista_usuario(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artista(artista_id),
  PRIMARY KEY (usuario_id, artista_id)
) ENGINE = InnoDB;

INSERT INTO plano(plano_nm, plano_vl)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO usuario(usuario_nm, idade,plano_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO artista(artista_nm)
VALUES
  ('Walter Phoenix'),
  ('Lance Day'),
  ('Peter Strong'),
  ('Freedie Shannon');

INSERT INTO album(album_nm, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 3),
  ('Incandescent', 2), 
  ('Temporary Culture', 4);

INSERT INTO cancoes(cancoes_nm, album_id)
VALUES 
  ("Soul For Us", 1),
  ("Reflections Of Magic", 1),
  ("Dance With Her Own", 1),
  ("Troubles Of My Inner Fire", 2), 
  ("Time Fireworks", 2),
  ("Magic Circus", 3), 
  ("Honey, So Do I", 3),
  ("Sweetie, Let's Go Wild", 3),
  ("She Knows", 3),
  ("Fantasy For Me", 4),  
  ("Celebration Of More", 4),
  ("Rock His Everything", 4),
  ("Home Forever", 4),
  ("Diamond Power", 4),
  ("Honey, Let's Be Silly", 4),
  ("Thang Of Thunder", 5),
  ("Words Of Her Life", 5),
  ("Without My Streets", 5);

INSERT INTO historico(usuario_id, cancoes_id)
VALUES
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 13),
  (2, 17),
  (2, 2),
  (2, 15),
  (3, 4),
  (3, 16),
  (3, 6),
  (4, 3),
  (4, 18),
  (4, 11);

INSERT INTO artista_usuario (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 4),
  (2, 1),
  (2, 2),
  (3, 3),
  (3, 1),
  (4, 4);
