var id_suwaka_perskiego = db.zwierzeta.
	find({gatunek:"Suwak perski"}).
	map(function(gr) { 
		return gr.id; 
	}
);

db.osoby.find(
	{"zwierzaki.gatunek_id": {$in:id_suwaka_perskiego}},
	{imie:1, nazwisko:1, obywatelstwo:1, _id:0}
).sort( { wzrost: 1 } );