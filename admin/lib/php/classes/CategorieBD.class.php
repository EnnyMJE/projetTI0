<?php

Class CategorieBD extends Categorie {

    private $_db;
    private $_data = array();
    private $_resultset;

    public function __construct($cnx){
        $this->_db=$cnx;
    }

    public function getCategorie(){
        $query = "select * from bibli_cat_livre";
        $_resultset = $this->_db->prepare($query);
        $_resultset->execute();
        while ($d = $_resultset->fetch()){
            $_data[]= new Categorie($d);
        }
        if(!empty($_data)){
            return $_data;
        }
        else{
            return null;
        }

        //$_data = $_resultset->fetchAll();
        //var_dump($_data);
    }
}
