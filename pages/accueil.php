<?php
$liste = new CategorieBD($cnx);
$categories = $liste->getCategorie();
if (!is_null($categories)) {
    //print "not null";
    $nbr = count($categories);
    //print '  not null, il y a ' .$nbr. ' donnees. ';
} else {
    print 'null';
}
//var_dump
?>

<div class="container">
    <div class="card text-center">
        <div class="card-header">
            Mini Bibliothéque
        </div>
        <div class="card-body">
            <h5 class="card-title">Categories des livres : </h5>
            <p class="card-text">
                <?php
                for ($i = 0; $i < $nbr; $i++) {
                    print $categories[$i]->nom_cat;
                    if ($i < $nbr - 1) {
                        print ' ** ';
                    }
                }

                ?>
            </p>
            <a href="./index_.php?page=collection_livre.php" class="btn btn-primary button_collection">Toute notre
                collection de livres</a>
        </div>
        <div class="card-footer offcolor">
            Condorcet - Mons - @: enny.frans@condorcet.be
        </div>
    </div>
    <p>&nbsp</p>

    <?php
    $cat = new CategorieBD($cnx);
    $liste_cat = $cat->getCategorie();
    $nbr = count($liste_cat);
    //print "il y a ".count($liste_cat)." données";
    //var_dump($liste_cat);
    ?>
    <div class="card-group">
        <?php
        for ($i = 0; $i < $nbr; $i++) {
            ?>
            <div class="card">
                <img src="./admin/images/<?php print $liste_cat[$i]->image; ?>" class="card-img-top" alt="Livre">
                <div class="card-body">
                    <h5 class="card-title">
                        <a class="lien" href="index_.php?page=collection_livre.php&id_cat_livre=<?php print $liste_cat[$i]->id_cat_livre;?>">
                        <?php print $liste_cat[$i]->nom_cat; ?>
                        </a>
                        <p>&nbsp</p><i class="bi bi-book light_blue"></i>
                    </h5>
                    <p class="card-text">-- description de la categorie --</p>
                </div>
            </div>
            <?php
        }
        ?>
        <!--<div class="card">
            <img src="./admin/images/Nihongo-shoho.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><i class="bi bi-book light_blue"></i> Card title </h5>
                <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
            </div>
            <div class="card-footer offcolor">
                <small>Last updated 3 mins ago</small>
            </div>
        </div>
        <div class="card">
            <img src="./admin/images/Becoming.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"> <i class="bi bi-book light_blue"></i> Card title</h5>
                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                    content. This card has even longer content than the first to show that equal height action.</p>
            </div>
            <div class="card-footer offcolor">
                <small>Last updated 3 mins ago</small>
            </div>
        </div>
        -->
    </div>
</div>

