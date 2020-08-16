#drop table if exists t_pomocnicza;

set @q='
	select (case
		when h.typ=1 then s.nazwa
		when h.typ=2 then n.nazwa
		when h.typ=3 then i.nazwa
	end) as nazwa from hobby as h 
	left join osoba as o on h.osoba=o.id 
	left join sport as s on h.id=s.id
	left join nauka as n on h.id=n.id
	left join inne as i on h.id=i.id
	where o.id=?';
prepare stmt from @q;
set @id = 1021;
execute stmt using @id;
deallocate prepare stmt;


/*
set @s='insert into t_pomocnicza 
		Select distinct nazwa
		from sport';
set @n='insert into t_pomocnicza 
		Select distinct nazwa
		from nauka';		
set @i='insert into t_pomocnicza 
		Select distinct nazwa
		from inne';		
	
create table t_pomocnicza (nazwa varchar(50));
	
prepare stmt from @s;
execute stmt;

prepare stmt from @n;
execute stmt;

prepare stmt from @i;
execute stmt;


deallocate prepare stmt;

select * from t_pomocnicza;
*/


/*
select distinct nazwa
from inne union
select distinct nazwa
from sport union
select distinct nazwa
from nauka;
*/
