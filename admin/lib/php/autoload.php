<?php
//page de chargement automatique des classes

//fonction qui charge les fichiers classes

function autoload($nom_classe)
{
    if (file_exists('./lib/php/classes/' . $nom_classe . '.class.php')) {
        require './lib/php/classes/' . $nom_classe . '.class.php';
    } else if (file_exists('./admin/lib/php/classes/' . $nom_classe . '.class.php')) {
        require './admin/lib/php/classes/' . $nom_classe . '.class.php';
    }
}

spl_autoload_register('autoload');

//fonction prèdifinie qui appelle la fonciton d'autoload lors d'une rencontre du mot new