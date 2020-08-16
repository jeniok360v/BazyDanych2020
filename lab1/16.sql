select distinct pet1.owner,pet2.owner
from pet as pet1 cross join pet as pet2
where pet1.species<pet2.species and pet1.owner<>pet2.owner;