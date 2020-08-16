select name, birth
from pet
where	birth=(select min(birth)
			   from pet
			   where death is null)
;