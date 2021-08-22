$(document).ready(function () {

    $('#efacer').click(function (){
        alert('efacée');

    });

    //blur : perte de focus
    $('#reference').blur(function () {
        var ref = $(this).val();
        if (ref != '') {
            var parametre = "ref=" + ref;
            $.ajax({
                type: 'GET',
                data: parametre,
                datatype: 'json',
                url: './lib/php/ajax/ajaxRechercheLivre.php',
                success: function (data) {
                    console.log(data);
                    $('#denomination').val(data[0].titre_livre);
                    if ($('#denomination').val() != '') {
                        $('#inserer').hide();
                        $('#editer').show();
                    } else {
                        $('#editer').hide();
                        $('#inserer').show();
                    }
                    $('#titre_livre').val(data[0].titre_livre);
                    $('#author_livre').val(data[0].author_livre);
                    $('#nbr_page').val(data[0].nbr_page);
                    $('#livre_status').val(data[0].livre_status);
                    $('#id_livre').val(data[0].id_livre);
                }
            });
            $('#reference').click(function () {
                $('#reference').val('');
                $('#denomination').val('');
            })
        }
    });


    //comment récupérer la valeur dans un input
    $('#recup').blur(function () {
        var recup = $(this).val();//val = récupération des valeurs dans un formulaire
        alert(recup);
    });

    //utilisée dans admin/gestion_livre.php
    $('span[id]').click(function () {
        //text() : récupérer le contenu quand ce n'est pas un champ de formulaire
        //val() : contenu d'un champ de formulaire
        //récupération du contenu d'origine
        var valeur1 = $.trim($(this).text());
        //récupération des attributs name et id de la zone cliquée
        var ident = $(this).attr("id");//valeur de l'id
        var name = $(this).attr("name");//champ à modifier
        //alert("ident = "+ident+" et name = "+name);
        $(this).blur(function () {
            var valeur2 = $.trim($(this).text());
            //alert("valeur 1 : "+valeur1+" valeur2 : "+valeur2);
            if (valeur1 != valeur2) {
                //écriture des paramétres de l'URL
                var parametre = 'champ=' + name + '&id=' + ident + '&nouveau=' + valeur2;
                //alert(parametre);
                $.ajax({
                    type: 'GET',
                    data: parametre,
                    datatype: 'text',
                    url: './lib/php/ajax/ajaxUpdateLivre.php',
                    success: function (data) {
                        console.log(data);
                    }
                });
            }
        });
    });


    $('#submit_id').remove();
    //traitement ajax zone <input> dans jquery.php
    $('#id').blur(function () {
        //on relève la valeur entrée dans l'input
        var id = $(this).val(); //val() : uniquement pour les inputs
        //alert("id : "+id);
        var parametre = "id_livre=" + id;
        $.ajax({
            type: 'GET',
            data: parametre, //ce qui est envoyé à ajaxLivreDetail
            datatype: 'json',
            url: './admin/lib/php/ajax/ajaxDetailLivre.php',
            success: function (data) { //data : ce qui est reçu de ajaxDetailLivre
                //console.data(data);
                $('#id_livre').html("<br><b>" + data[0].titre_livre + "</b><br>Author : " + data[0].author_livre+
                    "<br>nbr pages :"+ data[0].nbr_page);
                $('#image_livre').html('<img src="admin/images/' + data[0].photos + '" alt="Illustration">');
            }
        });
    });


    $('#choix_livre').change(function () {
        //récupérer la valeur de l'atribut name (pour le php)
        var attribut = $(this).attr('name');
        //valeur de cet attribut
        var id = $(this).val();
        var parametre = "id_livre=" + id;
        $.ajax({
            type: 'GET',
            data: parametre, //ce qui est envoyé à ajaxProduitDetail
            datatype: 'json',
            url: './admin/lib/php/ajax/ajaxDetailLivre.php',
            success: function (data) { //data : ce qui est reçu de ajaxDetailLivre
                //console.data(data);
                $('#id_livre').html("<br><b>" + data[0].titre_livre + "</b><br>Author : " + data[0].author_livre+
                "<br>nbr pages :"+ data[0].nbr_page);
                $('#image_livre').html('<img src="admin/images/' + data[0].photos + '" alt="Illustration">');
            }
        });
    });

    //alert("Coucou");
    $('#bordure').css('border', 'solid 1px #00F');

    $('#contenu2').html('<b>Contenu inséré par jquery</b>');

    $('h2').click(function () {
        $(this).css({
            'font-size': '130%',
            'color': '#F00'
        });
    });

    $('#cacher').hide();
    $('#cliquer').click(function () {
        $('#cacher').fadeIn(3000);
    });


    //todo 1 :  comment faire disparu les formulaire quand il est connectée avec JS
    $('#submit').click(function (){
       //alert("try the button of submit");
        if(errorMsg){
            allert("hello, test error");
        }
    });
});