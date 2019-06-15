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
        <section class="prvi-red">
            <p class="category"><?php echo $category; ?></p>
            <h1 class="title"><?php echo $title; ?></h1>
            <p class="autor">AUTOR:</p>
            <p class="objavljeno">OBJAVLJENO:</p>
        <section class="slika">
            <?php echo "<img src='img/$picture'"; ?>
        </section>
        <section class="about">
            <p><?php echo $about; ?></p>
        </section>
        <section class="content">
            <p><?php echo $content; ?></p>
        </section>
        </section>
    </main>
    <footer>
        <span class="autorska-prava">Napravio: Damir Koštić</span>
        <p>Le Parisien</p>
    </footer>
</body>
</html>