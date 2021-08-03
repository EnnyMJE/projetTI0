<?php

Class CategorieBD extends Categorie {

    private $_db; //recevoir la valeur de $cnx lors de la connexion à la BD dans index
    private $_data = array();
    private $_resultset;

    public function __construct($cnx){
        //$cnx envoyé depuis la page qui instancie
        $this->_db = $cnx;
    }

    public function getCategorie(){
        $query = "select * from bibli_cat_livre";
        $_resultset = $this->_db->prepare($query);
        $_resultset->execute();

        while ($d = $_resultset->fetch()){
            $_data[]= new Categorie($d);
       }
       if(!empty($_data)){
           //print "il y'a des donnees :)";
         return $_data;
        }
       else{
           //print "hello world, no data";
           return null;
        }

        //$_data = $_resultset->fetchAll();
        //var_dump($_data);
    }
}
