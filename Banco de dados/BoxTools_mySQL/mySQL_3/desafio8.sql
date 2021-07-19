USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE
ON usuario
FOR EACH ROW
BEGIN
DELETE FROM historico WHERE usuario_id = OLD.usuario_id;
DELETE FROM artista_usuario WHERE usuario_id = OLD.usuario_id;
END; $$

DELIMITER ;
