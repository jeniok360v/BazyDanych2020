alter table osoba
add Nazwisko varchar(50) after imie;

alter table zwierzak 
add id int first;

update zwierzak set id = (
	select id from osoba
	where zwierzak.owner = osoba.imie
);

alter table zwierzak
drop owner;