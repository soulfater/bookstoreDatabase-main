-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Dec 02. 18:59
-- Kiszolgáló verziója: 10.4.22-MariaDB
-- PHP verzió: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `bookstore`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `authors`
--

INSERT INTO `authors` (`id`, `first_name`, `last_name`) VALUES
(1, 'George R.R.', 'Martin'),
(2, 'J.R.R.', 'Tolkien'),
(3, 'Frank', 'Herbert'),
(4, 'George', 'Orwell'),
(5, 'Douglas', 'Adams');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `book`
--

CREATE TABLE `book` (
  `isbn` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `authors` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `book`
--

INSERT INTO `book` (`isbn`, `title`, `author`, `authors`, `quantity`, `price`) VALUES
('036723657236', 'Lord of the Rings: The Return of the King', 2, 'J.R.R Tolkien', 200, 25),
('046325463347', 'A Song of Ice and Fire: A Storm of Swords', 1, 'George R.R. Martin', 100, 30),
('047137813313', 'A Song of Ice and Fire: Game of Thrones', 1, 'George R.R. Martin', 100, 30),
('047274237457', 'A Song of Ice and Fire: A Feast of Crows', 1, 'George R.R. Martin', 100, 30),
('047274827846', 'A Song of Ice and Fire: The Winds of Winter', 1, 'George R.R. Martin', 100, 30),
('047294573378', 'A Song of Ice and Fire: A Clash of Kings', 1, 'George R.R. Martin', 100, 30),
('047354983755', 'A Song of Ice and Fire: A Dream of Spring', 1, 'George R.R. Martin', 100, 30),
('047487289744', '1984', 4, 'George Orwell', 100, 20),
('050752332853', 'Lord of The Rings: The Two Towers', 1, 'J.R.R. Tolkien', 200, 25),
('056325365762', 'Lord of The Rings: The Fellowship of the Ring', 1, 'J.R.R. Tolkien', 200, 25),
('057357335739', 'A Song of Ice and Fire: A Dance of Drangons', 1, 'Geroge R.R. Martin', 100, 30),
('058767598352', 'The Hitchhiker\'s Guide to the Galaxy', 5, 'Douglas Adams', 420, 42),
('082094824784', 'Dune', 3, 'Frank Herbert', 100, 15);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `book_discount`
--

CREATE TABLE `book_discount` (
  `book_id` varchar(255) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `postal_code` varchar(4) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `building_no` varchar(255) DEFAULT NULL,
  `flat_no` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `e-mail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `username`, `password`, `postal_code`, `street`, `building_no`, `flat_no`, `city`, `phone`, `e-mail`) VALUES
(2, '', '', 'test', '1234', '', '', '', '', '', '', 'something@something.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` decimal(2,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `order_details`
--

CREATE TABLE `order_details` (
  `book_id` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`isbn`);

--
-- A tábla indexei `book_discount`
--
ALTER TABLE `book_discount`
  ADD UNIQUE KEY `book_discount_book_id_uindex` (`book_id`),
  ADD UNIQUE KEY `book_discount_discount_id_uindex` (`discount_id`);

--
-- A tábla indexei `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_customer_id_uindex` (`customer_id`);

--
-- A tábla indexei `order_details`
--
ALTER TABLE `order_details`
  ADD UNIQUE KEY `order_details_book_id_uindex` (`book_id`),
  ADD UNIQUE KEY `order_details_order_id_uindex` (`order_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_authors__fk` FOREIGN KEY (`author`) REFERENCES `authors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Megkötések a táblához `book_discount`
--
ALTER TABLE `book_discount`
  ADD CONSTRAINT `book_discount_book__fk` FOREIGN KEY (`book_id`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_discount_discount__fk` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer__fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_book__fk` FOREIGN KEY (`book_id`) REFERENCES `book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_orders__fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
