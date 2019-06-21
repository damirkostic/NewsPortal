-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2019 at 03:14 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vijesti`
--
CREATE DATABASE IF NOT EXISTS `vijesti` DEFAULT CHARACTER SET utf32 COLLATE utf32_croatian_ci;
USE `vijesti`;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `ime` varchar(32) NOT NULL,
  `prezime` varchar(32) NOT NULL,
  `korisnicko_ime` varchar(32) NOT NULL,
  `lozinka` varchar(255) NOT NULL,
  `razina` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `ime`, `prezime`, `korisnicko_ime`, `lozinka`, `razina`) VALUES
(1, 'da', 'da', 'da', '$2y$10$HHaCcnP/YNIr1JCujqNHCOp6Xl8ven/NvqYxBIfLRkrN1LXIRHYNa', 1),
(2, 'Damir', 'KoÅ¡tiÄ‡', 'dkostic', '$2y$10$zbB69pxHYnJxZjWDe9bwmeLUx2UPjPQrZkxQqFUSvB.rphb5B1zJW', 1),
(4, 'Igor', 'Krznar', 'ikrznar', '$2y$10$nMegekx8yY1DZ2OBepqfTOpHw69bSI03hH7n85UlBBC1SbFLR/tAi', 0),
(5, '', '', '', '$2y$10$yjAZgDCspkPINuMGLw5nzughY9q0VZQHUWcZczfgKuEEEsEIPszpC', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE `vijesti` (
  `id` int(11) NOT NULL,
  `datum` varchar(32) COLLATE utf8_croatian_ci NOT NULL,
  `naslov` varchar(64) COLLATE utf8_croatian_ci NOT NULL,
  `sazetak` text COLLATE utf8_croatian_ci NOT NULL,
  `tekst` text COLLATE utf8_croatian_ci NOT NULL,
  `slika` varchar(64) COLLATE utf8_croatian_ci NOT NULL,
  `kategorija` varchar(64) COLLATE utf8_croatian_ci NOT NULL,
  `arhiva` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `vijesti`
--

INSERT INTO `vijesti` (`id`, `datum`, `naslov`, `sazetak`, `tekst`, `slika`, `kategorija`, `arhiva`) VALUES
(2, '14.06.2019.', 'Hrvatska izgubila od Tunisa!', 'U VaraÅ¾dinu nismo bili pravi!', 'Hrvatska nogometna reprezentacija je pala za jedno mjesto na najnovijoj Fifinoj ljestvici, a to je ujedno i najloÅ¡iji plasman izabranika Zlatka DaliÄ‡a nakon osvajanja srebra na Svjetskom prvenstvu u Rusiji u srpnju proÅ¡le godine', 'nogomet.jpeg', 'sport', 0),
(3, '14.06.2019.', 'Lovren odlazi iz Liverpoola?', 'Otkupna klauzula samo 28 milijuna eura...', 'Dejan Lovren finale Lige prvaka odgledao je s klupe pa su se probudile glasine da Ä‡e ovog ljeta biti prodan iz Liverpoola.\r\nOne su se joÅ¡ rasplamsale kad su Talijani ove srijede objavili kako je za usluge hrvatskog braniÄa zainteresiran posrnuli velikan Milan koji nikako da konsolidira svoju momÄad i izbori mjesto meÄ‘u europskom elitom.', 'nogomet2.jpeg', 'sport', 0),
(5, '14.06.2019.', 'IzloÅ¾ba Sva lica RiÅ¾inica', 'Bili smo na otvorenju izloÅ¾be', 'U Domu kulture Zvonimir u Solinu otvorena je izloÅ¾ba eksponata s arheoloÅ¡kog lokaliteteta RiÅ¾inice gdje je uz brojne artefakte pronaÄ‘en i kostur Å¾enske osobe preminule u 10. stoljeÄ‡u Äije je lice rekonstruirano uz pomoÄ‡ forenzike i moderne tehnologije. ', 'kultura1.jpeg', 'kultura', 0),
(6, '14.06.2019.', 'Manifestacija Rimski dani', 'FantastiÄna manifestacija koju ne Å¾elite propustiti.', 'Edukativno â€“ zabavna manifestacija Rimski dani, koja se krajem proljeÄ‡a odrÅ¾ava u Vinkovcima, tokom godina postala je iznimno popularan i prepoznatljiv turistiÄko â€“ zabavni dogaÄ‘aj u ovom dijelu Slavonije. OsmiÅ¡ljena od strane turistiÄke zajednica grada Vinkovaca, koja u suradnji s Gradskim muzejom Vinkovci te ostalim partnerima, a uz potporu Grada, svake godine predstavlja Vinkovce na originalan i jedinstven naÄin: kroz Å¾ive slike Colonie Aurelie Cibalae.', 'kultura2.jpeg', 'kultura', 0),
(7, '14.06.2019.', 'Subversive Festival', 'Nikad bogatiji festival', 'Festival koji Ä‡e se naredna dva tjedna odrÅ¾avati u zagrebaÄkim kinima Europa, TuÅ¡kanac, KIC-u, Muzeju suvremene umjetnosti i Pogonu Jedinstvo, u filmskom dijelu donosi viÅ¡e od 50 filmova, a u teorijskom organizira niz predavanja, okruglih stolova, gostovanja, najavljeno je sa Subversivea.\r\n\r\nNa zagrebaÄki festival stiÅ¾e viÅ¡e od stotinu gostiju, svjetskih intelektualaca, umjetnika, filmaÅ¡a i aktivista koji Ä‡e sudjelovati na Subversive, AlterEkonomskom i Balkanskom forumu sa zajedniÄkom ovogodiÅ¡njom festivalskom temom, Europa na rubu - prema novom emancipatornom imaginariju.', 'kultura3.jpeg', 'kultura', 0),
(8, '14.06.2019.', 'Å½ivotna priÄa HrgoviÄ‡a', 'Bili smo jedan dan sa Hrvatskom zvijezdom', 'Nije dugo trajalo, gledatelji u dvorani u predgraÄ‘u Washingtona, kao i oni pred televizijskim ekranima, nisu se joÅ¡ pravo ni zavalili u svoje stolce, a sve je bilo gotovo. Gregory Corbin (31), boksaÄ i osuÄ‘eni kriminalac, nestao je za 60 sekundi. Da, toliko je trebalo HrgoviÄ‡u da ga pogodi u bradu i ostvari osmu pobjedu u isto toliko profesionalnih nastupa.\r\n\r\nHvala Americi za ovu priliku, drago mi je Å¡to sam imao priliku boriti se ovdje. Ali niste imali vremena vidjeti najboljeg Filipa HrgoviÄ‡a. Nadam se da Ä‡u uskoro moÄ‡i opet pokazati koliko mogu i veÄ‡ sam rekao - spreman sam boriti se bilo kad, bilo gdje i protiv bilo koga, rekao je hrvatski boksaÄ, a kojeg je kultni magazin The Ring predstavio kao nadolazeÄ‡u boksaÄku zvijezdu.', 'sport.jpeg', 'sport', 0),
(9, '14.06.2019.', 'Hazard u Mardidu', 'Predstavljanje novoga igraÄa u Mardidu. ', 'Deset godina nakon kupovine Cristiana Ronalda u Madrid je stigla nova velika superzvijezda europskog nogometa. Za oko stotinu milijuna eura kupljen je Eden Hazard koji je ovog Äetvrtka odradio sve formalnosti, potpisao ugovor pa tehnicirao na dobro ispunjenom Santiago Bernabeu, gdje su ga doÄekali oduÅ¡evljeni navijaÄi.\r\n\r\n', 'sport2.png', 'sport', 0),
(10, '14.06.2019.', 'Slaven BiliÄ‡ ima novi klub!', 'VraÄ‡a se na otok.', 'Slaven BiliÄ‡ stekao je ugled u Engleskoj joÅ¡ tamo 2007. godine kada je na Wembleyju s Hrvatskom svladao Gordi Albion i oduzeo mu priliku nastupiti na nogometnom Euru, a bio je priliÄno medijski popularan i dok je bio na Äelu West Hama.\r\n\r\nNo, nakon Å¡to je dobio otkaz u Londonu kod ÄekiÄ‡ara, nije bio u stanju naÄ‡i novi dobar posao na Otoku pa je prihvatio voditi ugledni, ali posrnuli saudijski Al-Ittihad proÅ¡le godine, a ta se trenerska avantura pokazala kao fijasko, jer je brzo potjeran iz kluba.\r\n\r\nBivÅ¡i hrvatski izbornik u svojoj trenerskoj karijeri joÅ¡ uvijek Äeka na prvi trofej, nije mu to uspjelo niti s moskovskim Lokomotivom ni BeÅ¡iktaÅ¡om, a neuspjeh u Saudijskoj Arabiji malo je poljuljao povjerenje u njegove sposobnosti, no ovog Äetvrtka dobio je novu priliku u Engleskoj. Morao se zadovoljiti drugoligaÅ¡kim West Bromwich Albionom, ali u ovom trenutku i to je dovoljno dobra odskoÄna daska za njega.', 'sport3.jpeg', 'sport', 0),
(11, '14.06.2019.', 'Ljetno kino pod zvijezdama', 'TvrÄ‘ava kulture Å ibenik', 'Projekt je nastao u suradnji s festivalima koji su u Hrvatskoj meÄ‘u najznaÄajnijim promotorima nezavisnog i umjetniÄkog filma, a filmove za njega birali su selektori zagrebaÄkog kina Europa te Zagreb, Motovun i Subversive Film Festivala.\r\n\r\nPoÄetak filmskog programa na TvrÄ‘avi Barone obiljeÅ¾it Ä‡e gostovanje direktora i producentice Zagreb Film Festivala, Borisa T. MatiÄ‡a i Lane MatiÄ‡, voditelja zagrebaÄkog kina Europa, koji Ä‡e s koordinatoricom programa Selmom MehadÅ¾iÄ‡ izabrati filmove iz repertoara kina Europa, Zagreb Film Festivala te djeÄjeg festivala KinoKino.', 'kultura4.jpeg', 'kultura', 0),
(12, '14.06.2019.', 'Samostalna izloÅ¾ba Tee Hatadi ', 'Domu hrvatskih likovnih umjetnika', 'MuÅ¡Ä‡et smatra kako je praÄ‡enje ograde, koju je umjetnica formirala u obliku udaraljki, rasporedivÅ¡i cijevi razliÄitih dimenzija u zvuÄno tijelo ili plaÅ¡t, aktiviranjem dovodi u stav obrane, ali i odvajanja od svega nepoÅ¾eljnoga ili, rjeÄnikom umjetnice, ostvarenja zaÅ¡tite u obliku neprekidne, kruÅ¾no formirane igre.', 'kultura5.jpeg', 'kultura', 0),
(13, '14.06.2019.', 'Pula film festival', 'Posjetite, isplati se! ', 'Prilikom otvaranja legata u svibnju proÅ¡le godine, posveÄ‡enog Mileni DraviÄ‡ (1940.-2018.) i Draganu NikoliÄ‡u (1943.-2016.), sama je glumica izrazila Å¾aljenje Å¡to ondje nema njezine prve Zlatne arene koju je osvojila 1962.\r\n\r\nNaime, oko te nagrade postoji i neobiÄna priÄa - poÄetkom sedamdesetih bila je, uz nakit, otuÄ‘ena iz glumiÄina stana, a nakon viÅ¡e od dvadeset godina lopov joj je priÅ¡ao, priznao kraÄ‘u i zamolio za oprost, Å¡to je ona i uÄinila.', 'kultura6.jpeg', 'kultura', 0),
(17, '15.06.2019.', 'BuduÄ‡nost Hrvatske koÅ¡arke', 'IÅ¡li smo gledati buduÄ‡nost Hrvatske koÅ¡arke.', 'Svim onima koji pozornije prate domaÄ‡u koÅ¡arku znaju zbog Äega smo ovaj dvoboj povezali s buduÄ‡nosti hrvatske koÅ¡arke. Za RudeÅ¡ igra MVP U16 Europskog prvenstva na kojem je Hrvatska osvojila zlato, Roko PrkaÄin, a ponajbolji igraÄ Universitasa je Ivan PerasoviÄ‡, joÅ¡ jedan od nositelja igre generacije od koje oÄekujemo da iznjedri igraÄe koji Ä‡e nositi igru i seniorske reprezentativne selekcije. Iako klinci, PrkaÄin je upravo danas napunio 16 godina dok je PerasoviÄ‡ pola godine stariji, oba ova igraÄa su uspjeÅ¡no odgovorila izazovima seniorske koÅ¡arke na poÄetku sezone. PrkaÄin je uoÄi ove utakmice bio na prosjeku od 9,8 poena, 7,2 skoka i 2,2 asistencije, a PerasoviÄ‡ na 25 poena, 7,8 skokova i 2,4 asistencije. Bolju pozivnicu nisu mogli ispisati.', 'kosarka.jpg', 'sport', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `korisnicko_ime` (`korisnicko_ime`);

--
-- Indexes for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vijesti`
--
ALTER TABLE `vijesti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
