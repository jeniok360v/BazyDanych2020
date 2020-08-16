delete from event 
where name in (select name 
				from pet
				where death is not null);
				
delete from pet
where death is not null;