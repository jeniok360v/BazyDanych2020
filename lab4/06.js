
var id_krolika_domowego = db.zwierzeta.
	find({gatunek:"Krolik domowy"}).
	map(function(gr) { 
		return gr.id; 
	}
);


db.osoby.find(
	{"zwierzaki.gatunek_id": {$in:id_krolika_domowego}},
	{imie:1, id:1, nazwisko:1, "zwierzaki.gatunek_id":1, _id:0}
);























db.osoby.count( {"zwierzaki.gatunek_id": { $eq: 6 } } )


