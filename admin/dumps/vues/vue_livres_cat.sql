create or replace view vue_livres_cat as select 
collection_livres.id_livre, collection_livres.titre_livre, 
collection_livres.author_livre, collection_livres.date_publication,
collection_livres.nbr_page, collection_livres.photos, collection_livres.livre_status, collection_livres.reference,
bibli_cat_livre.id_cat_livre, bibli_cat_livre.nom_cat
from collection_livres, bibli_cat_livre
where bibli_cat_livre.Id_cat_livre = collection_livres.id_cat;

