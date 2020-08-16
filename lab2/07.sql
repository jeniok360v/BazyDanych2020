DROP PROCEDURE IF EXISTS add_records;


delimiter $$

create procedure add_records (in name varchar(20), in num int)
begin
	
	set @x=0;
	myloop: loop
		if name = 'osoba'
		then
			insert into osoba values(
				0,
				(select name_r from names
				order by rand()
				limit 1
				),
				(select surname from names
				order by rand()
				limit 1
				),
				(curdate() - INTERVAL (FLOOR(RAND() * 40) + 18 ) year
				),
				(CASE WHEN FLOOR(RAND()*2) = 1 THEN 'm' ELSE 'f' END)
			);
		 
		elseif name = 'sport'
		then
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
				
		elseif name = 'nauka'
		then
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

		elseif name = 'inne'
		then
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

				

		elseif name = 'hobby'
		then
			set @r=0;
			set @r=(
				case
					WHEN FLOOR(RAND()*3) = 1 THEN 1 
					WHEN floor(rand()*2) = 1 then 2
					ELSE 3 					
				end);
			
			
			insert into hobby values(
				(
				select id from osoba
				order by rand()
				limit 1),
				
				(case
					when @r=1 then (select id from sport order by rand() limit 1)
					when @r=2 then (select id from nauka order by rand() limit 1)
					else (select id from inne order by rand() limit 1)
				end),				
				(@r) 
			);

			
		end if;
		
		SET @x = @x + 1;
		IF @x >= num 
		THEN
			LEAVE myloop;		
		end if;
	end loop myloop;
end $$
delimiter ;
