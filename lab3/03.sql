create table zawody (
	id int auto_increment primary key not null,
	nazwa varchar(50) not null,
	pensja_min int not null,
	pensja_max int not null
);


delimiter $$
create trigger zawody_insert
before insert on zawody
for each row 
begin
	if(new.pensja_min<=0 || new.pensja_min>new.pensja_max)
	then
		signal sqlstate '45000'
		set message_text = 'Nieporprawna liczba';
	end if;
end$$
delimiter ;


delimiter $$
create trigger zawody_update
before update on zawody
for each row 
begin 
	if(new.pensja_min<=0 || new.pensja_min>new.pensja_max)
	then
		signal sqlstate '45000'
		set message_text = 'Nieporprawna liczba';
	end if;
end$$
delimiter ;


delimiter $$
create procedure insert_into_zawody()
begin
	set @counter=1;
	while @counter<=(select count(*) from cr_zawody)
	do
		set @pensja_min=2000+rand()*1000;
		set @pensja_max=@pensja_min+rand()*15000;
		insert into zawody values (
			0,
			(select zawod from cr_zawody
			where id=@counter),
			@pensja_min,
			@pensja_max
		);
		set @counter=@counter+1;
	end while;
end$$
delimiter ;



create table praca (
	id_osoby int not null,
	id_zawodu int not null,
	zarobek int not null,
	constraint praca_primary_key primary key (id_osoby, id_zawodu)
);


delimiter $$
create trigger praca_insert 
before insert on praca
for each row 
begin 
	if(new.id_osoby not in (select id from osoba))
	then
		signal sqlstate '45000'
		set message_text = 'Niepoprawne id osoby';
	end if;
	
	
	if(new.id_zawodu not in (select id from zawody))
	then
		signal sqlstate '45000'
		set message_text = 'Niepoprawne id zawodu';
	end if;
	
	
	if(
		(new.zarobek>(select pensja_max from zawody 
			where zawody.id=new.id_zawodu)) ||
		(new.zarobek<(select pensja_min from zawody 
			where zawody.id=new.id_zawodu))
	)
	then
		signal sqlstate '45000'
		set message_text = 'Przekroczeni widelkow placowych';
	end if;
end$$
delimiter ;


delimiter $$
create trigger praca_update 
before update on praca
for each row 
begin 
	if(new.id_osoby not in (select id from osoba))
	then
		signal sqlstate '45000'
		set message_text = 'Niepoprawne id osoby';
	end if;
	
	
	if(new.id_zawodu not in (select id from zawody))
	then
		signal sqlstate '45000'
		set message_text = 'Niepoprawne id zawodu';
	end if;
	
	
	if(
		(new.zarobek>(select pensja_max from zawody 
			where zawody.id=new.id_zawodu)) ||
		(new.zarobek<(select pensja_min from zawody 
			where zawody.id=new.id_zawodu))
	)
	then
		signal sqlstate '45000'
		set message_text = 'Przekroczeni widelkow placowych';
	end if;
end$$
delimiter ;


drop procedure if exists praca_dla_kazdego;
delimiter $$
create procedure praca_dla_kazdego()
begin	
	-- declare amount int;
	-- set amount=21;  -- select count(*) from zawody;
	declare id_osoby int;
	declare id_zawodu int;
	declare max_zarobek int;
	declare min_zarobek int;
	declare zarobek int;
	

	declare done int default false;
	declare cur1 cursor for select id from osoba;
	declare continue handler for not found set done=true;
	
	open cur1;
	
	insert_loop: loop
		fetch cur1 into id_osoby;
		if done then
			leave insert_loop;
		end if;
		set id_zawodu=1+floor(rand()*21);
		set max_zarobek=(
			select pensja_max from zawody
			where zawody.id=id_zawodu);
		set min_zarobek = (	
			select pensja_min from zawody 
			where zawody.id=id_zawodu);
		
		set zarobek=floor(
			min_zarobek+(max_zarobek-min_zarobek)*rand()
		);
		
		insert into praca values (
			id_osoby,
			id_zawodu,
			zarobek
		);
	end loop;
	
	close cur1;
end$$	
delimiter ;
