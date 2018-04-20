-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 20. 04 2018 kl. 12:16:35
-- Serverversion: 10.1.26-MariaDB
-- PHP-version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kulturhuset`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `arrengement`
--

CREATE TABLE `arrengement` (
  `id` int(11) NOT NULL,
  `titel` varchar(255) NOT NULL,
  `varighed` int(11) NOT NULL,
  `Pris` int(11) NOT NULL,
  `fk_kategori` int(11) NOT NULL,
  `beskrivelse` varchar(255) NOT NULL,
  `billede` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `arrengement`
--

INSERT INTO `arrengement` (`id`, `titel`, `varighed`, `Pris`, `fk_kategori`, `beskrivelse`, `billede`) VALUES
(3, 'Cykkelmyggen Egon', 130, 130, 4, 'Nu lander børneklassikeren på Kultur Huset', 'pic13.jpg'),
(4, 'Junglebogen', 105, 100, 1, 'Junglebogen handler om den forældreløse dreng Mowgli, der bliver opdraget i junglen af ulvene Raksha, Akela og resten af deres flok.', 'pic12.jpg'),
(5, 'Lazy Sunday', 120, 200, 2, 'Kultur huset bidrager til at udbrede jazzen og udvikle hele musiklivet', 'pic1.jpg'),
(8, 'Kultur rock', 150, 120, 2, 'Kultur rock for alle festløse mennesker', 'pic14.jpg'),
(9, 'Foredrag om universet', 70, 95, 3, 'foredraget om universet vil Jorgen paulsen fortælle om liv i universet', 'pic2.jpg'),
(10, 'Horror Movie night', 360, 450, 1, 'Horror movie night vil der blive afspillet fire forskellige gyser film med pauser imellem', 'pic5.jpg'),
(12, 'The martian ', 151, 130, 1, 'En astronaut bliver strandet på Mars, efter at hans hold troede han var død og nu må  han stole på hans opfindsomhed for at finde en måde at signalere til jorden, at han lever.', 'pic6.jpg');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `navn` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `kategori`
--

INSERT INTO `kategori` (`id`, `navn`) VALUES
(1, 'Film'),
(2, 'Koncert'),
(3, 'foredrag'),
(4, 'theater');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `kunde`
--

CREATE TABLE `kunde` (
  `id` int(11) NOT NULL,
  `fornavn` varchar(255) NOT NULL,
  `efternavn` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `kunde`
--

INSERT INTO `kunde` (`id`, `fornavn`, `efternavn`) VALUES
(1, 'Hans', 'Jørgensen'),
(2, 'Pernille', 'Hansen'),
(3, 'Lisa', 'Winther'),
(4, 'Astrid', 'Søndergaard'),
(5, 'Victoria', 'Lauritsen'),
(6, 'Nicolai', 'Jakobsen');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `resevation`
--

CREATE TABLE `resevation` (
  `id` int(11) NOT NULL,
  `fk_kunde` int(11) NOT NULL,
  `E-mail` varchar(255) NOT NULL,
  `plads` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `sal`
--

CREATE TABLE `sal` (
  `id` int(11) NOT NULL,
  `navn` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `udbudtarrengement`
--

CREATE TABLE `udbudtarrengement` (
  `id` int(11) NOT NULL,
  `dato` date NOT NULL,
  `tid` time NOT NULL,
  `fk_sal` int(11) NOT NULL,
  `pris` int(11) NOT NULL,
  `fk_arrengement` int(11) NOT NULL,
  `antal pladser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `arrengement`
--
ALTER TABLE `arrengement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kategori` (`fk_kategori`);

--
-- Indeks for tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `resevation`
--
ALTER TABLE `resevation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kunde` (`fk_kunde`);

--
-- Indeks for tabel `sal`
--
ALTER TABLE `sal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `udbudtarrengement`
--
ALTER TABLE `udbudtarrengement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sal` (`fk_sal`),
  ADD KEY `fk_arrengement` (`fk_arrengement`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `arrengement`
--
ALTER TABLE `arrengement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Tilføj AUTO_INCREMENT i tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Tilføj AUTO_INCREMENT i tabel `kunde`
--
ALTER TABLE `kunde`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Tilføj AUTO_INCREMENT i tabel `resevation`
--
ALTER TABLE `resevation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `sal`
--
ALTER TABLE `sal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `udbudtarrengement`
--
ALTER TABLE `udbudtarrengement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `arrengement`
--
ALTER TABLE `arrengement`
  ADD CONSTRAINT `arrengement_ibfk_2` FOREIGN KEY (`fk_kategori`) REFERENCES `kategori` (`id`);

--
-- Begrænsninger for tabel `resevation`
--
ALTER TABLE `resevation`
  ADD CONSTRAINT `resevation_ibfk_1` FOREIGN KEY (`fk_kunde`) REFERENCES `kunde` (`id`);

--
-- Begrænsninger for tabel `udbudtarrengement`
--
ALTER TABLE `udbudtarrengement`
  ADD CONSTRAINT `udbudtarrengement_ibfk_1` FOREIGN KEY (`fk_arrengement`) REFERENCES `arrengement` (`id`),
  ADD CONSTRAINT `udbudtarrengement_ibfk_2` FOREIGN KEY (`fk_sal`) REFERENCES `sal` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
