<?php
 $liste = new CategorieBD($cnx);
 $liste->getCategorie();
?>

<div class="container">
    <div class="card text-center">
        <div class="card-header">
            Featured
        </div>
        <div class="card-body">
            <h5 class="card-title"><i class="bi-alarm" style="font-size: 2rem; color: cornflowerblue;"></i>Special title treatment</h5>
            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
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

