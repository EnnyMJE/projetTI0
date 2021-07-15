create or replace function ajout_categorie(text) returns integer
as
'
	declare f_nom_cat alias for $1;
	declare id integer;
	declare retour integer;
begin
	select into id id_cat_livre from bibli_cat_livre where nom_cat = f_nom_cat;
	if not found
	then
		insert into bibli_cat_livre(nom_cat) values(f_nom_cat);
		retour = 1;
	else
		retour = 0;
	end if;
	return retour;
end;
'
language 'plpgsql';