DROP table if exists osoba;
DROP table if exists sport;
DROP table if exists nauka;
DROP table if exists inne;
DROP table if exists hobby;


Create table osoba (
	id int not null AUTO_INCREMENT,
	imie varchar(20) not null,
	dataUrodzenia date not null,
	plec char(1) not null,
	constraint osoba_id primary key (id)

);

Create table sport (
	id int not null AUTO_INCREMENT,
	nazwa varchar(40) not null,
	typ enum('indywidualny', 'druzynowy', 'mieszany') not null default 'druzynowy',
	lokacja varchar(40),
	constraint sport_id primary key (id)
);



Create table nauka (
	id int not null AUTO_INCREMENT,
	nazwa varchar(40) not null,
	lokacja varchar(40),
	constraint nauka_id primary key (id)
);

Create table inne (
	id int not null AUTO_INCREMENT,
	nazwa varchar(40) not null,
	lokacja varchar(40),
	towarzysze bool not null default true,
	constraint inne_id primary key (id)
);

create table hobby (
	osoba int not null,
	id int not null,
	typ enum('sport', 'nauka', 'inne') not null,
	constraint hobby_cns primary key (osoba, id, typ)
);


Delimiter $$
CREATE TRIGGER date_check
BEFORE INSERT ON osoba
FOR EACH ROW
BEGIN
	IF NEW.dataUrodzenia > CURDATE() - interval 18 year THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid date!';
	END IF;
END;$$
delimiter ;
	