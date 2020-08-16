select name
from pet
where death is null
order by (curdate()-birth) desc
limit 2;