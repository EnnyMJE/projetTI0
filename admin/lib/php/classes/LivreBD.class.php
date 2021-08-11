<?php

Class LivreBD extends Livre {

    private $_db; //recevoir la valeur de $cnx lors de la connexion à la BD dans index
    private $_data = array();
    private $_resultset;

    public function __construct($cnx){ //$cnx envoyé depuis la page qui instancie
        $this->_db = $cnx;
    }

    public  function delete_livre($id_livre){
        try {
            $query = "delete from collection_livres where id_livre = '".$id_livre."'";
            $resultset = $this->_db->prepare($query);
            $resultset->execute();
        } catch (PDOException $e){
            print "Echec de la requête : ".$e->getMessage();
            $_db->rollback();
        }
    }

    public  function mise_a_jourLivre($id_livre,$titre_livre,$author_livre,$nbr_page,$livre_status){
        try {
            $query = "update collection_livres set titre_livre = '".$titre_livre."', author_livre='".$author_livre."', nbr_page='".$nbr_page."',livre_status='".$livre_status."' where id_livre = '".$id_livre."'";
            $resultset = $this->_db->prepare($query);
            $resultset->execute();
        } catch (PDOException $e){
            print "Echec de la requête : ".$e->getMessage();
            $_db->rollback();
        }
    }

    public function ajout_livre($titre_livre, $author_livre, $nbr_page, $livre_status, $reference)
    {
        try {
            $query = "insert into collection_livres (titre_livre, author_livre, nbr_page, livre_status, id_cat, date_publication, reference)  values('".$titre_livre."', '".$author_livre."', '".$nbr_page."','".$livre_status."',1,'01-01-2000','".$reference."')";
            $resultset = $this->_db->prepare($query);
            $resultset->execute();
            print $titre_livre;

        } catch (PDOException $e) {
            print "Echec de la requête : " . $e->getMessage();
            $_db->rollback();
        }
    }


    public function getLivreByRef($ref){
        try {
            $this->_db->beginTransaction();
            $query = "select * from collection_livres where reference = :ref";
            $resultset = $this->_db->prepare($query);
            $resultset->bindValue(':ref', $ref);
            $resultset->execute();
            $data = $resultset->fetch();
            return $data;
            //renvoyer un objet nécéssite adaptation dans ajax pour retour json
            // donc retourner objet simple, qui sera stocké dans un élément de tableu json


            $this->_db->commit();

        } catch (PDOException $e){
            print "Echec de la requête : ".$e->getMessage();
            $_db->rollback();
        }

    }


    //écrire une requete avec paramétres de position (:champ, :id, ...) puis bindValue
    public function updateLivre($champ,$id,$valeur){
        try{
            //appeler une procédure embarquée
            $query = "update collection_livres set ".$champ."='".$valeur."'where id_livre='".$id."'";
            $resultset = $this->_db->prepare($query);//transformer la requête!
            $resultset->execute();
        }catch (PDOException $e){
            print $e->getMessage();
        }
    }


    //spécial AJAX
    public function getLivreById2($id_livre){
        try {
            $this->_db->beginTransaction();
            $query = "select * from vue_livres_cat where id_livre = :id_livre";
            $resultset = $this->_db->prepare($query);
            $resultset->bindValue(':id_livre',$id_livre);
            $resultset->execute();
            $data = $resultset->fetch();
            return $data;
            //renvoyer un objet nécéssite adaptation dans ajax pour retour json
            // donc retourner objet simple, qui sera stocké dans un élément de tableu json


            $this->_db->commit();

        } catch (PDOException $e){
            print "Echec de la requête : ".$e->getMessage();
            $_db->rollback();
        }

    }


    public function getAllLivre(){
        $query = "select * from vue_livres_cat order by id_cat_livre";
        $_resultset = $this->_db->prepare($query);
        $_resultset->execute();

        while ($d = $_resultset->fetch()){
            $_data[]= new Livre($d);
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

    public function getLivresByCat($id_cat){
        try {
            $query="select * from vue_livres_cat where id_cat_livre = :id_cat";
            $_resultset = $this->_db->prepare($query);
            $_resultset->bindValue(':id_cat',$id_cat);
            $_resultset->execute();

            while ($d = $_resultset->fetch()){
                $_data[] = new Livre($d);
            }
            return $_data;

        }catch (PDOException $e){
            print "Echec de la requête ".$e->getMessage();
        }
    }



}
