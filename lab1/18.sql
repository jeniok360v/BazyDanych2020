drop view if exists v;

create view v as
select p.name, p.owner, e.performer, e.type
from pet as p
	inner join event as e
	on p.name=e.name
;

UPDATE v
SET performer = owner
WHERE type<>'litter' and type<>'vet';

update v
set performer = 'Drewnowski'
where type='vet';

update v
set performer = 'Frankowski'
where type='litter';