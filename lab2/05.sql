alter table zwierzak
add constraint fk_zwierzak_id foreign key (id)
references osoba(id);

alter table hobby
add constraint fk_hobby_id foreign key (osoba)
references osoba(id);