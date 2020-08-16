drop trigger if exists delete_osoba;

Delimiter $$
CREATE TRIGGER delete_osoba
BEFORE delete ON osoba
FOR EACH ROW
BEGIN
	delete from hobby
	where osoba=old.id;
	
	update zwierzak set id=(
		select id from osoba
		where id<>old.id 
		order by rand()
		limit 1
	)
	where id=old.id;
END$$
delimiter ;