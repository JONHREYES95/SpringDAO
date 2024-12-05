-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-12-2024 a las 23:30:08
-- Versión del servidor: 8.4.3
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `thuvien`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `publishdate` date DEFAULT NULL,
  `numberofpage` int DEFAULT NULL,
  `sold` int DEFAULT NULL,
  `description` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cover` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `book`
--

INSERT INTO `book` (`id`, `title`, `author`, `category`, `publishdate`, `numberofpage`, `sold`, `description`, `cover`) VALUES
(5, 'Cien Años de Soledad', 'Gabriel Garcia Marquez', 'Realismo Magico', '1967-06-01', 50, 201, 'Cien años de soledad es una novela del escritor colombiano Gabriel García Márquez, ganador del Premio Nobel de Literatura en 1982.', 'YS7nQx.jpg'),
(7, 'Valle de la calma', 'Angel David Revilla', 'Terror', '1976-06-08', 100, 0, 'DrossRotzank', 'X2ubCT.jpg'),
(8, 'Así es la Puta vida', 'Jordy Wild', 'autoayuda', '2022-03-17', 100, 0, 'prueba nueva', 'bQive0.jpg'),
(9, 'Lugares', 'Luisito Comunica', 'Geografia', '2022-06-10', 150, 0, 'prueba2', 'rCPoDe.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `bookid` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rating`
--

INSERT INTO `rating` (`id`, `userid`, `username`, `bookid`, `rating`, `comment`) VALUES
(1, 3, 'Nguyen Anh Kiet', 1, 5, 'Hay VCL'),
(2, 4, 'Trinh Thuy Trang', 1, 1, 'Chan'),
(3, 7, 'Kieu Thi Lang', 4, 5, 'Truyen rat hay'),
(4, 3, 'Nguyen Anh Kiet', 4, 3, 'Binh Thuong'),
(5, 8, 'yara', 5, 5, 'muy buen escritor, excelente novela.'),
(6, 2, 'Usuario1', 5, 1, 'no me gusto, yo puedo escribir algo mejor.'),
(7, 9, 'fabiana galdamez', 5, 5, 'Excelente libro lo recomiendo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`, `role`) VALUES
(1, 'Jonathan Reyes', 'admin', 'admin@.com', 'admin', 'admin'),
(2, 'Usuario1', 'musk', 'musk@.com', 'musk', 'user'),
(8, 'yara', 'yara', 'yara@gmail.com', 'yara', 'user'),
(9, 'fabiana galdamez', 'fabi', 'fabiigaldy@gmail.com', '0000', 'user');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userorder`
--

DROP TABLE IF EXISTS `userorder`;
CREATE TABLE IF NOT EXISTS `userorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `bookid` int DEFAULT NULL,
  `bookname` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `userorder`
--

INSERT INTO `userorder` (`id`, `userid`, `bookid`, `bookname`, `quantity`, `status`) VALUES
(1, 3, 1, 'Mat Biec', 50, 1),
(2, 3, 2, 'Tat Den', 100, 0),
(3, 3, 2, 'Tat Den', 200, 0),
(4, 4, 1, 'Mat Biec', 10000, 0),
(5, 4, 2, 'Tat Den', 44555, 0),
(6, 3, 1, 'Mat Biec', 100, 0),
(7, 7, 4, 'Vo Nhat', 200, 1),
(8, 9, 5, 'Cien Años de Soledad', 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
