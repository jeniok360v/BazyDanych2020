drop table if exists zwierzak;

create table zwierzak (
  name    VARCHAR(20),
  owner   VARCHAR(20),
  species VARCHAR(20),
  sex     CHAR(1),
  birth   DATE,
  death   DATE
);

insert into hobby.zwierzak
	select * 
	from menagerie.pet;


insert into osoba(imie, dataUrodzenia, plec)
select owner, '1980-01-01', 'm' from zwierzak group by owner;

UPDATE osoba SET dataUrodzenia = (curdate() - INTERVAL FLOOR(RAND() * 40) year);
UPDATE osoba SET plec = (CASE WHEN FLOOR(RAND()*2) = 1 THEN 'm' ELSE 'f' END);
