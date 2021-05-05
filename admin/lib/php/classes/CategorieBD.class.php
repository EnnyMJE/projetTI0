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
        $_resultset = $this->_db->query($query);
        $_data = $_resultset->fetchAll();
        var_dump($_data);
    }
}
