drop procedure if exists max_hobby;

delimiter $$
create procedure max_hobby ()
begin
	set @max=(
		select count(osoba) as l 
		from hobby 
		group by osoba 
		order by l desc 
		limit 1
	);

	select imie, year(curdate())-year(dataUrodzenia) as wiek 
	from osoba
	where id in (
		select osoba from hobby
		group by osoba
		having count(osoba)=@max
	);
end $$
delimiter ;
