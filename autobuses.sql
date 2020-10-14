-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2020 a las 21:11:30
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

CREATE DATABASE parabus;

USE parabus;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `autobuses`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `listado_paradas` (IN `idBus` INT)  SELECT parada_bus.id_paradaB, autobus.No_Placa, parada.Numero_calle, zona.zona, parada_bus.hora_llegada from autobus INNER JOIN parada_bus on parada_bus.cod_autobus = autobus.cod_autobus INNER JOIN parada on parada_bus.id_parada = parada.id_parada INNER JOIN zona on parada_bus.id_zona = zona.id_zona WHERE autobus.cod_autobus = idBus$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autobus`
--

CREATE TABLE `autobus` (
  `cod_autobus` int(11) NOT NULL,
  `No_Placa` varchar(10) DEFAULT NULL,
  `Id_Modelo` int(11) DEFAULT NULL,
  `Id_color` int(11) DEFAULT NULL,
  `no_motor` int(11) DEFAULT NULL,
  `no_chasis` int(11) DEFAULT NULL,
  `cc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `autobus`
--

INSERT INTO `autobus` (`cod_autobus`, `No_Placa`, `Id_Modelo`, `Id_color`, `no_motor`, `no_chasis`, `cc`) VALUES
(5, 'U141UKL', 15, 6, 488838, 48833, 5000),
(6, 'C234QPA', 16, 9, 489939, 3882, 5000),
(7, 'U675ACS', 15, 1, 455643, 465433234, 4000),
(8, 'C124PYM', 4, 6, 48891983, 839902, 4000),
(9, 'C 236 KFC ', 12, 9, 1421, 56, 2900),
(10, 'U789JKM', 12, 5, 47749, 74883, 4000),
(11, 'U748JKN', 1, 5, 3378288, 36738, 4000),
(12, 'p456jkm', 2, 5, 377388, 477584, 3500),
(13, 'p584kjh', 12, 2, 47893429, 8593443, 3500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacidad`
--

CREATE TABLE `capacidad` (
  `id_capacidad` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `capacidad`
--

INSERT INTO `capacidad` (`id_capacidad`, `cantidad`) VALUES
(1, 30),
(2, 40),
(3, 50),
(4, 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id_color` int(11) NOT NULL,
  `color` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id_color`, `color`) VALUES
(1, 'Gris'),
(2, 'Verde'),
(3, 'Rojo'),
(4, 'Morado'),
(5, 'Cafe'),
(6, 'Blanco'),
(7, 'Negro'),
(8, 'Azul marin'),
(9, 'Azul marin'),
(10, 'Azul marin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivo`
--

CREATE TABLE `dispositivo` (
  `cod_dispositivo` int(11) NOT NULL,
  `nombre_dispositivo` varchar(25) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dispositivo`
--

INSERT INTO `dispositivo` (`cod_dispositivo`, `nombre_dispositivo`, `descripcion`, `precio`) VALUES
(218325, 'GPS', 'Para controlar la ubicaciÃ³n de las unidades', '1300.00'),
(637881, 'GPS', 'GPS para monitorear los buses', '1500.00'),
(577848899, 'GPS', 'Para la saber la ubicacion actual del autobus', '3000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivo_autobus`
--

CREATE TABLE `dispositivo_autobus` (
  `id_dispositivoA` int(11) NOT NULL,
  `cod_autobus` int(11) DEFAULT NULL,
  `cod_dispositivo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id_horario` int(11) NOT NULL,
  `hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id_horario`, `hora`) VALUES
(1, '06:00:00'),
(2, '07:00:00'),
(3, '08:00:00'),
(4, '10:00:00'),
(5, '11:00:00'),
(6, '12:00:00'),
(7, '13:00:00'),
(8, '14:00:00'),
(9, '15:00:00'),
(10, '16:00:00'),
(11, '17:00:00'),
(12, '18:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hora_autobus`
--

CREATE TABLE `hora_autobus` (
  `id_horaA` int(11) NOT NULL,
  `cod_autobus` int(11) DEFAULT NULL,
  `id_horario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencias`
--

CREATE TABLE `incidencias` (
  `id_incidencia` int(11) NOT NULL,
  `Nombre_incidencia` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `incidencias`
--

INSERT INTO `incidencias` (`id_incidencia`, `Nombre_incidencia`) VALUES
(1, 'Mantenimiento'),
(2, 'Reparacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia_autobus`
--

CREATE TABLE `incidencia_autobus` (
  `No_incidencia` int(11) NOT NULL,
  `cod_autobus` int(11) DEFAULT NULL,
  `id_incidencia` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `coste` decimal(8,2) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `incidencia_autobus`
--

INSERT INTO `incidencia_autobus` (`No_incidencia`, `cod_autobus`, `id_incidencia`, `fecha`, `coste`, `descripcion`) VALUES
(1, 5, 1, '2020-06-03', '500.00', 'Se hizo mantemiento de frenos y de motor'),
(2, 6, 2, '2020-06-03', '3000.00', 'Se le hizo reparacion de disco de cloutch'),
(3, 6, 1, '2020-06-03', '800.00', 'Mantemiento de caja de velocidades y catarina'),
(4, 7, 1, '2020-06-15', '2300.00', 'Mantenimiento de frenos y de motor'),
(5, 5, 1, '2020-06-18', '2300.00', 'Se le hizo mantenimiento a la caja velocidades, haciÃ©ndole cambio de aceite '),
(6, 5, 1, '2020-06-29', '570.00', ''),
(7, 5, 1, '2020-10-14', '1300.00', 'Ninguna');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `Id_Modelo` int(11) NOT NULL,
  `Modelo` int(11) DEFAULT NULL,
  `id_capacidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`Id_Modelo`, `Modelo`, `id_capacidad`) VALUES
(1, 1990, 1),
(2, 1991, 1),
(3, 1992, 1),
(4, 1993, 1),
(5, 1994, 1),
(6, 1995, 1),
(7, 1996, 2),
(8, 1997, 2),
(9, 1998, 2),
(10, 1999, 2),
(11, 2000, 2),
(12, 2001, 3),
(13, 2002, 3),
(14, 2003, 3),
(15, 2004, 3),
(16, 2005, 3),
(17, 2006, 3),
(18, 2007, 3),
(19, 2008, 3),
(20, 2009, 3),
(21, 2010, 3),
(22, 2011, 4),
(23, 2012, 4),
(24, 2013, 4),
(25, 2014, 4),
(26, 2015, 4),
(27, 2016, 4),
(28, 2017, 4),
(29, 2018, 4),
(30, 2019, 4),
(31, 2020, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parada`
--

CREATE TABLE `parada` (
  `id_parada` int(11) NOT NULL,
  `Numero_calle` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parada`
--

INSERT INTO `parada` (`id_parada`, `Numero_calle`) VALUES
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5),
(11, 6),
(12, 7),
(13, 8),
(14, 9),
(15, 10),
(16, 11),
(17, 12),
(18, 13),
(19, 14),
(20, 15),
(21, 16),
(22, 17),
(23, 18),
(24, 19),
(25, 20),
(26, 21),
(27, 22),
(28, 23),
(29, 24),
(30, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parada_bus`
--

CREATE TABLE `parada_bus` (
  `id_paradaB` int(11) NOT NULL,
  `cod_autobus` int(11) DEFAULT NULL,
  `id_parada` int(11) DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parada_bus`
--

INSERT INTO `parada_bus` (`id_paradaB`, `cod_autobus`, `id_parada`, `hora_llegada`, `id_zona`) VALUES
(20, 8, 12, '16:30:00', 7),
(23, 9, 13, '08:00:00', 6),
(24, 9, 19, '00:13:00', 6),
(26, 11, 10, '16:17:00', 5),
(27, 12, 7, '16:41:00', 6),
(31, 13, 12, '17:15:00', 7),
(32, 13, 8, '16:19:00', 4),
(33, 13, 8, '16:19:00', 4),
(34, 13, 6, '18:19:00', 4),
(40, 7, 9, '16:24:00', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

CREATE TABLE `zona` (
  `id_zona` int(11) NOT NULL,
  `zona` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `zona`
--

INSERT INTO `zona` (`id_zona`, `zona`) VALUES
(1, 'Zona 1'),
(2, 'Zona 2'),
(3, 'Zona 3'),
(4, 'Zona 4'),
(5, 'Zona 5'),
(6, 'Zona 6'),
(7, 'Zona 7'),
(8, 'Zona 8'),
(9, 'Zona 9'),
(10, 'Zona 10'),
(11, 'Zona 11'),
(12, 'Zona 12'),
(13, 'Zona 13'),
(14, 'Zona 14'),
(15, 'Zona 15'),
(16, 'Zona 16'),
(17, 'Zona 17'),
(18, 'Zona 18'),
(19, 'Zona 19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autobus`
--
ALTER TABLE `autobus`
  ADD PRIMARY KEY (`cod_autobus`),
  ADD KEY `Id_Modelo` (`Id_Modelo`),
  ADD KEY `Id_color` (`Id_color`);

--
-- Indices de la tabla `capacidad`
--
ALTER TABLE `capacidad`
  ADD PRIMARY KEY (`id_capacidad`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id_color`);

--
-- Indices de la tabla `dispositivo`
--
ALTER TABLE `dispositivo`
  ADD PRIMARY KEY (`cod_dispositivo`);

--
-- Indices de la tabla `dispositivo_autobus`
--
ALTER TABLE `dispositivo_autobus`
  ADD PRIMARY KEY (`id_dispositivoA`),
  ADD KEY `cod_autobus` (`cod_autobus`),
  ADD KEY `cod_dispositivo` (`cod_dispositivo`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id_horario`);

--
-- Indices de la tabla `hora_autobus`
--
ALTER TABLE `hora_autobus`
  ADD PRIMARY KEY (`id_horaA`),
  ADD KEY `cod_autobus` (`cod_autobus`),
  ADD KEY `id_horario` (`id_horario`);

--
-- Indices de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  ADD PRIMARY KEY (`id_incidencia`);

--
-- Indices de la tabla `incidencia_autobus`
--
ALTER TABLE `incidencia_autobus`
  ADD PRIMARY KEY (`No_incidencia`),
  ADD KEY `cod_autobus` (`cod_autobus`),
  ADD KEY `id_incidencia` (`id_incidencia`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`Id_Modelo`),
  ADD KEY `id_capacidad` (`id_capacidad`);

--
-- Indices de la tabla `parada`
--
ALTER TABLE `parada`
  ADD PRIMARY KEY (`id_parada`);

--
-- Indices de la tabla `parada_bus`
--
ALTER TABLE `parada_bus`
  ADD PRIMARY KEY (`id_paradaB`),
  ADD KEY `cod_autobus` (`cod_autobus`),
  ADD KEY `id_parada` (`id_parada`),
  ADD KEY `id_zona` (`id_zona`);

--
-- Indices de la tabla `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`id_zona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autobus`
--
ALTER TABLE `autobus`
  MODIFY `cod_autobus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `capacidad`
--
ALTER TABLE `capacidad`
  MODIFY `id_capacidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id_color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `dispositivo_autobus`
--
ALTER TABLE `dispositivo_autobus`
  MODIFY `id_dispositivoA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `hora_autobus`
--
ALTER TABLE `hora_autobus`
  MODIFY `id_horaA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  MODIFY `id_incidencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `incidencia_autobus`
--
ALTER TABLE `incidencia_autobus`
  MODIFY `No_incidencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `Id_Modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `parada`
--
ALTER TABLE `parada`
  MODIFY `id_parada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `parada_bus`
--
ALTER TABLE `parada_bus`
  MODIFY `id_paradaB` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `zona`
--
ALTER TABLE `zona`
  MODIFY `id_zona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autobus`
--
ALTER TABLE `autobus`
  ADD CONSTRAINT `autobus_ibfk_1` FOREIGN KEY (`Id_Modelo`) REFERENCES `modelo` (`Id_Modelo`),
  ADD CONSTRAINT `autobus_ibfk_2` FOREIGN KEY (`Id_color`) REFERENCES `color` (`id_color`);

--
-- Filtros para la tabla `dispositivo_autobus`
--
ALTER TABLE `dispositivo_autobus`
  ADD CONSTRAINT `dispositivo_autobus_ibfk_1` FOREIGN KEY (`cod_autobus`) REFERENCES `autobus` (`cod_autobus`),
  ADD CONSTRAINT `dispositivo_autobus_ibfk_2` FOREIGN KEY (`cod_dispositivo`) REFERENCES `dispositivo` (`cod_dispositivo`);

--
-- Filtros para la tabla `hora_autobus`
--
ALTER TABLE `hora_autobus`
  ADD CONSTRAINT `hora_autobus_ibfk_1` FOREIGN KEY (`cod_autobus`) REFERENCES `autobus` (`cod_autobus`),
  ADD CONSTRAINT `hora_autobus_ibfk_2` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id_horario`);

--
-- Filtros para la tabla `incidencia_autobus`
--
ALTER TABLE `incidencia_autobus`
  ADD CONSTRAINT `incidencia_autobus_ibfk_1` FOREIGN KEY (`cod_autobus`) REFERENCES `autobus` (`cod_autobus`),
  ADD CONSTRAINT `incidencia_autobus_ibfk_2` FOREIGN KEY (`id_incidencia`) REFERENCES `incidencias` (`id_incidencia`);

--
-- Filtros para la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`id_capacidad`) REFERENCES `capacidad` (`id_capacidad`);

--
-- Filtros para la tabla `parada_bus`
--
ALTER TABLE `parada_bus`
  ADD CONSTRAINT `parada_bus_ibfk_1` FOREIGN KEY (`cod_autobus`) REFERENCES `autobus` (`cod_autobus`),
  ADD CONSTRAINT `parada_bus_ibfk_2` FOREIGN KEY (`id_parada`) REFERENCES `parada` (`id_parada`),
  ADD CONSTRAINT `parada_bus_ibfk_3` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id_zona`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
