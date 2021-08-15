create function is_mail(text) returns integer
as
'
	declare f_mail alias for $1;
	declare id integer;
	declare retour integer;
begin
	select into id id_membre from bibli_membres where ad_mail = f_mail;
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