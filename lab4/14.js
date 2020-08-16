db.osoby.find(
	{$or: [
		{$and: [
			{$and: [
				{imie: {$not: {$regex: "w",$options: 'i'}}},
				{imie: {$not: {$regex: "x",$options: 'i'}}},
				{imie: {$not: {$regex: "q",$options: 'i'}}},
				{imie: {$not: {$regex: "ą",$options: 'i'}}},
				{imie: {$not: {$regex: "ł",$options: 'i'}}},
				{imie: {$not: {$regex: "z",$options: 'i'}}}
			]},
			{$and: [
				{nazwisko: {$not: {$regex: "w",$options: 'i'}}},
				{nazwisko: {$not: {$regex: "x",$options: 'i'}}},
				{nazwisko: {$not: {$regex: "q",$options: 'i'}}},
				{nazwisko: {$not: {$regex: "ą",$options: 'i'}}},
				{nazwisko: {$not: {$regex: "ł",$options: 'i'}}},
				{nazwisko: {$not: {$regex: "z",$options: 'i'}}}
			]}

		]},
		{
			obywatelstwo: "Poland"
		}
	]},		
	{imie:1, nazwisko:1, obywatelstwo:1, _id:0}	
)
  