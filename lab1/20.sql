select count(species) as amount
from pet
group by species
order by amount desc;