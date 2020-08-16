
1.)
show dbs;
use MDBHobby;
db.createCollection("zwierzeta");
db.createCollection("sport");
db.createCollection("osoby");


2.,3.,4.)
mongoimport --db MDBHobby --collection sport --file sport.json --jsonArray
mongoimport --db MDBHobby --collection zwierzeta --file zwierzeta.json --jsonArray
mongoimport --db MDBHobby --collection osoby --file osoby.json --jsonArray

5.)
show collections;
/*  all collections  */
db.getCollectionNames().forEach(function(collection) { 
	resultCount = db[collection].count();
	print("Documents count: "+ resultCount +" for collection "+ collection); 
});
/*  non-empty collections  */
db.getCollectionNames().forEach(function(collection) { 
	var resultCount = db[collection].count(); 
	if(resultCount>0) { 
		print(collection);
	} 
});	
db.getCollectionNames().forEach(function(collection) { 
	if(db[collection].count()>0) { 
		print(collection);
	} 
});	

