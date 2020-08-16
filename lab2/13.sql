drop trigger if exists delete_nauka;
drop trigger if exists update_nauka;

Delimiter $$
CREATE TRIGGER delete_nauka
BEFORE delete ON nauka
FOR EACH ROW
BEGIN
	delete from hobby
	where typ=2 and id = (
		select id from sport where nazwa=old.nazwa);
END$$

CREATE TRIGGER update_nauka
BEFORE update ON nauka
FOR EACH ROW
BEGIN
	delete from hobby
	where typ=2 and id in (
		select id from nauka where nazwa=old.nazwa);
END$$

delimiter ;