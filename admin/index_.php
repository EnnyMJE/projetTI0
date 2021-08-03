<!doctype html>
<?php
//index admin
session_start();
include ('./lib/php/admin_liste_include.php');
$cnx = Connexion::getInstance($dsn,$user,$password);
?>
<html>
<head>
    <title>La mini bibliothèque 2021</title>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="./lib/css/style.css"/>
    <link rel="stylesheet" href="./lib/css/custom.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="./lib/js/fonctions_jquery.js"></script>

</head>

<body>
<div id="page" class="container">
    <header class="img_header">
        <a href="index_.php?page=disconnect.php">Déconnexion</a>
    </header>
    <section id="colGauche">
        <nav>
            <?php
            $path = "./lib/php/admin_menu.php";
            if (file_exists($path)) {
                include ($path);
            }
            ?>
        </nav>

    </section>
    <section id="contenu">
        <div id="main">
            <?php
            if(isset($_SESSION['page']) && !isset($_SESSION['partie_admin'])){
                unset($_SESSION['page']);
                $_SESSION['partie_admin']=1;
            }
            if (!isset($_SESSION['page'])) {
                $_SESSION['page'] = "accueil_admin.php";
            }
            if (isset($_GET['page'])) {
                //si on a un param page dans l'url
                $_SESSION['page'] = $_GET['page'];
            }
            $path = "./pages/" . $_SESSION['page'];
            //print "path: " . $path . "<br>";
            if (file_exists($path)) {
                include ($path);
            } else {
                include ("./pages/page404.php");
            }
            ?>
        </div>
    </section>

</div>
<footer class="footer mt-auto py-3 bg-light">
    <div class="container">
        <?php
        if(file_exists('./lib/php/public_footer.php')){
            include ('./lib/php/public_footer.php');
        }
        ?>
    </div>
</footer>
</body>
</html>