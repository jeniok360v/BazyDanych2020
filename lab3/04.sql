drop procedure if exists aggregate_;
delimiter $$
create procedure aggregate_(in kol char(50), in agg char(50), out X char(5))
begin

	set @zmienna=kol;
	
	set @condition=
		"set @tf= (case when 0=(select column_name from information_schema.columns
		where table_name=\"osoba\" and column_name=?)
		then true else false end);"
	;
	prepare cond from @condition;
	execute cond using @zmienna;
	
	if (@tf && (@zmienna="imie" || @zmienna="plec") && agg="count") 
	then 
		set @q = concat(
			"set @y=(select ", agg, "(", kol, ")", " from osoba);"
		);
		prepare stmt from @q;
		execute stmt;
		set X=@y;
		select kol, agg, X;
	elseif agg="count"

	else 
		signal sqlstate '45000'
		set message_text = 'funkcja jest niepoprawna';	
	end if;
end$$
delimiter ;
