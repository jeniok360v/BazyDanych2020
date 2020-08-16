select distinct owner
from pet
where owner not in	(select owner
					 from pet as p
					 inner join event as e
					 on p.name=e.name
					 where e.type='birthday')
order by birth;
/*
select *
from event inner join pet
on pet.name=event.name;