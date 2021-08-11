<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="admin/index_.php?page=accueil_admin.php">Administrateur</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index_.php?page=accueil.php">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="index_.php?page=trouveLivre.php">Trouve des Livres</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        System de Bibliotheque
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="index_.php?page=emprunter.php">Emprunter un livre </a></li>
                        <li><a class="dropdown-item" href="index_.php?page=lectureSurPlace.php">Lecture sur place</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>