var sport_arr = db.sport.
	find({$or: [{"nazwa":"Baseball"},{"nazwa":"Golf"}]}).
	map(function(gr) { 
		return gr.id; 
	}
);

db.osoby.update(
	{$and: [
		{zainteresowania_id: sport_arr[0]},
		{zainteresowania_id: sport_arr[1]}
	]},
	{$addToSet:{zainteresowania_id: 11}},
	{$pull: {zainteresowania_id: { $in: sport_arr } } },
)












db.osoby.find(
	{$and: [
		{zainteresowania_id: sport_arr[0]},
		{zainteresowania_id: sport_arr[1]}
	]},
	{imie:1, id:1, nazwisko:1, "zwierzaki.gatunek_id":1, _id:0}
);