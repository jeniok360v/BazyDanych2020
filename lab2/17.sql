drop view if exists myview;

create view myview as 
	select o.id as id, o.plec as plec, h.id as id_hobby, h.typ as typ, z.name as name 
	from osoba as o
	left join hobby as h on o.id=h.osoba
	left join zwierzak as z on z.id=o.id
;




/*
#create view liczba_hobby_osoby as 
(select h.osoba, count(h.id) as liczba, count(z.id) from hobby as h 
left join zwierzak as z on h.osoba=z.id
group by h.osoba);
*/


#select count(hobby.osoba) as l from osoba 
#left join hobby on osoba.id=hobby.osoba group by osoba.id;

/*
select h.osoba, count(h.id) as liczba, count(z.id) from osoba as o left join
hobby as h on h.osoba=o.id left join
zwierzak as z on o.id=z.id group by o.id;
