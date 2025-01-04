-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-09-2021 a las 23:53:59
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_horarios_sena`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ambiente`
--

CREATE TABLE `tbl_ambiente` (
  `id_ambiente` int(11) NOT NULL,
  `amb_nombre` varchar(25) NOT NULL DEFAULT '0',
  `amb_codigo_ambiente` varchar(20) NOT NULL DEFAULT '0',
  `amb_capacidad` varchar(25) NOT NULL DEFAULT '0',
  `amb_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_ambiente`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_aprendiz`
--

CREATE TABLE `tbl_aprendiz` (
  `id_aprendiz` int(11) NOT NULL,
  `fk_id_ficha` int(11) NOT NULL DEFAULT 0,
  `fk_id_persona` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_aprendiz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_centro`
--

CREATE TABLE `tbl_centro` (
  `id_centro` int(11) NOT NULL,
  `cen_direccion` varchar(30) NOT NULL DEFAULT '0',
  `cen_telefono` varchar(10) NOT NULL DEFAULT '0',
  `cen_email` varchar(90) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_centro`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_contacto`
--

CREATE TABLE `tbl_contacto` (
  `id_contacto` int(11) NOT NULL,
  `con_nombre` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `con_correo` varchar(70) COLLATE utf8_spanish2_ci NOT NULL,
  `con_celular` bigint(11) NOT NULL,
  `con_asunto` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `con_mensaje` text COLLATE utf8_spanish2_ci NOT NULL,
  `con_visto` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_contacto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ficha`
--

CREATE TABLE `tbl_ficha` (
  `id_ficha` int(11) NOT NULL,
  `fic_fecha_inicio` date NOT NULL,
  `fic_fecha_fin_lectiva` date NOT NULL,
  `fic_fecha_fin_practica` date DEFAULT NULL,
  `fic_hora_ini` int(2) NOT NULL,
  `fic_hora_fin` int(2) NOT NULL,
  `fic_ambiente` int(11) NOT NULL,
  `fk_id_programa` int(11) NOT NULL DEFAULT 0,
  `fic_color` varchar(6) NOT NULL,
  `fic_trimestre` tinyint(4) NOT NULL,
  `fic_estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_ficha`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_horario`
--

CREATE TABLE `tbl_horario` (
  `id_horario` int(11) NOT NULL,
  `hor_dia` int(11) NOT NULL,
  `hor_hora_inicio` int(2) NOT NULL,
  `hor_hora_fin` int(2) NOT NULL,
  `fk_id_ficha` int(11) NOT NULL DEFAULT 0,
  `fk_id_instructor` int(11) NOT NULL,
  `fk_id_ambiente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_horario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_instructor`
--

CREATE TABLE `tbl_instructor` (
  `id_instructor` int(11) NOT NULL,
  `ins_profesion` varchar(60) NOT NULL DEFAULT '0',
  `ins_fechaInicio` date NOT NULL,
  `ins_fechaFin` date DEFAULT NULL,
  `fk_id_persona` int(11) NOT NULL DEFAULT 0,
  `ins_tipo_contrato` enum('Indefinido','Temporal') NOT NULL,
  `ins_horas` int(11) NOT NULL,
  `ins_color` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_instructor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_mantenimiento`
--

CREATE TABLE `tbl_mantenimiento` (
  `id_mantenimiento` int(11) NOT NULL,
  `man_problema` text COLLATE utf8_spanish2_ci NOT NULL,
  `man_reparacion` text COLLATE utf8_spanish2_ci DEFAULT NULL,
  `man_ides_amb` text COLLATE utf8_spanish2_ci NOT NULL,
  `man_estado` tinyint(4) NOT NULL,
  `fk_id_ambiente` int(11) NOT NULL,
  `fk_id_persona` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_notificacion`
--

CREATE TABLE `tbl_notificacion` (
  `not_texto` text COLLATE utf8_spanish2_ci NOT NULL,
  `not_visto` tinyint(4) NOT NULL,
  `not_clave` varchar(11) COLLATE utf8_spanish2_ci NOT NULL,
  `not_indice` enum('ficha','ambiente','mensaje','instructor','horario') COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_notificacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_persona`
--

CREATE TABLE `tbl_persona` (
  `id_persona` int(11) NOT NULL,
  `per_nombre` varchar(30) NOT NULL DEFAULT '0',
  `per_apellidos` varchar(30) NOT NULL DEFAULT '0',
  `per_tipo_identificacion` enum('CC','CE','TI','Otro') NOT NULL,
  `per_identificacion` varchar(10) NOT NULL DEFAULT '0',
  `per_email` varchar(90) NOT NULL DEFAULT '0',
  `per_contrasena` varchar(110) NOT NULL DEFAULT '0',
  `per_direccion` varchar(40) NOT NULL DEFAULT '0',
  `per_foto` varchar(80) NOT NULL,
  `per_rol` int(11) NOT NULL,
  `per_estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_persona`
--

INSERT INTO `tbl_persona` (`id_persona`, `per_nombre`, `per_apellidos`, `per_tipo_identificacion`, `per_identificacion`, `per_email`, `per_contrasena`, `per_direccion`, `per_foto`, `per_rol`, `per_estado`) VALUES
(11, 'Juan Ignacio', 'Silva Laguna', 'CC', '1007273585', 'juancho29silva@gmail.com', '$2y$10$GHx9JNGuLlmZJZeVfTSus.P1JCvxi7/qPWaDn5nvW.f9IgLEYSxIq', 'cll 25 c # 3-36', 'Images/fotos/1007273585.jpg', 1, 1);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_programa`
--

CREATE TABLE `tbl_programa` (
  `id_programa` int(11) NOT NULL,
  `pro_nombre` varchar(110) NOT NULL DEFAULT '0',
  `pro_tipo` enum('Tecnologo','Tecnico','Curso') NOT NULL,
  `pro_estado` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_programa`
--


--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_ambiente`
--
ALTER TABLE `tbl_ambiente`
  ADD PRIMARY KEY (`id_ambiente`);

--
-- Indices de la tabla `tbl_aprendiz`
--
ALTER TABLE `tbl_aprendiz`
  ADD PRIMARY KEY (`id_aprendiz`),
  ADD KEY `fk_id_ficha` (`fk_id_ficha`),
  ADD KEY `fk_id_persona` (`fk_id_persona`);

--
-- Indices de la tabla `tbl_centro`
--
ALTER TABLE `tbl_centro`
  ADD PRIMARY KEY (`id_centro`);

--
-- Indices de la tabla `tbl_contacto`
--
ALTER TABLE `tbl_contacto`
  ADD PRIMARY KEY (`id_contacto`);

--
-- Indices de la tabla `tbl_ficha`
--
ALTER TABLE `tbl_ficha`
  ADD PRIMARY KEY (`id_ficha`),
  ADD KEY `fk_id_programa` (`fk_id_programa`),
  ADD KEY `fic_ambiente` (`fic_ambiente`);

--
-- Indices de la tabla `tbl_horario`
--
ALTER TABLE `tbl_horario`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `fk_id_ficha` (`fk_id_ficha`),
  ADD KEY `fk_id_instructor` (`fk_id_instructor`),
  ADD KEY `fk_id_ambiente` (`fk_id_ambiente`);

--
-- Indices de la tabla `tbl_instructor`
--
ALTER TABLE `tbl_instructor`
  ADD PRIMARY KEY (`id_instructor`),
  ADD KEY `fk_id_persona` (`fk_id_persona`);

--
-- Indices de la tabla `tbl_mantenimiento`
--
ALTER TABLE `tbl_mantenimiento`
  ADD PRIMARY KEY (`id_mantenimiento`),
  ADD KEY `fk_id_ambiente` (`fk_id_ambiente`),
  ADD KEY `fk_id_persona` (`fk_id_persona`);

--
-- Indices de la tabla `tbl_notificacion`
--
ALTER TABLE `tbl_notificacion`
  ADD PRIMARY KEY (`not_clave`),
  ADD UNIQUE KEY `not_clave` (`not_clave`);

--
-- Indices de la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `tbl_programa`
--
ALTER TABLE `tbl_programa`
  ADD PRIMARY KEY (`id_programa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_ambiente`
--
ALTER TABLE `tbl_ambiente`
  MODIFY `id_ambiente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbl_aprendiz`
--
ALTER TABLE `tbl_aprendiz`
  MODIFY `id_aprendiz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;

--
-- AUTO_INCREMENT de la tabla `tbl_centro`
--
ALTER TABLE `tbl_centro`
  MODIFY `id_centro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_contacto`
--
ALTER TABLE `tbl_contacto`
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `tbl_ficha`
--
ALTER TABLE `tbl_ficha`
  MODIFY `id_ficha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2281968;

--
-- AUTO_INCREMENT de la tabla `tbl_horario`
--
ALTER TABLE `tbl_horario`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT de la tabla `tbl_instructor`
--
ALTER TABLE `tbl_instructor`
  MODIFY `id_instructor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tbl_mantenimiento`
--
ALTER TABLE `tbl_mantenimiento`
  MODIFY `id_mantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=460;

--
-- AUTO_INCREMENT de la tabla `tbl_programa`
--
ALTER TABLE `tbl_programa`
  MODIFY `id_programa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_aprendiz`
--
ALTER TABLE `tbl_aprendiz`
  ADD CONSTRAINT `FK__tbl_ficha` FOREIGN KEY (`fk_id_ficha`) REFERENCES `tbl_ficha` (`id_ficha`),
  ADD CONSTRAINT `FK__tbl_persona` FOREIGN KEY (`fk_id_persona`) REFERENCES `tbl_persona` (`id_persona`);

--
-- Filtros para la tabla `tbl_ficha`
--
ALTER TABLE `tbl_ficha`
  ADD CONSTRAINT `FK_tbl_ficha_tbl_programa` FOREIGN KEY (`fk_id_programa`) REFERENCES `tbl_programa` (`id_programa`),
  ADD CONSTRAINT `tbl_ficha_ibfk_1` FOREIGN KEY (`fic_ambiente`) REFERENCES `tbl_ambiente` (`id_ambiente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_horario`
--
ALTER TABLE `tbl_horario`
  ADD CONSTRAINT `FK_tbl_horario_tbl_ficha` FOREIGN KEY (`fk_id_ficha`) REFERENCES `tbl_ficha` (`id_ficha`),
  ADD CONSTRAINT `tbl_horario_ibfk_1` FOREIGN KEY (`fk_id_instructor`) REFERENCES `tbl_instructor` (`id_instructor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_horario_ibfk_2` FOREIGN KEY (`fk_id_ambiente`) REFERENCES `tbl_ambiente` (`id_ambiente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_instructor`
--
ALTER TABLE `tbl_instructor`
  ADD CONSTRAINT `FK_tbl_instructor_tbl_persona` FOREIGN KEY (`fk_id_persona`) REFERENCES `tbl_persona` (`id_persona`);

--
-- Filtros para la tabla `tbl_mantenimiento`
--
ALTER TABLE `tbl_mantenimiento`
  ADD CONSTRAINT `tbl_mantenimiento_ibfk_1` FOREIGN KEY (`fk_id_ambiente`) REFERENCES `tbl_ambiente` (`id_ambiente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_mantenimiento_ibfk_2` FOREIGN KEY (`fk_id_persona`) REFERENCES `tbl_persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
