
show collections;

db.getCollectionNames().forEach(function(collection) { 
	if(db[collection].count()>0) { 
		print(collection);
	} 
});	

