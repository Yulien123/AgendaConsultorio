-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2024 a las 19:38:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agenda_consultorio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendas`
--

CREATE TABLE `agendas` (
  `id` int(11) NOT NULL,
  `limite_sobreturnos` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `duracion_turnos` time NOT NULL,
  `matricula` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_clasificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agendas`
--

INSERT INTO `agendas` (`id`, `limite_sobreturnos`, `fecha_creacion`, `fecha_fin`, `hora_inicio`, `hora_fin`, `duracion_turnos`, `matricula`, `id_sucursal`, `id_clasificacion`) VALUES
(1, 2, '2025-01-01', '2025-02-20', '08:00:00', '12:00:00', '00:20:00', 8100, 1, 1),
(2, 1, '2024-10-30', '2025-01-10', '16:00:00', '21:00:00', '00:30:00', 8100, 1, 1),
(3, 2, '2024-10-30', '2025-02-10', '08:00:00', '14:00:00', '00:15:00', 8100, 2, 1),
(4, 1, '2024-10-30', '2025-02-10', '06:00:00', '10:00:00', '00:20:00', 8106, 1, 1),
(5, 1, '2024-10-30', '2025-02-10', '16:00:00', '21:00:00', '00:20:00', 8106, 2, 1),
(6, 2, '2024-10-30', '2025-02-10', '08:00:00', '12:00:00', '00:20:00', 8103, 1, 2),
(7, 2, '2024-10-30', '2025-02-10', '08:00:00', '12:00:00', '00:20:00', 8110, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificaciones`
--

CREATE TABLE `clasificaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clasificaciones`
--

INSERT INTO `clasificaciones` (`id`, `nombre`) VALUES
(2, 'Especial'),
(1, 'Normal'),
(3, 'Vip');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias_disponibles`
--

CREATE TABLE `dias_disponibles` (
  `id_agenda` int(11) NOT NULL,
  `dia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias_no_laborables`
--

CREATE TABLE `dias_no_laborables` (
  `id` int(11) NOT NULL,
  `dia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dias_no_laborables`
--

INSERT INTO `dias_no_laborables` (`id`, `dia`) VALUES
(1, '2024-01-01'),
(2, '2024-02-12'),
(3, '2024-02-13'),
(4, '2024-03-24'),
(5, '2024-03-29'),
(6, '2024-04-02'),
(7, '2024-05-01'),
(8, '2024-05-25'),
(9, '2024-06-17'),
(10, '2024-06-20'),
(11, '2024-07-09'),
(12, '2024-08-17'),
(13, '2024-10-12'),
(14, '2024-11-20'),
(15, '2024-12-08'),
(16, '2024-12-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id`, `nombre`, `estado`) VALUES
(1, 'Cardiología', 1),
(2, 'Dermatología', 1),
(3, 'Endocrinología', 1),
(4, 'Gastroenterología', 1),
(5, 'Geriatría', 1),
(6, 'Hematología', 1),
(7, 'Infectología', 1),
(8, 'Nefrología', 1),
(9, 'Neurología', 1),
(10, 'Oncología', 1),
(11, 'Pediatría', 1),
(12, 'Psiquiatría', 1),
(13, 'Reumatología', 1),
(14, 'Urología', 1),
(15, 'Oftalmología', 1),
(16, 'General', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id_usuario` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id_usuario`, `estado`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(48, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico_especialidad`
--

CREATE TABLE `medico_especialidad` (
  `id_medico` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medico_especialidad`
--

INSERT INTO `medico_especialidad` (`id_medico`, `id_especialidad`, `matricula`, `estado`) VALUES
(1, 16, 8100, 1),
(2, 16, 8101, 1),
(3, 13, 8102, 1),
(4, 14, 8103, 1),
(5, 16, 8104, 1),
(6, 16, 8105, 1),
(33, 1, 8106, 1),
(34, 2, 8107, 1),
(35, 3, 8108, 1),
(36, 4, 8109, 1),
(7, 11, 8110, 1),
(8, 12, 8111, 1),
(9, 15, 8112, 1),
(10, 11, 8113, 1),
(37, 5, 8114, 1),
(38, 6, 8115, 1),
(39, 7, 8116, 1),
(40, 8, 8117, 1),
(41, 9, 8118, 1),
(42, 10, 8119, 1),
(33, 16, 8401, 1),
(34, 16, 8402, 1),
(35, 16, 8403, 0),
(36, 16, 8404, 1),
(37, 16, 8405, 0),
(33, 4, 8777, 1),
(48, 16, 8910, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico_obra_social`
--

CREATE TABLE `medico_obra_social` (
  `id` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_obra_social` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medico_obra_social`
--

INSERT INTO `medico_obra_social` (`id`, `id_medico`, `id_obra_social`, `estado`) VALUES
(1, 1, 2, 1),
(2, 2, 3, 1),
(3, 3, 4, 1),
(4, 4, 2, 1),
(5, 5, 3, 1),
(6, 6, 4, 1),
(7, 7, 2, 1),
(8, 8, 3, 1),
(9, 9, 4, 1),
(10, 10, 2, 1),
(11, 33, 3, 1),
(12, 34, 4, 1),
(13, 35, 2, 1),
(14, 36, 3, 1),
(15, 37, 1, 1),
(16, 38, 1, 1),
(17, 39, 1, 1),
(18, 40, 1, 1),
(19, 41, 1, 1),
(20, 42, 1, 1),
(21, 1, 1, 1),
(22, 2, 1, 1),
(23, 3, 1, 1),
(24, 4, 1, 1),
(25, 34, 1, 1),
(26, 35, 1, 1),
(27, 36, 1, 0),
(28, 37, 1, 0),
(29, 38, 1, 0),
(30, 33, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obras_sociales`
--

CREATE TABLE `obras_sociales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `obras_sociales`
--

INSERT INTO `obras_sociales` (`id`, `nombre`, `descripcion`, `direccion`) VALUES
(1, 'Sin Obra Social', NULL, NULL),
(2, 'Dosep', 'Cobertura Media', 'Calle Callejera 221'),
(3, 'Pami', 'Cobertura Básica', 'Av. Avenidera 331'),
(4, 'Sancor', 'Cobertura Básica', 'Av. Laboratorio 112');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `dni` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_obra_social` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`dni`, `id_usuario`, `id_obra_social`) VALUES
(1345678, 20, 3),
(1456789, 30, 2),
(11234567, 11, 1),
(11345678, 21, 4),
(11456789, 31, 2),
(21234567, 12, 1),
(21345678, 22, 4),
(21456789, 32, 3),
(31234567, 13, 1),
(31345678, 23, 4),
(41234567, 14, 1),
(41345678, 24, 4),
(51234567, 15, 2),
(51345678, 25, 4),
(61234567, 16, 2),
(61345678, 26, 1),
(71234567, 17, 2),
(71345678, 27, 1),
(81234567, 18, 2),
(81345678, 28, 1),
(91234567, 19, 3),
(91345678, 29, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`dni`, `nombre`, `apellido`, `nacimiento`) VALUES
(1234567, 'Sofía', 'Escobar', '1999-10-12'),
(1236660, 'Prueba', 'Prueba', '2002-02-02'),
(1345678, 'Patricia', 'Cruz', '2009-08-20'),
(1456789, 'Carmen', 'Peña', '2019-06-30'),
(3216660, 'colega', 'colega', '1999-02-02'),
(3426660, 'drCongo', 'Flores', '2002-02-02'),
(3436660, 'drCongo', 'Flores', '2002-02-02'),
(3456660, 'drCongo', 'Flores', '2002-02-02'),
(7776660, 'drCongoBongo', 'Flores', '1990-01-01'),
(11234567, 'Pedro', 'Flores', '2000-11-11'),
(11345678, 'Ricardo', 'Jiménez', '2010-09-21'),
(11456789, 'Hugo', 'Suárez', '2020-07-31'),
(12121234, 'DrPrueba', 'pruebin', '2002-02-02'),
(12345678, 'Juan', 'Pérez', '1990-01-01'),
(12641257, 'Jose', 'Basco', '1970-10-12'),
(13352175, 'Paola', 'Fernandez', '1981-03-12'),
(14343464, 'Miguel', 'Martines', '1975-02-12'),
(15334346, 'Carlos', 'Montero', '1988-05-12'),
(16325635, 'Manuel', 'Montiel', '1997-06-12'),
(17316553, 'Jessica', 'Maldonado', '1969-07-12'),
(18307842, 'Jazmín', 'Gutierres', '1983-11-12'),
(19398724, 'Sandra', 'Dorado', '1976-12-12'),
(20389031, 'Julian', 'Bazan', '1985-09-12'),
(21234567, 'Lucía', 'Ramos', '2001-12-12'),
(21345678, 'Isabel', 'Ruiz', '2011-10-22'),
(21370913, 'Maria', 'Salomon', '1984-10-12'),
(21456789, 'Alicia', 'Romero', '2021-08-01'),
(22222222, 'Morito', 'Lucero', '2002-02-22'),
(23456789, 'María', 'García', '1991-02-02'),
(31234567, 'Diego', 'Díaz', '2002-01-13'),
(31345678, 'Roberto', 'Navarro', '2012-11-23'),
(34567890, 'Carlos', 'Rodríguez', '1992-03-03'),
(41234567, 'Marta', 'Morales', '2003-02-14'),
(41345678, 'Gabriela', 'Rojas', '2013-12-24'),
(45678901, 'Ana', 'Martínez', '1993-04-04'),
(51234567, 'Raúl', 'Ortega', '2004-03-15'),
(51345678, 'Francisco', 'Molina', '2014-01-25'),
(56789012, 'Luis', 'López', '1994-05-05'),
(61234567, 'Valeria', 'Castro', '2005-04-16'),
(61345678, 'Claudia', 'Silva', '2015-02-26'),
(66666660, 'congobongogo', 'flores', '1992-02-02'),
(67890123, 'Elena', 'González', '1995-06-06'),
(71234567, 'Andrés', 'Vega', '2006-05-17'),
(71345678, 'Albert', 'Ortiza', '2016-03-27'),
(78901234, 'Miguel', 'Sánchez', '1996-07-07'),
(81234567, 'Natalia', 'Mendoza', '2007-06-18'),
(81345678, 'Verónica', 'Iglesias', '2017-04-28'),
(89012345, 'Laura', 'Fernández', '1997-08-08'),
(90123456, 'Jorge', 'Ramírez', '1998-09-09'),
(91234567, 'Fernando', 'Herrera', '2008-07-19'),
(91345678, 'Daniel', 'Soto', '2018-05-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'Admin'),
(3, 'Admisión '),
(2, 'Profesional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id`, `nombre`, `direccion`, `ciudad`) VALUES
(1, 'Clinica Argentina', 'Av. Argentina y Calle Lionel Messi', 'San Luis'),
(2, 'Clinica España', 'Av. España 123', 'Juana Koslay');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `id_usuario` int(11) NOT NULL,
  `numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`id_usuario`, `numero`) VALUES
(1, 24345678),
(1, 1543450033),
(2, 24544332),
(2, 154547773),
(3, 64102938),
(3, 154106662),
(4, 64304958),
(5, 64101918),
(6, 154564738),
(7, 154381065),
(8, 154119988),
(9, 154110066),
(10, 66123456),
(10, 154124433),
(11, 66234567),
(11, 154231133),
(12, 154762727),
(12, 2147483647),
(13, 64433221),
(13, 154430010),
(14, 64293847),
(15, 64405968),
(16, 64291038),
(33, 66456789),
(33, 154452232),
(34, 66567890),
(34, 1544567777),
(35, 24677889),
(35, 154679900),
(36, 64789012),
(36, 154789292),
(37, 64899012),
(37, 154898873),
(38, 64900112),
(38, 154902211),
(39, 24099887),
(39, 154408844),
(40, 64988776),
(40, 154983342),
(41, 24877665),
(41, 154873232),
(42, 24655443),
(42, 154658383),
(48, 2314412);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `motivo` varchar(250) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `orden` int(11) DEFAULT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_agenda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `dni`, `email`, `password`, `id_rol`) VALUES
(1, 71345678, 'albert.ortiza', '12341234321', 2),
(2, 21456789, 'alicia.romero', NULL, NULL),
(3, 45678901, 'ana.martinez', NULL, NULL),
(4, 71234567, 'andres.vega', NULL, NULL),
(5, 34567890, 'carlos.rodriguez', NULL, NULL),
(6, 1456789, 'carmen.pena', NULL, NULL),
(7, 61345678, 'claudia.silva', NULL, NULL),
(8, 15334346, 'cMontero', NULL, NULL),
(9, 91345678, 'daniel.soto', NULL, NULL),
(10, 31234567, 'diego.diaz', NULL, NULL),
(11, 67890123, 'elena.gonzalez', NULL, NULL),
(12, 91234567, 'fernando.herrera', NULL, NULL),
(13, 51345678, 'francisco.molina', NULL, NULL),
(14, 41345678, 'gabriela.rojas', NULL, NULL),
(15, 11456789, 'hugo.suarez', NULL, NULL),
(16, 21345678, 'isabel.ruiz', NULL, NULL),
(17, 12641257, 'jBasco', NULL, NULL),
(18, 20389031, 'jBazan', NULL, NULL),
(19, 18307842, 'JGutierres', NULL, NULL),
(20, 17316553, 'JMaldonado', NULL, NULL),
(21, 90123456, 'jorge.ramirez', NULL, NULL),
(22, 12345678, 'juan.perez', NULL, NULL),
(23, 12121234, 'juliofloresth', '12341234', 2),
(24, 89012345, 'laura.fernandez', NULL, NULL),
(25, 21234567, 'lucia.ramos', NULL, NULL),
(26, 56789012, 'luis.lopez', NULL, NULL),
(27, 23456789, 'maria.garcia', NULL, NULL),
(28, 41234567, 'marta.morales', NULL, NULL),
(29, 78901234, 'miguel.sanchez', NULL, NULL),
(30, 14343464, 'mMartines', NULL, NULL),
(31, 16325635, 'mMontiel', NULL, NULL),
(32, 21370913, 'MSalomon', NULL, NULL),
(33, 81234567, 'natalia.mendoza', NULL, NULL),
(34, 1345678, 'patricia.cruz', NULL, NULL),
(35, 11234567, 'pedro.flores', NULL, NULL),
(36, 13352175, 'pFernandez', NULL, NULL),
(37, 51234567, 'raul.ortega', NULL, NULL),
(38, 11345678, 'ricardo.jimenez', NULL, NULL),
(39, 31345678, 'roberto.navarro', NULL, NULL),
(40, 19398724, 'SDorado', NULL, NULL),
(41, 1234567, 'sofia.torres', NULL, NULL),
(42, 61234567, 'valeria.castro', NULL, NULL),
(43, 81345678, 'veronica.iglesias', NULL, NULL),
(44, 1236660, 'Prueba', 'Prueba', 2),
(45, 3216660, 'prueba2', '1234321', 2),
(46, 3426660, 'drBongoCongo', '12341234', 2),
(47, 7776660, 'drBongogo', '12341234', 2),
(48, 66666660, 'gogobongo', '12341234', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matricula` (`matricula`),
  ADD KEY `id_sucursal` (`id_sucursal`),
  ADD KEY `id_clasificacion` (`id_clasificacion`);

--
-- Indices de la tabla `clasificaciones`
--
ALTER TABLE `clasificaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `dias_disponibles`
--
ALTER TABLE `dias_disponibles`
  ADD KEY `id_agenda` (`id_agenda`);

--
-- Indices de la tabla `dias_no_laborables`
--
ALTER TABLE `dias_no_laborables`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unico` (`nombre`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `medico_especialidad`
--
ALTER TABLE `medico_especialidad`
  ADD UNIQUE KEY `unico` (`matricula`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_especialidad` (`id_especialidad`);

--
-- Indices de la tabla `medico_obra_social`
--
ALTER TABLE `medico_obra_social`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_obra_social` (`id_obra_social`);

--
-- Indices de la tabla `obras_sociales`
--
ALTER TABLE `obras_sociales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unico` (`nombre`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `id_obra_social` (`id_obra_social`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD UNIQUE KEY `unico` (`numero`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_agenda` (`id_agenda`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unico` (`email`),
  ADD KEY `dni` (`dni`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agendas`
--
ALTER TABLE `agendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `clasificaciones`
--
ALTER TABLE `clasificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `dias_no_laborables`
--
ALTER TABLE `dias_no_laborables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `medico_obra_social`
--
ALTER TABLE `medico_obra_social`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agendas`
--
ALTER TABLE `agendas`
  ADD CONSTRAINT `agendas_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `medico_especialidad` (`matricula`),
  ADD CONSTRAINT `agendas_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id`),
  ADD CONSTRAINT `agendas_ibfk_3` FOREIGN KEY (`id_clasificacion`) REFERENCES `clasificaciones` (`id`);

--
-- Filtros para la tabla `dias_disponibles`
--
ALTER TABLE `dias_disponibles`
  ADD CONSTRAINT `dias_disponibles_ibfk_1` FOREIGN KEY (`id_agenda`) REFERENCES `agendas` (`id`);

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `medico_especialidad`
--
ALTER TABLE `medico_especialidad`
  ADD CONSTRAINT `medico_especialidad_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_usuario`),
  ADD CONSTRAINT `medico_especialidad_ibfk_2` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id`);

--
-- Filtros para la tabla `medico_obra_social`
--
ALTER TABLE `medico_obra_social`
  ADD CONSTRAINT `medico_obra_social_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_usuario`),
  ADD CONSTRAINT `medico_obra_social_ibfk_2` FOREIGN KEY (`id_obra_social`) REFERENCES `obras_sociales` (`id`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_2` FOREIGN KEY (`id_obra_social`) REFERENCES `obras_sociales` (`id`),
  ADD CONSTRAINT `pacientes_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `telefonos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`id_agenda`) REFERENCES `agendas` (`id`),
  ADD CONSTRAINT `turnos_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`dni`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `personas` (`dni`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
