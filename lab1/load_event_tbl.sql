# empty the table
DELETE FROM event;

# load new records into it
LOAD DATA LOCAL INFILE 'event.txt' INTO TABLE event;
