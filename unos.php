<?php 
   if(isset($_POST['prihvati'])) {
    include 'connect.php';
    $picture = $_FILES['pphoto']['name'];
    $title = $_POST['title'];
    $about = $_POST['about'];
    $content = $_POST['content'];
    $category = $_POST['category'];
    $date = date('d.m.Y.');
    if(isset($_POST['archive'])) {
        $archive = 1;
    } else {
        $archive = 0;
    }

    $target_dir = 'img/'.$picture;
    move_uploaded_file($_FILES['pphoto']['tmp_name'], $target_dir);

    // prepare and bind
    $stmt = $dbc->prepare("INSERT INTO vijesti (datum, naslov, sazetak, tekst, slika, kategorija, arhiva) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssssss", $date, $title, $about, $content, $picture, $category, $archive);

    // set parameters and execute
    $picture = $_FILES['pphoto']['name'];
    $title = $_POST['title'];
    $about = $_POST['about'];
    $content = $_POST['content'];
    $category = $_POST['category'];
    $date = date('d.m.Y.');
    $stmt->execute();

    echo "New records created successfully";

    $stmt->close();


	include 'skripta.php'; die;
}

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
        <section class="unosForma"> 
        <form action="" method="post" enctype="multipart/form-data">
                <div class="form-item">
                <span id="porukaTitle" class="bojaPoruke"></span>
                <label for="title">Naslov vijesti</label>
                <div class="form-field">
                    <input type="text" name="title" id="title" class="form-field-textual">
                </div>
            </div>
            <div class="form-item">
                <span id="porukaAbout" class="bojaPoruke"></span>
                <label for="about">Kratki sadržaj vijesti (do 50 znakova)</label>
                <div class="form-field">
                    <textarea name="about" id="about" cols="30" rows="10" class="form-field-textual"></textarea>
                </div>
            </div>
            <div class="form-item">
                <span id="porukaContent" class="bojaPoruke"></span>
                <label for="content">Sadržaj vijesti</label>
                <div class="form-field">
                    <textarea name="content" id="content" cols="30" rows="10" class="form-field-textual"></textarea>
                </div>
            </div>
            <div class="form-item">
                <span id="porukaSlika" class="bojaPoruke"></span>
                <label for="pphoto" >Slika: </label>
                <div class="form-field">
                    <input type="file" name="pphoto" id="pphoto" class="input-text" accept="image/x-png,image/gif,image/jpeg">
                </div>
            </div>
            <div class="form-item">
                <span id="porukaKategorija" class="bojaPoruke"></span>
                <label for="category">Kategorija vijesti</label>
                <div class="form-field">
                    <select name="category" id="category" class="form-field-textual">
						<option value="izbor">Odaberite kategoriju</option>
                        <option value="sport">Sport</option>
                        <option value="kultura">Kultura</option>
                    </select>
                </div>
            </div>
            <div class="form-item">
                <label>Spremiti u arhivu:
                    <div class="form-field">
                        <input type="checkbox" name="archive" id="archive">
                    </div>
                </label>
            </div>
            <div class="form-item">
                <button type="reset" value="Poništi">Poništi</button>
                <button type="submit" name="prihvati" id="slanje" value="Prihvati">Prihvati</button>
            </div>
        </form>
        </section>
        <script>
            // Provjera forme prije slanja
            document.getElementById("slanje").onclick = function(event) {

            var slanjeForme = true;

            // Naslov vjesti (5-30 znakova)
            var poljeTitle = document.getElementById("title");
            var title = document.getElementById("title").value;
            if (title.length < 5 || title.length > 30) {
            slanjeForme = false;
            poljeTitle.style.border="1px dashed red";
            document.getElementById("porukaTitle").innerHTML="Naslov vjesti mora imati između 5 i 30 znakova!<br>";
			} else {
            poljeTitle.style.border="1px solid green";
            document.getElementById("porukaTitle").innerHTML="";
            }

            // Kratki sadržaj (10-100 znakova)
            var poljeAbout = document.getElementById("about");
            var about = document.getElementById("about").value;
            if (about.length < 10 || about.length > 100) {
            slanjeForme = false;
            poljeAbout.style.border="1px dashed red";
            document.getElementById("porukaAbout").innerHTML="Kratki sadržaj mora imati između 10 i 100 znakova!<br>";
			} else {
            poljeAbout.style.border="1px solid green";
            document.getElementById("porukaAbout").innerHTML="";
            }
            // Sadržaj mora biti unesen
            var poljeContent = document.getElementById("content");
            var content = document.getElementById("content").value;
            if (content.length == 0) {
            slanjeForme = false;
            poljeContent.style.border="1px dashed red";
            document.getElementById("porukaContent").innerHTML="Sadržaj mora biti unesen!<br>";
			} else {
            poljeContent.style.border="1px solid green";
            document.getElementById("porukaContent").innerHTML="";
            }
            // Slika mora biti unesena
            var poljeSlika = document.getElementById("pphoto");
            var pphoto = document.getElementById("pphoto").value;
            if (pphoto.length == 0) {
            slanjeForme = false;
            poljeSlika.style.border="1px dashed red";
            document.getElementById("porukaSlika").innerHTML="Slika mora biti unesena!<br>";
			} else {
            poljeSlika.style.border="1px solid green";
            document.getElementById("porukaSlika").innerHTML="";
            }
            // Kategorija mora biti odabrana
            var poljeCategory = document.getElementById("category");
            if(document.getElementById("category").selectedIndex == 0) {
            slanjeForme = false;
            poljeCategory.style.border="1px dashed red";

            document.getElementById("porukaKategorija").innerHTML="Kategorija mora biti odabrana!<br>";
			} else {
            poljeCategory.style.border="1px solid green";
            document.getElementById("porukaKategorija").innerHTML="";
            }

            if (slanjeForme != true) {
            event.preventDefault();
        }

        };
    </script>
    </main>
    <footer>
        <span class="autorska-prava">Napravio: Damir Koštić</span>
        <p>Le Parisien</p>
    </footer>
</body>
</html>