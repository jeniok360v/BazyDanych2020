select name, owner
from pet
where	month(birth)>0 and month(birth)<7;