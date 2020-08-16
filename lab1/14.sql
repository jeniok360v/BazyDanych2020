select distinct owner
from pet
where name in (select name
			   from event
			   where date >	(select date
							 from event
							 where (name='Slim' and type='vet')
							 )
				);