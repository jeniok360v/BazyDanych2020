create or replace view liczba_hobby (nazwa, liczba) as 

(select nazwa, count(nazwa) as amount from sport group by nazwa) union
(select nazwa, count(nazwa) as amount from nauka group by nazwa) union
(select nazwa, count(nazwa) as amount from inne group by nazwa);

select * from liczba_hobby;