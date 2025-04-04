-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-04-2025 a las 18:48:33
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
(4, 'SIN COBERTURA'),
(5, 'LALALA');

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
(1, 'asd', '', '2025-04-04', '', 'abril@gmail.com', '', NULL),
(2, 'asd', '', '2025-04-04', 'http://localhost/app-medica/public/uploads/asd/asd_20250404_Captur4.PNG,http://localhost/app-medica/public/uploads/asd/asd_20250404_Captura%205%28bis%29.png,http://localhost/app-medica/public/uploads/asd/asd_20250404_Captura%206%28bis%29.png', 'abril@gmail.com', '', 4);

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
(1, 'admin', '$2y$10$jnBbi5J2snyhyFzKx7MMUuwrH1lpuL5Ys48nODCgHVGa2.7x4GgPq', 'admin@gmail.com');

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
  MODIFY `id_cobertura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `informes`
--
ALTER TABLE `informes`
  MODIFY `id_informe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
