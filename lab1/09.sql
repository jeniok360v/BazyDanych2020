select owner
from pet
group by owner
having count(name)>1;