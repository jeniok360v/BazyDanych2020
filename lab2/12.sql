drop trigger if exists delete_sport;

Delimiter $$
CREATE TRIGGER delete_sport
BEFORE delete ON sport
FOR EACH ROW
BEGIN
	delete from hobby
	where typ=1 and id = (
		select id from sport where id=old.id);
END$$
delimiter ;