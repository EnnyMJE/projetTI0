create function is_membre(text,text) returns integer
as
'
	declare f_mail alias for $1;
	declare f_motpass alias for $2;
	declare id integer;
	declare retour integer;
begin
	select into id id_membre from bibli_membres where ad_mail = f_mail and mot_pass = f_motpass;
	if not found
	then
		retour = 0;
	else
		retour = 1;
		
	end if;
	return retour;
end;
'
language plpgsql;