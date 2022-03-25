-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-03-2022 a las 15:15:22
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nom_cliente` varchar(30) NOT NULL,
  `tel_cliente` varchar(30) NOT NULL,
  `hotel_id_hotel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nom_cliente`, `tel_cliente`, `hotel_id_hotel`) VALUES
(1005838455, 'nicole', '3213435677', 8996789),
(1006789566, 'esteban', '322250987', 8996789);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleados` int(11) NOT NULL,
  `nom_empleado` varchar(30) NOT NULL,
  `apell_empleado` varchar(30) NOT NULL,
  `cargo_empleado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleados`, `nom_empleado`, `apell_empleado`, `cargo_empleado`) VALUES
(4764, 'camila', 'suarez', 'aseadora'),
(7445, 'esteban', 'ortiz', 'recepcionista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `cod_habitacion` int(11) NOT NULL,
  `hotel_id_hotel` int(11) NOT NULL,
  `servic_habitacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`cod_habitacion`, `hotel_id_hotel`, `servic_habitacion`) VALUES
(3737, 78889, 'internet'),
(7834, 8996789, 'television');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `id_hotel` int(11) NOT NULL,
  `nom_hotel` varchar(30) NOT NULL,
  `direc_hotel` varchar(30) NOT NULL,
  `tel_hotel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`id_hotel`, `nom_hotel`, `direc_hotel`, `tel_hotel`) VALUES
(78889, 'almuaditas', 'mz 3 cs 22', 32245678),
(8996789, 'el gran hotel', 'mz 1 cs 10', 32345677);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedad`
--

CREATE TABLE `propiedad` (
  `num_propiedad` varchar(30) NOT NULL,
  `empleado_id_empleados` int(11) NOT NULL,
  `hotel_id_hotel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `propiedad`
--

INSERT INTO `propiedad` (`num_propiedad`, `empleado_id_empleados`, `hotel_id_hotel`) VALUES
('6767543', 4764, 8996789),
('234688', 7445, 78889);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`,`hotel_id_hotel`),
  ADD KEY `fk_cliente_hotel1_idx` (`hotel_id_hotel`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleados`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`cod_habitacion`,`hotel_id_hotel`),
  ADD KEY `fk_habitacion_hotel1_idx` (`hotel_id_hotel`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id_hotel`);

--
-- Indices de la tabla `propiedad`
--
ALTER TABLE `propiedad`
  ADD PRIMARY KEY (`num_propiedad`,`empleado_id_empleados`,`hotel_id_hotel`),
  ADD KEY `fk_hotel_has_empleado_empleado1_idx` (`empleado_id_empleados`),
  ADD KEY `fk_propiedad_hotel1_idx` (`hotel_id_hotel`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_hotel1` FOREIGN KEY (`hotel_id_hotel`) REFERENCES `hotel` (`id_hotel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `fk_habitacion_hotel1` FOREIGN KEY (`hotel_id_hotel`) REFERENCES `hotel` (`id_hotel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `propiedad`
--
ALTER TABLE `propiedad`
  ADD CONSTRAINT `fk_hotel_has_empleado_empleado1` FOREIGN KEY (`empleado_id_empleados`) REFERENCES `empleado` (`id_empleados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_propiedad_hotel1` FOREIGN KEY (`hotel_id_hotel`) REFERENCES `hotel` (`id_hotel`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
