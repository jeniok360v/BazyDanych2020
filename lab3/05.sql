/*
create table hasla (
	id int auto_increment primary key not null,
	id_osoby int unique not null,
	haslo varchar(255) not null
);
*/
drop procedure if exists check_pass;
delimiter $$
create procedure check_pass(
	in id_osoby int, in haslo_osoby varchar(32), out dataUrodzenia date)
begin 
	if sha1(haslo_osoby)=(
		select haslo from hasla 
		where hasla.id_osoby=id_osoby)
	then
		
		set dataUrodzenia=(
			select osoba.dataUrodzenia from osoba
			where osoba.id=id_osoby
		);
	else 
		
		set dataUrodzenia=(
			select curdate() - interval floor(
				6570 + rand()*36500) day);
	end if;
end$$
delimiter ;


drop procedure if exists add_pass;
delimiter $$
create procedure add_pass(in new_pass varchar(32), in id_osoby int)
begin 
	set @temporary=sha1(new_pass);
	insert into hasla values 
		(0, id_osoby, @temporary);
	set @temporary=null;
end$$
delimiter ;

