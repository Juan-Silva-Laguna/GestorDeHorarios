-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2021 a las 06:34:21
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 8.0.1

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

INSERT INTO `tbl_ambiente` (`id_ambiente`, `amb_nombre`, `amb_codigo_ambiente`, `amb_capacidad`, `amb_estado`) VALUES
(9, '209-1', '1', '35', 1),
(10, '209-2', '2', '35', 1),
(11, '209-3', '3', '35', 1);

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

INSERT INTO `tbl_aprendiz` (`id_aprendiz`, `fk_id_ficha`, `fk_id_persona`) VALUES
(110, 1906756, 124),
(111, 1906756, 125),
(112, 1906756, 126),
(113, 1906756, 127),
(114, 1906756, 128),
(115, 1906756, 129),
(116, 1906756, 130),
(117, 1906756, 131),
(118, 1906756, 132),
(119, 1906756, 133),
(120, 1906756, 134),
(121, 1906756, 135),
(122, 1906756, 136),
(123, 1906756, 137),
(124, 1906756, 138),
(125, 1906756, 139),
(126, 1906756, 140),
(127, 1906756, 141),
(128, 1906756, 142),
(129, 1906756, 143),
(130, 1906756, 144),
(131, 1906756, 145),
(132, 1906756, 146),
(133, 1906756, 147),
(134, 1906756, 148),
(135, 1906756, 149),
(136, 1906756, 150),
(137, 1906756, 151),
(138, 1906756, 152),
(139, 1906756, 153),
(140, 1906756, 154),
(141, 1906756, 155),
(142, 1906756, 156),
(143, 1906756, 157),
(144, 1906756, 158),
(145, 1906756, 159),
(146, 1906756, 160),
(147, 1906756, 161),
(148, 1906756, 162),
(149, 1906756, 163),
(150, 1906756, 164),
(151, 1906756, 165),
(152, 1906756, 166),
(153, 1906756, 167),
(154, 1906756, 168),
(155, 1906756, 169),
(156, 1906756, 170),
(157, 1906756, 171),
(158, 1906756, 172),
(159, 1906756, 173),
(160, 1906756, 174),
(161, 1906756, 175),
(162, 1906756, 176),
(163, 1906756, 177),
(164, 1906756, 178),
(165, 1906756, 179),
(166, 1906756, 180),
(167, 1906756, 181),
(168, 1906756, 182),
(169, 1906756, 183),
(170, 1906756, 184),
(171, 1906756, 185),
(172, 1906756, 186),
(173, 1906756, 187),
(174, 1906756, 188),
(175, 1906756, 189),
(176, 1906756, 190),
(177, 1906756, 191),
(178, 1906756, 192),
(179, 1906756, 193),
(180, 1906756, 194),
(181, 1964898, 195),
(182, 1964898, 196),
(183, 1964898, 197),
(184, 1964898, 198),
(185, 1964898, 199),
(186, 1964898, 200),
(187, 1964898, 201),
(188, 1964898, 202),
(189, 1964898, 203),
(190, 1964898, 204),
(191, 1964898, 205),
(192, 1964898, 206),
(193, 1964898, 207),
(194, 1964898, 208),
(195, 1964898, 209),
(196, 1964898, 210),
(197, 1964898, 211),
(198, 1964898, 212),
(199, 1964898, 213),
(200, 1964898, 214),
(201, 1964898, 215),
(202, 1964898, 216),
(203, 1964898, 217),
(204, 1964898, 218),
(205, 1964898, 219),
(206, 1964898, 220),
(207, 1964898, 221),
(208, 1964898, 222),
(209, 1964898, 223),
(210, 1964898, 224),
(211, 1964898, 225),
(212, 1964898, 226),
(213, 1964898, 227),
(214, 2052637, 228),
(215, 2052637, 229),
(216, 2052637, 230),
(217, 2052637, 231),
(218, 2052637, 232),
(219, 2052637, 233),
(220, 2052637, 234),
(221, 2052637, 235),
(222, 2052637, 236),
(223, 2052637, 237),
(224, 2052637, 238),
(225, 2052637, 239),
(226, 2052637, 240),
(227, 2052637, 241),
(228, 2052637, 242),
(229, 2052637, 243),
(230, 2052637, 244),
(231, 2052637, 245),
(232, 2052637, 246),
(233, 2052637, 247),
(234, 2052637, 248),
(235, 2052637, 249),
(236, 2052637, 250),
(237, 2052637, 251),
(238, 2052637, 252),
(239, 2052637, 253),
(240, 2052637, 254),
(241, 2052637, 255),
(242, 2052637, 256),
(243, 2052637, 257),
(244, 2205781, 258),
(245, 2205781, 259),
(246, 2205781, 260),
(247, 2205781, 261),
(248, 2205781, 262),
(249, 2205781, 263),
(250, 2205781, 264),
(251, 2205781, 265),
(252, 2205781, 266),
(253, 2205781, 267),
(254, 2205781, 268),
(255, 2205781, 269),
(256, 2205781, 270),
(257, 2205781, 271),
(258, 2205781, 272),
(259, 2205781, 273),
(260, 2205781, 274),
(261, 2205781, 275),
(262, 2205781, 276),
(263, 2205781, 277),
(264, 2205781, 278),
(265, 2205781, 279),
(266, 2205781, 280),
(267, 2205781, 281),
(268, 2205781, 282),
(269, 2205781, 283),
(270, 2205781, 284),
(271, 2205781, 285),
(272, 2205781, 286),
(273, 2205781, 287),
(274, 2205781, 288),
(275, 2205781, 289),
(276, 2205781, 290),
(277, 2205781, 291),
(278, 2205781, 292),
(279, 2205781, 293),
(280, 2205781, 294),
(281, 2205781, 295),
(282, 2205781, 296),
(283, 2205781, 297),
(284, 2205781, 298),
(285, 2205781, 299),
(286, 2205781, 300),
(287, 2205781, 301),
(288, 2205781, 302),
(289, 2205781, 303),
(290, 2205781, 304),
(291, 2205781, 305),
(292, 2205781, 306),
(293, 2205781, 307),
(294, 2205781, 308),
(295, 2205781, 309),
(296, 2205781, 310),
(297, 2245819, 311),
(298, 2245819, 312),
(299, 2245819, 313),
(300, 2245819, 314),
(301, 2245819, 315),
(302, 2245819, 316),
(303, 2245819, 317),
(304, 2245819, 318),
(305, 2245819, 319),
(306, 2245819, 320),
(307, 2245819, 321),
(308, 2245819, 322),
(309, 2245819, 323),
(310, 2245819, 324),
(311, 2245819, 325),
(312, 2245819, 326),
(313, 2245819, 327),
(314, 2245819, 328),
(315, 2245819, 329),
(316, 2245819, 330),
(317, 2245819, 331),
(318, 2245819, 332),
(319, 2245819, 333),
(320, 2245819, 334),
(321, 2245819, 335),
(322, 2245819, 336),
(323, 2245819, 337),
(324, 2245819, 338),
(325, 2245819, 339),
(326, 2245819, 340),
(327, 2245819, 341),
(328, 2281599, 342),
(329, 2281599, 343),
(330, 2281599, 344),
(331, 2281599, 345),
(332, 2281599, 346),
(333, 2281599, 347),
(334, 2281599, 348),
(335, 2281599, 349),
(336, 2281599, 350),
(337, 2281599, 351),
(338, 2281599, 352),
(339, 2281599, 353),
(340, 2281599, 354),
(341, 2281599, 355),
(342, 2281599, 356),
(343, 2281599, 357),
(344, 2281599, 358),
(345, 2281599, 359),
(346, 2281599, 360),
(347, 2281599, 361),
(348, 2281599, 362),
(349, 2281599, 363),
(350, 2281599, 364),
(351, 2281599, 365),
(352, 2281599, 366),
(353, 2281599, 367),
(354, 2281599, 368),
(355, 2281599, 369),
(356, 2281599, 370),
(357, 2281599, 371),
(358, 2281599, 372),
(359, 2281599, 373),
(360, 2281599, 374),
(361, 2281599, 375),
(362, 2281599, 376),
(363, 2281599, 377),
(364, 2281599, 378),
(365, 2281599, 379),
(366, 2281599, 380),
(367, 2281599, 381),
(368, 2281599, 382),
(369, 2281599, 383),
(370, 2281599, 384),
(371, 2281599, 385),
(372, 2281599, 386),
(373, 2281599, 387),
(374, 2281599, 388),
(375, 2281599, 389),
(376, 2281967, 390),
(377, 2281967, 391),
(378, 2281967, 392),
(379, 2281967, 393),
(380, 2281967, 394),
(381, 2281967, 395),
(382, 2281967, 396),
(383, 2281967, 397),
(384, 2281967, 398),
(385, 2281967, 399),
(386, 2281967, 400),
(387, 2281967, 401),
(388, 2281967, 402),
(389, 2281967, 403),
(390, 2281967, 404),
(391, 2281967, 405),
(392, 2281967, 406),
(393, 2281967, 407),
(394, 2281967, 408),
(395, 2281967, 409),
(396, 2281967, 410),
(397, 2281967, 411),
(398, 2281967, 412),
(399, 2281967, 413),
(400, 2281967, 414),
(401, 2281967, 415),
(402, 2281967, 416),
(403, 2281967, 417),
(404, 2281967, 418),
(405, 2281967, 419),
(406, 2281967, 420),
(407, 2281967, 421),
(408, 2281967, 422),
(409, 2281967, 423),
(410, 2281967, 424),
(411, 2281967, 425),
(412, 2281967, 426),
(413, 2281967, 427),
(414, 2281967, 428),
(415, 2281967, 429),
(416, 2281967, 430),
(417, 2281967, 431),
(418, 2281967, 432),
(419, 2281967, 433),
(420, 2281967, 434),
(421, 2281967, 435),
(422, 2281967, 436),
(423, 2281967, 437),
(424, 2281967, 438),
(425, 2281967, 439);

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

INSERT INTO `tbl_centro` (`id_centro`, `cen_direccion`, `cen_telefono`, `cen_email`) VALUES
(1, 'Carrera 9 N° 68-50 Neiva-Huila', '8764401', 'sena@sena.edu.co');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ficha`
--

CREATE TABLE `tbl_ficha` (
  `id_ficha` int(11) NOT NULL,
  `fic_fecha_inicio` date NOT NULL,
  `fic_fecha_fin_lectiva` date NOT NULL,
  `fic_fecha_fin_practica` date DEFAULT NULL,
  `fk_id_programa` int(11) NOT NULL DEFAULT 0,
  `fic_color` varchar(6) NOT NULL,
  `fic_trimestre` tinyint(4) NOT NULL,
  `fic_estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_ficha`
--

INSERT INTO `tbl_ficha` (`id_ficha`, `fic_fecha_inicio`, `fic_fecha_fin_lectiva`, `fic_fecha_fin_practica`, `fk_id_programa`, `fic_color`, `fic_trimestre`, `fic_estado`) VALUES
(1906756, '2019-07-20', '2021-01-17', '2021-07-18', 16, '294B9C', 0, 1),
(1964898, '2019-10-07', '2021-04-06', '2021-10-05', 16, 'C2F190', 0, 1),
(2052637, '2019-12-09', '2021-06-08', '2021-12-07', 16, 'D6572D', 0, 1),
(2205781, '2020-11-03', '2022-05-04', '2022-11-02', 16, '978788', 2, 0),
(2245819, '2020-12-07', '2022-06-07', '2022-12-06', 16, 'A8292B', 2, 0),
(2281599, '2021-03-15', '2022-09-13', '2023-03-14', 16, '348586', 1, 0),
(2281967, '2021-03-15', '2022-09-13', '2023-03-14', 16, '7E1E5A', 1, 0);

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

INSERT INTO `tbl_horario` (`id_horario`, `hor_dia`, `hor_hora_inicio`, `hor_hora_fin`, `fk_id_ficha`, `fk_id_instructor`, `fk_id_ambiente`) VALUES
(85, 1, 6, 12, 2245819, 11, 9),
(86, 2, 6, 12, 2245819, 11, 9),
(87, 3, 6, 12, 2245819, 11, 9),
(88, 4, 6, 12, 2245819, 11, 9),
(93, 1, 12, 18, 2205781, 9, 9),
(94, 5, 12, 18, 2205781, 9, 9),
(95, 2, 12, 18, 2205781, 10, 9),
(96, 3, 12, 18, 2205781, 10, 9),
(97, 4, 12, 18, 2205781, 10, 9),
(98, 1, 6, 12, 2281967, 8, 11),
(99, 2, 6, 12, 2281967, 8, 11),
(100, 3, 6, 12, 2281967, 8, 11),
(101, 5, 9, 12, 2281967, 8, 11),
(102, 1, 15, 18, 2281599, 8, 11),
(103, 3, 12, 18, 2281599, 8, 11),
(104, 4, 12, 18, 2281599, 8, 11),
(105, 5, 12, 18, 2281599, 8, 11);

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

INSERT INTO `tbl_instructor` (`id_instructor`, `ins_profesion`, `ins_fechaInicio`, `ins_fechaFin`, `fk_id_persona`, `ins_tipo_contrato`, `ins_horas`, `ins_color`) VALUES
(8, 'Ingeniería de Sistemas', '2021-01-01', NULL, 443, 'Indefinido', 42, '018468'),
(9, 'Ingeniería de Sistemas', '2021-01-01', NULL, 445, 'Indefinido', 12, '6AA793'),
(10, 'Ingeniería de Sistemas', '2021-01-01', '2021-12-16', 446, 'Temporal', 18, '5781B8'),
(11, 'Ingeniería de Sistemas', '2021-01-01', NULL, 447, 'Indefinido', 24, 'D36C6C'),
(12, 'Ingeniería de Sistemas', '2021-01-01', '2021-12-16', 448, 'Temporal', 0, 'D6617E');

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

INSERT INTO `tbl_notificacion` (`not_texto`, `not_visto`, `not_clave`, `not_indice`) VALUES
('La ficha 1906756 ya termino la etapa lectiva', 0, '1906756', 'ficha'),
('La ficha 1964898 ya termino la etapa lectiva', 0, '1964898', 'ficha'),
('La ficha 2052637 ya termino la etapa lectiva', 0, '2052637', 'ficha'),
('La ficha 2205781 a cumplido su 2 trimestre, puedes editar el horario', 0, 'h2205781', 'horario'),
('La ficha 2245819 a cumplido su 2 trimestre, puedes editar el horario', 0, 'h2245819', 'horario'),
('La ficha 2281599 a cumplido su 1 trimestre, puedes editar el horario', 0, 'h2281599', 'horario'),
('La ficha 2281967 a cumplido su 1 trimestre, puedes editar el horario', 0, 'h2281967', 'horario');

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
(11, 'Juan Ignacio', 'Silva Laguna', 'CC', '1007273585', 'juancho29silva@gmail.com', '$2y$10$YFMjulrIDeml87Pd95zJ1uWudlP95d4TRW3HcbgMXvYaeVgNaJlr6', 'cll 25 c # 3-36', 'Images/fotos/1007273585.jpg', 1, 1),
(124, 'VALERY KARINA', 'GOMEZ PERDOMO', 'CC', '1003801713', 'valerykarina2000@gmail.com', '$2y$10$N6PS7t1AerxIG5CRouARluZmdvKk0IfWjqGFWaCmJcmcInlUVtK2K', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(125, 'ROBINSON LEANDRO', 'VALENZUELA CARDONA', 'CC', '1003802928', 'robinleandro2001@gmail.com', '$2y$10$qmy7/LD.V/5.BbbUX9.a/uRCIN0fN.bYZwemf7pK8XP70/wNYpcMm', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(126, 'JESUS ANTONIO', 'ROJAS BOCANEGRA', 'CC', '1003804256', 'jarojas6524@misena.edu.co', '$2y$10$B3OR7SSLO2sT6c1m7KYgbe8PmYdwKXkB04GAYFSOEGoJEsONiNqA2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(127, 'MARIA PAULA', 'CLAVIJO PINZON', 'CC', '1003804881', 'paulapinzon22_@outlook.com', '$2y$10$xjO7KIONTnn6QD9.5w70xeFS.U9LsP7fOTO8Yq74nOzQdB09iSETG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(128, 'OSCAR STIVEN', 'ASTUDILLO REYES', 'CC', '1003805501', 'osastudillo@misena.edu.co', '$2y$10$fJzmRfLAxGl6HT08PSzHEO6UesQNQes2nrUOjfLUGWMwu5hrl4iHC', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(129, 'SELENA', 'RIVERA QUIROGA', 'CC', '1003806728', 'selequi1231@gmail.com', '$2y$10$3D6OMg3aQKJ6zxP2sq0K9OHFqr9posCO3SkjUhrEu9P9dBxTFA9YS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(130, 'JEFFERSON ESTIVEN', 'CARDENAS GARCIA', 'CC', '1003807116', 'cardenasjefferson629@gmail.com', '$2y$10$l0fMr8nItMQerXEL9OKYHuJeTPOQbo5pN7QjA8JvxMpoPEaNzAwYG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(131, 'VALENTINA', 'AMAYA RAMIREZ', 'CC', '1003807582', 'valentina.amaya2017@gmail.com', '$2y$10$usDTB5io5J9r30F6WWYaIuGWrMQ3DiE6xeRO.cEcZubrgyzRLFT02', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(132, 'JOSE ARMANDO', 'GUARIN CALDERON', 'CC', '1003814464', 'jose25regge@gmail.com', '$2y$10$qW/yvzsTTSLASBYhQSIyS.ChIhyK5iorSJZfPjCkuzltpHytJGQ4a', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(133, 'NEIDER FABIAN', 'WALLES GUTIERREZ', 'CC', '1003814878', 'nfwalles@misena.edu.co', '$2y$10$eVU/ddApC/7f720nhP18g..yTVMIoLLZQuuyrczFzI8dDEIISkcJe', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(134, 'HOLMAN', 'CAÑAS PAVA', 'CC', '1003814980', 'h.canas10@ciaf.edu.co', '$2y$10$SKnd/mwsFUEAA1UNYba2i.AZRhAeLcaDefXt.ojM.oBNPhPQrCK42', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(135, 'EDUARDO', 'BARREIRO MONCALEANO', 'CC', '1003816240', 'eduardmonca2000@gmail.com', '$2y$10$qYhroiClS4KYxcwLI2rfaOMrWic2BOD4T1EDltC1HTCLupuj9B3nW', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(136, 'DAYANA KARINA', 'GORDO FARFAN', 'CC', '1003893610', 'dkgordo@misena.edu.co', '$2y$10$NSu6F19HSm8plE/ER3eHvOhy78p8dqVn1tWiZDEwYeZFRAbYi2/sa', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(137, 'KEVIN ESNEIDER', 'FLOREZ LLANOS', 'CC', '1003893911', 'kevinflorez533@gmail.com', '$2y$10$K7228SddLSY3Hxt2U80WVuQGJxlCz3srY5Bvhvle7PIqe/sVSsfly', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(138, 'FAIBER DANIEL', 'LARA SUAREZ', 'CC', '1003894715', 'fdlara5@misena.edu.co', '$2y$10$GKs4OxKyfXLY0cytaUFOvevoVtRd8TFktevcH.uBN7hJGVksg1yn.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(139, 'YULY ANDREA', 'HERRERA ROJAS', 'CC', '1003950740', 'yuli_edu02@hotmail.com', '$2y$10$VgLH69IwE4RHlN.WU0z5K.u6O1NnDCZjvyP8K7/1yibQV6VIlWAoC', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(140, 'JUAN SEBASTIAN', 'MORALES ESPAÑA', 'CC', '1007429232', 'noname1998auf@gmail.com', '$2y$10$hH1wl7Vi7Wc/mBviG9Uwk.bxYlylEL2XTAUSqTfsgmV7K4cuqPu5y', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(141, 'YENI ALEJANDRA', 'MEDINA ALMONACID', 'CC', '1007675040', 'yamedina04@misena.edu.co', '$2y$10$9iVxrTeKTh5eEooWV/W8MeqcKSI2ZnRX7cgoFWmuYJ9p1.gOQchRS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(142, 'MELISA', 'ROA HERNANDEZ', 'CC', '1007717110', 'mroa011@misena.edu.co', '$2y$10$rOIAwy/do1jsrjh0hLibluW25lxJn1TgoGdlkVfygt.UtfJxwNU8a', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(143, 'JUAN SEBASTIAN', 'MONTERO GORDILLO', 'CC', '1018504634', 'juansebas2298@hotmail.com', '$2y$10$UWVR2ffW2LNyJzNdbr3edOnPK9uJZ33YDBfANIMvEiobiNZtv2.l2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(144, 'ERICK LEANDRO', 'CARDOSO BUSTOS', 'CC', '1030540016', 'leandro2587@misena.edu.co', '$2y$10$wvsdMeyUNjsMhQcPX4b2/.SGaFMoSV1gFkNNOkvoD8H06qH7pdOzm', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(145, 'JULIO ADRIAN', 'MOLINA ALVAREZ', 'CC', '1033684307', 'julioadrianmolinaalvarez@gmail.com', '$2y$10$F.46MaJssGZ0D4y9OyGeHefXEqV4J.uJhKx2QnVZhmdHRImDnZiai', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(146, 'CLAUDIA MILENA', 'SANCHEZ GAONA', 'CC', '1069852821', 'snikkgirl90@hotmail.com', '$2y$10$Y42zG0TJPB.tkOmYdOPU6ePhmUlT34Uj9AfguZAK4b6zPxAjTVIpK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(147, 'YANID ALEXI', 'ANDRADE ROJAS', 'CC', '1075208554', 'yanid.andrade@gmail.com', '$2y$10$Rd2Eh3ffIw/a.6D9a5eW.ObUIgAR/edB6RFvVkv1l3B1ZfEX0ibOu', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(148, 'CAMILO EDUARDO', 'VALENCIA', 'CC', '1075219773', 'saratoga1075@hotmail.com', '$2y$10$7XMRSNy8tWtsJkBI29j44eYQ18nmQPBqhlc3ZGpvlOBpPderz/b3W', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(149, 'CRISTIAN IVAN', 'ALDANA GUZMAN', 'CC', '1075223549', 'cristian.guzman61@gmail.com', '$2y$10$8nm/HkhUs11uitcpR09gSOYIC3KqeEoZXLxVlliE3PZbrEb2SrbMG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(150, 'EDWARD ALEXANDER', 'IZQUIERDO ARIZMENDI', 'CC', '1075239402', 'edward4212@gmail.com', '$2y$10$slOtZ5a64ZH/Jfq1y91BE.Zk7NiV7F2t9bgKZdcbvuUN/FqxbKiy6', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(151, 'ANGELICA MARIA', 'MONTES PERDOMO', 'CC', '1075245112', 'kika_1101@hotmail.com', '$2y$10$0oHGRl1oj8bw0SThF786cuvGCy7LZj4r1WLQ9ybGtWUfQedeSvZbq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(152, 'LEYDI XIOMARA', 'CRUZ BONILLA', 'CC', '1075248218', 'xiomy4466@hotmail.com', '$2y$10$AgBRSXZjnLDWdoQJVQKQAufoVqagB5ic0fN0BKJ/ObzpKEz1TM1YK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(153, 'LUIS FELIPE', 'MORALES VALDERRAMA', 'CC', '1075261488', 'lufemova093@hotmail.com', '$2y$10$c14buMpO2OxnT/MQt78NWOs1N39CSCpn0RFyCfNTBLemH9nVNbpci', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(154, 'STHEFANI MILENA', 'HERNANDEZ MARIN', 'CC', '1075267144', 'sthefani_9210@hotmail.com', '$2y$10$n1dfu0cUucEmybT1UZzrceG6VjoOoFFJXZbjKCiUIUFtDYn.WdJgu', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(155, 'LEIDY JOHANA', 'MUÑOZ ALDANA', 'CC', '1075273536', 'munozaldana12@gmail.com', '$2y$10$sEaqk2uvrlSbo28X6Afd7OKMRw.RaSTzjgTb6gnn/kcS3nVSarKz6', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(156, 'CRISTIAN LEONARDO', 'SOSA DUSAN', 'CC', '1075273946', 'cristiansosa0915@outlook.com', '$2y$10$4vDJ7I7paQxzdZhBbIcGRevI.E5nBn4HrWY9l/NruFt6nRhglI74e', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(157, 'LINA YICELA', 'OSORIO BURBANO', 'CC', '1075280068', 'linaosorio066@gmail.com', '$2y$10$3DQoam5RHRpORCyyAUEpP.niMyDTJMr/XD1yQ79aAb/ir3PJKusPi', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(158, 'CARLOS ALBERTO', 'GONZALEZ ORTIZ', 'CC', '1075289463', 'carlos.gonzalez923@gmail.com', '$2y$10$tlZaY5H/lFnfn3pB2psmT.UiLayR2UeW9PK5oVV.0d6ghBshxm9OG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(159, 'MELISA', 'MANIOS CUELLAR', 'CC', '1075290431', 'melisamanioscuellar2041@hotmail.com', '$2y$10$yoorRQDwG8K0N0JiwW6mauB4A7uC40HMw1yCeo8ZuJ0nD3SUFLy52', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(160, 'MARIA ALEJANDRA', 'ROMERO MURCIA', 'CC', '1075294300', 'laurendaniela2014@gmail.com', '$2y$10$ZBhxikXjnWPggyIRiyp6d.3m/F2FSQbI8fgK4zd3Op5Kzf1hOzcLC', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(161, 'JESUS DAVID', 'VICTORIA SILVA', 'CC', '1075298223', 'jesus__victoria@hotmail.com', '$2y$10$1MqRb1oBlc429dcNV6/.i.BgTWRjPIXYseilnvybO.HsUXz4zmV3K', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(162, 'ESTEBAN', 'MARTINEZ QUIMBAYA', 'CC', '1075301423', 'arcanjel_015@hotmail.com', '$2y$10$2kxw1uIvq4OwGU1ARurSgO.Gp4PQP3u6zhizWGoMStlPUXtipYGjS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(163, 'NICOLAS', 'RODRIGUEZ ROA', 'CC', '1075301903', 'nico_koz@hotmail.com', '$2y$10$YePaW2PGxTdXodqLiicWSOC.cBK/7MYyb91dZa4pB37wcfrkjohK2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(164, 'JOSE RICARDO', 'GONZALES ROMERO', 'CC', '1075304522', 'riverside.ro12@gmail.com', '$2y$10$ArknCLxYoIvHJXwYetCvs.OQObCvXbxiePPyHILQTpTlk5ZNXzgZ6', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(165, 'SEBASTIAN', 'RIVERA JOVEN', 'CC', '1075305836', 'sebastianriverajoven1997@hotmail.com', '$2y$10$kyjSdJiv12TaPtaqsNvM3OlQVGALs3n3R4EKMLfzmeM/Fjau11w8a', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(166, 'FRANCISCO JAVIER', 'RIVERA ARIAS', 'CC', '1075307897', 'franciscojavierriveraarias17@hotmail.com', '$2y$10$vGf.OWEhOMq9MySUp9NZIecI3h1J4orTL3lpNQVB9mmhsadJ9b3DG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(167, 'DANIELA', 'FAJARDO CAMPOS', 'CC', '1075309880', 'dfajardo08@misena.edu.co', '$2y$10$MpvCixUQ6op3K42lEZ/Uhuva9v/z1COyQkOPu.23XNnYn5RAsMiFm', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(168, 'JUAN DIEGO', 'PASCUAS MEDINA', 'CC', '1075311348', 'juandy-@hotmail.es', '$2y$10$bNeHeeXSUvu9JXYwBcJ5QeZ5kFeMDt.NjwXcu7h0B0JeuRxBNEXLa', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(169, 'CRISTIAN ANDRES', 'BUSTOS MORA', 'CC', '1075314699', 'andresbmas@gmail.com', '$2y$10$8FYUfJI4WfOmX73RjCpB5ufsBr6LDBxRjOa5KtY6.p.SPjvs83SUi', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(170, 'DANIEL HERNANDO', 'PATIÑO CABRERA', 'CC', '1079177258', 'danielpatino0205@gmail.com', '$2y$10$xbLOexf3t/aXBHx4uulrXOEkQrAoeJKx44zEnRCZJKRplCGaMiUwi', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(171, 'KENDI TATIANA', 'SALGADO SANCHEZ', 'CC', '1079185139', 'tatianita201809@gmail.com', '$2y$10$AYbhT3cp0xoShIzd8pl3QOjLtbyebqEZlA7klQfjQv7EG9xp4Kyei', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(172, 'LUZ MIREYA', 'PIÑA SOGAMOSO', 'CC', '1079185998', 'mireyaps17@gmail.com', '$2y$10$2f9eZuG7Iz0tiFuln8IvGerU9zxG2L/QNbFg7gXXr5riFJ8TG0Zk6', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(173, 'KARLA XIMENA', 'NINCO FONSECA', 'CC', '1079607780', 'kxninco@misena.edu.co', '$2y$10$Byl4nn30ZgdQ6Hg8HvY2cuKtQQmEUDOhhhWmOQDANWalkLvGKnFBm', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(174, 'MITCHEL STEVEN', 'OVIEDO ROJAS', 'CC', '1081155730', 'm-s-o-r_654@hotmail.com', '$2y$10$EvBePhlkGogouGuq19kxlOFLdTBrLBorMIqMReYp1OxeRWyR2zZ4O', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(175, 'EDINSON IVAN', 'TORRES LLANOS', 'CC', '1081160769', 'ivan.1999torres@gmail.com', '$2y$10$VI0h2eXPBpBUzexZBPPVleTMbgwbFD7CdcZ/NVZucmjq1tkYynjI.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(176, 'CRISTIAN FABIAN', 'SERRATO ALVAREZ', 'CC', '1081161102', 'SerratoCristian99@hotmail.com', '$2y$10$RKHwij/LJQpiLzERmod5CehUXMuZUhXb.yw6p9zMDLUXAiKUQDqWW', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(177, 'VIVIANA ANDREA', 'GARCIA MONJE', 'CC', '1082214880', 'viandregarcia@hotmail.com', '$2y$10$eff0Y8DKHAp0Xu6b56r.rew771Xct67c/mOXd3BJSKNxYn0C1uzKi', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(178, 'CARLOS EDUARDO', 'BRAN PERDOMO', 'CC', '1082215747', 'carlosedbrand@gmail.com', '$2y$10$I/xcqdf/oLhR9JzT3mP/KOYS6ZBAWpDyLx3p5j4wgs7DnHwWGfl.G', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(179, 'LUISA MARIA', 'MONJE MEJIA', 'CC', '1082217057', 'luisamariamonjemejia@gmail.com', '$2y$10$YythSw/cAcqNou5dNrSrvuEkEGwQj8yrTNuKzQVbTb/dSYtdiv73e', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(180, 'OSCAR EDUARDO', 'GONZALEZ', 'CC', '1109418769', 'lida.hernandez@cun.edu.co', '$2y$10$omLgypgp4fMj75joBCTDNOw6wyNyTCxl6fy5YEsl2F6XvzJ3VAymi', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(181, 'LORENZO', 'SANCHEZ RAMIREZ', 'CC', '1149195921', 'lsanchez129@misena.edu.co', '$2y$10$iZ/7GYaMZJBXsDUDQfwiJuwRvvbZBGl8QaVfDj6R3cFRajCw3tVUK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(182, 'YULIANA ANDREA', 'PERDOMO BURBANO', 'CC', '1193085963', 'yulianaperdomo190901@gmail.com', '$2y$10$pckxHp9MMZjOPfYBQnW/ZuI5o/H/KqNlyAGwa4cD4xJEUODbRz00a', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(183, 'LAURA MARIA', 'QUIROGA CAVIEDES', 'CC', '1193096483', 'mariiacaviedes@gmail.com', '$2y$10$29BHgIoQJtc17YPd0l77ou/jhEAKWMIZWPLtvWMvA3t1EtO46TArK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(184, 'CAROLINA', 'ZUÑIGA ALVARADO', 'CC', '55069673', 'carolinazunig84@hotmail.com', '$2y$10$eMhcPdWN7SF8nSCQ6PlskOhoEgu8.kH/HazFcmK3rwAeqR.Ble95W', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(185, 'SANDRA PATRICIA', 'AREVALO RAYO', 'CC', '55190751', 'arledraca26@gmail.com', '$2y$10$vxHlUR8V90NToEis3ktHoerafDoKFDn/LnCLzOWP2TdZC.ymkD1iS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(186, 'DANIEL', 'LARA MURCIA', 'CC', '7705410', 'daniel.lar.mur@hotmail.com', '$2y$10$WF9Svhfo14H86SF9iymkye6W8e1MANdwANEJwehKhIUU8Cif4w.bq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(187, 'DIEGO ALEXANDER', 'MONTES PERDOMO', 'CC', '7730918', 'alexander.montes1091@correo.policia.gov.co', '$2y$10$78VOZcxkF3vOSqGWMSrLLuafL/LSwzy5apImTGNQvoRaIW8ipyFfy', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(188, 'CRISTIAN CAMILO', 'GONZALEZ MOSQUERA', 'TI', '1003806349', 'ccgonzalez94@misena.edu.co', '$2y$10$AT55uKmyozVf867KOgaAcOXNSUFGlNz4tT30AwtlEGNjtjhALjtti', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(189, 'JULIAN CAMILO', 'SILVA SALAZAR', 'TI', '1003828436', 'jcsilva63@misena.edu.co', '$2y$10$MXYxuIJ7UDEgbrME.lS5Ye9Xkb9fhumxyDCGrpbCRb35chZE6sHYe', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(190, 'GERALDINE', 'ANDRADE VALENZUELA', 'TI', '1003894116', 'geraldineandrade001@gmail.com', '$2y$10$QCRmaq0Wlu8tESnYJQt/ZulbQX8ui6h5maxXVW07N7Dmg7ZzjI2IS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(191, 'JUAN DIEGO', 'RODRIGUEZ LEIVA', 'TI', '1003950931', 'juanrodriguez3103@hotmail.com', '$2y$10$SBRKj8qwvffzgpeECIAvSumIcLwz1GmseiWEWO9PijrRSOsD9PvUu', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(192, 'YESSICA JULIETH', 'CRUZ NINCO', 'TI', '1004225026', 'yesicacruz1590@gmail.com', '$2y$10$oBr3d1cux3lUtp29.kwyLuHaEyAvij.K7mOBTuYOeJ0zPqSpEFt8O', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(193, 'KARLA YULIETH', 'MEDINA FUENTES', 'TI', '1004248167', 'karlitafuentes94@hotmail.com', '$2y$10$CspDwkonZjkBMyTf/o1z0u9xwZc.BD3nhoeGlEK5FeSAM3bkbf/Na', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(194, 'ELIAN ESTEBAN', 'LEGUIZAMON ZAMUDIO', 'TI', '1007674903', 'eeleguizamon3@misena.edu.co', '$2y$10$3tNhrz/N9XVQMoo9qaF/4eKbI9MtxQnzRf0iKlzcKbuZXkls/b/Vi', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(195, 'JUAN NICOLAS', 'DUSSAN CORONADO', 'CC', '1003807319', 'Juannicolasd15@gmail.com', '$2y$10$ZJ2jV2XPwtN2M8zjGqqdIuFmVgC0I.3v.4.SUxLi3PaY5v2gCX8Ey', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(196, 'JOSE ARMANDO', 'GUARIN CALDERON', 'CC', '1003814464', 'jose25regge@gmail.com', '$2y$10$MHvAFeKZ5WoX/IE68jMKIe4TOgpIqafLm9rE64KquW41wV9rYBsSK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(197, 'JUAN DIEGO', 'PARRA SANCHEZ', 'CC', '1003866415', 'juandiegoparrasanchez@gmail.com', '$2y$10$eAcK2MHXnDB2ddfCEAigFeeQCQh6ySFxHs0012AkHk.6yRgELNWe6', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(198, 'MANUEL EDUARDO', 'VELEZ CABRERA', 'CC', '1003994023', 'manuelvelez526@gmail.com', '$2y$10$se7vimC4i04h5ykBrRhwfeev4ALl.kpSrLfCn07uE36JsMq3o45TS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(199, 'SEBASTIAN', 'VALENCIA CELIS', 'CC', '1010136186', 'svalenciacelis16@gmail.com', '$2y$10$6SretYvikG8.0y7uQVaBoOJry9pcaPzPUduZAfKo/1K950lsYbwo2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(200, 'VALERIA KATHERINE', 'BARRERA VEGA', 'CC', '1032491488', 'valebarrera11@hotmail.com', '$2y$10$ytLeQLUndp3IvaeeC7MrAeJPK3LMNNIeodbz/pv6qasfEnm74HUC6', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(201, 'MAYRA ALEJANDRA', 'ALARCON CURICO', 'CC', '1075217530', 'malejan.alarcon@gmail.com', '$2y$10$M2BHrM0zvC7Eslzn3X.3LuwO2PtgHrCJwnOVvjm8oT.w/DSh0M/Pe', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(202, 'ESNEIDER', 'CHAVARRO CACERES', 'CC', '1075219916', 'echavarro7@gmail.com', '$2y$10$oKAsCndnZ7wJ6jKM/NgOBeELHjnK4L3yxK5MO1agJGl3w8urhqoEK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(203, 'EDNA ROCIO', 'CEDEÑO BAQUERO', 'CC', '1075235547', 'edna_rocio1988@hotmail.com', '$2y$10$Mts0Z11Rtdk7nbxzBU0CWeck6ttlgFk6bSDU5gM3.xFhqdxbpg/3G', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(204, 'JHON SEBASTIAN', 'REYES MAVESOY', 'CC', '1075248294', 'ninealca@hotmail.com', '$2y$10$qhfASN8ItcKDYBdQmhXE2eUSUUQAmigdAiG/VF43X5C424FVjdQ8m', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(205, 'WILMER', 'VARGAS BAUTISTA', 'CC', '1075250180', 'u20152142462@usco.edu.co', '$2y$10$y4dkjQ5/6XGvgJ7bgpo2xOhduLQDpVTxeR7Jtbh8xpJCAlzX/65Bi', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(206, 'CARLOS ALBERTO', 'CUENCA LOPEZ', 'CC', '1075254233', 'cacuenca33@misena.edu.co', '$2y$10$MRfvdqDRe9QdvWoOgW4J2O6F9zaOxjidI1SnOpi6iyiR6Z6zMDVCG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(207, 'GUSTAVO ADOLFO', 'SALGADO GUZMAN', 'CC', '1075256251', 'guxtavoan1609@hotmail.com', '$2y$10$UAvkTyfrE3k0tCxlYi4th.2e9542jP9WFAw.QxDy1UWK9wlyk72Ga', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(208, 'JOSER ESNEYDER', 'QUINTERO GIRALDO', 'CC', '1075259444', 'esneyderquin@hotmail.com', '$2y$10$zHNNVl5uYNK12xwiaIwU7.PZk0tyMSSNa/KriEl82FT1iTYowuITS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(209, 'YURLEY', 'CORTES SANCHEZ', 'CC', '1075261706', 'yurleycortes544@gmail.com', '$2y$10$ejYqf08jbg1VBMFFoePLJuo4XpXvY1ngZWKSECMVaB22FzZHbCRrm', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(210, 'EDUARDO ANDRES', 'PEÑA ROJAS', 'CC', '1075264436', 'eapr_14@hotmail.com', '$2y$10$TOXrPUzZVskU9b1dLCt3LOQxlwwMY1cCv5Pdchhc9dzWhl6.n3AwK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(211, 'CAMILO ANDRES', 'LEMOS CUELLAR', 'CC', '1075292937', 'camilolemus30@gmail.com', '$2y$10$HQ71zOjDAnoUexXS0qmVl.xxSVHG/0KvQDSyOlD2WMWHfWr3uzHfq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(212, 'IVAN DANIEL', 'ALARCON VILLANY', 'CC', '1075296749', 'ivanalarcon03@hotmail.com', '$2y$10$KKsGve0J.U3n8GrJEVai2e5qV7EKP39BJWTC9FBRA.27Syfe2ALlS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(213, 'MAIRA ALEJANDRA', 'FLOREZ BARREIRO', 'CC', '1075300569', 'maira_florez_@hotmail.com', '$2y$10$UKh1DdGCr0bGUuRQYo6Ake0i/Pka7gc4ULaH38ozZw9LMhm15hxOu', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(214, 'MATEO', 'RODRIGUEZ LOPEZ', 'CC', '1075301573', 'mateorodri_1997@hotmail.com', '$2y$10$4P8KmDU4MjOTpee.T8gmc./EcalSnFxLK9DzEEkgRBRUp9SHZut72', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(215, 'ANDRES FELIPE', 'BONILLA LEON', 'CC', '1075306572', 'felipebonillaleon@gmail.com', '$2y$10$IJDbuB/HZg0yHOtZv3OaceRTFLrBtfL1laWU5hJNX8Y00hD3yuF2G', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(216, 'MARIA DEL PILAR', 'GUZMAN RIVAS', 'CC', '1075307676', 'pilar_rivas97@hotmail.com', '$2y$10$7m18nSYULA4ATtKna8FRKu4Pl48kQ8aEodgF.zsVGr2rI3Vzp0XAO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(217, 'BRANDO STEVE', 'MAYORGA GARCIA', 'CC', '1075310353', 'brandongarcia0798@gmail.com', '$2y$10$XspKPthc1USBYoA/OkSrI.JjZvUTMQJB5wntaQbEhtQzCWxJ5OoEC', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(218, 'JOSE HENRY', 'CHARRY ARIAS', 'CC', '1075541199', 'charry2518@gmail.com', '$2y$10$srwIeeI9YMn9rRGrFKFxEeywKDeRbrfh7KlYDiigZVyn3xs9Ld3TC', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(219, 'ANDRES FELIPE', 'LOZADA CARDOZO', 'CC', '1079182284', 'andresfelipe.aflc@gmail.com', '$2y$10$mVqxCLQKdDcefsqfobJrUO/A.deWgkR5/Y4zHJMeGYeIuLmA91HoS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(220, 'OSCAR LEONARDO', 'PERDOMO GONZALEZ', 'CC', '1081158586', 'leonardo.perdomo.1081@gmail.com', '$2y$10$ffMtDuQxZHgMNHY9lYlEj.bANvKBC6kR0MS1RbAT0/zNZgrO5uNq.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(221, 'GERMAN ANDRES', 'RESTREPO NARVAEZ', 'CC', '1082805624', 'anresnar@gmail.com', '$2y$10$l2Qgs386p2QmoEr/c.nrBeeCFVOzrsIA.ewM7N25N15NWJOldm0CG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(222, 'DERLY ALEJANDRA', 'CRUZ LEYVA', 'CC', '1084868306', 'aleja13668@gmail.com', '$2y$10$7/H8dpql0WiA42NJBCK5Z.5LDpuSvDrycyoyrtX6IAQ3G3oVpp6HO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(223, 'JOHN JAIRO', 'BLANDON MARIN', 'CC', '1193371012', 'marinjhon60@gmail.com', '$2y$10$aOs8XuVMnpLQc9xnNm15XObPKeDM0pvx2FpzuyKfcaAO1hayFu6s2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(224, 'SEBASTIAN', 'MONJE PULECIO', 'CC', '1193459453', 'sebasmonje@outlook.com', '$2y$10$RBDfO0ciEkvEOm.25usdZOlwAbw/2/WJMrhfGqeSrb7qxNk4eP/tW', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(225, 'LINK ROBERSSON', 'ROSAS PINEDA', 'CC', '6802110', 'liropi2000@hotmail.com', '$2y$10$LPe/i5Vbh82RKE76o91uo.U/EbpeWyuxNnKfLhZWUeBiDQAYIv1Ge', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(226, 'DIEGO ARMANDO', 'QUIZA FIERRO', 'CC', '7727966', 'diegokantiano@gmail.com', '$2y$10$k8AyKd1x7c6QMGxPRjYEhuLmiTVjwPidssH3.voKccyeoW.ur.UvW', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(227, 'SEBASTIAN', 'LEON YAGUE', 'TI', '1003809575', 'la45678yague@gmail.com', '$2y$10$nODjKhYYP41.xxPLGhdZ.e3fdqug18ZOriGcNh2RwbSy1OJOynbFi', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(228, 'JUAN CAMILO ANDRES', 'QUESADA ROBLES', 'CC', '1003806285', 'selbor443@hotmail.com', '$2y$10$gwBwYxPAY0JguVxoUO.0e.D/DDEkARwkvib0DpK77zwyGuj8BQFDq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(229, 'PEDRO ELIAS', 'SANCHEZ VELASQUEZ', 'CC', '1003806315', 'jefemaster999@hotmail.com', '$2y$10$YJSG/kqgbWj064pfuE8fHuNGbNr2ybCie81h2xfbeuXSwgYeokPfC', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(230, 'EDWARD ALEXIS', 'DUQUE OVALLE', 'CC', '1003808208', 'hito32202@gmail.com', '$2y$10$RpDA1UaxUTHJ1XJ3kXTVyekLxEZJ0JOFpvG2eRZ6M1F2HOwpGxmqe', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(231, 'JUAN SEBASTIAN', 'ARTUNDUAGA ROJAS', 'CC', '1003828394', 'JULIAND7896@HOTMAIL.COM', '$2y$10$8BidLnTaDSSV0I.Shrp4xOoGDgpa3ZxNv90.cPPP9vSHc/XzvDg.S', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(232, 'JAIME ANDRES', 'CHARRY MEDINA', 'CC', '1003829289', 'charryjaime5@gmail.com', '$2y$10$vCwJsL3Go7FnAUzCBT2U7eLRgLz8XWy72r1R.R71VhjslEV3DVke.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(233, 'OSCAR IVAN', 'MAHECHA MORALES', 'CC', '1003894746', 'oscarmahechaii@gmail.com', '$2y$10$jNAZl8gKyzYbPnBq8uXrl.uzsTUSFSM9uf1qbsgxCHFc4IbutME.O', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(234, 'JOHANN SEBASTIAN', 'DUSSAN RIVEROS', 'CC', '1003894987', 'johanndussan47@gmail.com', '$2y$10$I/mMfjD5oTV2cuYas6/DAO4uXZyKwyv359Voa5K6rDaF2ig1Cx3em', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(235, 'MARIA JOSE', 'PADILLA TORRES', 'CC', '1003951434', 'mjosepadilla12@gmail.com', '$2y$10$e90wia2RzDceM/brRFCm9OzM8n.Z3m7cYbxq7rIJrT2DAP9v6aG3e', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(236, 'ALEJANDRO', 'ROMERO TOVAR', 'CC', '1003952030', 'alexroto500@gmail.com', '$2y$10$CgDYptJs60sgTbOJzziZe.nwEImXivJ3qpfUfuKarDVIvSqvUOwAe', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(237, 'JUAN ESTEBAN', 'BETANCOURT GALINDO', 'CC', '1003952516', 'juanesb777@gmail.com', '$2y$10$qRMoSRS0DWXkKDu.j4ZJAuTHRbXWKIsTiIg3SCC7ToEAomcjOmVCe', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(238, 'LISETH DAYANA', 'CORDOBA GUTIERREZ', 'CC', '1004062809', 'cordobad732@gmail.com', '$2y$10$oAHrKjf99nSbQx7bQPA72uVX.eTpENuOXdCLJK0CdDT4eeRzabN7.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(239, 'ISAIAS', 'MONJE DIAZ', 'CC', '1004062904', 'isaiasmonje2@gmail.com', '$2y$10$52FPLoErO/ajYXgv1w2khuGhoeke/Gb9BG1nmc1lpdMgiAb.CIcAq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(240, 'DIEGO ALEJANDRO', 'LUGO MANRIQUE', 'CC', '1004344469', 'diegoalejandrolugomanrique@gmail.com', '$2y$10$wyBCD1MuPDUzMeh4P/i/O.ECCyiSoUjb3TjzxtxyOCpARniu7QZRy', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(241, 'MARIA ISABEL', 'CERQUERA LAGUNA', 'CC', '1004493896', 'micerquera@misena.edu.co', '$2y$10$VhXzdwvxTMDqFFtf5LO8q.eUIAMLJsFsFt5WtUGfzl1s5S5RQkwTK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(242, 'NATALIA', 'GARZON CASTIBLANCO', 'CC', '1006509459', 'garzoncastiblanconatalia@gmail.com', '$2y$10$GVojzGTmB79SfnNFxeO7B.6zhmFYyxtp3xrohz8zEut66OzJj6AAe', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(243, 'MICHELL DAYANA', 'OCAMPOS ANDRADE', 'CC', '1007287219', 'michellocampos2002@gmail.com', '$2y$10$Tepf.LCC3czOmPguJdvRs.XfdFbeYMNxn4MGAGEyFdu24ssWcRPgK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(244, 'ESDILMAR', 'CABRERA VALDERRAMA', 'CC', '1007659757', 'esdilmarcv@gmail.com', '$2y$10$E5tVZX.UvYbc5geln4sa6OfmrhtnjYLLZZG6rSTz8KeEZVmHQgcZq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(245, 'BRAYAN JULIAN', 'SUAZA MORA', 'CC', '1007704762', 'brayansuaza111435@gmail.com', '$2y$10$VKG9zZY391s5W5tqZ7GiS.aU76qPT1ipH0uwSBZzJeRawe6iDQ/2G', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(246, 'YESSICA LORENA', 'CORTES CHAVEZ', 'CC', '1007938108', 'yesica07cortes@gmail.com', '$2y$10$rM6lILLC3EbcJ/AQImXUIenSKtqauMRDHSH/kgMN4IPvf8yYK./z6', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(247, 'JHONN FAIBER', 'SANCHEZ CUPITRE', 'CC', '1193081391', 'cupitre16@gmail.com', '$2y$10$dQtVStsepGV0PXcKnAizUO1paGdDE0G7vbndlcoqRHKxdU5E/MZHK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(248, 'ADRIAN MAURICIO', 'TRIANA GUTIERREZ', 'TI', '1003829161', 'adriantriana23@gmail.com', '$2y$10$yoBs7ZfSCBQw4X9bXY9Mn.fXPYeu20qkAD.mVcFpMmg5sPe0kx31y', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(249, 'NIKOLAS STERLING', 'VILLABON PUENTES', 'TI', '1003895494', 'nikolasvillabom2003@gmail.com', '$2y$10$Oxip0qriN.7vscz2j3v1reFH2zxFAqVq6FDxZNUhum5S655zmgR.O', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(250, 'MARIA FERNANDA', 'PADILLA TORRES', 'TI', '1003951440', 'mfernandapadillat@gmail.com', '$2y$10$.ZY4MzP3b1Y.D/Qay61al.O2Qn0431m1eN33djQtEpszoIpQrhCzq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(251, 'YORDAN STIVEN', 'GUZMAN RAMIREZ', 'TI', '1004062342', 'jhordanguzman596@gmail.com', '$2y$10$guEjQgTSixVneKSCfioK0uNUQfKACPvXf4ZVF6sO7zeAc5hGhPAn.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(252, 'DAYRON STIBEN', 'TRUJILLO CAMACHO', 'TI', '1004062964', 'stevenelectronico1535@gmail.com', '$2y$10$/4G41QfWPmNRrU43WoVIKel4a6idBozkaFpa1PuwloXpFAHFLUuH2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(253, 'JHON JAIDER', 'CERQUERA LEGUIZAMO', 'TI', '1004493897', 'cerqueraleguizamojaider@gmail.com', '$2y$10$g32Vo7RUJYdkwFxazaeHIu94dmvML6N1zeYawXcR7SPE71wch8nTa', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(254, 'ANILIBETH', 'HERRERA OLCUNCHE', 'TI', '1004494003', 'aherreraolcunche@gmail.com', '$2y$10$DT/kk2jIDCE1QJGOHTuQPucww7c9U4UgqfngdkMbWNhpuNmUKjGj2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(255, 'JOHAN SEBASTIAN', 'PALECHOR MONTAÑEZ', 'TI', '1076902089', 'sebpalechorz@gmail.com', '$2y$10$k9r7bokq9ROUdK199YDOh.ERXfW/w4ErI9T3/iTOPd4GBMAZ0.EhO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(256, 'JOHAN SEBASTIAN', 'CASTRO SANCHEZ', 'TI', '1076906506', 'castrojohan804@gmail.com', '$2y$10$F9lQPUXCIcTf0RWLyqFhaO41/zhrVmJXxOcSstf76Chz1cAOvm5Pa', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(257, 'YULIANA MERCEDES', 'SALAZAR ORTIZ', 'TI', '1079172497', 'salazarortizyuliana@gmail.com', '$2y$10$BgwtA/yV63nqogSXmtrIwehplxvl5fSyzIpfDkxIYCMCfk6/A44A2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(258, 'JOSE LUIS', 'TRUJILLO GRANDA', 'CC', '1003806019', 'TRUJILLOJOSE172@GMAIL.COM', '$2y$10$vWu6HVYrc.pGtkdWmY2KxuQXgHVmGD4R5XrgT0Mx1Re2UGf/Dt1t.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(259, 'KEVIN FERNANDO', 'RIVERA SAPUYES', 'CC', '1003808596', 'riverakevin365@gmail.com', '$2y$10$WdObzMqJEJBpM/umkzASIOKJu.b/BxPS3gJufdXJk/fFhAe52oNgq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(260, 'ANDRES FELIPE', 'SERRATO TRUJILLO', 'CC', '1003810962', 'serratotrujilloa@gmail.com', '$2y$10$OaNVwHXSB6X686zCaZpfP.7xOahvsgR4ENGdN8lpj2/WuuX9GWuCa', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(261, 'MILENA', 'CENDALES RIOS', 'CC', '1003811451', 'cendalesmilena1@gmail.com', '$2y$10$gXV.vfB/foWrDOHNQPA/HuLFZzcZjRra3GUYKM2PqEGekZN2nTaDO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(262, 'HOLMAN', 'CAÑAS PAVA', 'CC', '1003814980', 'h.canas10@ciaf.edu.co', '$2y$10$SP.CZ.IjJAYA9B3PXGnOreEzy/dVVBjv1Dz0ezP5YHztmFLEISFZ2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(263, 'JHONATAN DAVID', 'CAVIEDES PAREDES', 'CC', '1003951515', 'paredesmarleny43@gmail.com', '$2y$10$ZxXctm3Wa.NmS.9y7XLxgeQNuywn54Ortun6WJ8PLzUOXHbdo8zQm', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(264, 'JAIRO ANDRES', 'COMETTA NARVAEZ', 'CC', '1003951664', 'jairoandrescomettanarvaez01@gmail.com', '$2y$10$e/iqV99lVVGJa735XGG7yujbV6CeuvwS.NZvp6fVZIF1giioQnkdm', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(265, 'SHIRLEY XIOMARA', 'CAMACHO CALDERON', 'CC', '1004225656', 'xiomaracamacho0526@gmail.com', '$2y$10$9rJhuwMtkS2JTTZnSPO61uNJidv5HuEqeNb.UnPGR/W0ul1Ok1AR6', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(266, 'OTALVARO', 'CUELLAR TOVAR', 'CC', '1004252978', 'cuellartovar0198@gmail.com', '$2y$10$dXJub5E5Sg1/4kbozNaLAu4xmbUSOVIOkHFB60Qf3TQJcZtmG6/EG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(267, 'ARNOLD ANDREY', 'CARDOZO ANDRADE', 'CC', '1010102310', 'cardozoarnold218@gmail.com', '$2y$10$yn7AJJFbH/HrfZ586.abqeG3OecYPzB4SNSWCv2u6awAymKR2zU9K', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(268, 'OMAR HERNANDO', 'GONZALEZ PAREDES', 'CC', '1013585094', 'omargonpa@gmail.com', '$2y$10$oUTUD01HhiMirceuablgQObK7WwM0GEi0epIxhUaUik09VK3DZAHm', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(269, 'YEIMI SORANI', 'VALENCIA BENJUMEA', 'CC', '1069176295', 'yvalencia95@itfip.edu.co', '$2y$10$c.d.kYeUrUOQQd3ZTJyPa.BCN.GuSZE8kub5hSc9KfY9H/q2clmTu', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(270, 'JUAN CAMILO', 'MONJE RIVAS', 'CC', '1075236399', 'monjerivasjuancamilo@gmail.com', '$2y$10$GCEqrcUjw3FBYohGvnARMuucuj2OUpxzG8RW5mbjRE0GlT0t7cwnq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(271, 'GERMAN RICARDO', 'BAUTISTA SILVA', 'CC', '1075266747', 'silvabautistagerman@gmail.com', '$2y$10$s1vfW8/YFMoq8bLVSKaQtelFa.6.mbQ7ptIww.Dn/xijB2g5Dst5S', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(272, 'YURI STEFANY', 'PALOMAR GONGORA', 'CC', '1075268098', 'yspalomarg@corhuila.edu.co', '$2y$10$xiyxOKX.ZmklucA2y8CibuXsmqM6vlGfs85B1YsEk9.qB0mXfigSG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(273, 'LUIS FERNANDO', 'VILLARRIAL SOTO', 'CC', '1075270510', 'lunchwars40@gmail.com', '$2y$10$T61PftNzxSceH0By6/QJROlfHsxcioDsXug2M6x7ktdlZ4k2qsdlG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(274, 'HECTOR JULIAN', 'ANGARITA SANCHEZ', 'CC', '1075273732', 'superjulian2006@hotmail.com', '$2y$10$OL03EEDhGi40T9Dj2XkqtO5H79NclK.QTb6u9quTpblXPf0mjaPHu', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(275, 'HAMILTON EDUARDO', 'POSSO ACEVEDO', 'CC', '1075274692', 'hamiltonpossoacevedo@gmail.com', '$2y$10$fI5Ht013VRmC84QNcDSjwO.LYbg24Hk4W1yy3JxPaPGD7UH0xgyVW', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(276, 'JHON EDISSON', 'CASTRO ALVAREZ', 'CC', '1075284016', 'jhoedical@hotmail.com', '$2y$10$e8bVToiSeZ5m98aMu81Z/uKqW0o9kEpobW2bLZ1MLOsZedw8m1PGS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(277, 'CARLOS EDUARDO', 'CHIA LOPEZ', 'CC', '1075289269', 'eduardocl.18@hotmail.com', '$2y$10$c2XkPF1b0qa11xxBPz0D1.P9i01lVKpKNeZjRD0nMKv0QA3jtAAMa', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(278, 'CHRISTIAN FERNEY', 'URIBE CRUZ', 'CC', '1075294626', 'christianuribe2002@gmail.com', '$2y$10$xjQT03VtQZQR5nbad0boJuke/AuHDXsCvmrO16aP9Poehrn73mWae', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(279, 'CATALINA', 'ARIZA ZULUAGA', 'CC', '1075296571', 'catalinaarizazuluaga@gmail.com', '$2y$10$CmOXWO8pum8xu5UKLT20HObgc5V4iqGH5cz7PrRWFH26AyREDrDpG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(280, 'CAMILO ANDRES', 'CABRERA ESPINOSA', 'CC', '1075302215', 'ccabreraespinosa@hotmail.com', '$2y$10$jtp/5xFjP.e83dkAeHICPOTaDO6o5pZqZn5Kkv8Mv2d8gBEVizRJG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(281, 'BRANDON DAVID', 'SANCHEZ PAREDES', 'CC', '1075304046', 'bsanmpar@gmail.com', '$2y$10$bDyWxy0JdNyV5oQBvqfIYePhrOKbr08YFJrhGOpDj2M0bcJh9qGlW', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(282, 'JUAN DIEGO', 'PASCUAS MEDINA', 'CC', '1075311348', 'juandy-@hotmail.es', '$2y$10$RpkMjUbmps/GbyFnvU4Psu2tyJHW53bM.NiqGyZlZY.Iy86ybVgVO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(283, 'STEFANIA', 'LOPEZ AGUIRRE', 'CC', '1075312113', 'stefanialopezaguirre@gmail.com', '$2y$10$7MWeaTprfA26UWn1ZQPWKO1xPPhwC9y3GONn0.ESL14sQhnTlCx1a', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(284, 'CAROLINA', 'CRUZ VARGAS', 'CC', '1075312122', 'cruzcaroo98@gmail.com', '$2y$10$y18Ombt76QvcW7rwg4eqzuARDZm4lAkZSnhIZpVFm6RJ2FQpVamci', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(285, 'JUAN MANUEL', 'ROJAS CAMARGO', 'CC', '1075313041', 'jmrojas0159@gmail.com', '$2y$10$PWD5Nyp4SF9Jv9zyHDN9aub65seG0Hx7pesrurfrWOExseaQP1BlW', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(286, 'OSCAR STEVEN', 'RUBIANO ESPAÑA', 'CC', '1075314476', 'oscarjdt2015@gmail.com', '$2y$10$hLfknbdbRkB0KY.hWZu/IunUrpUAUXqvbS71ZL77CXjhLJ.PcSOF.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(287, 'JUAN ESTEBAN', 'ESCOBAR PORTILLA', 'CC', '1075316062', 'juanes_escobar@hotmail.com', '$2y$10$0fIUsLos8mEMYZYz7iZZ1uf6/lFHCQy/2aRumFgrcoOoXdqpnSd6W', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(288, 'JUAN ESTEBAN', 'OSPINA ESPINOSA', 'CC', '1075316504', 'manuelospinaru@hotmail.com', '$2y$10$swTwrxtA6mRUvFf1BiYe4eJHXzEK8qWYxYnJ7FM3Ir5iKJdRCM.lC', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(289, 'JUAN FELIPE', 'CASAS LOSADA', 'CC', '1075318859', 'pipehalo4@hotmail.com', '$2y$10$e8CkKd8cvrvfUYM/1xqxm.wfhD0AEsuOxIvm7bBZQGTcXYIzdeUK2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(290, 'ANGELICA YOHANA', 'ORTIZ TOVAR', 'CC', '1075541867', 'johanis_1991@hotmail.com', '$2y$10$YdkVrlUcXjOwbXJlv4cyB.zOkYFBWVjxC2evNxiykgPtJwDsvW70e', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(291, 'MIGUEL ANGEL', 'MURCIA CASTRO', 'CC', '1078247311', 'miguelmurcia0207@gmail.com', '$2y$10$EYQRdUJcZIUW9uq9DZ1a/O0pfIvo35qLkT.3fgRonlE2k2Ht5gPAK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(292, 'SAIDY VANESSA', 'ORTIZ POLANIA', 'CC', '1079173300', 'saidyortizpolania@gmail.com', '$2y$10$GYxpxyOlFg8J3EGKOBtPXOyLMd8f7Y3zy6h/dIdFlUeYGIEvCo8/a', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(293, 'GERMAN', 'TRUJILLO MUSSE', 'CC', '1079187457', 'Musse1390@gmail.com', '$2y$10$RaySqcOreMGRLxn5iLrU9uJdjl.mrGPh9AZQXm.ZXIlpbrU4O8QMC', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(294, 'DIEGO FERNANDO', 'CASTILLO RAMIREZ', 'CC', '1082216304', 'difercastillo@gmail.com', '$2y$10$mWSuxhLKhy4Ul5Qlr4Je7OOEmiWao8H/aiXnaWXTHtPhPq/PIUCiO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(295, 'CLARA MIREYA', 'ANDAPIÑA ANDAPIÑA', 'CC', '1084577143', 'candapina@hotmail.com', '$2y$10$bjcOzwrO4qYRZlNtTKqbEuFwAIkwNQYL/wpk8/gTLAgH6h24.yQrq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(296, 'EDWIN MAURICIO', 'FALLA PINZON', 'CC', '14136746', 'edwinfalla30@outlook.es', '$2y$10$NNXtvmTk7eysipuLjgauguEAhxPCwMu25c/.cTLZLsCTwba0cwp1q', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(297, 'ANGELA MARIA', 'CASTELLANOS SANCHEZ', 'CC', '26422743', 'anmasanchez2017@gmail.com', '$2y$10$j23ohgSPUJlcaiESFkto3e8t9HtjvAuKRChSNH3pST1QKP9NJv.4K', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(298, 'KATHERINE YINETH', 'AGUIRRE HERRERA', 'CC', '52528091', 'katherine.aguirreherrera@gmail.com', '$2y$10$mNb66q3i2/SFQ5bvw2A2seLHCBldsvVMhtQ1PnZBn/Pk3CjxMU.3G', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(299, 'CATALINA', 'CAVIEDES ANGUCHO', 'CC', '55174778', 'precioso260701@hotmail.com', '$2y$10$0kzRSHmO/abx5WOTjguH4uibTYdiVpE65iADLWSfmdiaE1T76G/FO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(300, 'OCTAVIO', 'QUESADA GOMEZ', 'CC', '7705649', 'octavio.quesada@hotmail.com', '$2y$10$i1d/WQU8iXt.hDzL1iKp3ueWvcPYUWAt50ViQvsrcDneUsJJ8bPL6', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(301, 'ANDRES JULIAN', 'BERNAL CARDOZO', 'CC', '7723007', 'andresjulian-21@hotmail.com', '$2y$10$Hy24v.zZKQUt0EeS2dRpiepqm/t7if0J6yVAocEuXGWNAf0zAqTeu', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(302, 'DIEGO ALEXANDER', 'RIVERA RAMOS', 'CC', '7726856', 'diegoo.rivera02@gmail.com', '$2y$10$25LjApgY3y.6rjfDhKFQcO2VYhfmmiMRnfrjzbCPBKQcjiazpBTp2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(303, 'MIGUEL ANGEL', 'YAIMA CRUZ', 'TI', '1003805632', 'miguelangelyaimacruz@gmail.com', '$2y$10$eE9wki0nbdCevCzjR2n37.6E0bHyoIgnZesMXubr.FEL.A.SUEZ7y', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(304, 'JOHAN SEBASTIAN', 'ZAMBRANO POLANCO', 'TI', '1003828711', 'josepoza125@gmail.com', '$2y$10$aI3hVWHEeXxv0rfDF8hgUu25lBtzJEDtdj86bG4WJT/s3/YOAFjPq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(305, 'ADRIANA LUCIA', 'LISCANO PERDOMO', 'TI', '1003865530', 'lliscano2003@gmail.com', '$2y$10$xg4JzQmgKwsODO1X7myHOOFYpvOehcjGk9WJ4jHGxqze7MmRiFC.O', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(306, 'CESAR DAVID', 'CEDEÑO ROJAS', 'TI', '1003865804', 'alguienexplendedor@gmail.com', '$2y$10$HvbTv8df1Oo3A75UiwqxVOsdMd6Ae/nLb1pgIVM4IMO72zzIAwD.O', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(307, 'TANIA MELISSA', 'BAHAMON MONTENEGRO', 'TI', '1004063029', 'melli11041@gmail.com', '$2y$10$td8rSSmmitb3MIstJzHXB.5EcCxUjCCqv9zuaapjwDx2NbsVpmR2i', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(308, 'SANTIAGO ANDRES', 'VALBUENA MENDEZ', 'TI', '1004156228', 'andresvalbuena1209@gmail.com', '$2y$10$vv9XNw3/Up0OvBApFWjGTusNppmtnBiZqgqXjQeDWsyX3J5J13vtW', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(309, 'YARLEY', 'CALDERON QUINTERO', 'TI', '1006557161', 'yarleycalderon16@gmail.com', '$2y$10$mADMQdbi0YiVesd8aCYSP.x37J32KMfy2t4AudztI5pCWMn3vz6Y2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(310, 'VALENTINA', 'MONDRAGON POLOCHE', 'TI', '1007600824', 'mondragon.pv12@gmail.com', '$2y$10$JgZDyShVKPE77K6ZeAG4nOnUMgBI3mJGyZeainKTssh/0uKE0mhT.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(311, 'KAROL DAYANA', 'GUZMAN SILVA', 'CC', '1003805383', 'kdayanag@misena.edu.co', '$2y$10$GQo8VjHoElCcNMjt/ikOSeCjvkIQjncsinOgXiOyQDoT2TdEmaGh6', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(312, 'LUIS EDUARDO', 'CARBONO LUCUARA', 'CC', '1003808919', 'luis.carbono19@gmail.com', '$2y$10$y/ItIdHUJtFzVOSoFhuh7OCIBSIibocphSTOMyRqVZPPuI3QE.Zuq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(313, 'JUAN FERNANDO', 'PERDOMO TOLEDO', 'CC', '1003950919', 'jfperdomo91@misena.edu.co', '$2y$10$FHA9P2TTTbnLSAT27Zu.VeaG/geHCG3tuFtDePtZOT/rER7xYS/qK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(314, 'DARCY VANNESSA', 'ALVAREZ FERREIRA', 'CC', '1004062669', 'darcyalvarez56@gmail.com', '$2y$10$9MkcSH3tLNCQka4/wUFpZ.QGB7Lm0mCWXNV9rrzM0U/.ZT.1CD.nu', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(315, 'LISSYI TAHILLY LISSBETH', 'AGUIRRE MONTERO', 'CC', '1117232212', 'tahilly2017@gmail.com', '$2y$10$7MurnNoQpTF42tdCEPB05OHXLPUIRNEb4Me/UIu9XS3xel52vmIQq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(316, 'JUAN CAMILO', 'GUZMAN GARCIA', 'TI', '1001115103', 'camiloguzmangar@gmail.com', '$2y$10$emNogyfFfU7JkGFJfvP45OjPLv2iNLoWX2JOOZQqKyqH1xkaJwyce', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(317, 'JOSE MIGUEL', 'SANCHEZ VARGAS', 'TI', '1001289484', 'josemiguelsanchezvargas2015@gmail.com', '$2y$10$5Q7D/ymcw5AggJBIL6IwIOJtMHHKvi8G/yqMuxi2jmRqSV13ZLNem', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(318, 'ANDRES FELIPE', 'LEON ZULETA', 'TI', '1003828683', 'aleonzuleta@gmail.com', '$2y$10$TxBH2BFZoLuorkBTfxHfbenwe/TiAGd2FZ3jxqVACSj1Nde1MpYy2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(319, 'CRISTIAN CAMILO', 'CLAROS FIRIGUA', 'TI', '1003829381', 'cristianclafi@gmail.com', '$2y$10$V0SBuOK4HQBKWLp6uEQGUuFqij1WYBercp25dp9CxMX1nYv41LFPm', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(320, 'HERNAN SANTIAGO', 'NARVAEZ PEREZ', 'TI', '1003864960', 'narvaezsantiago140@hotmail.com', '$2y$10$qxq8UO1.gCFPc.2EOqlpYOCWXhgK5a4L5lBl.PT88sBGDTFBP6FE2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(321, 'DUVAN', 'RIVERA MONTEALEGRE', 'TI', '1003866081', 'drivera18@misena.edu.co', '$2y$10$CeTed9UvsKdBr9XWnGFYQOqzIxypAEX5QmyRGcmMMAOVz650pbOjC', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(322, 'WILLIAM ESTEBAN', 'CASTRO FIERRO', 'TI', '1003952237', 'wecastro7@misena.edu.com', '$2y$10$F6qnvImQ8v7pet9AEmZHve63VFseogrylcdUbUH78qGO/g6L18HwK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(323, 'MARIA JOSE', 'AVILES GOMEZ', 'TI', '1003953125', 'majo212528@gmail.com', '$2y$10$YwRfPeZ8FydlFB22N3v62.BHelWqwJd/nxuM2Z7GHFJZxMiF0ckea', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(324, 'DANIELA MILDRED', 'PATIÑO', 'TI', '1004063341', 'daniielita0317@gmail.com', '$2y$10$g3DE7i2tL6dYllax7o4aLuPeg2V3I5//9K//xWpcUeICUNEYIbx5u', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(325, 'ANDRES RICARDO', 'RODRIGUEZ FERNANDEZ', 'TI', '1004474938', 'andresricardo1238@gmail.com', '$2y$10$hEvYBhNBF4olK/7Gz26bO.EY9TaTbZRWcw4mMd5tKXgsDOJCooCim', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(326, 'WENDY KAROLINA', 'MONJE LAGUNA', 'TI', '1004494032', 'karitomonje26@gmail.com', '$2y$10$Ke.Sa.eVEOzZ55EIF1sQR.UTm6FSfcsIOyRq9BmKypebaZK5AQDf2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(327, 'HAROL STIVEN', 'NOSCUE CERQUERA', 'TI', '1004494104', 'harolocerquera@gmail.com', '$2y$10$AM3lfvDkSv2WMiATji.FD.6xy8hBzEeGM05051EITWZw0rJs5Z3X.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(328, 'ADRIANA LUCIA', 'BAHAMON PABON', 'TI', '1006063399', 'luciabahamon123@gmail.com', '$2y$10$gogCEtLLP0hS/cEA3l4sduLjGRb/wAEnrPz1UR1AqDmtr1abpnaRW', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(329, 'GIOVANNY', 'VALDERRAMA PERDOMO', 'TI', '1006351883', 'giovannydemj@gmail.com', '$2y$10$sQ7X.yHMDAiztK5BKGvWGOExym5gRPHEcI9V6IKEqEW4zYKAI6RuO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(330, 'BRIGITH LORENA', 'TOQUICA GUTIERREZ', 'TI', '1021664024', 'lorenatoquica06@gmail.com', '$2y$10$B42hC92yHLZgton39nGZ5OIDNz6tIKyIhkt.O6e/9RqHxx6dlrqzW', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(331, 'SANTIAGO', 'MURCIA CANGREJO', 'TI', '1024460334', 'santyagomurciamc@gmail.com', '$2y$10$J.akvropZzH50RepKljTa.2IpzCRv/uVFfi1I4X7YxXSbofoTc/xa', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(332, 'MAIRA ALEJANDRA', 'QUINTERO OLAYA', 'TI', '1075209280', 'mairaalejandraquinteroolaya@gmail.com', '$2y$10$s9pFdGQzA55KbdEEOGeZzOIrIAi2K4O7JmZ2DtcqjAEuPl1e8voKO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(333, 'EVER JULIAN', 'MEJIA RUBIANO', 'TI', '1075790302', 'gokut777@gmail.com', '$2y$10$Tw/AW4FmLFG8tM65a.HcJ.dRLkC9J3ZVeYJHg/NsAt5rNb.k3QawG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(334, 'JARVI ANDRES', 'CLAROS IPUZ', 'TI', '1076500400', 'jarvi42500@gmail.com', '$2y$10$CHyznQEv7QEPIxEc44V0uuNRdPXLkBVDuEGXHqfMd5tYEd6SsWL06', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(335, 'ASDRUBAL', 'VALENZUELA GUTIERREZ', 'TI', '1077720115', 'asdruproxx@gmail.com', '$2y$10$Jhw0FEhSSH.o/gR5jMdYtOdYp/r2gYUIBwTDsjyu825C62oROZu1C', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(336, 'HALLYS ANDREA', 'ESCOBAR PALOMA', 'TI', '1077729852', 'hallysandrea@gmail.com', '$2y$10$AcUq7RLTAyx1UHLBELE9luK.Dc6XziiRBsNoMalApzEPMycqxIEQS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(337, 'JUAN DIEGO', 'ANDRADE CARDOZO', 'TI', '1077840242', 'andradecardozojd@gmail.com', '$2y$10$TYx738H2GVGC7r7qY9BTd.rMZ7Lu8qCD4.s.lLn7ZA7VcNvZb7FI6', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(338, 'LUISA FERNANDA', 'RIOS LOPEZ', 'TI', '1079174636', 'luizafer1614@gmail.com', '$2y$10$gg7sXH8D7AyrjTHnm3ocZODKEF/qvyhEN4AM5Bl9eCNhoaNl6cT2.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(339, 'JUAN DIEGO', 'JIMENEZ HORTA', 'TI', '1080290005', 'Juan23972@outlook.com', '$2y$10$U3SUa6p78gopRK.w3FkVL.xYp1zTQ7BWDNgXv33SR70cKXemLQMXu', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(340, 'CARLOS ALIRIO', 'SANDOVAL CORREDOR', 'TI', '1081183031', 'carlosaliriosandoval03@gmail.com', '$2y$10$S5dVq2QaFPn66nKlROsO3.IbuD98oWJhAV98BiDpbw4hbbvt0vnju', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(341, 'BRENDA YULIETH', 'ROMERO VARGAS', 'TI', '1084922145', 'romerobrendayulieth@gmail.com', '$2y$10$1jU3zmXlkH6U5OrD6aF6OeR/usy89CA8tQaZgvX4vWF4e9yURV0VO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(342, 'WILLIAM ANDRES', 'ALVARADO FRANCO', 'CC', '1000348097', 'williamalvaradolol@gmail.com', '$2y$10$f2jbCQuuvTy4EfaQaMOWdeFxxVkAqblEHeK2G1Cdo/VnlQOcpcPTa', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(343, 'VALMIRO JOSÉ', 'POTES HERNANDEZ', 'CC', '1001875956', 'valjpotes@misena.edu.co', '$2y$10$i3bTceUenMXTnrkgNE25auopTDF6Z.BxGgQAyLNvGJCTw3sqmwYHm', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(344, 'CESAR IVAN', 'CHAPARRO SOGAMOSO', 'CC', '1002760233', 'chaparrosogamosocesarivan@gmail.com', '$2y$10$aB2Jv68KK68VGQOlWI8GvOhKduERdQqkV6uW0ZiCQkXHzNKnvLy8i', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(345, 'ISAAC MOISES', 'SALAS MARTINEZ', 'CC', '1003409240', 'moisesdurango2019@gmail.com', '$2y$10$189zFrbYNxa.MQIBU2eiHuy6jt/1hWE/htEUkNAzyZRnQocW4mhca', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(346, 'ADRIANA LUZ', 'DURANGO DIAZ', 'CC', '1003456769', 'adridurango55@gmail.com', '$2y$10$4oeoCCHSF/UzMf5buDvOmech.yNCpu1xwExg6DDBsMXDfEe0dWWa.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(347, 'LAURA CAMILA', 'QUIROZ VARGAS', 'CC', '1003527678', 'lcqv1234@gmail.com', '$2y$10$oBN1acG/2KZkM0g.p6pGaesu24RYfIFFGqBWGW2a640TFx8S/XMn.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(348, 'GERARDO DARIO', 'RODRIGUEZ SAYAGO', 'CC', '1004359777', 'tatoonchingon@gmail.com', '$2y$10$QFwk3yW.Hb/7Ixl8S4bd2.bifSjme3wHa7QDlPGtxMU4zPnQOlF3S', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(349, 'MARLENE', 'TORRES CIRO', 'CC', '1005189692', 'marletorresciro09@gmail.com', '$2y$10$EDKWXQ0FtvcCIhathjK7VuUpJ1OOskLSgXlFHNRUvx0uO88Tmnqi2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(350, 'YULLY SANDRID', 'BLANCO RUEDA', 'CC', '1005653932', 'ysblanco2@misena.educ.co', '$2y$10$CUx4eGtYP1LwnicoApy8ieO4jzfSf155JhSYLJfaTpJMklxvKDa12', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(351, 'LUIS CARLOS', 'ROMERO SANABRIA', 'CC', '1005929288', 'luchor.s@hotmail.com', '$2y$10$4IfMCXg5Borlta546G9.AekGWjiWzJpiBRnrAiuB5I7XegZkXkfDS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(352, 'MARY LUZ', 'QUIÑONEZ SANTACRUZ', 'CC', '1006198443', 'quinonezmaryluz4@gmail.com', '$2y$10$LNAzGv4MLuk9kjv3vvpts.qwEUo1QBrbzoSJChABYVTzkmY96H1m.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(353, 'MICHAEL FELIPE', 'ROZO MURCIA', 'CC', '1007389956', 'micfrozo@misena.edu.co', '$2y$10$tTodtHTGMgzxVRgEcIjXMOJR.3oumwSUOE4rj8YMDr15zsEVGlo4S', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(354, 'JUAN CARLOS', 'RODRIGUEZ FRANCO', 'CC', '1007736648', 'juacrodriguez1111111@misena.edu.co', '$2y$10$zUfORmg75NVTQoU19oBc7u0jON.a8tFlWlUxjyCVdnZh4/O5mHAuy', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(355, 'JEFERSSON', 'PINZON RAMIREZ', 'CC', '1010234408', 'jefersson.pinzon.ramirez@gmail.com', '$2y$10$WYfcCTqvSVffKHwJbSmdO.2y/zVfS4dtyB1F7ZsQaoX2SrBvDMI6a', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(356, 'CHRISTIAN CAMILO', 'RIAÑO CARDONA', 'CC', '1014254556', 'cristiancamilo-94@hotmail.es', '$2y$10$q9x/DiUBlsy1IO/bcB1Ekef5OpDM7X9UAjSfGUt1407U0.aoqeKj6', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(357, 'CARLOS ANDRES', 'BOLAÑOS AMBITO', 'CC', '1019059925', 'andres_san@live.com', '$2y$10$gBK.yctgWJmaBqfs7RCEAuEXQUaNWdphlWCljex/4l.By73Sw8yxa', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(358, 'FRANKLIN ARIEL', 'ALFONSO HERNANDEZ', 'CC', '1022993191', 'faalfonso191@misena.edu.co', '$2y$10$T6lheDEa1GjE0hCa.olt/uYL5UrXfh8svhasiJGiHX0XWL2B1NsPi', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(359, 'BRAYAN FAUBRICIO', 'GUTIERREZ CASTRO', 'CC', '1037653270', 'bgc.sistemas@gmail.com', '$2y$10$fs9uiUlFHOttyvnyOGKHaO/PepEOrITp2XrRsWm9TOwHwSwdF1SSS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(360, 'LAURA CRISTINA', 'PAREJO MIER', 'CC', '1064119947', 'laurap3481@hotmail.com', '$2y$10$Ds0W9igifOuxaRlP9UJ/vutkpst5IMbQeDcP9dVH0hMeHbyZjOE8e', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(361, 'LUIS GABRIEL', 'SOTO FUENTES', 'CC', '10820039', 'luis_g16@live.com', '$2y$10$bhQXbHwa6IewlpuAexacyeIc4y4hWYhWvc0TbQIn0lehfep27s4oO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(362, 'JHONIER ROMANY', 'HERNANDEZ MONTENEGRO', 'CC', '1085634625', 'jhorhernandez@misena.edu.co', '$2y$10$.YT4NPoBL.Ocz01OBZ9Xz.TaWLZs/dFzimX.9bVEV8HPVbjugbiDu', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(363, 'MARIA JAKELINE', 'LEAL TORRES', 'CC', '1090174273', 'jakelineleal0319@gmail.com', '$2y$10$NZhclVMOf6W4qi4tzv6oA.7QP3ACw21qkSyF0DUVFVCDhrbwNVTTK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(364, 'JAIRO OMAR', 'GRIMALDO GOMEZ', 'CC', '1090476843', 'jairo_omar014@hotmail.com', '$2y$10$k8qc/lNjvMQ/j.KglgMXFel7BZZvvOE/DWyfKuPB4F6kSChUpgE1O', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(365, 'KAREN PAOLA', 'RAMIREZ DUARTE', 'CC', '1095945060', 'karenpao75@gmail.com', '$2y$10$ZDzMs6BlodGH4FKSRKe/S.ngEpPtQEO.gSfKWq05pLFhW1HOZ3qLi', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(366, 'LUISA FERNANDA', 'VEGA MORENO', 'CC', '1098812936', 'vegaluisa8@gmail.com', '$2y$10$UQzLY5iUU8HJhBeNGaBJe.FvKwhSkMQ3QP5SwS3lY8NrLHj5STOX.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(367, 'LEONEL', 'OCHOA TOSCANO', 'CC', '1102042172', 'lochoa27@misena.edu.co', '$2y$10$h3QSWlxIWkPkvIMXmUPhSObC2qw6SbcI4SqPwXB3xFvFZ7ZsHvxd.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(368, 'JHOAN STEVEN', 'MARLES ROJAS', 'CC', '1110532009', 'jsmarles@misena.edu.co', '$2y$10$.IOtyQAkYFcPK.8u4a6jT.t85/Gk3eOz0Arikm61eWNoMUpjh06.G', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(369, 'CHRISTIAN HERNANDO', 'VELASCO RODRIGUEZ', 'CC', '1112475094', 'CHHristian29@gmail.com', '$2y$10$yEQ5rl0q690ZFNAeW0kjTOzLPfEG1Ni/tBhAo5ZJrdB8lIfL9E6BS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(370, 'JHON JAER', 'LANDAETA INFANTE', 'CC', '1127385909', 'jjlandaeta9@misena.edu.co', '$2y$10$b11uveBDApSUVfcVJQC78eWBQ6IAwx0h2DdhZ6kcKZZgEMBv3jIFe', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(371, 'EDGARDO JOSE', 'MARTINEZ TORRES', 'CC', '1128048286', 'edgjmartinez1@misena.edu.co', '$2y$10$IgAJSfEORG/XbAjTvrfGJeL4..ENqK5mryv0x3rVfLvC.3k7j9ZaK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(372, 'JOHN ALEJANDRO', 'COPETE MARTINEZ', 'CC', '1130617695', 'copetejohn@hotmail.com', '$2y$10$5bfFyX2rFBoxQwdozy0WIO40iJ4cQkXhJPhRwfjL.qEfNr84f77Si', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(373, 'ANTONY JOSE', 'DIAZ HERNANDEZ', 'CC', '1192768377', 'Antonydiazyt@gmail.com', '$2y$10$PtzXSbeQLQSJ.mfLc.f5zuGTgGQvPcIH2dy1oYKKoRWeXe/BqvqjK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(374, 'CARMEN ANDREA', 'MONTAÑO MONTAÑO', 'CC', '1235288432', 'andreamontano0809@gmail.com', '$2y$10$8UuWWiEsigyU9Ji8UdJOAeQNlp.CI098Nf8ZdJOgBGrC1L4rrmoDW', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(375, 'LENIS YADIRA', 'QUITIAN QUIROGA', 'CC', '52851331', 'lenyquitian@misena.edu.co', '$2y$10$Er8vXkTzYj9JC0pR7Pt9nOjRQoDWw5UiwOW9Jb.hJr3aGlNdwL5oW', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(376, 'SANDRA CAROLINA', 'YEPES ACUÑA', 'CC', '52976100', 'sancyepes@misena.edu.co', '$2y$10$00nvGWq8WzI84jirImjx..3mBvD7WDBIAtkGjal3pXc2ZW/hBjbz.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(377, 'WILLIAN SALVADOR', 'MOYA LATORRE', 'CC', '86060897', 'wilsmoya@misena.edu.co', '$2y$10$aTqhBNVct5H6ohxhVHigcukMoTZg0wd8T6IkCsJ3DJUq7YiGsVwbG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(378, 'JOSE EFRAIN', 'MARIN ESPARZA', 'CC', '87063167', 'eesparza36@hotmail.com', '$2y$10$rPJiTFDtOf1KKc2flPOareCuCiln3df4uDUYWBM3UeMTjRHr7u0US', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(379, 'ARMANDO', 'SUAREZ LOPEZ', 'CC', '91487692', 'majosuab@hotmail.com', '$2y$10$yIXibKLCUX57BKCIr5E0YOB6N0CkH4w1cWu.JXXA7eoOHgcH.27qO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(380, 'JULIANA ALEXANDRA', 'SISSA SISA', 'TI', '1002528265', 'julianithasisa13@gmail.com', '$2y$10$yEzvmOFv3cu3MAS8276F9uOjJfysv/xI/tqDNao0.dMtqDBm51rcG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(381, 'DIANA FERNANDA', 'PASTAS RIVAS', 'TI', '1004534343', 'dianafernandarivas15@gmail.com', '$2y$10$02nVaIb.Ktcg.Qw3II4PM.ipBEFk4nyISioKli0/zUMXpYAYrGhEK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(382, 'JOHAN SEBASTIAN', 'FERNANDEZ TORRES', 'TI', '1005296684', 'jsfernandez486@misena.edu.co', '$2y$10$aylInPvrh2TaRpZl5ljzWeupnwTnY4qCfCqhxxcau1/WJzHtRKSxK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(383, 'BRYAN FELIPE', 'FERNANDEZ CUARTAS', 'TI', '1005839263', 'bryffernandez@misena.edu.co', '$2y$10$SyPnJMlUdmMgdj7tF4FqieLP/z11EDZG19/.0o92dFmd7inOFvE8C', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(384, 'BRIAN RODRIGO', 'ACOSTA VARGAS', 'TI', '1006774439', 'brianacosta123.brav@gmail.com', '$2y$10$W6Ip8Btw7CycgCRsZrN5WO53fZr24PJ1cbC0vAa5j201oKgWUtQ0u', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(385, 'JHONATAN DAVID', 'CAICEDO RUANO', 'TI', '1059534220', 'jhodcaicedo111@misena.edu.co', '$2y$10$7PtR70AfhtE.Mr0XaVrAMujTWzUI4sj6El/Fu9DH7C68EC5dZo9B6', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(386, 'MIGUEL ANGEL', 'SALINAS TOVAR', 'TI', '1074958270', 'masalinas072@misena.edu.co', '$2y$10$yC25BzudgGlTZMr7GCEUKegbMSoxZGPKRWxNlSqEvh9d12uThk46q', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(387, 'KATTY MARCELA', 'MARTINEZ TENORIO', 'TI', '1087111548', 'kattytenorio204@gmail.com', '$2y$10$z46qgZ3FLWtAkwGpQXzOmu5bNQlFoAstqTUC5QyfzJkVfRelt2B/a', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(388, 'MELANY DANIELA', 'ARCINIEGAS RICARDO', 'TI', '1106888029', 'melany.arciniegas10@gmail.com', '$2y$10$nQTuhSxx5tCKADisUL.1nuDDxk97Ntk0ISLQLTYmYXHfHP0WDVAce', 'N/A', 'Images/sinFoto.jpg', 2, 1);
INSERT INTO `tbl_persona` (`id_persona`, `per_nombre`, `per_apellidos`, `per_tipo_identificacion`, `per_identificacion`, `per_email`, `per_contrasena`, `per_direccion`, `per_foto`, `per_rol`, `per_estado`) VALUES
(389, 'LUIS ALEJANDRO', 'GUTIERREZ HERNANDEZ', 'TI', '1121824014', 'luis.gutierrez0@misena.edu.co', '$2y$10$.nPNS.OnhvqxyLTMLbWbJ.Ypi42/U0fENUUNVwdekV96XZ8DFU5jy', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(390, 'PAULA ANDREA', 'HURTADO ESPITIA', 'CC', '1000381725', 'hurtadopaulaandrea45@gmail.com', '$2y$10$ISWS4Bu51fatRiMangecouqekojrQYoell5gy9acQlcqwGzqYkmnq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(391, 'SANTIAGO MIGUEL', 'BARON GAMBA', 'CC', '1001345116', 'santiagobgamba275@gmail.com', '$2y$10$uMhJbYPyOr01bW1mRjpa/uf5brk/8w1LTe2DJrxya4IRLbQYBq71y', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(392, 'FARID LEONARDO', 'RIOS FAJARDO', 'CC', '1002582407', 'farid123millos@gmail.com', '$2y$10$gPkpN7orPzJu0npXbJ9hVuqJ/X7HW9z7LcYrMNK2ZbLguU664KaK2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(393, 'BRAYAN', 'MUÑOZ VASQUEZ', 'CC', '1002655859', 'brayanva1014@gmail.com', '$2y$10$54bXLbD7AaF91yzact4zW.6kRJ5WRWKmtEeXC7aTd14GMlu.JzG3q', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(394, 'LUIS CARLOS', 'PEREZ JULIO', 'CC', '1003069285', 'perezjulioluiscarlos35@gmail.com', '$2y$10$78QtKEuHv6QqmtY0PoGXV.DGtHJBvY2nrKGs0yRp9dSRuIUolGgp2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(395, 'WILLIAM ANDRES', 'ROJAS RAMOS', 'CC', '1006016659', 'williamrojas1324@gmail.com', '$2y$10$2k76jEVOG1XGaTs7w30BLe92tWkrxKIzUtEVT0XNx9exhLvvN.j9.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(396, 'LAURA DANIELA', 'ESTEPA CÁRDENAS', 'CC', '1006795335', 'cardenasrosalba12@gmail.com', '$2y$10$cDuj70CM.PFxmy1z4zTD6O7jCQ7K/zqajdBbSYbxRhZuhhEjuQV46', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(397, 'FRANKLIN DAVID', 'LOZANO LEON', 'CC', '1007307517', 'fdlozano7@misena.edu.co', '$2y$10$q3OdeBRnOpSUvaZD2diqL.z0YevpqjFUu/x72E86sGi1aO5kQQf92', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(398, 'ELIANA', 'PERDOMO ORTEGA', 'CC', '1007682011', 'ortegaperdomoe@gmail.com', '$2y$10$G5SYXi/ho0aH3lKDbX1zVOUhbLBGQJxaKXb0jbW32LnST5vo/c9RS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(399, 'JOSELINE ANDREA', 'MUÑOZ AGAMEZ', 'CC', '1007772686', 'josandre1805@gmail.com', '$2y$10$3NPgMzTKidnzxuROGAIcquyD6Rbbm3BHVi0IV2aGIG93QpEyiPooq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(400, 'RONALD NICOLAS', 'ROJAS DAZA', 'CC', '1010064896', 'nicolasrojas-0505@hotmail.com', '$2y$10$3ljwOrLhgQ.n6Elxy5aQ/.79G4tzCrkMiZ/ldcQDu0/5zoHptX7qS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(401, 'LUIS MIGUEL', 'MEDINA UBAQUE', 'CC', '1013623146', 'luismi705@hotmail.com', '$2y$10$dpP7xmxIEZ0yerhxdo2dau3MXUzQA/83fr9DkZ8Mu9BcKyQxHsmH.', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(402, 'MONICA PATRICIA', 'ARCE LEON', 'CC', '1020747389', 'monicaleon8910@hotmail.com', '$2y$10$F712Ox3ys.RoVECjj4GSa.UQ/SCALkVGkO4vxzoFXXGuwmWDhYRNa', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(403, 'YERSON', 'NIÑO GUERRERO', 'CC', '1073170245', 'yersonng0245@gmail.com', '$2y$10$eDNBSemDWiE640VrqsWfYeiMc/8UQItRli2GQ.rKx2JOzQgY6iBfS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(404, 'JEFFERSON', 'DUSSAN CUBI', 'CC', '1075240808', 'jeffersondussancubi@hotmail.com', '$2y$10$WKWnOGDwTgkrRblztzdDpudrz..FJraYImH158iXIY3Ebi1wgwLBO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(405, 'JUAN SEBASTIAN', 'TOVAR GOMEZ', 'CC', '1075278517', 'capaci_tg@hotmail.com', '$2y$10$mDBOF4yWM.wBczAAlkrnvOe94HWfJveED.evM5EUGO4N4HfnV2sdO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(406, 'LINA YULIETH', 'GARCIA SUAREZ', 'CC', '1075283224', 'liyusu13@gmail.com', '$2y$10$qqLMYEqByWkWxMgZmVPE0./RzeLVOyO1a/zIESzS6pzNQJia3EMoC', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(407, 'RONY JAVIER', 'ALVAREZ BOLAÑO', 'CC', '1081829883', 'Ronnyalvarez470@gmail.com', '$2y$10$o4wzsKffKYrGULTHeGn5lehp/NBS3CbxqORXDMhIg9UCf0cAxFJKS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(408, 'ANDREA CATALINA', 'BRITTO MEJIA', 'CC', '1082872502', 'ancabrime@hotmail.com', '$2y$10$LzAJiLsehG1Aa1oMqap8T.FtQjblLcobE0jdgG.5/Sf1VakC195GG', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(409, 'JHONATAN RAFAEL', 'GALVAN LEON', 'CC', '1103103447', 'jhonysalc@hotmail.com', '$2y$10$PrE9GrF76Uw3jdl.7E0RLOe7FprUqRNlJ2ZQVy3DOxjBoGnI71qA2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(410, 'JORGE DAVID', 'GUAVITA CARDONA', 'CC', '1120382403', 'guavitacardonajorgedavid@gmail.com', '$2y$10$owrUrU6U8ftOsHKxx45UFOkMYhwffNR2q3Wdq4MRxE0LHXOl9cvmu', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(411, 'CARLOS ANDRES', 'LEITON DIAZ', 'CC', '1126448193', 'cald880404@gmail.com', '$2y$10$fCIwsm4e0RCt78rM0ttg5.22DP/SOF4gpyHW06ZjQKV5T/yVtB0da', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(412, 'DIANA MARCELA', 'PALOMINO HURTADO', 'CC', '1130950863', 'dianahurtado174@gmail.com', '$2y$10$.ABJPA5/OpfG2TQhjWhWDOY5StTIkc3V9pTmDukyA1YIntQhJrbU2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(413, 'ANDRES JOSE', 'PEDROZA FONTALVO', 'CC', '1140836603', 'ambrox20@gmail.com', '$2y$10$tWFHXL5c1zWnylz6zleBWOuohMolINe2Ya.P.iQbjfJL21XAjL1oe', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(414, 'MARTA ISABEL', 'DOMÍNGUEZ YANCE', 'CC', '1192724609', 'ariadnne1304@gmail.com', '$2y$10$ygkL.9MXPx4urGHu9YmwreVY3GiR6053UKTVpltsNxA/RfQetYEPq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(415, 'HAROLD FERNANDO', 'PERDOMO MUÑOZ', 'CC', '12195348', 'hfperdomo@misena.edu.co', '$2y$10$5hnu2Z76mvvBJb6tgUobKexE4LSazncYyqZQkjKM0iOoRkvZnRG2O', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(416, 'HEIDER MAURICIO', 'BEDOYA GRISALES', 'CC', '16461219', 'hmbedoya9@misena.edu.co', '$2y$10$CAHyLXyYRRwPOYxLcXH7COf.Y730pVtr2wraKyuAhtIryS5h01WBS', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(417, 'RAFAEL EDUARDO', 'PALACIO RUIZ', 'CC', '18778509', 'rafael.palacio@correo.policia.gov.co', '$2y$10$1cLqh38FpcnVopwqf4OuhuoOOmLb1WeyMfsREDrt7ez/Pod6j4KuK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(418, 'ZORAIDA', 'PUERTO VASQUEZ', 'CC', '23857119', 'ZPUERTOV@GMAIL.COM', '$2y$10$sFsMYd0MeuuG4XYBMsf3UevKTbczx0UYAh3QwZwu6jvCHPeSRPj5W', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(419, 'JUAN CARLOS', 'CATAÑO GIRALDO', 'CC', '70327675', 'juanca1729@hotmail.com', '$2y$10$a7uQ11NQGAEQZvYA3atXNeU3GNBvAfDUh75B4B4HlMYki0F0IDKaO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(420, 'ANDRES MAURICIO', 'JIMENEZ PEÑARANDA', 'CC', '7187301', 'andresmauricio@protonmail.com', '$2y$10$RCnWzneYuJ3HOmxzLBAK9OS32FjXmm0W2l9fu.UasEA5dwvI0wHVC', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(421, 'DAVID JESUS', 'BARROS CHAPARRO', 'CC', '72343403', 'djbarros3@misena.edu.co', '$2y$10$apFcd4pKoE4rUCNBjlio3eg6n43LhQqxq9Ti29zLVOmFL9lK6FbVO', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(422, 'JOHN JAIRO', 'RAMIREZ LEAL', 'CC', '79974371', 'jjram04@hotmail.com', '$2y$10$hgyur/8zhBm83j6bmli2puVVwobKZkOwZpx0dCPx./MNVmoHIwsgC', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(423, 'DANIEL ARGEMIRO', 'MELGAREJO CARDENAS', 'CC', '80819187', 'danielcardenas368@gmail.com', '$2y$10$G0Sw71r/HJn8.lqGTr58L.uvQpM7iyRUk0sVjnn3x9kbz.wkQCHKy', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(424, 'CAMILO ANDRES', 'SERRANO LUNA', 'CC', '91183442', 'camiserlu@hotmail.com', '$2y$10$jI5e6sHJ/NJRyudSet1N.ucNeABfLDlwixeHo8BLg1Q9aLbrXJai6', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(425, 'YENER ANTONIO', 'GARNICA BUITRAGO', 'CC', '91282521', 'yener.garnica521@casur.gov.co', '$2y$10$vcHN4k2AtXN1x7ULVX4ISu25I28R46.Tf7A4Xo63avbrOTkQ8ZcpK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(426, 'ROBINSON ALONSO', 'RESTREPO CARDONA', 'CC', '98604118', 'robinson.restrepo2907@gmail.com', '$2y$10$mtY5NP5qMtD5zy3qEp3XNO5EJj/uPalBaJjj4deyJJjBxcOw1.KXi', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(427, 'EDWIN DANIEL', 'ANGARITA ACOSTA', 'TI', '1000007569', 'edwinangarita03@gmail.com', '$2y$10$YSH.7776VdGWQuFvBaqqzenlHg0vMsaTQb1SUTJhpUEqdr7v.uzXa', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(428, 'SEBASTIAN', 'CIFUENTES PEREZ', 'TI', '1000219869', 'sebastianperez1622@gmail.com', '$2y$10$P6AweKPuHwfdMeFS4NmpEe4iDngzw6Xwd0VEpgjBInIe2Y.a7g7qK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(429, 'JULIETH ANGELICA', 'CARDENAS GOMEZ', 'TI', '1000727072', 'juliethcardenas-14@hotmail.com', '$2y$10$ntCuoChcnpWVn8Px7wvveOlfFomfaoopkXjqpnWhx4MnFy7c3G0ae', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(430, 'JOAN SEBASTIAN', 'SIMBAQUEBA BOJACA', 'TI', '1000860638', 'tastas589@gmail.com', '$2y$10$H9LHAvLurtXZsB1AOtrFaOnNrXFkZCdiiUAtHZosvlY4Q.0QnYuSi', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(431, 'JUAN DIEGO', 'DIAZ ROMERO', 'TI', '1001173526', 'diazromerojuandiego57@gmail.com', '$2y$10$tls73HwfwXc1lU8XB0JH5.dxLpr.6biQu6nD2IFkZQHhPPBRKIDIK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(432, 'JUAN PABLO', 'CELIS GIRALDO', 'TI', '1001328372', 'juanpa061603@gmail.com', '$2y$10$XtGy2N5Nk3MYPpcfl0Lcd.2r/Rr1UlBrk/UNqCFGVuRb6Qep0Lh6K', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(433, 'MOISES', 'AVILA PARRA', 'TI', '1006464812', 'moiplay300@gmail.com', '$2y$10$Y7OSWQ2IF8NoUKZ5uacJTe6aIO9RLqoXIccUuggkWOkJr0jEUz7i2', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(434, 'JULIAN ANDRES', 'CEDEÑO HOLGUIN', 'TI', '1006593110', 'julian10xl70@gmail.com', '$2y$10$NpcmWDTSPBdwyxsL.bUum.2TqBC3JZzRd3IbWcS.OaI2LumsLwDfq', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(435, 'ANA MARIA', 'OCHOA GARCIA', 'TI', '1007460889', 'anamochoag192003@gmail.com', '$2y$10$UIg93pvzF0N5TIdZJIxqi.KfiL/2caSJc8WIh6PNr5FoYIQ5deoRu', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(436, 'SAMUEL ESTEBAN', 'AVILA CASAS', 'TI', '1016592491', 'samuelestevan2402@gmail.com', '$2y$10$ocLkbjxJvwSl9ZjYVRnS9eIIC.yZrBstOcKTja9gsUx5jedfQBs.u', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(437, 'BANESSA ALEXANDRA', 'GONZALEZ LIZARAZO', 'TI', '1019002304', 'vg4488170@gmail.com', '$2y$10$IEvkg7iveQzJ0TbQ14ptEeVDVydu8EfQoqKTHDoLTTBKF9sMW5UbK', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(438, 'ILIAN ALEJANDRA', 'MELO CARDOZO', 'TI', '1025460223', 'aleilianmelo09@gmail.com', '$2y$10$73eaj3fRs56hCEU2TKgHDOHumw1/B7RO2Eb/7k9eAOtZ/dFqtMKce', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(439, 'LUIS GUILLERMO', 'OROZCO ORTEGA', 'TI', '1079911740', 'saraorteoro2016@gmail.com', '$2y$10$xXGrFDvTWQ/mXhSY7ZJnReJregEX9zvg3MRDm3pblWAAfjT/vsNri', 'N/A', 'Images/sinFoto.jpg', 2, 1),
(440, 'Carlos Fabian', 'Martinez Mora', 'CC', '79796778', 'cfmartinez@sena.edu.co', '$2y$10$JFEutwcH81GxLgxGrhiWDugbwTvMuMk.u417TvHb0GgBybe04yFqW', 'N/A', 'Images/sinFoto.jpg', 3, 1),
(441, 'Carlos Fabian', 'Martinez Mora', 'CC', '79796778', 'cfmartinez@sena.edu.co', '$2y$10$BIEnjw7EhliRnbny9Ww9we.TCTdmeEk8sO5H9UUZtwLRR4j5qjXg.', 'N/A', 'Images/sinFoto.jpg', 3, 1),
(442, 'Carlos Fabian', 'Martinez Mora', 'CC', '79796778', 'cfmartinez@sena.edu.co', '$2y$10$7B6HjCdVgiuiRgcES0oFr.zdvmAEM2K.iPzqLd5ovCiUHnYssLzQW', 'N/A', 'Images/sinFoto.jpg', 3, 1),
(443, 'Carlos Fabian', 'Martinez Mora', 'CC', '79796778', 'cfmartinez@sena.edu.co', '$2y$10$XvaRkv/9o5hVUBJBfUWz1u7AiJv9NEjoWtd1RH5A1NEmrvv/YxXhO', 'N/A', 'Images/sinFoto.jpg', 3, 1),
(444, 'Carlos Fabian', 'Martinez Mora', 'CC', '79796778', 'cfmartinez@sena.edu.co', '$2y$10$Bdur2nzVeRbbxkgeCxeYMe32wAa1h3cW7R.6CK0TLIdD0PK1LSj4S', 'N/A', 'Images/sinFoto.jpg', 3, 1),
(445, 'Cesar Marino', 'Cuellar Chacon', 'CC', '7684351', 'ccuellar@sena.edu.co', '$2y$10$pjaetbxioIzSd1xaFnN6hezvnkLQ6f96CeGnoZm7//IuuKEKlH7ae', 'N/A', 'Images/sinFoto.jpg', 3, 1),
(446, 'Herley Antonio', 'Puentes Penaloza', 'CC', '1032378054', 'hpuentes@sena.edu.co', '$2y$10$dIYYW1S0yoiM9.6Fv2x5seARmTqWTZ0cPqK/Qjd.yBZG0McoieKiW', 'N/A', 'Images/sinFoto.jpg', 3, 1),
(447, 'Javier Humberto', 'Pinto Diaz', 'CC', '13511188', 'jhpinto@sena.edu.co', '$2y$10$.yHGJHkBiO0NSqcJl24YKeh4OJR8uDH0syLseMQSLgovKNs1Yjq2S', 'N/A', 'Images/sinFoto.jpg', 3, 1),
(448, 'Jesus Ariel', 'Gonzalez Bonilla', 'CC', '1079606375', 'jagonzalezb@sena.edu.co', '$2y$10$IRpaVMV55B0VaOKPkt/xguh8eyMhuJlHJmCo.hysYPFC0X2BwWOf6', 'N/A', 'Images/sinFoto.jpg', 3, 1);

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

INSERT INTO `tbl_programa` (`id_programa`, `pro_nombre`, `pro_tipo`, `pro_estado`, `created_at`, `updated_at`) VALUES
(16, 'Análisis y Desarrollo de Sistemas de Información', 'Tecnologo', 1, '2021-05-20 09:58:28', '2021-05-20 09:58:28');

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
  ADD KEY `fk_id_programa` (`fk_id_programa`);

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
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
  ADD CONSTRAINT `FK_tbl_ficha_tbl_programa` FOREIGN KEY (`fk_id_programa`) REFERENCES `tbl_programa` (`id_programa`);

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
