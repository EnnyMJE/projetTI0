<h2>Ajax</h2>
<?php
$lv = new LivreBD($cnx);
$liste = $lv->getAllLivre();
$nbr = count($liste);

?>

<form action="<?php print $_SERVER['PHP_SELF']; ?>" method="get">
    <label for="id"> Identifiant : </label>
    <input type="text" id="id" name="id">&nbsp;

    &nbsp;&nbsp;
    <select name="choix_livre" id="choix_livre">
        <option value="">Choisissez</option>
        <?php
        for ($i = 0; $i < $nbr; $i++) {
            ?>
            <option value="<?php print $liste[$i]->id_livre; ?>">
                <?php print $liste[$i]->titre_livre; ?>
            </option>
            <?php
        }
        ?>
    </select>
        <input type="submit" name="submit_id" value="Chercher" id="submit_id">

</form>
<div class="card-group" id="infoLivre">
    <div class="card" style="width: 18rem;">
        <div class="card-body">
            <h5 class="card-title"></h5>
            <div id="id_livre"></div>
        </div>
    </div>

    <div class="card" style="width: 18rem;">
        <div class="card-body">
            <h5 class="card-title"></h5>
            <div id="image_livre"></div>
        </div>
    </div>
</div>

<p>&nbsp;</p>
<p>&nbsp;</p>

<div id="bordure">

    <h2>Impruntés des livre :</h2>


    <section id="para1">

        <p id="p1">Tous les livres pouvaient être empruntés directement sur place.</p>
        <p>nous pouvons emprunter maximum 3 livres pendant 10 jours maximum
            et pourra être prolongé de 5 jours supplémentaires.</p>

    </section>

    <section id="para2">
        <div id="cliquer">la lecture sur place</div>
        <p id="p2">Malheureusement en cette période de covid 19,
            selon le règlement gouvernemental la lecture sur place n'est pas encore autorisée</p>
    </section>
</div>

<div id="contenu2">


</div>