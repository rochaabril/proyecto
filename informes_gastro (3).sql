-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2025 a las 19:58:10
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
(4, 'SIN COBERTURA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informes`
--

CREATE TABLE `informes` (
  `id_informe` int(11) NOT NULL,
  `nombre_paciente` varchar(100) NOT NULL,
  `dni_paciente` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `url_archivo` varchar(250) NOT NULL,
  `mail_paciente` varchar(100) NOT NULL,
  `tipo_informe` varchar(5) NOT NULL,
  `id_cobertura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informes`
--

INSERT INTO `informes` (`id_informe`, `nombre_paciente`, `dni_paciente`, `fecha`, `url_archivo`, `mail_paciente`, `tipo_informe`, `id_cobertura`) VALUES
(12, 'Abril R', '123123', '2025-04-08', 'uploads/asd_123123/20250408_140540/informe_2025_04_08_1744121140.pdf', 'abril@gmail.com', 'VCC', NULL),
(13, 'Rocio', '123123', '2025-04-07', 'uploads/asd_123123/20250408_141149/informe_2025_04_07_1744121509.pdf', 'abrilRocha@gmail.com', 'VCC', NULL);

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
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `pass`, `mail`) VALUES
(1, 'admin', '$2y$10$5F.ZHOVd.19wvj1aKNMaWOF1VofezVS5XOb5H58pFa8vxtn6geMmu', 'admin@gmail.com');

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
  MODIFY `id_cobertura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `informes`
--
ALTER TABLE `informes`
  MODIFY `id_informe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `informes`
--
ALTER TABLE `informes`
  ADD CONSTRAINT `informe_cobertura` FOREIGN KEY (`id_cobertura`) REFERENCES `coberturas` (`id_cobertura`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
