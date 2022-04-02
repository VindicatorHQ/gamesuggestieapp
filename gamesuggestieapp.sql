-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 22 mrt 2022 om 14:59
-- Serverversie: 10.4.21-MariaDB
-- PHP-versie: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamesuggestieapp`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `customer`
--

CREATE TABLE `customer` (
  `userID` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `customer`
--

INSERT INTO `customer` (`userID`, `userName`) VALUES
(1, 'Frederik'),
(2, 'Sam'),
(3, 'Christiaan'),
(4, 'Mikal');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gamedata`
--

CREATE TABLE `gamedata` (
  `gameID` int(11) NOT NULL,
  `releaseYear` date NOT NULL,
  `gameName` varchar(255) NOT NULL,
  `gamePublisher` varchar(255) NOT NULL,
  `gameGenre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `gamedata`
--

INSERT INTO `gamedata` (`gameID`, `releaseYear`, `gameName`, `gamePublisher`, `gameGenre`) VALUES
(1, '2020-06-02', 'Valorant', 'Riot Games', 'First-person shooter'),
(2, '2019-10-25', 'Call of Duty: Modern Warfare', 'Activision', 'First-person shooter'),
(3, '2012-08-21', 'Counter-Strike: Global Offensive', 'Valve', 'First-person shooter'),
(4, '2006-11-29', 'Garrys Mod', 'Facepunch Studios', 'Sandbox'),
(5, '2017-03-03', 'The Legend of Zelda: Breath of the Wild', 'Nintendo', 'Action-adventure'),
(6, '2013-09-17', 'Grand Theft Auto V', 'Rockstar Games', 'Action-adventure'),
(7, '2020-03-23', 'Half-Life: Alyx', 'Valve', 'VR'),
(8, '2010-07-27', 'Starcraft 2', 'Blizzard entertainment', 'Strategy'),
(9, '2012-10-19', 'Euro Truck Simulator 2', 'SCS Software', 'Simulation'),
(10, '2018-05-01', 'Beat Saber', 'Beat Games', 'VR'),
(11, '2020-08-17', 'Microsoft Flight Simulator', 'Asobo Studio', 'Simulation'),
(12, '2015-03-10', 'Cities: Skylines', 'Paradox Interactive', 'Simulation'),
(13, '2000-04-02', 'The Sims', 'Electronic Arts', 'Sandbox'),
(14, '2011-11-18', 'Minecraft', 'Mojang Studios', 'Sandbox'),
(15, '2016-02-02', 'American Truck Simulator', 'SCS Software', 'Simulation'),
(16, '2018-10-26', 'Red Read Redemption 2', 'Rockstar Games', 'Action-adventure'),
(17, '2021-09-28', 'Age of Empires IV', 'Xbox Game Studios', 'Strategy'),
(18, '2018-06-15', 'Among Us', 'Innersloth', 'Indie'),
(19, '2016-04-05', 'Job Simulator', 'Owlchemy Labs', 'VR'),
(20, '2011-08-28', 'The Binding of Isaac', 'Edmund McMiller', 'Indie'),
(21, '2022-02-25', 'Elden ring', 'From Software', 'Action-adventure'),
(22, '2021-09-16', 'Call of Duty: Vanguard', 'Activison', 'First person shooter'),
(23, '2009-10-27', 'League of legends', 'Riot games', 'Strategy'),
(24, '2006-08-27', 'Roblox', 'Roblox Corporation', 'Sandbox'),
(25, '2014-04-01', 'Goat simulator', 'Coffee stain studio', 'Indie'),
(26, '2021-10-07', 'Far Cry 6', 'Ubisoft', 'First-person shooter'),
(27, '2019-12-04', 'Lost Ark', 'Smilegate', 'MMO'),
(28, '2004-11-23', 'World of Warcraft', 'Blizzard Entertainment', 'MMO'),
(29, '2001-01-04', 'Runescape', 'Jagex', 'MMO'),
(30, '2010-09-30', 'Final Fantasy XIV', 'Square Enix', 'MMO'),
(31, '2016-03-03', 'Black Dessert Online', 'Pearl Abyss', 'MMO'),
(32, '2011-11-11', 'The Elder Scrolls V: Skyrim', 'Bethesda Game Studios', 'Action adventure'),
(33, '2012-08-16', 'Terraria', 'Re-Logic', 'Sandbox'),
(34, '2016-02-25', 'Super Hot', 'Super Hot Team', 'VR'),
(35, '2018-01-25', 'Celeste', 'Matt Makes Games', 'Indie'),
(36, '2015-09-15', 'Undertale', 'Toby Fox', 'Indie'),
(37, '2019-12-10', 'Boneworks', 'Stress Level Zero', 'VR'),
(38, '2015-04-27', 'Kerbal space program', 'Squad', 'Simulation'),
(39, '2010-08-12', 'World of tanks', 'Wargaming', 'Strategy'),
(40, '2016-10-21', 'Civilization VI', 'Ed Beach', 'Strategy');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rating`
--

CREATE TABLE `rating` (
  `ratingID` int(11) NOT NULL,
  `gameID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `ratingValue` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `rating`
--

INSERT INTO `rating` (`ratingID`, `gameID`, `userID`, `ratingValue`) VALUES
(59, 6, 4, 8),
(60, 8, 4, 6),
(61, 39, 4, 5),
(62, 17, 4, 7),
(63, 38, 2, 10),
(64, 34, 2, 7),
(65, 21, 2, 1),
(66, 14, 2, 9),
(67, 18, 2, 6),
(68, 2, 2, 9),
(69, 1, 1, 0),
(70, 12, 1, 10),
(71, 22, 1, 1);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`userID`);

--
-- Indexen voor tabel `gamedata`
--
ALTER TABLE `gamedata`
  ADD PRIMARY KEY (`gameID`),
  ADD UNIQUE KEY `gameName` (`gameName`);

--
-- Indexen voor tabel `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`ratingID`),
  ADD KEY `gameID` (`gameID`),
  ADD KEY `userID` (`userID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `gamedata`
--
ALTER TABLE `gamedata`
  MODIFY `gameID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT voor een tabel `rating`
--
ALTER TABLE `rating`
  MODIFY `ratingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`gameID`) REFERENCES `gamedata` (`gameID`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `customer` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
