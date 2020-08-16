select owner, name
from pet
where name not in (select distinct name 
				   from event
				   where type = 'birthday');