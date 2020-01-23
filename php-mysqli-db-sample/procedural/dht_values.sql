-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 23. Jan 2020 um 08:41
-- Server-Version: 10.3.15-MariaDB-1
-- PHP-Version: 7.3.4-2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `dev_sensors`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dht_values`
--

CREATE TABLE `dht_values` (
  `time` bigint(11) NOT NULL,
  `serial_number` varchar(100) NOT NULL,
  `temperature` float NOT NULL,
  `humidity` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `dht_values`
--

INSERT INTO `dht_values` (`time`, `serial_number`, `temperature`, `humidity`) VALUES
(20200123082444, '123', 10, 12),
(20200123083145, '123', 10, 12),
(20200123083148, '123', 10, 12),
(20200123083427, '123', 10, 12),
(20200123083447, '123', 10, 12),
(20200123083448, '123', 10, 12),
(20200123083449, '123', 10, 12),
(20200123083452, '123', 10, 1233),
(20200123083508, '123', 10, 1233),
(20200123083532, '123', 10, 1233),
(20200123083707, '123', 10, 1233),
(20200123083723, '123', 10, 1233),
(20200123083904, '123', 10, 1233),
(20200123083946, '123', 10, 1233),
(20200123084006, '123', 10, 1233);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `dht_values`
--
ALTER TABLE `dht_values`
  ADD UNIQUE KEY `time-serial` (`time`,`serial_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
