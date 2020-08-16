/*
DROP PROCEDURE IF EXISTS salary_up;
DELIMITER $$
CREATE PROCEDURE salary_up (IN profession CHAR(20))
BEGIN
DECLARE id_pracy INT;
DECLARE not_done BOOLEAN DEFAULT TRUE;
DECLARE cur1 CURSOR FOR SELECT praca.id FROM praca WHERE praca.id_zawod =
(SELECT zawody.id FROM zawody WHERE zawody.nazwa = profession);

DECLARE continue HANDLER FOR NOT FOUND SET not_done=FALSE;

OPEN cur1;
SET autocommit = 0;
START TRANSACTION;
WHILE not_done DO
fetch cur1 into  id_pracy;
UPDATE praca SET praca.placa = praca.placa*1.1 WHERE id = id_pracy;
END WHILE;
COMMIT;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE salary_up (IN profession CHAR(20))
BEGIN
	DECLARE id_pracy INT;
	DECLARE not_done BOOLEAN DEFAULT TRUE;
	DECLARE cur1 CURSOR FOR SELECT praca.id FROM praca 
	\WHERE praca.id_zawod = (SELECT zawody.id FROM zawody WHERE
	zawody.nazwa = profession);

	DECLARE continue HANDLER FOR NOT FOUND SET not_done=FALSE;

	OPEN cur1;
	SET autocommit = 0;
	START TRANSACTION;
		WHILE not_done DO
			fetch cur1 into id_pracy;
			UPDATE praca SET praca.placa = praca.placa*1.1 WHERE id = id_pracy;
		END WHILE;
	COMMIT;
END $$
DELIMITER ;

*/
delimiter $$ 
create procedure salary (in zawod varchar(32))
begin
	declare id_pracy int;
	declare not_done boolean default true;
	declare cur1 cursor for
		select praca.id_osoby from praca where
		praca.id_zawodu = (
			select zawody.id from zawody where zawody.nazwa = zawod
		);
	declare continue handler for not found set not_done=false;
	
	open cur1;
	set autocommit=0;
	start transaction;
		while not_done do
			fetch cur1 into id_pracy;
			update praca set praca.zarobek = praca.zarobek*1.1 
			where id_osoby = id_pracy;
		end while;
	commit;
	if ( 
		(select zarobek from praca where id_zawodu = (
			select zawody.id from zawody where zawody.nazwa = zawod)
			order by zarobek desc limit 1) >
		(select pensja_max from zawody where nazwa= zawod)
	)
	then 
		rollback;
	end if;
end $$
delimiter ;



