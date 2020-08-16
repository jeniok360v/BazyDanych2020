db.osoby.count( {"zwierzaki.gatunek_id": { $eq: 6 } } )
for(i=0,i<10,i=i+1){
	{ $cond: [ 
	{db.osoby.find({{zainteresowania_id: 
	{$eq: 1}}, {id:1, _id:0}).count()}: {$gt: 10}},
		{print(i+" - no")}, {print(i + " - yes")} ] }
	if(db.osoby.find({zainteresowania_id: {$eq: 1}}, {id:1, _id:0}).count()
}


for(i=0;i<10;i=i+1){
	var counter = i;
	db.osoby.aggregate({zainteresowania_id: {$eq: counter}}, {id:1, _id:0}).count();
	
};


  // {field: {$gt: value} }

for(i=0;i<5;i=i+1){
	var counter = i;
	print(counter);
	db.osoby.find(
		{"zwierzaki.gatunek_id": counter},
		{imie:1, id:1, nazwisko:1, _id:0}
	)
	
};
	db.osoby.aggregate({zainteresowania_id: {$eq: counter}}, {id:1, _id:0}).count();
	
};

db.osoby.find().forEach(function(func)
	{print("imie: "+func.imie+", nazwisko: "+func.nazwisko);}
	
);