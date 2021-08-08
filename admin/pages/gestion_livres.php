<?php
include('./lib/php/verifier_connexion.php');
$lv = new LivreBD($cnx);
$liste = $lv->getAllLivre();
$nbr = count($liste);

?>

<table class="table">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Titre</th>
        <th scope="col">Author/Editeur</th>
        <th scope="col">date publication</th>
        <th scope="col">nombre des pages</th>
        <th scope="col">id categorie</th>
        <th scope="col">status / disponibilité</th>
        <th scope="col">photos</th>
    </tr>
    </thead>
    <tbody>
    <?php
    for ($i = 0; $i < $nbr; $i++) {
        ?>
        <tr>
            <th scope="row">
                <?php print $liste[$i]->id_livre; ?>
            </th>
            <td><span contenteditable="true" name="titre_livre" id="<?php print $liste[$i]->id_livre; ?>">
                    <?php print $liste[$i]->titre_livre; ?>
                </span></td>
            <td><span contenteditable="true" name="author_livre" id="<?php print $liste[$i]->id_livre; ?>">
                    <?php print $liste[$i]->author_livre; ?>
                </span></td>
            <td>
                <span contenteditable="true" name="date_publication" id="<?php print $liste[$i]->id_livre; ?>">
                    <?php print $liste[$i]->date_publication; ?>
                </span></td>
            <td><span contenteditable="true" name="nbr_page" id="<?php print $liste[$i]->id_livre; ?>">
                    <?php print $liste[$i]->nbr_page; ?>
                </span></td>
            <td><span contenteditable="true" name="id_cat_livre" id="<?php print $liste[$i]->id_livre; ?>">
                    <?php print $liste[$i]->id_cat_livre; ?>
                </span></td>
            <td><span contenteditable="true" name="livre_status" id="<?php print $liste[$i]->id_livre; ?>">
                    <?php print $liste[$i]->livre_status; ?>
                </span></td>
            <td><span contenteditable="true" name="photos" id="<?php print $liste[$i]->id_livre; ?>">
                    <?php print $liste[$i]->photos; ?>
                </span></td>
        </tr>
        <?php
    }
    ?>
    </tbody>
</table>
