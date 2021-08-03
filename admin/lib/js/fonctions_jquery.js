$(document).ready(function (){

   $('#submit_id').remove();
    //traitement ajax zone <input> dans jquery.php
   $('#id').blur(function (){
      //on relève la valeur entrée dans l'input
       var id =$(this).val(); //val() : uniquement pour les inputs
       //alert("id : "+id);
       var parametre = "id_livre="+id;
       $.ajax({
          type: 'GET',
          data: parametre, //ce qui est envoyé à ajaxProduitDetail
          datatype: 'json',
           url: './admin/lib/php/ajax/ajaxDetailLivre.php',
           success: function (data) { //data : ce qui est reçu de ajaxDetailLivre
              //console.data(data);
              $('#id_livre').html("<br><b>"+data[0].titre_livre+"</b><br>Author : "+data[0].author_livre);
              $('#image_livre').html('<img src="admin/images/'+data[0].photos+'" alt="Illustration">');
           }
       });
   });


    $('#choix_livre').change(function (){
        //récupérer la valeur de l'atribut name (pour le php)
        var attribut = $(this).attr('name');
        //valeur de cet attribut
        var id = $(this).val();
        var parametre = "id_livre="+id;
        $.ajax({
            type: 'GET',
            data: parametre, //ce qui est envoyé à ajaxProduitDetail
            datatype: 'json',
            url: './admin/lib/php/ajax/ajaxDetailLivre.php',
            success: function (data) { //data : ce qui est reçu de ajaxDetailLivre
                //console.data(data);
                $('#id_livre').html("<br><b>"+data[0].titre_livre+"</b><br>Author : "+data[0].author_livre);
                $('#image_livre').html('<img src="admin/images/'+data[0].photos+'" alt="Illustration">');
            }
        });


    });

    //alert("Coucou");
    $('#bordure').css('border','solid 1px #00F');

    $('#contenu2').html('<b>Contenu inséré par jquery</b>');

    $('h2').click(function (){
        $(this).css({
            'font-size':'130%',
            'color':'#F00'
        });
    });


    $('#cliquer').click(function (){
        $('#p2').fadeOut(3000);
    });
});