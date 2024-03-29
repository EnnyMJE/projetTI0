<?php include ('lib/php/verifier_connexion.php'); ?>

<h2>Editer / ajouter un livre</h2>

<?php
$livre = new LivreBD($cnx);
if(isset($_GET['editer'])){
    ?><pre><?php
    var_dump($_GET);
    ?></pre><?php
    extract($_GET, EXTR_OVERWRITE);
    $lv = $livre->mise_a_jourLivre($id_livre, $titre_livre, $author_livre, $nbr_page, $livre_status);
}
//else{
if (isset($GET['inserer'])){
    ?><pre><?php
    var_dump($_GET);
    ?></pre><?php
    extract($_GET, EXTR_OVERWRITE);
    $lv = $livre->ajout_livre($titre_livre, $author_livre, $nbr_page, $livre_status, $reference);//ajouter les arguments vérifiés

}

?>

<form class="row g-3" method="get" action="<?php print $_SERVER['PHP_SELF'];?>">
    <!--
    <div class="col-md-12">
        Example à effacer <input type="text" id="recup">
    </div>
    -->
    <div class="col-md-2">
        <label for="reference" class="form-label">Référence</label>
        <input type="text" class="form-control" id="reference" name="reference">
    </div>
    <div class="col-md-6">
        <label for="denomination" class="form-label">Dénomination</label>
        <input type="text" class="form-control" id="denomination" name="titre_livre">
    <br>
    </div>
    <div class="col-8">
        <label for="titre_livre" class="form-label">Titre</label>
        <input type="text" class="form-control" id="titre_livre" name="titre_livre">
        <br>
    </div>
    <div class="col-md-6">
        <label for="author_livre" class="form-label">Author / Editeur</label>
        <input type="text" class="form-control" id="author_livre" name="author_livre">
    </div>
    <div class="col-md-2">
        <label for="nbr_page" class="form-label">Nombre de pages</label>
        <input type="number" class="form-control" id="nbr_page" name="nbr_page">
    </div>

    <div class="col-md-6">
        <br>
        <label for="livre_status" class="form-label">Status / Disponibilité</label>
        <input type="text" class="form-control" id="livre_status" name="livre_status">
    </div>


    <div class="col-12">
        <br>
        <input type="hidden" name="id_livre" id="id_livre">
        <button type="submit" class="btn btn-primary" id="editer" name="editer">Mettre à jour</button>
        <button type="submit" class="btn btn-primary" id="inserer" name="inserer ">Enregistrer</button>
    </div>
</form>
