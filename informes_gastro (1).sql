-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-03-2025 a las 17:52:31
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `informes_gastro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coberturas`
--

CREATE TABLE `coberturas` (
  `id_cobertura` int(11) NOT NULL,
  `nombre_cobertura` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `coberturas`
--

INSERT INTO `coberturas` (`id_cobertura`, `nombre_cobertura`) VALUES
(1, 'OSDE'),
(2, 'IOSFA'),
(4, 'OSPE'),
(5, 'OSMEDICA'),
(6, 'OSECAC'),
(7, 'nonon'),
(8, 'nononfff'),
(9, 'IOSFALsad'),
(10, 'adsad'),
(11, 'asdasd'),
(12, 'abril'),
(13, 'HOLA44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informes`
--

CREATE TABLE `informes` (
  `id_informe` int(11) NOT NULL,
  `nombre_paciente` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `url_archivo` varchar(250) NOT NULL,
  `mail_paciente` varchar(100) NOT NULL,
  `id_cobertura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informes`
--

INSERT INTO `informes` (`id_informe`, `nombre_paciente`, `fecha`, `url_archivo`, `mail_paciente`, `id_cobertura`) VALUES
(2, 'ABRIL ROCIO ROCHA', '2025-03-28', 'lalaalalala', 'abril@gmail.com', 1),
(4, 'lalaalalla', '2025-03-13', 'lalaalalala', 'abril@gmail.com', 2),
(5, 'asdasd', '0000-00-00', 'lalaalalala', 'abril@gmail.com', 4),
(6, 'aaaaaa', '0000-00-00', 'lalaalalala', 'abril@gmail.com', 6),
(7, 'aaaaaa', '2025-03-21', 'lalaalalala', 'abril@gmail.com', 8),
(8, 'lalaalalla', '2025-03-06', 'lalaalalala', 'abril@gmail.com', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(200) NOT NULL,
  `pass` char(60) NOT NULL,
  `mail` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `coberturas`
--
ALTER TABLE `coberturas`
  ADD PRIMARY KEY (`id_cobertura`);

--
-- Indices de la tabla `informes`
--
ALTER TABLE `informes`
  ADD PRIMARY KEY (`id_informe`),
  ADD KEY `informe_cobertura_idx` (`id_cobertura`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `coberturas`
--
ALTER TABLE `coberturas`
  MODIFY `id_cobertura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `informes`
--
ALTER TABLE `informes`
  MODIFY `id_informe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `informes`
--
ALTER TABLE `informes`
  ADD CONSTRAINT `informe_cobertura` FOREIGN KEY (`id_cobertura`) REFERENCES `coberturas` (`id_cobertura`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
