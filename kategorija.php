<?php
    include 'connect.php';
    define('UPLPATH', 'img/');
	
	$kategorija = $_GET['id'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>LeParisien</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <section class="logo">
            <img src="logo.png" alt="ParisienLogo">
        </section>
    </header>
    <section class="navigacija">
        <nav class="navbar main_nav" role="navigation">
            <ul class="main nav navbar-nav">
                <li><a href="index.php">Početna</a></li>
                <li><a href="kategorija.php?id=sport">Sport</a></li>
                <li><a href="kategorija.php?id=kultura">Kultura</a></li>
                <li><a href="administracija.php">Administracija</a></li>
                <li><a href="unos.php">Unos</a></li>
            </ul>
        </nav>
    </section>
    <main>
        <section class="naslov">
            <h2><?php echo $kategorija; ?> svi članci</h2>
        </section>
        <section class="novi-red">
            <?php
                $query = "SELECT * FROM vijesti WHERE kategorija='$kategorija'";
                $result = mysqli_query($dbc, $query);
                $i = 0;
                while($row = mysqli_fetch_array($result)) {
                    echo '<article>';
                        echo '<img src="'. UPLPATH . $row ['slika'] .'"';
                        echo '<div class="media_body">';
                        echo '<h4 class="title">';
                        echo '<a href="clanak.php?id='.$row['id'].'">';
                        echo $row['naslov'];
                        echo '</a></h4>';
                        echo '</div>';
                    echo '</article>';
                }
            ?>
                        
        </section>
    </main>
    <footer>
        <span class="autorska-prava">Napravio: Damir Koštić</span>
        <p>Le Parisien</p>
    </footer>
</html>