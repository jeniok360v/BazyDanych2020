mysqldump -u root -p hobby > hobbyDUMP.sql
drop database hobby;
mysql -u root -p hobby < hobbyDUMP.sql