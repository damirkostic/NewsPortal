<?php
include 'connect.php';
define('UPLPATH', 'img/');
$id =$_GET['id'];
$query = "SELECT * FROM vijesti WHERE id='$id'";
$result = mysqli_query($dbc, $query);
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
        <?php 
            while($row = mysqli_fetch_array($result)) {
				$id = $row['id'];
                echo '<div class="row">
                <h2 class="category"><span>'.$row['kategorija'].'</span></h2>
                <h1 class="title">'. $row['naslov'] .'</h1>
                <p>AUTOR:</p>
                <p>OBJAVLJENO: <span>'.$row['datum'].'</span> </p>
                </div>
                <section class="slika">
                     
                         <img src="'.UPLPATH . $row['slika'].'">
                    
                </section>
                <section class="about">
                    <p>
                     <i>'.$row['sazetak'].'</i>
                    </p>
                </section>
                <section class="sadrzaj"> 
                    <p>
                      '.$row['tekst'].'
                    </p>
                </section>';
            }
        ?>
    </main>
    <footer>
        <span class="autorska-prava">Napravio: Damir Koštić</span>
        <p>Le Parisien</p>
    </footer>
</body>
</html>