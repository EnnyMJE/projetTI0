<?php
 $liste = new CategorieBD($cnx);
 $categories = $liste->getCategorie();
 if (!is_null ($categories)){
     $nbr = count($categories);
 }
 //var_dump

?>

<div class="container">
    <div class="card text-center">
        <div class="card-header">
            Mini Bibliothéque
        </div>
        <div class="card-body">
            <h5 class="card-title">Mini Bibliothéque </h5>
            <p class="card-text">
                <?
                print "hello world";
                print  $nbr;
                for ($i = 0; $i < $nbr; $i++){
                    print $categories[$i]->nom_categories." ";
                }

                ?>
            </p>
            <a href="#" class="btn btn-primary">Reserver</a>
        </div>
        <div class="card-footer offcolor">
            2 days ago
        </div>
    </div>

    <p>&nbsp</p>
    <div class="card-group">
        <div class="card">
            <img src="./admin/images/au-clair-de-la-lune.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><i class="bi bi-book light_blue"></i> Card title</h5>
                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                    content. This content is a little bit longer.</p>
            </div>
            <div class="card-footer offcolor">
                <small>Last updated 3 mins ago</small>
            </div>
        </div>
        <div class="card">
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
    </div>
</div>

