DROP FUNCTION IF EXISTS gauss;
DELIMITER $$
CREATE FUNCTION gauss(mean float, stdev float) RETURNS float
BEGIN
set @x=rand(), @y=rand();
set @gaus = ((sqrt(-2*log(@x))*cos(2*pi()*@y))*stdev)+mean;
return @gaus;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS privacy;
DELIMITER $$
CREATE PROCEDURE privacy (IN profession CHAR(20),OUT avg_pay FLOAT)
BEGIN
DECLARE randd FLOAT;
DECLARE delta INT;

SET delta = (SELECT (MAX(tab.placa)-MIN(tab.placa))/COUNT(*) FROM 
(SELECT praca.placa FROM praca WHERE praca.id_zawod =
(SELECT zawody.id FROM zawody WHERE zawody.nazwa = profession) )AS tab  );
 
SET randd = gauss(0,delta/0.03);
SET avg_pay = (SELECT AVG(praca.placa)+randd FROM praca WHERE praca.id_zawod =
(SELECT zawody.id FROM zawody WHERE zawody.nazwa = profession) );
END $$
DELIMITER ;