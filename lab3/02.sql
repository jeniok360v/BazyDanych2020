explain
SELECT plec FROM  osoba WHERE imie LIKE "A%";

SELECT distinct nazwa FROM sport where typ='druzynowy' ORDER BY nazwa;


SELECT sport1.id, sport2.id 
	FROM sport AS sport1 
	inner JOIN sport AS sport2 
	ON sport1.lokacja = sport2.lokacja
	where sport1.typ='indywidualny' && sport2.typ='indywidualny'
	&& sport1.id<sport2.id;
	

SELECT id, imie, Nazwisko, dataUrodzenia FROM osoba 
	WHERE dataUrodzenia < "2000-01-01";


SELECT (CONCAT_ws("",i.nazwa,s.nazwa,n.nazwa)) AS name ,COUNT(*)   
	FROM hobby h LEFT JOIN inne i ON h.id=i.id
	LEFT JOIN sport s ON h.id=s.id
	LEFT JOIN nauka n ON h.id=n.id 
	GROUP BY name ORDER BY COUNT(*) desc; 

select * from osoba
	where dataUrodzenia = (
		select dataUrodzenia from osoba
			where id in (
				select id from zwierzak
				where species='dog')
			order by dataUrodzenia
			limit 1);


SELECT osoba.id, imie, nazwisko FROM osoba JOIN zwierzak 
	ON zwierzak.id = osoba.id where species = "dog"
	ORDER BY dataUrodzenia limit 1;

select * from osoba join zwierzak 
	on zwierzak.id = osoba.id
	where zwierzak.species="dog"
	and osoba.dataUrodzenia = (
		select dataUrodzenia
		from osoba
		where id in (
			select id
			from zwierzak 
			where species="dog"
		)
		order by dataUrodzenia 
		limit 1
	)
;
