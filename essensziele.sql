-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 28. Jan 2020 um 16:15
-- Server-Version: 10.3.16-MariaDB
-- PHP-Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `essensziele`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adressen`
--

CREATE TABLE `adressen` (
  `id` int(3) NOT NULL,
  `str` varchar(256) COLLATE utf8_german2_ci NOT NULL,
  `hsnr` varchar(256) COLLATE utf8_german2_ci NOT NULL,
  `plz` int(5) NOT NULL,
  `ort` varchar(256) COLLATE utf8_german2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Daten für Tabelle `adressen`
--

INSERT INTO `adressen` (`id`, `str`, `hsnr`, `plz`, `ort`) VALUES
(1, 'Spitalerstraße', '22', 20095, 'Hamburg\r\n'),
(2, 'Ballindamm', '40 EG2', 20095, 'Hamburg'),
(3, 'Spadenteich', '1', 20099, 'Hamburg'),
(4, 'Ditmar-Koel-Straße', '21', 20459, 'Hamburg'),
(5, 'Brandstwiete', '58', 20457, 'Hamburg'),
(6, 'Steindamm', '53', 20099, 'Hamburg'),
(7, 'Depenau', '10', 20095, 'Hamburg'),
(8, 'Kleine Reichenstraße', '18', 20457, 'Hamburg'),
(9, 'Rosenstraße Ecke', 'Getrudenkirchhof', 20095, 'Hamburg'),
(10, 'Kurze Mühren ', '13', 20095, 'Hamburg'),
(11, 'Speersort', '1', 20095, 'Hamburg'),
(12, 'Rathausmarkt', '7', 20095, 'Hamburg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorien`
--

CREATE TABLE `kategorien` (
  `id` int(2) NOT NULL,
  `bezeichnung` varchar(256) COLLATE utf8_german2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Daten für Tabelle `kategorien`
--

INSERT INTO `kategorien` (`id`, `bezeichnung`) VALUES
(1, 'Alles'),
(2, 'Hausmannskost'),
(3, 'Pizza / Pasta'),
(4, 'Sonstiges'),
(5, 'Asiatisch'),
(6, 'Burger');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int(2) NOT NULL,
  `name` varchar(256) COLLATE utf8_german2_ci NOT NULL,
  `entfernung` int(1) NOT NULL,
  `preis` int(1) NOT NULL,
  `veggie` int(1) NOT NULL,
  `adresse` int(1) NOT NULL,
  `kategorie` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Daten für Tabelle `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `entfernung`, `preis`, `veggie`, `adresse`, `kategorie`) VALUES
(1, 'Perle', 1, 1, 3, 1, 1),
(2, 'Europapassage', 1, 2, 3, 2, 1),
(3, 'Max & Consorten', 3, 1, 2, 3, 2),
(4, 'Luigis\'s', 3, 2, 3, 4, 3),
(5, 'Bella Italia', 2, 1, 2, 5, 3),
(6, 'Restaurant Kabul', 3, 1, 2, 6, 3),
(7, 'Goot', 2, 3, 1, 7, 2),
(8, 'O-ren Ishii', 2, 3, 3, 8, 5),
(9, 'Better burger Company', 1, 2, 3, 9, 6),
(10, 'Bucks Burgers', 2, 2, 3, 10, 6),
(11, 'Mr. Cherng', 2, 3, 3, 11, 5),
(12, 'Franco Rathauspassage', 2, 2, 3, 12, 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `adressen`
--
ALTER TABLE `adressen`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kategorien`
--
ALTER TABLE `kategorien`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategorie` (`kategorie`),
  ADD KEY `adresse` (`adresse`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `adressen`
--
ALTER TABLE `adressen`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT für Tabelle `kategorien`
--
ALTER TABLE `kategorien`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `adresse` FOREIGN KEY (`adresse`) REFERENCES `adressen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kategorie` FOREIGN KEY (`kategorie`) REFERENCES `kategorien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
