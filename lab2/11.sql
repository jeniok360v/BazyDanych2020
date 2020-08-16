drop trigger if exists new_hobby;

Delimiter $$
CREATE TRIGGER new_hobby
BEFORE INSERT ON hobby
FOR EACH ROW
BEGIN
	IF (NEW.typ = 1 and new.id not in (select id from sport)) THEN
	insert into sport values (
		0,
		(select sport from locations
		order by rand()
		limit 1
		),
		(CASE
			WHEN FLOOR(RAND()*3) = 1 THEN 1 
			WHEN floor(rand()*2) = 1 then 2
			ELSE 3 
		END),
		(select location from locations
		order by rand()
		limit 1)
	);
	end if;
	
	IF (NEW.typ = 2 and new.id not in (select id from nauka)) THEN
	insert into nauka values (
		0,
		(select nauka from locations
		order by rand()
		limit 1
		),
		(select location from locations
		order by rand()
		limit 1)
	);			
	end if;
	
	if (NEW.typ = 3 and new.id not in (select id from inne)) THEN
	insert into inne values (
		0,
		(select inne from locations
		order by rand()
		limit 1
		),
		(select location from locations
		order by rand()
		limit 1
		),
		(CASE
			WHEN FLOOR(RAND()*2) = 1 THEN true
			ELSE false 
		END)			
	);
	END IF;
END$$
delimiter ;