drop procedure if exists hobby_osoby_mod;

delimiter $$
create procedure hobby_osoby_mod (in id_osoby int)
begin
	(select nazwa from sport
	where id in (
		select id from hobby
		where osoba=id_osoby and typ=1
	)) union
	(select nazwa from nauka
	where id in (
		select id from hobby
		where osoba=id_osoby and typ=2
	)) union
	(select nazwa from inne
	where id in (
		select id from hobby
		where osoba=id_osoby and typ=3
	)) union
	(select distinct species from zwierzak
	where id=id_osoby);


end$$
delimiter ;