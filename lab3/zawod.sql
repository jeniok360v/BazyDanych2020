drop table if exists cr_zawody;

create table cr_zawody(
	id int primary key auto_increment not null,
	zawod varchar(50)
);

insert into cr_zawody values 
	
	(0, 'Anestezjolog'),
	(0, 'Artysta'),
	(0, 'Bankowiec'),
	(0, 'Barista'),
	(0, 'Barman'),
	(0, 'Biotechnolog'),
	(0, 'Budowlaniec'),
	(0, 'Dziennikarz'),
	(0, 'Ekonomista'),
	(0, 'Fotograf'),
	(0, 'Hostessa'),
	(0, 'Informatyk'),
	(0, 'Inzynier'),
	(0, 'Kosmetyczka'),
	(0, 'Ksiegowa'),
	(0, 'Kucharz'),
	(0, 'Lekarz'),
	(0, 'Logistyk'),
	(0, 'Maszynista'),
	(0, 'Nauczyciel'),
	(0, 'Naukowiec');
