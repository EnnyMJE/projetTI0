<!doctype html>


<?php
if (isset($_POST['logon'])) {
    extract($_POST, EXTR_OVERWRITE);
    $mb = new MembreBD($cnx);
    $membre = $mb->getMembre($ad_mail, $mot_pass);
    //var_dump($membre);
    if ($membre) {
        $_SESSION['membre'] = 1;
        //print 'OK';
        //header('http://localhost/ProjetTItest/index_.php?page=accueil.php');
        header('../index_.php');
    } else {
        $message = "Identifiants incorrects !";
    }
}
?>





<body class="mystyle">

<h3>Bonjour !</h3>
<h5>Pour voir les pages de notre bibliothèque, veuillez tout d'abord vous connecter ou vous inscrire</h5>

<div class="container">
    <div class="login-box">
        <div class="row">
            <div class="col-md-6 login-left">
                <h2> Login </h2>
                <form action="<?php print $_SERVER['PHP_SELF']; ?>" method="post">
                    <div class="form-group">
                        <label>Adresse mail</label>
                        <input type="email" class="form-control" id="ad_mail" name="ad_mail" required>
                    </div>
                    <div class="form-group">
                        <label>Mot de pass</label>
                        <input type="password" class="form-control" id="mot_pass" name="mot_pass" required>
                    </div>
                    <button type="submit" class="btn btn-primary" id="logon" name="logon"> Logon</button>

                    <p class=""><br><?php
                        if (isset($message)) {
                            print $message;
                        }

                        ?></p>

                </form>
            </div>
            <div class="col-md-6 login-right">
                <h2> Register </h2>
                <form action="registration.php" method="post">
                    <div class="form-group">
                        <label>Adresse mail</label>
                        <input type="email" class="form-control" id="ad_mail" name="ad_mail" required>
                    </div>
                    <div class="form-group">
                        <label>Mot de pass</label>
                        <input type="password" class="form-control" id="mot_pass" name="mot_pass" required>
                    </div>
                    <button type="submit" class="btn btn-primary" id="enregistre" name="enregistre"> Enregistre</button>

                </form>

            </div>
        </div>
    </div>
</div>

</body>