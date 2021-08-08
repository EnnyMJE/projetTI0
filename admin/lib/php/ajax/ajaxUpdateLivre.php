<?php
header('Content-Type: application/json');
/*
 * inclure les fichiers nécessaire à la communication avec la BD car on ne passe par l'index
 * Ce fichier est appelé par fonctions_jquery.js
 */
//A partir de admin/lib/php/ajax, revenir dans dossier prérédent
include ('../pg_connect.php');
include ('../classes/Connexion.class.php');
include ('../classes/Livre.class.php');
include ('../classes/LivreBD.class.php');

$cnx = Connexion::getInstance($dsn,$user,$password);

$lv = array();
$livre = new LivreBD($cnx);
//id_livre est un paramètre de l'url
//ds js : var parametre = "id_livre = " +id;
extract($_GET,EXTR_OVERWRITE);
$lv[] = $livre->updateLivre($champ,$id,$nouveau);

//conversion du tableau PHP au format javascript
print json_encode($lv);
