<?php

Class MembreBD extends Membre {

    private $_db; //recevoir la valeur de $cnx lors de la connexion à la BD dans index
    private $_data = array();
    private $_resultset;

    public function __construct($cnx){
        //$cnx envoyé depuis la page qui instancie
        $this->_db = $cnx;
    }

    public function getMembre($ad_mail,$mot_pass){
        try {

            $query = "select is_membre (:ad_mail,:mot_pass) as retour";
            $_resultset = $this->_db->prepare($query);
            $_resultset->bindValue(':ad_mail',$ad_mail);
            $_resultset->bindValue(':mot_pass',$mot_pass);
            $_resultset->execute();
            $retour = $_resultset->fetchColumn(0);

            return $retour;

        }catch (PDOException $e){
            print "Echec ".$e->getMessage();
        }
    }
}
