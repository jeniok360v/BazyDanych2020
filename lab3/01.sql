create index name_index using BTREE on osoba(imie);
create index birthday_index using BTREE on osoba(dataUrodzenia);
create index id_nazwa_index using BTREE on sport(id,nazwa);
create index nazwa_id_index using BTREE on inne(nazwa,id);
create unique index osoba_id_typ_index using BTREE on hobby(osoba,id,typ);