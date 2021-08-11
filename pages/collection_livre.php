
<?php
$lv=new LivreBD($cnx);
if(isset($_GET['id_cat_livre'])){
    $list_livre =$lv->getLivresByCat($_GET['id_cat_livre']);
}
else{
    $list_livre = $lv->getAllLivre();
}

//var_dump($list_livre);
$nbr = count($list_livre);
?>


<div class="album py-5 bg-light">
    <div class="container">

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <?php
            for ($i = 0; $i < $nbr; $i++) {
                ?>
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="./admin/images/<?php print $list_livre[$i]->photos; ?>" alt="Image"/>

                        <div class="card-body">
                            <p class="card-text">
                                <?php
                                print $list_livre[$i]->titre_livre;
                                ?>
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><?php
                                        print $list_livre[$i]->livre_status;
                                        ?></button>
                                    <!--<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>-->
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <?php
            }
            ?>
        </div>
    </div>
</div>