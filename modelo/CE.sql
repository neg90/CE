-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 06-07-2015 a las 16:18:05
-- Versión del servidor: 5.5.43-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `CE`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonado`
--

CREATE TABLE IF NOT EXISTS `abonado` (
  `importe` double NOT NULL,
  `fechadeultimopago` date NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `numabonado` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`numabonado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Volcado de datos para la tabla `abonado`
--

INSERT INTO `abonado` (`importe`, `fechadeultimopago`, `activo`, `numabonado`) VALUES
(2, '2015-07-08', 1, 1),
(5, '2015-07-07', 1, 2),
(44, '2015-07-01', 1, 3),
(5, '2015-07-07', 1, 4),
(44, '2015-07-01', 1, 5),
(5, '2015-07-07', 1, 6),
(44, '2015-07-01', 1, 7),
(5, '2015-07-07', 1, 8),
(44, '2015-07-01', 1, 9),
(5, '2015-07-07', 1, 10),
(44, '2015-07-01', 1, 11),
(5, '2015-07-07', 1, 12),
(44, '2015-07-01', 1, 13),
(5, '2015-07-07', 1, 14),
(44, '2015-07-01', 1, 15),
(5, '2015-07-07', 1, 16),
(44, '2015-07-01', 1, 17),
(5, '2015-07-07', 1, 18),
(44, '2015-07-01', 1, 19),
(5, '2015-07-07', 1, 20),
(44, '2015-07-01', 1, 21),
(5, '2015-07-07', 1, 22),
(44, '2015-07-01', 1, 23),
(5, '2015-07-07', 1, 24),
(44, '2015-07-01', 1, 25),
(5, '2015-07-07', 1, 26),
(44, '2015-07-01', 1, 27),
(5, '2015-07-07', 1, 28),
(44, '2015-07-01', 1, 29),
(35.2, '2015-07-23', 1, 30),
(35.22, '2015-07-02', 1, 31),
(35.22, '2015-07-02', 1, 32),
(35.2, '2015-07-22', 1, 33),
(2, '2015-07-16', 1, 34),
(35.2, '2015-07-27', 1, 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonadoempresa`
--

CREATE TABLE IF NOT EXISTS `abonadoempresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idempresa` int(11) NOT NULL,
  `numabonado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `numabonado` (`numabonado`),
  KEY `idempresa` (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `descripcion`) VALUES
(15, 'N/A'),
(16, 'Economia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE IF NOT EXISTS `contacto` (
  `idcontacto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `asociadosm` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `tipodocumento` varchar(4) NOT NULL,
  `documento` varchar(100) NOT NULL,
  PRIMARY KEY (`idcontacto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=218 ;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`idcontacto`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo`, `asociadosm`, `activo`, `tipodocumento`, `documento`) VALUES
(162, 'Fer', 'Nisman', '(011) 15-3858-7990', 'Moreno 8567', 'financiera.naveyra@gmail.com', 0, 1, 'DU', '35414241'),
(163, 'Nelson', 'Nisman', '(011) 15-3858-7990', 'Moreno 856', 'neg90@hotmail.com', 0, 1, 'DU', '123213132123'),
(164, 'Fer', 'Garrido', '123123', 'Moreno 856', 'nismanSomosTodos@gmail.com', 0, 1, 'DU', '123'),
(165, 'asd', 'asd', '', '', '', 0, 0, '', ''),
(166, '', '', '', '', '', 0, 0, '', ''),
(167, 'asd', 'asd', '', '', '', 0, 0, '', ''),
(168, '', '', '', '', '', 0, 0, '', ''),
(169, 'asdasd', 'qweqwewqe', '', '', '', 0, 0, '', ''),
(170, 'asd', 'asd', '', '', '', 0, 0, '', ''),
(171, 'asdasd', 'qweqwewqe', '', '', '', 0, 0, '', ''),
(172, 'asd', 'asd', '', '', '', 0, 0, '', ''),
(173, 'asdasd', 'qweqwewqe', '', '', '', 0, 0, '', ''),
(174, 'asd', 'asd', '', '', '', 0, 0, '', ''),
(175, 'asdasd', 'qweqwewqe', '', '', '', 0, 0, '', ''),
(176, 'asd', 'asd', '', '', '', 0, 0, '', ''),
(177, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(178, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(179, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(180, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(181, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(182, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(183, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(184, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(185, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(186, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(187, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(188, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(189, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(190, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(191, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(192, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(193, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(194, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(195, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(196, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(197, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(198, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(199, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(200, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(201, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(202, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(203, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(204, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(205, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(206, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(207, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(208, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(209, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(210, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(211, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(212, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(213, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(214, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(215, 'asdasdqweqwe', 'adssadasd', '', '', '', 0, 0, '', ''),
(216, 'asd', 'asdads', '', '', '', 0, 0, '', ''),
(217, 'Nelson', 'Garrido', '112312', 'asd', 'financiera.naveyra@gmail.com', 0, 1, 'DU', '3541424');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactoempresa`
--

CREATE TABLE IF NOT EXISTS `contactoempresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcontacto` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `relacion` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idcontacto` (`idcontacto`),
  KEY `idempresa` (`idempresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Volcado de datos para la tabla `contactoempresa`
--

INSERT INTO `contactoempresa` (`id`, `idcontacto`, `idempresa`, `relacion`) VALUES
(64, 162, 8652, ''),
(65, 163, 8652, ''),
(66, 165, 8652, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correoempresa`
--

CREATE TABLE IF NOT EXISTS `correoempresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idempresa` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `correoempresa`
--

INSERT INTO `correoempresa` (`id`, `idempresa`, `correo`, `descripcion`) VALUES
(3, 8652, 'neg90.ng@gmail.com', ''),
(4, 8652, 'neg90@hotmail.com', ''),
(5, 8653, 'neg90.ng@gmail.com', ''),
(6, 8653, 'neg90@hotmail.com', ''),
(7, 8653, 'sistemas@cresta.edu.ar', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilioempresa`
--

CREATE TABLE IF NOT EXISTS `domicilioempresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idempresa` int(11) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `domicilioempresa`
--

INSERT INTO `domicilioempresa` (`id`, `idempresa`, `domicilio`, `descripcion`) VALUES
(2, 8652, 'Moreno 400', ''),
(3, 8653, 'Moreno 400', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `idempresa` int(11) NOT NULL AUTO_INCREMENT,
  `denominacion` varchar(30) NOT NULL,
  `idrubro` int(11) NOT NULL,
  `detactividad` varchar(500) NOT NULL,
  `cantempleados` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `fechainicioce` date NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `importemensual` double NOT NULL,
  `fechafundacion` date NOT NULL,
  `cuit` varchar(100) NOT NULL,
  `web` varchar(100) NOT NULL,
  `numusuario` int(11) NOT NULL,
  PRIMARY KEY (`idempresa`),
  KEY `idrubro` (`idrubro`),
  KEY `idcategoria` (`idcategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8654 ;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idempresa`, `denominacion`, `idrubro`, `detactividad`, `cantempleados`, `idcategoria`, `fechainicioce`, `activo`, `importemensual`, `fechafundacion`, `cuit`, `web`, `numusuario`) VALUES
(8652, 'Mercantil ', 12, '', 1, 16, '2015-07-22', 1, 65, '2015-07-03', '20354140447', 'www.merecantil.com.ar', 0),
(8653, 'Suchar', 12, '', 3, 16, '2015-07-17', 1, 50, '0000-00-00', '124', 'www.merecantil.com', 484901);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infcorreo`
--

CREATE TABLE IF NOT EXISTS `infcorreo` (
  `id` int(11) NOT NULL,
  `cantempresas` int(11) NOT NULL,
  `cantcontactos` int(11) NOT NULL,
  `arrayempresas` longtext NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infmedidorexcel`
--

CREATE TABLE IF NOT EXISTS `infmedidorexcel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actualizados` longtext NOT NULL,
  `totalregistros` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `fallados` longtext NOT NULL,
  `medidorInsertado` int(11) NOT NULL,
  `registroNoInsertado` int(11) NOT NULL,
  `medidorActualizado` int(11) NOT NULL,
  `empresaActualizada` int(11) NOT NULL,
  `relacionInsertada` int(11) NOT NULL,
  `medidorSinEmpresaInsertado` int(11) NOT NULL,
  `medidorSinEmpresaActualizado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `infmedidorexcel`
--

INSERT INTO `infmedidorexcel` (`id`, `actualizados`, `totalregistros`, `fecha`, `fallados`, `medidorInsertado`, `registroNoInsertado`, `medidorActualizado`, `empresaActualizada`, `relacionInsertada`, `medidorSinEmpresaInsertado`, `medidorSinEmpresaActualizado`) VALUES
(15, '""', 465, '2015-07-03 03:07:43', '""', 465, 0, 0, 0, 0, 465, 0);
INSERT INTO `infmedidorexcel` (`id`, `actualizados`, `totalregistros`, `fecha`, `fallados`, `medidorInsertado`, `registroNoInsertado`, `medidorActualizado`, `empresaActualizada`, `relacionInsertada`, `medidorSinEmpresaInsertado`, `medidorSinEmpresaActualizado`) VALUES
(16, '{"1":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ABELLEIRA FABIAN-LEN","cuit":"0","titular":"ABELLEIRA FABIAN-LEN"},"2":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ACA SALUD","cuit":"0","titular":"ACA SALUD COOPERATIV"},"3":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ACMC SRL","cuit":"0","titular":"ACMC S.R.L."},"4":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGF ALLIANZ ARG.CIA ","cuit":"0","titular":"AGF ALLIANZ ARG.CIA "},"5":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AGRO EL CARRETERO S.","cuit":"0","titular":"AGRO EL CARRETERO S."},"6":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGRO INDUSTRIA TRES ","cuit":"0","titular":"AGRO INDUSTRIA TRES "},"7":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AGRO-GILARDONI S.R.L","cuit":"0","titular":"AGRO-GILARDONI S.R.L"},"8":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGROPAL S.A.","cuit":"0","titular":"AGROPAL S.A."},"9":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGROPRIMUS S.A","cuit":"0","titular":"AGROPRIMUS S.A"},"10":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AGUADAS GOMEZ HNOS S","cuit":"0","titular":"AGUADAS GOMEZ HNOS S"},"11":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"AIELLO JOSE E HIJOS ","cuit":"0","titular":"AIELLO JOSE E HIJOS "},"12":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AIELLO NATALIO","cuit":"0","titular":"AIELLO NATALIO"},"13":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALARCON ANA VERONICA","cuit":"0","titular":"ALARCON ANA VERONICA"},"14":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALBA E.A.DE Y G.ALBA","cuit":"0","titular":"ALBA E.A.DE Y G.ALBA"},"15":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VIZZOLINI HUGO CESAR","cuit":"0","titular":"ALBA MIRTA GRACIELA"},"16":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALBERCA FACUNDO SEBA","cuit":"0","titular":"ALBERCA FACUNDO SEBA"},"18":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALEGRO MARIA ANTONEL","cuit":"0","titular":"ALEGRO MARIA ANTONEL"},"20":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Aberturas Alemani","cuit":"0","titular":"ALEMANI CARLOS DANIE"},"21":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALONSO CARLOS ALBERT","cuit":"0","titular":"ALONSO CARLOS ALBERT"},"22":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALONSO MARIA ROSARIO","cuit":"0","titular":"ALONSO MARIA ROSARIO"},"23":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ALTUNA CARLOS F.","cuit":"0","titular":"ALTUNA CARLOS F."},"24":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ALVARADO S.A.","cuit":"0","titular":"ALVARADO S.A."},"25":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALVAREZ TARGISE JUAN","cuit":"0","titular":"ALVAREZ TARGISE JUAN"},"26":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ANA JORGE OSCAR","cuit":"0","titular":"ANA JORGE OSCAR"},"27":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ANDERBERG FERNANDO A","cuit":"0","titular":"ANDERBERG FERNANDO A"},"28":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ANDREATTA GRACIELA D","cuit":"0","titular":"ANDREATTA GRACIELA D"},"29":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"La Voz del Pueblo","cuit":"0","titular":"ANTONIO MACIEL S.R.L"},"30":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AQUATICA S.A. E\\/F.","cuit":"0","titular":"AQUATICA S.A. E\\/F."},"31":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ARAMBERRI LUIS ALFRE","cuit":"0","titular":"ARAMBERRI LUIS ALFRE"},"32":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ARANEGUI KARINA BEAT","cuit":"0","titular":"ARANEGUI KARINA BEAT"},"33":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Eduardo Ramon Jatib","cuit":"0","titular":"ARENAL PABLO E."},"34":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ARENAS OSVALDO ARIEL","cuit":"0","titular":"ARENAS OSVALDO ARIEL"},"35":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ARIAS AMALIA-GROENEN","cuit":"0","titular":"ARIAS AMALIA-GROENEN"},"37":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ARISTEGUI SERGIO FAB","cuit":"0","titular":"ARISTEGUI SERGIO FAB"},"39":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Antuen S.A.","cuit":"0","titular":"ARRECHEA JUAN FRANCI"},"40":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ARTURE DE MARTINEZ C","cuit":"0","titular":"ARTURE DE MARTINEZ C"},"41":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ASEF EDUARDO RUBEN","cuit":"0","titular":"ASEF EDUARDO RUBEN"},"42":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ASOC. DE ABOGADOS DE","cuit":"0","titular":"ASOC. DE ABOGADOS DE"},"43":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ASOC. MUTUAL DAN","cuit":"0","titular":"ASOC. MUTUAL DAN"},"45":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ASTIZ JORGE ARIEL","cuit":"0","titular":"ASTIZ JORGE ARIEL"},"46":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ASTIZ MARIANA","cuit":"0","titular":"ASTIZ MARIANA"},"47":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AZTIZ MARIO SANTIAGO","cuit":"0","titular":"ASTIZ MARIO SANTIAGO"},"48":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AUSTRAL MOTOR S.A.","cuit":"0","titular":"AUSTRAL MOTOR S.A."},"49":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AYALA RAMON ANDRES","cuit":"0","titular":"AYALA RAMON ANDRES"},"50":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BAQUEDANO MARTIN","cuit":"0","titular":"BAQUEDANO MARTIN"},"51":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Barainca Eduardo","cuit":"0","titular":"BARAINCA EDUARDO JUA"},"52":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BARCALA SERGIO ANDRE","cuit":"0","titular":"BARCALA SERGIO ANDRE"},"53":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BARRAZA MARIA MATILD","cuit":"0","titular":"BARRAZA MARIA MATILD"},"54":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BARRERAS ALBERTO MIG","cuit":"0","titular":"BARRERAS ALBERTO MIG"},"56":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BASSINI MARIA PAULA","cuit":"0","titular":"BASSINI MARIA PAULA"},"57":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BAZAR EL MUNDIAL S.R","cuit":"0","titular":"BAZAR EL MUNDIAL S.R"},"58":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BEITIA LUIS ALBERTO","cuit":"0","titular":"BEITIA LUIS ALBERTO"},"59":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BENGOCHEA SUSANA MAR","cuit":"0","titular":"BENGOCHEA SUSANA MAR"},"60":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"BERESFORD S.A.","cuit":"0","titular":"BERESFORD S.A"},"61":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BETTOMEO ROBERTO SAN","cuit":"0","titular":"BETTOMEO ROBERTO SAN"},"62":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BIANCHI LUCIANO SEBA","cuit":"0","titular":"BIANCHI LUCIANO SEBA"},"63":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BONIFACIO LILIANA","cuit":"0","titular":"BONIFACIO LILIANA"},"64":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BONINI JUAN CARLOS","cuit":"0","titular":"BONINI JUAN CARLOS"},"65":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"BORIONI JUAN PABLO","cuit":"0","titular":"BORIONI JUAN PABLO"},"66":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CONSULTORA RH -TRES ","cuit":"0","titular":"BORRA JORGE RENATO"},"67":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BRAJOVICH GUILLERMO ","cuit":"0","titular":"BRAJOVICH GUILLERMO "},"68":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BRAVO CARLOS-MARQUIS","cuit":"0","titular":"BRAVO CARLOS-MARQUIS"},"69":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BREA DIEGO ALBERTO","cuit":"0","titular":"BREA DIEGO ALBERTO"},"70":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BREA OMAR","cuit":"0","titular":"BREA OMAR"},"71":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BUSTOS SILVINA LILIA","cuit":"0","titular":"BUSTOS SILVINA LILIA"},"72":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CABANE OSMAR ALBERTO","cuit":"0","titular":"CABANE OSMAR ALBERTO"},"74":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CAMBEX S.A.","cuit":"0","titular":"CAMBEX S.A."},"75":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CAMPAGNE MARIO CESAR","cuit":"0","titular":"CAMPAGNE MARIO CESAR"},"77":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CAMPOS CARMEN","cuit":"0","titular":"CAMPOS CARMEN"},"78":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CAMUS FLORENCIA AGUS","cuit":"0","titular":"CAMUS FLORENCIA AGUS"},"80":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Venecia Turismo","cuit":"0","titular":"CARRACEDO NORMA"},"81":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CARRERA HNOS.","cuit":"0","titular":"CARRERA HNOS."},"82":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CARRERA MARIA INES","cuit":"0","titular":"CARRERA MARIA INES"},"83":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CARRERA NELIDA SUSAN","cuit":"0","titular":"CARRERA NELIDA SUSAN"},"84":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CARRERA Y SALDUNA SO","cuit":"0","titular":"CARRERA Y SALDUNA SO"},"86":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CASA HUMBERTO LUCAIO","cuit":"0","titular":"CASA HUMBERTO LUCAIO"},"87":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CASTRO NELLY","cuit":"0","titular":"CASTRO NELLY"},"88":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CATALANO MAURO ELIO","cuit":"0","titular":"CATALANO MAURO ELIO"},"89":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CENTRO ACOPIADORES C","cuit":"0","titular":"CENTRO ACOPIADORES C"},"90":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CENTRO BULONERO TS.A","cuit":"0","titular":"CENTRO BULONERO TS.A"},"91":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CEPEDA MARISOL GRACI","cuit":"0","titular":"CEPEDA MARISOL GRACI"},"92":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CEPEDA SILVIA MARIA","cuit":"0","titular":"CEPEDA SILVIA MARIA"},"93":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CEREALERA TRES ARROY","cuit":"0","titular":"CEREALERA TRES ARROY"},"94":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CERIANI NANCY GRACIE","cuit":"0","titular":"CERIANI NANCY GRACIE"},"95":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"La Atomica Carlos Ce","cuit":"0","titular":"CERRI CARLOS E HIJOS"},"96":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CERVINI MARIA SUSANA","cuit":"0","titular":"CERVINI MARIA SUSANA"},"97":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"CIA.DE SEG.LA MERCAN","cuit":"0","titular":"CIA.DE SEG.LA MERCAN"},"98":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Agustin Clerch","cuit":"0","titular":"CLERCH AGUSTIN"},"99":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Clerch Ignacio Agust","cuit":"0","titular":"CLERCH IGNACIO"},"100":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CLUB DE CAZADORES DE","cuit":"0","titular":"CLUB DE CAZADORES DE"},"102":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"COLANTONIO JOSE A.Y ","cuit":"0","titular":"COLANTONIO JOSE A.Y "},"104":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"COLLAZOS ALDO O.","cuit":"0","titular":"COLLAZOS ALDO O."},"106":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"COLONNA OMAR RODOLFO","cuit":"0","titular":"COLONNA OMAR RODOLFO"},"107":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"COMASA S.A.","cuit":"0","titular":"COMASA S.A."},"108":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"COMPA\\u00d1IA EURO SRL.","cuit":"0","titular":"COMPA\\u00d1IA EURO SRL."},"109":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CONFITERIA LA PERLA ","cuit":"0","titular":"CONFITERIA LA PERLA "},"111":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CONTRERAS LUIS ALBER","cuit":"0","titular":"CONTRERAS LUIS ALBER"},"112":{"ModImpo":"Si","Empresa":"Actualizada","imp":200,"Medidor":"Actualizado","denominacion":"Cooperativa Agraria ","cuit":"0","titular":"COOP.AGRARIA DE TS.A"},"113":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"COOP.DE TRANSP.DE TS","cuit":"0","titular":"COOP.DE TRANSP.DE TS"},"114":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"COOP.ELECT.LTDA.DE C","cuit":"0","titular":"COOP.ELECT.LTDA.DE C"},"115":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"COOP.RURAL LTDA.ALFA","cuit":"0","titular":"COOP.RURAL LTDA.ALFA"},"116":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Hugo Costanzo","cuit":"0","titular":"COSTANZO HUGO JUAN"},"118":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CREDIL S.R.L.","cuit":"0","titular":"CREDIL S.R.L."},"119":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CUMECHE SRL","cuit":"0","titular":"CUMECHE S.R.L."},"120":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DABIEN DE CHIRINO MA","cuit":"0","titular":"DABIEN DE CHIRINO MA"},"121":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DAGUERRE CRISTINA JO","cuit":"0","titular":"DAGUERRE CRISTINA JO"},"122":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DATRI SANDRA","cuit":"0","titular":"D''ATRI SANDRA ELIZAB"},"123":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Parque Hotel","cuit":"0","titular":"DAWSON S.A."},"126":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DE LA CAL FRANCISCO","cuit":"0","titular":"DE LA CAL FRANCISCO"},"127":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DE LA PENNA JUAN CAR","cuit":"0","titular":"DE LA PENNA JUAN CAR"},"128":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SEGURID. FENIX S.A","cuit":"0","titular":"DE LA PENNA SEGURID."},"129":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Perfumeria Beatriz","cuit":"0","titular":"DE MARTINO MARIA EST"},"130":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DE ZOETE SANDRA MARI","cuit":"0","titular":"DE ZOETE SANDRA MARI"},"131":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DEJEAN ROBERTO OSCAR","cuit":"0","titular":"DEJEAN ROBERTO OSCAR"},"132":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DEL CASTA\\u00d1O ANGEL R","cuit":"0","titular":"DEL CASTA\\u00d1O ANGEL R"},"133":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DEL GRANDE SERGIO FA","cuit":"0","titular":"DEL GRANDE SERGIO FA"},"134":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DEL VALLE MARIA LOUR","cuit":"0","titular":"DEL VALLE MARIA LOUR"},"135":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DEL VALLE NELSON BER","cuit":"0","titular":"DEL VALLE NELSON BER"},"136":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Delgado Sonia Alejan","cuit":"0","titular":"DELGADO SONIA ALEJAN"},"138":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI CROCE CLAUDIA ALE","cuit":"0","titular":"DI CROCE CLAUDIA ALE"},"139":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Trelactea","cuit":"0","titular":"DI CROCE LAURA OFELI"},"140":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MORA","cuit":"0","titular":"DI FELICE DORA NOEMI"},"141":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI FULVIO LUIS EUGEN","cuit":"0","titular":"DI FULVIO LUIS EUGEN"},"142":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI MARCO JUAN E.","cuit":"0","titular":"DI MARCO JUAN E."},"143":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI ROCCO MARIA CECIL","cuit":"0","titular":"DI ROCCO MARIA CECIL"},"144":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DI SALVO GUILLERMO E","cuit":"0","titular":"DI SALVI GUILLERMO E"},"145":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI SALVO GRACIELA ES","cuit":"0","titular":"DI SALVO GRACIELA ES"},"146":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI SALVO S.A.","cuit":"0","titular":"DI SALVO S.A."},"147":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DI TOMMASO MARIO Y T","cuit":"0","titular":"DI TOMMASO MARIO Y T"},"148":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DI VITO CARMELO A.","cuit":"0","titular":"DI VITO CARMELO A."},"149":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI VITO CLAUDIA SUSA","cuit":"0","titular":"DI VITO CLAUDIA SUSA"},"150":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DIAZ RAUL ALBERTO","cuit":"0","titular":"DIAZ RAUL ALBERTO"},"151":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DIFONZO & MARCHI","cuit":"0","titular":"DIFONZO & MARCHI"},"154":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TRIBI\\u00d1O ALBERTO","cuit":"0","titular":"DUCHOSAL VERONICA"},"155":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DUPUY STELLA MARIS","cuit":"0","titular":"DUPUY STELLA MARIS"},"156":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"EICHLER EDUARDO HUGO","cuit":"0","titular":"EICHLER EDUARDO HUGO"},"157":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ELCUAZ HECTOR A.","cuit":"0","titular":"ELCUAZ HECTOR A."},"158":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ELGART REYNALDO E Y ","cuit":"0","titular":"ELGART REYNALDO E Y "},"159":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ELGART VERONICA Y EL","cuit":"0","titular":"ELGART VERONICA Y EL"},"160":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ELICALDE NESTOR JUAN","cuit":"0","titular":"ELICALDE NESTOR JUAN"},"161":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ERRAZU MARIA EMILIA","cuit":"0","titular":"ERRAZU MARIA EMILIA"},"162":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ESPELUSE RODOLFO Y C","cuit":"0","titular":"ESPELUSE RODOLFO Y C"},"163":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ETCHEVERRY ALFREDO J","cuit":"0","titular":"ETCHEVERRY ALFREDO J"},"164":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ETERNET S.R.L.","cuit":"0","titular":"ETERNET S.R.L."},"165":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"EXPRESO EL VASQUITO ","cuit":"0","titular":"EXPRESO EL VASQUITO "},"166":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FAGEMAR S.A.","cuit":"0","titular":"FAGEMAR S.A."},"167":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"FAMTEX S.R.L.","cuit":"0","titular":"FAMTEX S.R.L."},"169":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FARINA AMERICO","cuit":"0","titular":"FARINA AMERICO"},"170":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FARMACIA TRES ARROYO","cuit":"0","titular":"FARMACIA TRES ARROYO"},"171":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Marco Polo","cuit":"0","titular":"FERNANDEZ JAVIER EDU"},"172":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERNANDEZ CRISTINA","cuit":"0","titular":"FERNANDEZ MARIA CRIS"},"173":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERNANDEZ MIGUEL ANG","cuit":"0","titular":"FERNANDEZ MIGUEL ANG"},"174":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERNANDEZ RODOLFO Y ","cuit":"0","titular":"FERNANDEZ RODOLFO Y "},"175":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"FERNANDEZ VILLANUEVA","cuit":"0","titular":"FERNANDEZ VILLANUEVA"},"176":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERRARI RICARDO DOMI","cuit":"0","titular":"FERRARI RICARDO DOMI"},"177":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"REFRESH","cuit":"0","titular":"FERRARIO GUILLERMO E"},"178":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERRARIO GUSTAVO ADR","cuit":"0","titular":"FERRARIO GUSTAVO ADR"},"185":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FOSQUE MARIA ADELA","cuit":"0","titular":"FOSQUE MARIA ADELA"},"186":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"FRIGORIFICO CAPRIATA","cuit":"0","titular":"FRIGORIFICO CAPRIATA"},"187":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FUCHS SANDRA CECILIA","cuit":"0","titular":"FUCHS SANDRA CECILIA"},"189":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"La casa del pantalon","cuit":"0","titular":"GALILEA EUGENIO HECT"},"190":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GALLARDO JAVIER NEST","cuit":"0","titular":"GALLARDO JAVIER NEST"},"192":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Ganim Nestor Hugo","cuit":"0","titular":"GANIM NESTOR HUGO"},"193":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Elsa Maria Garat","cuit":"0","titular":"GARAT ELSA MARIA"},"194":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Childrens Wish","cuit":"0","titular":"GARCIA ANA CAROLINA"},"195":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GARCIA GABRIEL Y GUS","cuit":"0","titular":"GARCIA GABRIEL Y GUS"},"196":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GARCIA ROCIO","cuit":"0","titular":"GARCIA MARCONI ROCIO"},"197":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GARCIA MARIA DEL CAR","cuit":"0","titular":"GARCIA MARIA DEL CAR"},"198":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GARCIA MAURICIO DAVI","cuit":"0","titular":"GARCIA MAURICIO DAVI"},"199":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GARCIA SERGIO RAUL","cuit":"0","titular":"GARCIA SERGIO RAUL"},"200":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Amestoy Automotores ","cuit":"0","titular":"GASANEO Y AMESTOY"},"201":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GASPAROLI ANA TERESA","cuit":"0","titular":"GASPAROLI ANA TERESA"},"202":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GEJO RUBEN Y RODOLFO","cuit":"0","titular":"GEJO RUBEN Y RODOLFO"},"203":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GENOVESI HNOS.S.R.L","cuit":"0","titular":"GENOVESI HNOS.S.R.L"},"204":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GIACOMINO ANDREA SUS","cuit":"0","titular":"GIACOMINO ANDREA SUS"},"206":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Acosta Juan Enrique","cuit":"0","titular":"GIDINI MARGARITA AGU"},"207":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GIMNASIO STADIUM","cuit":"0","titular":"GIMNASIO STADIUM"},"209":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GIULIANI HECTOR Y LU","cuit":"0","titular":"GIULIANI HECTOR Y LU"},"210":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ JORGE VENTU","cuit":"0","titular":"GONZALEZ JORGE VENTU"},"211":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ LUIS ALBERT","cuit":"0","titular":"GONZALEZ LUIS ALBERT"},"212":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ MARCELO GAB","cuit":"0","titular":"GONZALEZ MARCELO GAB"},"213":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ MARCELO OSC","cuit":"0","titular":"GONZALEZ MARCELO OSC"},"214":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ MARIA LAURA","cuit":"0","titular":"GONZALEZ MARIA LAURA"},"215":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GRANDA LUCIANO","cuit":"0","titular":"GRANDA LUCIANO"},"216":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GROSSO CLAUDIA LUJAN","cuit":"0","titular":"GROSSO CLAUDIA LUJAN"},"217":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GRUAS Y MONTAJES IOR","cuit":"0","titular":"GRUAS Y MONTAJES IOR"},"218":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GUAZZORA ELSA CELICA","cuit":"0","titular":"GUAZZORA ELSA CELICA"},"219":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GUILLERMO ECHEVARRIA","cuit":"0","titular":"GUILLERMO ECHEVARRIA"},"220":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GUISASOLA MARIA LEON","cuit":"0","titular":"GUISASOLA MARIA LEON"},"222":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GUSTAVO FIORDA MAQUI","cuit":"0","titular":"GUSTAVO FIORDA MAQUI"},"223":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"HERNANDEZ HUGO SEBAS","cuit":"0","titular":"HERNANDEZ HUGO SEBAS"},"224":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"HERRERA F-HERRERA N-","cuit":"0","titular":"HERRERA F-HERRERA N-"},"225":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"HERRERO RAUL MARIO","cuit":"0","titular":"HERRERO RAUL MARIO"},"226":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MACHADO ROBERTO OSCA","cuit":"0","titular":"HID MARIO HORACIO"},"227":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Marea","cuit":"0","titular":"HIDALGO MARIA EUGENI"},"229":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"HOJOBAR S.A.","cuit":"0","titular":"HOJOBAR S.A."},"230":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"HOLLENDER PEDRO MARC","cuit":"0","titular":"HOLLENDER PEDRO MARC"},"232":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"IELMINI NELIDA ESTER","cuit":"0","titular":"IELMINI NELIDA ESTER"},"234":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"INGENERARE SRL","cuit":"0","titular":"INGENERARE SRL"},"235":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"INSTITUTO BIOQUIMICO","cuit":"0","titular":"INSTITUTO BIOQUIMICO"},"236":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"IRIART FERNANDO RAUL","cuit":"0","titular":"IRIART FERNANDO RAUL"},"237":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"IRIBARNE EDUARDO","cuit":"0","titular":"IRIBARNE EDUARDO"},"239":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ISMAEL CLAUDIO ANIBA","cuit":"0","titular":"ISMAEL CLAUDIO ANIBA"},"240":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ITALIANI MARIA ELENA","cuit":"0","titular":"ITALIANI MARIA ELENA"},"241":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VETERINARIA EL MOLIN","cuit":"0","titular":"ITURBURU MARIA ISABE"},"242":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JACOBSEN ANDRES RAUL","cuit":"0","titular":"JACOBSEN ANDRES RAUL"},"243":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JALLE ANDRES","cuit":"0","titular":"JALLE ANDRES"},"244":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JAUREGUIBEHERE LIA M","cuit":"0","titular":"JAUREGUIBEHERE LIA M"},"245":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JEANNERET JULIO","cuit":"0","titular":"JEANNERET JULIO"},"246":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JORGE ALBERTO","cuit":"0","titular":"JORGE ALBERTO"},"247":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"EDUARDO SANTIAGO JUA","cuit":"0","titular":"JUAN EDUARDO"},"248":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Pizza 3","cuit":"0","titular":"JURORUSA S.A"},"249":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"LA AGRICOLA GANAD.DE","cuit":"0","titular":"LA AGRICOLA GANAD.DE"},"250":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LA CASA DE LOS BULON","cuit":"0","titular":"LA CASA DE LOS BULON"},"251":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"LA PERSEVERANCIA SEG","cuit":"0","titular":"LA PERSEVERANCIA SEG"},"252":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LABORDE CARLOS ALBER","cuit":"0","titular":"LABORDE CARLOS ALBER"},"253":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"LAGO S.A.","cuit":"0","titular":"LAGO S.A."},"254":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LAMBERTA JORGE MIGUE","cuit":"0","titular":"LAMBERTA JORGE MIGUE"},"255":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LANCE FABIANA","cuit":"0","titular":"LANCE FABIANA"},"256":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LARA ROBERTO MARCELO","cuit":"0","titular":"LARA ROBERTO MARCELO"},"257":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LARRIESTRA BEATRIZ C","cuit":"0","titular":"LARRIESTRA BEATRIZ C"},"258":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LARSEN CESAR GERARDO","cuit":"0","titular":"LARSEN CESAR GERARDO"},"259":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LAS MECHAS SOCIEDAD ","cuit":"0","titular":"LAS MECHAS SOCIEDAD "},"260":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LATORRE ALEJANDRO MA","cuit":"0","titular":"LATORRE ALEJANDRO MA"},"261":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LATORRE JOAQUIN IGNA","cuit":"0","titular":"LATORRE JOAQUIN IGNA"},"262":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LAVANDERIA TRES ARRO","cuit":"0","titular":"LAVANDERIA TRES ARRO"},"264":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Dragon Rojo","cuit":"0","titular":"LEGUIZAMON CLAUDIA I"},"265":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Leguizamon Esteban H","cuit":"0","titular":"LEGUIZAMON ESTEBAN H"},"266":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LETAMENDI LUIS ANGEL","cuit":"0","titular":"LETAMENDI LUIS ANGEL"},"267":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LIEBANA JORGE F.","cuit":"0","titular":"LIEBANA JORGE F."},"268":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LIFIRON S.A.","cuit":"0","titular":"LIFIRON S.A"},"269":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LLANOS ALICIA CLALFI","cuit":"0","titular":"LLANOS ALICIA CLALFI"},"270":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LOFIEGO JOSE JUIS","cuit":"0","titular":"LOFIEGO JOSE JUIS"},"271":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LOPEZ IRMA ELENA","cuit":"0","titular":"LOPEZ IRMA ELENA"},"272":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LOPEZ NESTOR FABIAN","cuit":"0","titular":"LOPEZ NESTOR FABIAN"},"273":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LOSADA RICARDO OSVAL","cuit":"0","titular":"LOSADA RICARDO OSVAL"},"274":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Despensa El Gauchito","cuit":"0","titular":"LUCERO OLGA"},"275":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"LUIS BLANCO S.A","cuit":"0","titular":"LUIS BLANCO S.A"},"276":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MACHADO ROBERTO OSCA","cuit":"0","titular":"MACHADO ROBERTO OSCA"},"277":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"MACIEL HERMANOS S.A.","cuit":"0","titular":"MACIEL HERMANOS S.A."},"278":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MADERAS S. JOSE DE L","cuit":"0","titular":"MADERAS S. JOSE DE L"},"279":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"M.A.M. S.A.","cuit":"0","titular":"M.A.M. S.A."},"280":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MARINO MONICA GRACIE","cuit":"0","titular":"MARINO MONICA GRACIE"},"281":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MARTINEZ CLAUDIO NES","cuit":"0","titular":"MARTINEZ CLAUDIO NES"},"282":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MARTINEZ DE CAMPOS A","cuit":"0","titular":"MARTINEZ DE CAMPOS A"},"283":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Agromar SA","cuit":"0","titular":"MARTINEZ FRANKLIN SE"},"284":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Compu3","cuit":"0","titular":"MARTINEZ GUILLERMO O"},"285":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MARTINEZ JULIO CESAR","cuit":"0","titular":"MARTINEZ JULIO CESAR"},"286":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MASCHI EDUARDO ERNES","cuit":"0","titular":"MASCHI EDUARDO ERNES"},"287":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MASTROSIMONE GUSTAVO","cuit":"0","titular":"MASTROSIMONE GUSTAVO"},"289":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MAYER RICARDO AUTOMO","cuit":"0","titular":"MAYER RICARDO AUTOMO"},"290":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MENNA ELIANA ANDREA","cuit":"0","titular":"MENNA ELIANA ANDREA"},"291":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MENNA CEREALES","cuit":"0","titular":"MENNA JOSE ANGEL"},"292":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MENNA LORENZO N.","cuit":"0","titular":"MENNA LORENZO N."},"293":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MEO GUZMAN ENRIQUE F","cuit":"0","titular":"MEO GUZMAN ENRIQUE F"},"294":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MERLINO PLAN S.A.","cuit":"0","titular":"MERLINO PLAN S.A."},"295":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MERLO CARMEN HERMINI","cuit":"0","titular":"MERLO CARMEN HERMINI"},"296":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MESA DE FORCHETTI MO","cuit":"0","titular":"MESA DE FORCHETTI MO"},"297":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Miedan, Ana Karina","cuit":"0","titular":"MIEDAN ANA KARINA"},"298":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MILLA SUR S.A.","cuit":"0","titular":"MILLA SUR S.A."},"299":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MIO FIGLIO","cuit":"0","titular":"MIO FIGLIO  S.R.L."},"300":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MOIRANO EVELIA LILIA","cuit":"0","titular":"MOIRANO EVELIA LILIA"},"301":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MOIZZI JUAN JOSE","cuit":"0","titular":"MOIZZI JUAN JOSE"},"303":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"METALURGICA MOLINA","cuit":"0","titular":"MOLINA EUGENIO ALFRE"},"304":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MOLINA HECTOR MARIAN","cuit":"0","titular":"MOLINA HECTOR MARIAN"},"305":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MOLINOS TRES ARROYOS","cuit":"0","titular":"MOLINOS TRES ARROYOS"},"306":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MOLINOS ZALLA S.A","cuit":"0","titular":"MOLINOS ZALLA S.A."},"307":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MOLLER GUSTAVO","cuit":"0","titular":"MOLLER ARTURO"},"308":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MONSALVO MARIA DE LO","cuit":"0","titular":"MONSALVO MARIA DE LO"},"309":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MONTESINOS JOSE MANU","cuit":"0","titular":"MONTESINOS JOSE MANU"},"310":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MORAN JORGE ANTONIO","cuit":"0","titular":"MORAN JORGE ANTONIO"},"312":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DE BENEDETTO AUGUSTO","cuit":"0","titular":"MUNGAI MARIA MERCEDE"},"314":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"NALDO LOMBARDI S.A","cuit":"0","titular":"NALDO LOMBARDI S.A"},"315":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"NIKRO S.A","cuit":"0","titular":"NIKRO S.A"},"316":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"NOICSA S.A.","cuit":"0","titular":"NOICSA S.A."},"317":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Mera Fernando Omar","cuit":"0","titular":"NOVILLO VIRGINIA VER"},"318":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"OHACO RAUL BAUTISTA","cuit":"0","titular":"OHACO RAUL BAUTISTA"},"319":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"OLEOHIDRAULICA DI RO","cuit":"0","titular":"OLEOHIDRAULICA DI RO"},"320":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"OLOCCO BARTOLO","cuit":"0","titular":"OLOCCO BARTOLO"},"321":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"OLSEN CRISTIAN","cuit":"0","titular":"OLSEN CRISTIAN"},"322":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ONGARINI LIVIO","cuit":"0","titular":"ONGARINI LIVIO"},"323":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Tito Otero","cuit":"0","titular":"OTERO OSCAR ALBERTO"},"324":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PALLA SILVIA CRISTIN","cuit":"0","titular":"PALLA SILVIA CRISTIN"},"325":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"PALLADINO  S.A.","cuit":"0","titular":"PALLADINO  S.A."},"326":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PALMA NORA","cuit":"0","titular":"PALMA NORA"},"327":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PASCUAL SILVIA ADRIA","cuit":"0","titular":"PASCUAL SILVIA ADRIA"},"328":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PAZOS DE VELOSO MABE","cuit":"0","titular":"PAZOS DE VELOSO MABE"},"329":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PC TRUCKS TRES ARROY","cuit":"0","titular":"PC TRUCKS TRES ARROY"},"330":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEQUE\\u00d1O JOSE","cuit":"0","titular":"PEQUE\\u00d1O JOSE"},"331":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FLYING MOTORS","cuit":"0","titular":"PEREYRA ESTEBAN CEFE"},"332":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"PEREZ DALSGAARD Y CI","cuit":"0","titular":"PEREZ DALSGAARD Y CI"},"333":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ GUILLERMO LUIS","cuit":"0","titular":"PEREZ GUILLERMO LUIS"},"334":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ GUSTAVO MIGUEL","cuit":"0","titular":"PEREZ GUSTAVO MIGUEL"},"335":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ MARIA ISABEL","cuit":"0","titular":"PEREZ MARIA ISABEL"},"336":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ NELSON ADRIAN","cuit":"0","titular":"PEREZ NELSON ADRIAN"},"337":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ PAULA ANDREA","cuit":"0","titular":"PEREZ PAULA ANDREA"},"338":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Gestion Inmobiliaria","cuit":"0","titular":"PEREZ RAUL MARTIN"},"339":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PERTICARARI JUAN PAB","cuit":"0","titular":"PERTICARARI JUAN PAB"},"340":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"PETELA HECTOR","cuit":"0","titular":"PETELA HECTOR"},"341":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PIERINI CARLOS FABIA","cuit":"0","titular":"PIERINI CARLOS FABIA"},"342":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"PINTURERIAS RUCCI S.","cuit":"0","titular":"PINTURERIAS RUCCI S."},"343":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PIROSANTO CAMILO ALD","cuit":"0","titular":"PIROSANTO CAMILO ALD"},"344":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PODESTA MARIANA","cuit":"0","titular":"PODESTA MARIANA"},"345":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PONCE EDUARDO ESTEBA","cuit":"0","titular":"PONCE EDUARDO ESTEBA"},"346":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"POULSEN PEDRO-CAZEAU","cuit":"0","titular":"POULSEN PEDRO-CAZEAU"},"347":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Bodycare","cuit":"0","titular":"POZZOLI LAURA CECILI"},"349":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PRIETO JUAN JOSE","cuit":"0","titular":"PRIETO JUAN JOSE"},"350":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PROCACCINI FRANCISCO","cuit":"0","titular":"PROCACCINI FRANCISCO"},"351":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"QUIMICA MOLERO S.R.L","cuit":"0","titular":"QUIMICA MOLERO S.R.L"},"353":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RANZINI MATIAS FEDER","cuit":"0","titular":"RANZINI MATIAS FEDER"},"355":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RAVELLA RICARDO H.","cuit":"0","titular":"RAVELLA RICARDO H."},"356":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RE MARIO CESAR","cuit":"0","titular":"RE MARIO CESAR"},"357":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RECARI MARIANO (Pana","cuit":"0","titular":"RECARI MARIANO"},"358":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"REFAFLOTO S.A.","cuit":"0","titular":"REFAFLOTO S.A"},"359":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RENDO DE PODESTA IRM","cuit":"0","titular":"RENDO DE PODESTA IRM"},"360":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"REY ANA MARIA","cuit":"0","titular":"REY ANA MARIA"},"361":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RIDINO EDUARDO","cuit":"0","titular":"RIDINO EDUARDO NICOL"},"363":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ROAS SACIF","cuit":"0","titular":"ROAS SACIF"},"364":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RODERA FRANCISCO Y J","cuit":"0","titular":"RODERA FRANCISCO Y J"},"365":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Penelope Lanas","cuit":"0","titular":"RODRIGUEZ ELSA TERES"},"366":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RODRIGUEZ TERESA ANG","cuit":"0","titular":"RODRIGUEZ TERESA ANG"},"367":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ROLANDO LUIS ROBERTO","cuit":"0","titular":"ROLANDO LUIS ROBERTO"},"368":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGENCIA ISIDORO","cuit":"0","titular":"ROLDAN JUANA MARIELA"},"370":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RUBIO DANIEL CECILIO","cuit":"0","titular":"RUBIO DANIEL CECILIO"},"371":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RUTA 2 S.R.L.","cuit":"0","titular":"RUTA 2 S.R.L."},"372":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SABATINI MARCELO","cuit":"0","titular":"SABATINI MARCELO EDM"},"374":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SAEZ SILVIA NELLY","cuit":"0","titular":"SAEZ SILVIA NELLY"},"375":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SAGARDOY FERNANDO JO","cuit":"0","titular":"SAGARDOY FERNANDO JO"},"376":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SAINI SERGIO DANIEL","cuit":"0","titular":"SAINI SERGIO DANIEL"},"377":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SALOME JULIO","cuit":"0","titular":"SALOME JULIO"},"378":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SAN PELLEGRINI DE M.","cuit":"0","titular":"SAN PELLEGRINI DE M."},"379":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANCHEZ ELIZABETH","cuit":"0","titular":"SANCHEZ ELIZABETH"},"380":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANCHEZ MONICA LUJAN","cuit":"0","titular":"SANCHEZ MONICA LUJAN"},"381":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANCHEZ N.DE PEREYRA","cuit":"0","titular":"SANCHEZ N.DE PEREYRA"},"382":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Quintana Roberto Mar","cuit":"0","titular":"SANCINETO VICTOR MAR"},"383":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANDE JUAN JOSE","cuit":"0","titular":"SANDE JUAN JOSE"},"384":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SANI TRES S.A.","cuit":"0","titular":"SANI TRES S.A."},"385":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANTAJULIANA M. ALEJ","cuit":"0","titular":"SANTAGIULIANA MARIA "},"386":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANTIRSO MARIA ROSAN","cuit":"0","titular":"SANTIRSO MARIA ROSAN"},"387":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SAURO ROBERTO CESAR","cuit":"0","titular":"SAURO ROBERTO CESAR"},"388":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SCARCELLA DIEGO JOSE","cuit":"0","titular":"SCARCELLA DIEGO JOSE"},"389":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SCHENCH ANDREA FABIA","cuit":"0","titular":"SCHENCK ANDREA FABIA"},"390":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SCHUMACHER ALFREDO Y","cuit":"0","titular":"SCHUMACHER ALFREDO Y"},"391":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SEMILLERA PAMPA FERT","cuit":"0","titular":"SEMILLERA PAMPA FERT"},"392":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SEQUEIRA CARLOS ENRI","cuit":"0","titular":"SEQUEIRA CARLOS ENRI"},"393":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ESTUDIO PANDOLFO","cuit":"0","titular":"SERRANO ELSA GLORIA"},"394":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SISTEMAS TERMODINAMI","cuit":"0","titular":"SISTEMAS TERMODINAMI"},"395":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"BERTEL SKOU SAAII Y ","cuit":"0","titular":"SKOU BERTEL S.A."},"396":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SOBANSKI VICTOR ADOL","cuit":"0","titular":"SOBANSKI VICTOR ADOL"},"397":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SOC. DE TRANSP.LIBRE","cuit":"0","titular":"SOC. DE TRANSP.LIBRE"},"398":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Clinica Privada Hisp","cuit":"0","titular":"SOC.ESPA\\u00d1OLA DE S.M"},"399":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"RED 24","cuit":"0","titular":"SOCOLOFF MARTIN IVAN"},"400":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SODA LA HUELLA S.R.L","cuit":"0","titular":"SODA LA HUELLA S.R.L"},"401":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SODE HORACIO ABEL","cuit":"0","titular":"SODE HORACIO ABEL"},"402":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SORIANO MIGUEL ANGEL","cuit":"0","titular":"SORIANO MIGUEL ANGEL"},"403":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SORIANO RAFAEL","cuit":"0","titular":"SORIANO RAFAEL"},"404":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Panificadora San Jua","cuit":"0","titular":"SOULE SERGIO OSVALDO"},"405":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TORRES CARIONI MARIA","cuit":"0","titular":"SOUMOULOU PABLO HERN"},"406":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SPENZA MARIANO M.","cuit":"0","titular":"SPENZA MARIANO MARTI"},"408":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"STARCEL PAMPA CENTRO","cuit":"0","titular":"STARCEL PAMPA CENTRO"},"410":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SUAREZ ADELA JOSEFIN","cuit":"0","titular":"SUAREZ ADELA JOSEFIN"},"411":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SUAREZ JORGE EDUARDO","cuit":"0","titular":"SUAREZ JORGE EDUARDO"},"412":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SUPERCARNE S.A.","cuit":"0","titular":"SUPERCARNE S.A."},"413":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SUPERMERCADO PLANETA","cuit":"0","titular":"SUPERMERCADO PLANETA"},"414":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SUR AGROPECUARIA S.A","cuit":"0","titular":"SUR AGROPECUARIA S.A"},"415":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Sandra Marisa Rivero","cuit":"0","titular":"TARABORELLI ALEJANDR"},"416":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TARABORELLI MARIO JE","cuit":"0","titular":"TARABORELLI MARIO JE"},"417":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TARANTELA ELVIRA ELS","cuit":"0","titular":"TARANTELA ELVIRA ELS"},"418":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TARJETA NARANJA SA.","cuit":"0","titular":"TARJETA NARANJA SA."},"419":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Estacion de Servicio","cuit":"0","titular":"TARTAGLINO Y CIA. SR"},"420":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TEILETCHE ENRIQUE Y ","cuit":"0","titular":"TEILETCHE ENRIQUE Y "},"421":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RECICLADOS TRES ARRO","cuit":"0","titular":"TERRASANTA MONICA"},"422":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TIEMERSMA SEBASTIAN","cuit":"0","titular":"TIEMERSMA SEBASTIAN"},"423":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TORRES CARIONI SANTI","cuit":"0","titular":"TORRES CARIONI SANTI"},"425":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"TOSTEX S.A.","cuit":"0","titular":"TOSTEX S.A."},"426":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TRAFER SAIC","cuit":"0","titular":"TRAFER SAIC"},"427":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TRANSPORTE GOIZUETA","cuit":"0","titular":"TRANSPORTE GOIZUETA"},"428":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TRAVERSO GUILLERMO H","cuit":"0","titular":"TRAVERSO GUILLERMO H"},"429":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TRESNECO S.A.","cuit":"0","titular":"TRESNECO S.A."},"431":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TRUCK EXPRESS S.R.L.","cuit":"0","titular":"TRUCK EXPRESS S.R.L."},"432":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TUMINI D. Y J. Y MEN","cuit":"0","titular":"TUMINI D. Y J. Y MEN"},"433":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TURINI PABLO","cuit":"0","titular":"TURINI PABLO RENATO"},"434":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ULLERUP RAUL ADOLFO","cuit":"0","titular":"ULLERUP RAUL ADOLFO"},"435":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"UNIVALORES S.A.","cuit":"0","titular":"UNIVALORES S.A."},"436":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"URBAN ANDERSEN MARCO","cuit":"0","titular":"URBAN ANDERSEN MARCO"},"437":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"URBIETA ANDRES","cuit":"0","titular":"URBIETA ANDRES"},"438":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"URRUTIA MARIA MARTA","cuit":"0","titular":"URRUTIA MARIA MARTA"},"440":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"UZCUDUN S.A.F.I.M.","cuit":"0","titular":"UZCUDUN S.A.F.I.M."},"441":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"UZIDINGER EDUARDO NI","cuit":"0","titular":"UZIDINGER EDUARDO NI"},"442":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VACCA REINALDO RUBEN","cuit":"0","titular":"VACCA REINALDO RUBEN"},"443":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Automotores Vazquez","cuit":"0","titular":"VAZQUEZ MIGUEL ANGEL"},"444":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VERGNANO RAUL ANDRES","cuit":"0","titular":"VERGNANO RAUL ANDRES"},"445":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VERKUYL ASTRID CINTI","cuit":"0","titular":"VERKUYL ASTRID CINTI"},"447":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VIGILAN S.R.L.AG.DE ","cuit":"0","titular":"VIGILAN S.R.L.AG.DE "},"448":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VILLAFRANCA MARTA S.","cuit":"0","titular":"VILLAFRANCA MARTA S."},"449":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Viviana A Villalva","cuit":"0","titular":"VILLALBA JORGE ALFRE"},"450":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"VILLALBA PEDRO","cuit":"0","titular":"VILLALBA PEDRO"},"452":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VILLEMUR GUSTAVO MIG","cuit":"0","titular":"VILLEMUR GUSTAVO MIG"},"453":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VINOTECA LOS TONELES","cuit":"0","titular":"VINOTECA LOS TONELES"},"454":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VIVIANI CARMEN","cuit":"0","titular":"VIVIANI CARMEN"},"455":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VIZZOLINI NESTOR J.","cuit":"0","titular":"VIZZOLINI NESTOR J."},"456":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"WEHRHANNE HORACIO MA","cuit":"0","titular":"WEHRHANNE HORACIO MA"},"457":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"WEST FERNANDO LUIS","cuit":"0","titular":"WEST FERNANDO LUIS"},"458":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ZIJLSTRA JORGE ROBER","cuit":"0","titular":"ZIJLSTRA JORGE ROBER"},"459":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ZIJLSTRA SILVINA","cuit":"0","titular":"ZIJLSTRA SILVINA ELE"},"460":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ZORRILLA HNOS. S.R.L","cuit":"0","titular":"ZORRILLA HNOS. S.R.L"},"461":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ZOTES SAUL FRANCISCO","cuit":"0","titular":"ZOTES SAUL FRANCISCO"},"462":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ZURITA HNOS. Y CIA.","cuit":"0","titular":"ZURITA HNOS. Y CIA."},"463":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"18 DE SETIEMBRE S.A","cuit":"0","titular":"18 DE SETIEMBRE S.A"},"464":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"LASO - 3 ARROYOS S.A","cuit":"0","titular":"3 ARROYOS S.A."},"465":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"3 NET S.A.","cuit":"0","titular":"3 NET S.A."}}', 465, '2015-07-03 03:07:36', '""', 0, 0, 465, 411, 0, 0, 54);
INSERT INTO `infmedidorexcel` (`id`, `actualizados`, `totalregistros`, `fecha`, `fallados`, `medidorInsertado`, `registroNoInsertado`, `medidorActualizado`, `empresaActualizada`, `relacionInsertada`, `medidorSinEmpresaInsertado`, `medidorSinEmpresaActualizado`) VALUES
(17, '""', 465, '2015-07-03 03:07:18', '""', 0, 0, 465, 0, 0, 0, 54),
(18, '""', 465, '2015-07-03 03:07:11', '""', 0, 0, 465, 0, 0, 0, 54),
(19, '""', 465, '2015-07-03 04:07:18', '""', 465, 0, 0, 0, 0, 465, 0);
INSERT INTO `infmedidorexcel` (`id`, `actualizados`, `totalregistros`, `fecha`, `fallados`, `medidorInsertado`, `registroNoInsertado`, `medidorActualizado`, `empresaActualizada`, `relacionInsertada`, `medidorSinEmpresaInsertado`, `medidorSinEmpresaActualizado`) VALUES
(20, '{"1":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ABELLEIRA FABIAN-LEN","cuit":"0","titular":"ABELLEIRA FABIAN-LEN"},"2":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ACA SALUD","cuit":"0","titular":"ACA SALUD COOPERATIV"},"3":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ACMC SRL","cuit":"0","titular":"ACMC S.R.L."},"4":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGF ALLIANZ ARG.CIA ","cuit":"0","titular":"AGF ALLIANZ ARG.CIA "},"5":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AGRO EL CARRETERO S.","cuit":"0","titular":"AGRO EL CARRETERO S."},"6":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGRO INDUSTRIA TRES ","cuit":"0","titular":"AGRO INDUSTRIA TRES "},"7":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AGRO-GILARDONI S.R.L","cuit":"0","titular":"AGRO-GILARDONI S.R.L"},"8":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGROPAL S.A.","cuit":"0","titular":"AGROPAL S.A."},"9":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGROPRIMUS S.A","cuit":"0","titular":"AGROPRIMUS S.A"},"10":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AGUADAS GOMEZ HNOS S","cuit":"0","titular":"AGUADAS GOMEZ HNOS S"},"11":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"AIELLO JOSE E HIJOS ","cuit":"0","titular":"AIELLO JOSE E HIJOS "},"12":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AIELLO NATALIO","cuit":"0","titular":"AIELLO NATALIO"},"13":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALARCON ANA VERONICA","cuit":"0","titular":"ALARCON ANA VERONICA"},"14":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALBA E.A.DE Y G.ALBA","cuit":"0","titular":"ALBA E.A.DE Y G.ALBA"},"15":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VIZZOLINI HUGO CESAR","cuit":"0","titular":"ALBA MIRTA GRACIELA"},"16":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALBERCA FACUNDO SEBA","cuit":"0","titular":"ALBERCA FACUNDO SEBA"},"18":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALEGRO MARIA ANTONEL","cuit":"0","titular":"ALEGRO MARIA ANTONEL"},"20":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Aberturas Alemani","cuit":"0","titular":"ALEMANI CARLOS DANIE"},"21":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALONSO CARLOS ALBERT","cuit":"0","titular":"ALONSO CARLOS ALBERT"},"22":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALONSO MARIA ROSARIO","cuit":"0","titular":"ALONSO MARIA ROSARIO"},"23":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ALTUNA CARLOS F.","cuit":"0","titular":"ALTUNA CARLOS F."},"24":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ALVARADO S.A.","cuit":"0","titular":"ALVARADO S.A."},"25":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALVAREZ TARGISE JUAN","cuit":"0","titular":"ALVAREZ TARGISE JUAN"},"26":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ANA JORGE OSCAR","cuit":"0","titular":"ANA JORGE OSCAR"},"27":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ANDERBERG FERNANDO A","cuit":"0","titular":"ANDERBERG FERNANDO A"},"28":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ANDREATTA GRACIELA D","cuit":"0","titular":"ANDREATTA GRACIELA D"},"29":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"La Voz del Pueblo","cuit":"0","titular":"ANTONIO MACIEL S.R.L"},"30":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AQUATICA S.A. E\\/F.","cuit":"0","titular":"AQUATICA S.A. E\\/F."},"31":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ARAMBERRI LUIS ALFRE","cuit":"0","titular":"ARAMBERRI LUIS ALFRE"},"32":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ARANEGUI KARINA BEAT","cuit":"0","titular":"ARANEGUI KARINA BEAT"},"33":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Eduardo Ramon Jatib","cuit":"0","titular":"ARENAL PABLO E."},"34":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ARENAS OSVALDO ARIEL","cuit":"0","titular":"ARENAS OSVALDO ARIEL"},"35":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ARIAS AMALIA-GROENEN","cuit":"0","titular":"ARIAS AMALIA-GROENEN"},"37":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ARISTEGUI SERGIO FAB","cuit":"0","titular":"ARISTEGUI SERGIO FAB"},"39":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Antuen S.A.","cuit":"0","titular":"ARRECHEA JUAN FRANCI"},"40":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ARTURE DE MARTINEZ C","cuit":"0","titular":"ARTURE DE MARTINEZ C"},"41":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ASEF EDUARDO RUBEN","cuit":"0","titular":"ASEF EDUARDO RUBEN"},"42":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ASOC. DE ABOGADOS DE","cuit":"0","titular":"ASOC. DE ABOGADOS DE"},"43":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ASOC. MUTUAL DAN","cuit":"0","titular":"ASOC. MUTUAL DAN"},"45":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ASTIZ JORGE ARIEL","cuit":"0","titular":"ASTIZ JORGE ARIEL"},"46":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ASTIZ MARIANA","cuit":"0","titular":"ASTIZ MARIANA"},"47":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AZTIZ MARIO SANTIAGO","cuit":"0","titular":"ASTIZ MARIO SANTIAGO"},"48":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AUSTRAL MOTOR S.A.","cuit":"0","titular":"AUSTRAL MOTOR S.A."},"49":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AYALA RAMON ANDRES","cuit":"0","titular":"AYALA RAMON ANDRES"},"50":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BAQUEDANO MARTIN","cuit":"0","titular":"BAQUEDANO MARTIN"},"51":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Barainca Eduardo","cuit":"0","titular":"BARAINCA EDUARDO JUA"},"52":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BARCALA SERGIO ANDRE","cuit":"0","titular":"BARCALA SERGIO ANDRE"},"53":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BARRAZA MARIA MATILD","cuit":"0","titular":"BARRAZA MARIA MATILD"},"54":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BARRERAS ALBERTO MIG","cuit":"0","titular":"BARRERAS ALBERTO MIG"},"56":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BASSINI MARIA PAULA","cuit":"0","titular":"BASSINI MARIA PAULA"},"57":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BAZAR EL MUNDIAL S.R","cuit":"0","titular":"BAZAR EL MUNDIAL S.R"},"58":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BEITIA LUIS ALBERTO","cuit":"0","titular":"BEITIA LUIS ALBERTO"},"59":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BENGOCHEA SUSANA MAR","cuit":"0","titular":"BENGOCHEA SUSANA MAR"},"60":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"BERESFORD S.A.","cuit":"0","titular":"BERESFORD S.A"},"61":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BETTOMEO ROBERTO SAN","cuit":"0","titular":"BETTOMEO ROBERTO SAN"},"62":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BIANCHI LUCIANO SEBA","cuit":"0","titular":"BIANCHI LUCIANO SEBA"},"63":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BONIFACIO LILIANA","cuit":"0","titular":"BONIFACIO LILIANA"},"64":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BONINI JUAN CARLOS","cuit":"0","titular":"BONINI JUAN CARLOS"},"65":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"BORIONI JUAN PABLO","cuit":"0","titular":"BORIONI JUAN PABLO"},"66":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CONSULTORA RH -TRES ","cuit":"0","titular":"BORRA JORGE RENATO"},"67":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BRAJOVICH GUILLERMO ","cuit":"0","titular":"BRAJOVICH GUILLERMO "},"68":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BRAVO CARLOS-MARQUIS","cuit":"0","titular":"BRAVO CARLOS-MARQUIS"},"69":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BREA DIEGO ALBERTO","cuit":"0","titular":"BREA DIEGO ALBERTO"},"70":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BREA OMAR","cuit":"0","titular":"BREA OMAR"},"71":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BUSTOS SILVINA LILIA","cuit":"0","titular":"BUSTOS SILVINA LILIA"},"72":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CABANE OSMAR ALBERTO","cuit":"0","titular":"CABANE OSMAR ALBERTO"},"74":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CAMBEX S.A.","cuit":"0","titular":"CAMBEX S.A."},"75":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CAMPAGNE MARIO CESAR","cuit":"0","titular":"CAMPAGNE MARIO CESAR"},"77":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CAMPOS CARMEN","cuit":"0","titular":"CAMPOS CARMEN"},"78":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CAMUS FLORENCIA AGUS","cuit":"0","titular":"CAMUS FLORENCIA AGUS"},"80":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Venecia Turismo","cuit":"0","titular":"CARRACEDO NORMA"},"81":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CARRERA HNOS.","cuit":"0","titular":"CARRERA HNOS."},"82":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CARRERA MARIA INES","cuit":"0","titular":"CARRERA MARIA INES"},"83":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CARRERA NELIDA SUSAN","cuit":"0","titular":"CARRERA NELIDA SUSAN"},"84":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CARRERA Y SALDUNA SO","cuit":"0","titular":"CARRERA Y SALDUNA SO"},"86":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CASA HUMBERTO LUCAIO","cuit":"0","titular":"CASA HUMBERTO LUCAIO"},"87":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CASTRO NELLY","cuit":"0","titular":"CASTRO NELLY"},"88":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CATALANO MAURO ELIO","cuit":"0","titular":"CATALANO MAURO ELIO"},"89":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CENTRO ACOPIADORES C","cuit":"0","titular":"CENTRO ACOPIADORES C"},"90":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CENTRO BULONERO TS.A","cuit":"0","titular":"CENTRO BULONERO TS.A"},"91":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CEPEDA MARISOL GRACI","cuit":"0","titular":"CEPEDA MARISOL GRACI"},"92":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CEPEDA SILVIA MARIA","cuit":"0","titular":"CEPEDA SILVIA MARIA"},"93":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CEREALERA TRES ARROY","cuit":"0","titular":"CEREALERA TRES ARROY"},"94":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CERIANI NANCY GRACIE","cuit":"0","titular":"CERIANI NANCY GRACIE"},"95":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"La Atomica Carlos Ce","cuit":"0","titular":"CERRI CARLOS E HIJOS"},"96":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CERVINI MARIA SUSANA","cuit":"0","titular":"CERVINI MARIA SUSANA"},"97":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"CIA.DE SEG.LA MERCAN","cuit":"0","titular":"CIA.DE SEG.LA MERCAN"},"98":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Agustin Clerch","cuit":"0","titular":"CLERCH AGUSTIN"},"99":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Clerch Ignacio Agust","cuit":"0","titular":"CLERCH IGNACIO"},"100":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CLUB DE CAZADORES DE","cuit":"0","titular":"CLUB DE CAZADORES DE"},"102":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"COLANTONIO JOSE A.Y ","cuit":"0","titular":"COLANTONIO JOSE A.Y "},"104":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"COLLAZOS ALDO O.","cuit":"0","titular":"COLLAZOS ALDO O."},"106":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"COLONNA OMAR RODOLFO","cuit":"0","titular":"COLONNA OMAR RODOLFO"},"107":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"COMASA S.A.","cuit":"0","titular":"COMASA S.A."},"108":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"COMPA\\u00d1IA EURO SRL.","cuit":"0","titular":"COMPA\\u00d1IA EURO SRL."},"109":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CONFITERIA LA PERLA ","cuit":"0","titular":"CONFITERIA LA PERLA "},"111":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CONTRERAS LUIS ALBER","cuit":"0","titular":"CONTRERAS LUIS ALBER"},"112":{"ModImpo":"Si","Empresa":"Actualizada","imp":200,"Medidor":"Actualizado","denominacion":"Cooperativa Agraria ","cuit":"0","titular":"COOP.AGRARIA DE TS.A"},"113":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"COOP.DE TRANSP.DE TS","cuit":"0","titular":"COOP.DE TRANSP.DE TS"},"114":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"COOP.ELECT.LTDA.DE C","cuit":"0","titular":"COOP.ELECT.LTDA.DE C"},"115":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"COOP.RURAL LTDA.ALFA","cuit":"0","titular":"COOP.RURAL LTDA.ALFA"},"116":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Hugo Costanzo","cuit":"0","titular":"COSTANZO HUGO JUAN"},"118":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CREDIL S.R.L.","cuit":"0","titular":"CREDIL S.R.L."},"119":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CUMECHE SRL","cuit":"0","titular":"CUMECHE S.R.L."},"120":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DABIEN DE CHIRINO MA","cuit":"0","titular":"DABIEN DE CHIRINO MA"},"121":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DAGUERRE CRISTINA JO","cuit":"0","titular":"DAGUERRE CRISTINA JO"},"122":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DATRI SANDRA","cuit":"0","titular":"D''ATRI SANDRA ELIZAB"},"123":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Parque Hotel","cuit":"0","titular":"DAWSON S.A."},"126":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DE LA CAL FRANCISCO","cuit":"0","titular":"DE LA CAL FRANCISCO"},"127":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DE LA PENNA JUAN CAR","cuit":"0","titular":"DE LA PENNA JUAN CAR"},"128":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SEGURID. FENIX S.A","cuit":"0","titular":"DE LA PENNA SEGURID."},"129":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Perfumeria Beatriz","cuit":"0","titular":"DE MARTINO MARIA EST"},"130":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DE ZOETE SANDRA MARI","cuit":"0","titular":"DE ZOETE SANDRA MARI"},"131":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DEJEAN ROBERTO OSCAR","cuit":"0","titular":"DEJEAN ROBERTO OSCAR"},"132":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DEL CASTA\\u00d1O ANGEL R","cuit":"0","titular":"DEL CASTA\\u00d1O ANGEL R"},"133":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DEL GRANDE SERGIO FA","cuit":"0","titular":"DEL GRANDE SERGIO FA"},"134":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DEL VALLE MARIA LOUR","cuit":"0","titular":"DEL VALLE MARIA LOUR"},"135":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DEL VALLE NELSON BER","cuit":"0","titular":"DEL VALLE NELSON BER"},"136":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Delgado Sonia Alejan","cuit":"0","titular":"DELGADO SONIA ALEJAN"},"138":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI CROCE CLAUDIA ALE","cuit":"0","titular":"DI CROCE CLAUDIA ALE"},"139":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Trelactea","cuit":"0","titular":"DI CROCE LAURA OFELI"},"140":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MORA","cuit":"0","titular":"DI FELICE DORA NOEMI"},"141":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI FULVIO LUIS EUGEN","cuit":"0","titular":"DI FULVIO LUIS EUGEN"},"142":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI MARCO JUAN E.","cuit":"0","titular":"DI MARCO JUAN E."},"143":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI ROCCO MARIA CECIL","cuit":"0","titular":"DI ROCCO MARIA CECIL"},"144":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DI SALVO GUILLERMO E","cuit":"0","titular":"DI SALVI GUILLERMO E"},"145":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI SALVO GRACIELA ES","cuit":"0","titular":"DI SALVO GRACIELA ES"},"146":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI SALVO S.A.","cuit":"0","titular":"DI SALVO S.A."},"147":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DI TOMMASO MARIO Y T","cuit":"0","titular":"DI TOMMASO MARIO Y T"},"148":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DI VITO CARMELO A.","cuit":"0","titular":"DI VITO CARMELO A."},"149":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI VITO CLAUDIA SUSA","cuit":"0","titular":"DI VITO CLAUDIA SUSA"},"150":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DIAZ RAUL ALBERTO","cuit":"0","titular":"DIAZ RAUL ALBERTO"},"151":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DIFONZO & MARCHI","cuit":"0","titular":"DIFONZO & MARCHI"},"154":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TRIBI\\u00d1O ALBERTO","cuit":"0","titular":"DUCHOSAL VERONICA"},"155":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DUPUY STELLA MARIS","cuit":"0","titular":"DUPUY STELLA MARIS"},"156":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"EICHLER EDUARDO HUGO","cuit":"0","titular":"EICHLER EDUARDO HUGO"},"157":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ELCUAZ HECTOR A.","cuit":"0","titular":"ELCUAZ HECTOR A."},"158":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ELGART REYNALDO E Y ","cuit":"0","titular":"ELGART REYNALDO E Y "},"159":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ELGART VERONICA Y EL","cuit":"0","titular":"ELGART VERONICA Y EL"},"160":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ELICALDE NESTOR JUAN","cuit":"0","titular":"ELICALDE NESTOR JUAN"},"161":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ERRAZU MARIA EMILIA","cuit":"0","titular":"ERRAZU MARIA EMILIA"},"162":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ESPELUSE RODOLFO Y C","cuit":"0","titular":"ESPELUSE RODOLFO Y C"},"163":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ETCHEVERRY ALFREDO J","cuit":"0","titular":"ETCHEVERRY ALFREDO J"},"164":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ETERNET S.R.L.","cuit":"0","titular":"ETERNET S.R.L."},"165":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"EXPRESO EL VASQUITO ","cuit":"0","titular":"EXPRESO EL VASQUITO "},"166":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FAGEMAR S.A.","cuit":"0","titular":"FAGEMAR S.A."},"167":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"FAMTEX S.R.L.","cuit":"0","titular":"FAMTEX S.R.L."},"169":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FARINA AMERICO","cuit":"0","titular":"FARINA AMERICO"},"170":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FARMACIA TRES ARROYO","cuit":"0","titular":"FARMACIA TRES ARROYO"},"171":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Marco Polo","cuit":"0","titular":"FERNANDEZ JAVIER EDU"},"172":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERNANDEZ CRISTINA","cuit":"0","titular":"FERNANDEZ MARIA CRIS"},"173":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERNANDEZ MIGUEL ANG","cuit":"0","titular":"FERNANDEZ MIGUEL ANG"},"174":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERNANDEZ RODOLFO Y ","cuit":"0","titular":"FERNANDEZ RODOLFO Y "},"175":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"FERNANDEZ VILLANUEVA","cuit":"0","titular":"FERNANDEZ VILLANUEVA"},"176":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERRARI RICARDO DOMI","cuit":"0","titular":"FERRARI RICARDO DOMI"},"177":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"REFRESH","cuit":"0","titular":"FERRARIO GUILLERMO E"},"178":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERRARIO GUSTAVO ADR","cuit":"0","titular":"FERRARIO GUSTAVO ADR"},"185":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FOSQUE MARIA ADELA","cuit":"0","titular":"FOSQUE MARIA ADELA"},"186":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"FRIGORIFICO CAPRIATA","cuit":"0","titular":"FRIGORIFICO CAPRIATA"},"187":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FUCHS SANDRA CECILIA","cuit":"0","titular":"FUCHS SANDRA CECILIA"},"189":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"La casa del pantalon","cuit":"0","titular":"GALILEA EUGENIO HECT"},"190":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GALLARDO JAVIER NEST","cuit":"0","titular":"GALLARDO JAVIER NEST"},"192":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Ganim Nestor Hugo","cuit":"0","titular":"GANIM NESTOR HUGO"},"193":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Elsa Maria Garat","cuit":"0","titular":"GARAT ELSA MARIA"},"194":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Childrens Wish","cuit":"0","titular":"GARCIA ANA CAROLINA"},"195":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GARCIA GABRIEL Y GUS","cuit":"0","titular":"GARCIA GABRIEL Y GUS"},"196":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GARCIA ROCIO","cuit":"0","titular":"GARCIA MARCONI ROCIO"},"197":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GARCIA MARIA DEL CAR","cuit":"0","titular":"GARCIA MARIA DEL CAR"},"198":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GARCIA MAURICIO DAVI","cuit":"0","titular":"GARCIA MAURICIO DAVI"},"199":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GARCIA SERGIO RAUL","cuit":"0","titular":"GARCIA SERGIO RAUL"},"200":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Amestoy Automotores ","cuit":"0","titular":"GASANEO Y AMESTOY"},"201":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GASPAROLI ANA TERESA","cuit":"0","titular":"GASPAROLI ANA TERESA"},"202":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GEJO RUBEN Y RODOLFO","cuit":"0","titular":"GEJO RUBEN Y RODOLFO"},"203":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GENOVESI HNOS.S.R.L","cuit":"0","titular":"GENOVESI HNOS.S.R.L"},"204":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GIACOMINO ANDREA SUS","cuit":"0","titular":"GIACOMINO ANDREA SUS"},"206":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Acosta Juan Enrique","cuit":"0","titular":"GIDINI MARGARITA AGU"},"207":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GIMNASIO STADIUM","cuit":"0","titular":"GIMNASIO STADIUM"},"209":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GIULIANI HECTOR Y LU","cuit":"0","titular":"GIULIANI HECTOR Y LU"},"210":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ JORGE VENTU","cuit":"0","titular":"GONZALEZ JORGE VENTU"},"211":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ LUIS ALBERT","cuit":"0","titular":"GONZALEZ LUIS ALBERT"},"212":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ MARCELO GAB","cuit":"0","titular":"GONZALEZ MARCELO GAB"},"213":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ MARCELO OSC","cuit":"0","titular":"GONZALEZ MARCELO OSC"},"214":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ MARIA LAURA","cuit":"0","titular":"GONZALEZ MARIA LAURA"},"215":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GRANDA LUCIANO","cuit":"0","titular":"GRANDA LUCIANO"},"216":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GROSSO CLAUDIA LUJAN","cuit":"0","titular":"GROSSO CLAUDIA LUJAN"},"217":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GRUAS Y MONTAJES IOR","cuit":"0","titular":"GRUAS Y MONTAJES IOR"},"218":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GUAZZORA ELSA CELICA","cuit":"0","titular":"GUAZZORA ELSA CELICA"},"219":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GUILLERMO ECHEVARRIA","cuit":"0","titular":"GUILLERMO ECHEVARRIA"},"220":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GUISASOLA MARIA LEON","cuit":"0","titular":"GUISASOLA MARIA LEON"},"222":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GUSTAVO FIORDA MAQUI","cuit":"0","titular":"GUSTAVO FIORDA MAQUI"},"223":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"HERNANDEZ HUGO SEBAS","cuit":"0","titular":"HERNANDEZ HUGO SEBAS"},"224":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"HERRERA F-HERRERA N-","cuit":"0","titular":"HERRERA F-HERRERA N-"},"225":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"HERRERO RAUL MARIO","cuit":"0","titular":"HERRERO RAUL MARIO"},"226":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MACHADO ROBERTO OSCA","cuit":"0","titular":"HID MARIO HORACIO"},"227":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Marea","cuit":"0","titular":"HIDALGO MARIA EUGENI"},"229":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"HOJOBAR S.A.","cuit":"0","titular":"HOJOBAR S.A."},"230":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"HOLLENDER PEDRO MARC","cuit":"0","titular":"HOLLENDER PEDRO MARC"},"232":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"IELMINI NELIDA ESTER","cuit":"0","titular":"IELMINI NELIDA ESTER"},"234":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"INGENERARE SRL","cuit":"0","titular":"INGENERARE SRL"},"235":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"INSTITUTO BIOQUIMICO","cuit":"0","titular":"INSTITUTO BIOQUIMICO"},"236":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"IRIART FERNANDO RAUL","cuit":"0","titular":"IRIART FERNANDO RAUL"},"237":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"IRIBARNE EDUARDO","cuit":"0","titular":"IRIBARNE EDUARDO"},"239":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ISMAEL CLAUDIO ANIBA","cuit":"0","titular":"ISMAEL CLAUDIO ANIBA"},"240":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ITALIANI MARIA ELENA","cuit":"0","titular":"ITALIANI MARIA ELENA"},"241":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VETERINARIA EL MOLIN","cuit":"0","titular":"ITURBURU MARIA ISABE"},"242":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JACOBSEN ANDRES RAUL","cuit":"0","titular":"JACOBSEN ANDRES RAUL"},"243":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JALLE ANDRES","cuit":"0","titular":"JALLE ANDRES"},"244":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JAUREGUIBEHERE LIA M","cuit":"0","titular":"JAUREGUIBEHERE LIA M"},"245":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JEANNERET JULIO","cuit":"0","titular":"JEANNERET JULIO"},"246":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JORGE ALBERTO","cuit":"0","titular":"JORGE ALBERTO"},"247":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"EDUARDO SANTIAGO JUA","cuit":"0","titular":"JUAN EDUARDO"},"248":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Pizza 3","cuit":"0","titular":"JURORUSA S.A"},"249":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"LA AGRICOLA GANAD.DE","cuit":"0","titular":"LA AGRICOLA GANAD.DE"},"250":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LA CASA DE LOS BULON","cuit":"0","titular":"LA CASA DE LOS BULON"},"251":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"LA PERSEVERANCIA SEG","cuit":"0","titular":"LA PERSEVERANCIA SEG"},"252":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LABORDE CARLOS ALBER","cuit":"0","titular":"LABORDE CARLOS ALBER"},"253":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"LAGO S.A.","cuit":"0","titular":"LAGO S.A."},"254":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LAMBERTA JORGE MIGUE","cuit":"0","titular":"LAMBERTA JORGE MIGUE"},"255":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LANCE FABIANA","cuit":"0","titular":"LANCE FABIANA"},"256":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LARA ROBERTO MARCELO","cuit":"0","titular":"LARA ROBERTO MARCELO"},"257":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LARRIESTRA BEATRIZ C","cuit":"0","titular":"LARRIESTRA BEATRIZ C"},"258":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LARSEN CESAR GERARDO","cuit":"0","titular":"LARSEN CESAR GERARDO"},"259":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LAS MECHAS SOCIEDAD ","cuit":"0","titular":"LAS MECHAS SOCIEDAD "},"260":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LATORRE ALEJANDRO MA","cuit":"0","titular":"LATORRE ALEJANDRO MA"},"261":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LATORRE JOAQUIN IGNA","cuit":"0","titular":"LATORRE JOAQUIN IGNA"},"262":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LAVANDERIA TRES ARRO","cuit":"0","titular":"LAVANDERIA TRES ARRO"},"264":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Dragon Rojo","cuit":"0","titular":"LEGUIZAMON CLAUDIA I"},"265":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Leguizamon Esteban H","cuit":"0","titular":"LEGUIZAMON ESTEBAN H"},"266":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LETAMENDI LUIS ANGEL","cuit":"0","titular":"LETAMENDI LUIS ANGEL"},"267":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LIEBANA JORGE F.","cuit":"0","titular":"LIEBANA JORGE F."},"268":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LIFIRON S.A.","cuit":"0","titular":"LIFIRON S.A"},"269":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LLANOS ALICIA CLALFI","cuit":"0","titular":"LLANOS ALICIA CLALFI"},"270":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LOFIEGO JOSE JUIS","cuit":"0","titular":"LOFIEGO JOSE JUIS"},"271":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LOPEZ IRMA ELENA","cuit":"0","titular":"LOPEZ IRMA ELENA"},"272":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LOPEZ NESTOR FABIAN","cuit":"0","titular":"LOPEZ NESTOR FABIAN"},"273":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LOSADA RICARDO OSVAL","cuit":"0","titular":"LOSADA RICARDO OSVAL"},"274":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Despensa El Gauchito","cuit":"0","titular":"LUCERO OLGA"},"275":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"LUIS BLANCO S.A","cuit":"0","titular":"LUIS BLANCO S.A"},"276":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MACHADO ROBERTO OSCA","cuit":"0","titular":"MACHADO ROBERTO OSCA"},"277":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"MACIEL HERMANOS S.A.","cuit":"0","titular":"MACIEL HERMANOS S.A."},"278":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MADERAS S. JOSE DE L","cuit":"0","titular":"MADERAS S. JOSE DE L"},"279":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"M.A.M. S.A.","cuit":"0","titular":"M.A.M. S.A."},"280":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MARINO MONICA GRACIE","cuit":"0","titular":"MARINO MONICA GRACIE"},"281":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MARTINEZ CLAUDIO NES","cuit":"0","titular":"MARTINEZ CLAUDIO NES"},"282":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MARTINEZ DE CAMPOS A","cuit":"0","titular":"MARTINEZ DE CAMPOS A"},"283":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Agromar SA","cuit":"0","titular":"MARTINEZ FRANKLIN SE"},"284":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Compu3","cuit":"0","titular":"MARTINEZ GUILLERMO O"},"285":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MARTINEZ JULIO CESAR","cuit":"0","titular":"MARTINEZ JULIO CESAR"},"286":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MASCHI EDUARDO ERNES","cuit":"0","titular":"MASCHI EDUARDO ERNES"},"287":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MASTROSIMONE GUSTAVO","cuit":"0","titular":"MASTROSIMONE GUSTAVO"},"289":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MAYER RICARDO AUTOMO","cuit":"0","titular":"MAYER RICARDO AUTOMO"},"290":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MENNA ELIANA ANDREA","cuit":"0","titular":"MENNA ELIANA ANDREA"},"291":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MENNA CEREALES","cuit":"0","titular":"MENNA JOSE ANGEL"},"292":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MENNA LORENZO N.","cuit":"0","titular":"MENNA LORENZO N."},"293":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MEO GUZMAN ENRIQUE F","cuit":"0","titular":"MEO GUZMAN ENRIQUE F"},"294":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MERLINO PLAN S.A.","cuit":"0","titular":"MERLINO PLAN S.A."},"295":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MERLO CARMEN HERMINI","cuit":"0","titular":"MERLO CARMEN HERMINI"},"296":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MESA DE FORCHETTI MO","cuit":"0","titular":"MESA DE FORCHETTI MO"},"297":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Miedan, Ana Karina","cuit":"0","titular":"MIEDAN ANA KARINA"},"298":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MILLA SUR S.A.","cuit":"0","titular":"MILLA SUR S.A."},"299":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MIO FIGLIO","cuit":"0","titular":"MIO FIGLIO  S.R.L."},"300":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MOIRANO EVELIA LILIA","cuit":"0","titular":"MOIRANO EVELIA LILIA"},"301":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MOIZZI JUAN JOSE","cuit":"0","titular":"MOIZZI JUAN JOSE"},"303":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"METALURGICA MOLINA","cuit":"0","titular":"MOLINA EUGENIO ALFRE"},"304":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MOLINA HECTOR MARIAN","cuit":"0","titular":"MOLINA HECTOR MARIAN"},"305":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MOLINOS TRES ARROYOS","cuit":"0","titular":"MOLINOS TRES ARROYOS"},"306":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MOLINOS ZALLA S.A","cuit":"0","titular":"MOLINOS ZALLA S.A."},"307":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MOLLER GUSTAVO","cuit":"0","titular":"MOLLER ARTURO"},"308":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MONSALVO MARIA DE LO","cuit":"0","titular":"MONSALVO MARIA DE LO"},"309":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MONTESINOS JOSE MANU","cuit":"0","titular":"MONTESINOS JOSE MANU"},"310":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MORAN JORGE ANTONIO","cuit":"0","titular":"MORAN JORGE ANTONIO"},"312":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DE BENEDETTO AUGUSTO","cuit":"0","titular":"MUNGAI MARIA MERCEDE"},"314":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"NALDO LOMBARDI S.A","cuit":"0","titular":"NALDO LOMBARDI S.A"},"315":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"NIKRO S.A","cuit":"0","titular":"NIKRO S.A"},"316":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"NOICSA S.A.","cuit":"0","titular":"NOICSA S.A."},"317":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Mera Fernando Omar","cuit":"0","titular":"NOVILLO VIRGINIA VER"},"318":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"OHACO RAUL BAUTISTA","cuit":"0","titular":"OHACO RAUL BAUTISTA"},"319":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"OLEOHIDRAULICA DI RO","cuit":"0","titular":"OLEOHIDRAULICA DI RO"},"320":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"OLOCCO BARTOLO","cuit":"0","titular":"OLOCCO BARTOLO"},"321":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"OLSEN CRISTIAN","cuit":"0","titular":"OLSEN CRISTIAN"},"322":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ONGARINI LIVIO","cuit":"0","titular":"ONGARINI LIVIO"},"323":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Tito Otero","cuit":"0","titular":"OTERO OSCAR ALBERTO"},"324":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PALLA SILVIA CRISTIN","cuit":"0","titular":"PALLA SILVIA CRISTIN"},"325":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"PALLADINO  S.A.","cuit":"0","titular":"PALLADINO  S.A."},"326":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PALMA NORA","cuit":"0","titular":"PALMA NORA"},"327":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PASCUAL SILVIA ADRIA","cuit":"0","titular":"PASCUAL SILVIA ADRIA"},"328":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PAZOS DE VELOSO MABE","cuit":"0","titular":"PAZOS DE VELOSO MABE"},"329":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PC TRUCKS TRES ARROY","cuit":"0","titular":"PC TRUCKS TRES ARROY"},"330":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEQUE\\u00d1O JOSE","cuit":"0","titular":"PEQUE\\u00d1O JOSE"},"331":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FLYING MOTORS","cuit":"0","titular":"PEREYRA ESTEBAN CEFE"},"332":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"PEREZ DALSGAARD Y CI","cuit":"0","titular":"PEREZ DALSGAARD Y CI"},"333":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ GUILLERMO LUIS","cuit":"0","titular":"PEREZ GUILLERMO LUIS"},"334":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ GUSTAVO MIGUEL","cuit":"0","titular":"PEREZ GUSTAVO MIGUEL"},"335":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ MARIA ISABEL","cuit":"0","titular":"PEREZ MARIA ISABEL"},"336":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ NELSON ADRIAN","cuit":"0","titular":"PEREZ NELSON ADRIAN"},"337":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ PAULA ANDREA","cuit":"0","titular":"PEREZ PAULA ANDREA"},"338":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Gestion Inmobiliaria","cuit":"0","titular":"PEREZ RAUL MARTIN"},"339":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PERTICARARI JUAN PAB","cuit":"0","titular":"PERTICARARI JUAN PAB"},"340":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"PETELA HECTOR","cuit":"0","titular":"PETELA HECTOR"},"341":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PIERINI CARLOS FABIA","cuit":"0","titular":"PIERINI CARLOS FABIA"},"342":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"PINTURERIAS RUCCI S.","cuit":"0","titular":"PINTURERIAS RUCCI S."},"343":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PIROSANTO CAMILO ALD","cuit":"0","titular":"PIROSANTO CAMILO ALD"},"344":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PODESTA MARIANA","cuit":"0","titular":"PODESTA MARIANA"},"345":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PONCE EDUARDO ESTEBA","cuit":"0","titular":"PONCE EDUARDO ESTEBA"},"346":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"POULSEN PEDRO-CAZEAU","cuit":"0","titular":"POULSEN PEDRO-CAZEAU"},"347":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Bodycare","cuit":"0","titular":"POZZOLI LAURA CECILI"},"349":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PRIETO JUAN JOSE","cuit":"0","titular":"PRIETO JUAN JOSE"},"350":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PROCACCINI FRANCISCO","cuit":"0","titular":"PROCACCINI FRANCISCO"},"351":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"QUIMICA MOLERO S.R.L","cuit":"0","titular":"QUIMICA MOLERO S.R.L"},"353":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RANZINI MATIAS FEDER","cuit":"0","titular":"RANZINI MATIAS FEDER"},"355":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RAVELLA RICARDO H.","cuit":"0","titular":"RAVELLA RICARDO H."},"356":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RE MARIO CESAR","cuit":"0","titular":"RE MARIO CESAR"},"357":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RECARI MARIANO (Pana","cuit":"0","titular":"RECARI MARIANO"},"358":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"REFAFLOTO S.A.","cuit":"0","titular":"REFAFLOTO S.A"},"359":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RENDO DE PODESTA IRM","cuit":"0","titular":"RENDO DE PODESTA IRM"},"360":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"REY ANA MARIA","cuit":"0","titular":"REY ANA MARIA"},"361":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RIDINO EDUARDO","cuit":"0","titular":"RIDINO EDUARDO NICOL"},"363":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ROAS SACIF","cuit":"0","titular":"ROAS SACIF"},"364":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RODERA FRANCISCO Y J","cuit":"0","titular":"RODERA FRANCISCO Y J"},"365":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Penelope Lanas","cuit":"0","titular":"RODRIGUEZ ELSA TERES"},"366":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RODRIGUEZ TERESA ANG","cuit":"0","titular":"RODRIGUEZ TERESA ANG"},"367":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ROLANDO LUIS ROBERTO","cuit":"0","titular":"ROLANDO LUIS ROBERTO"},"368":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGENCIA ISIDORO","cuit":"0","titular":"ROLDAN JUANA MARIELA"},"370":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RUBIO DANIEL CECILIO","cuit":"0","titular":"RUBIO DANIEL CECILIO"},"371":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RUTA 2 S.R.L.","cuit":"0","titular":"RUTA 2 S.R.L."},"372":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SABATINI MARCELO","cuit":"0","titular":"SABATINI MARCELO EDM"},"374":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SAEZ SILVIA NELLY","cuit":"0","titular":"SAEZ SILVIA NELLY"},"375":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SAGARDOY FERNANDO JO","cuit":"0","titular":"SAGARDOY FERNANDO JO"},"376":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SAINI SERGIO DANIEL","cuit":"0","titular":"SAINI SERGIO DANIEL"},"377":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SALOME JULIO","cuit":"0","titular":"SALOME JULIO"},"378":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SAN PELLEGRINI DE M.","cuit":"0","titular":"SAN PELLEGRINI DE M."},"379":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANCHEZ ELIZABETH","cuit":"0","titular":"SANCHEZ ELIZABETH"},"380":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANCHEZ MONICA LUJAN","cuit":"0","titular":"SANCHEZ MONICA LUJAN"},"381":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANCHEZ N.DE PEREYRA","cuit":"0","titular":"SANCHEZ N.DE PEREYRA"},"382":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Quintana Roberto Mar","cuit":"0","titular":"SANCINETO VICTOR MAR"},"383":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANDE JUAN JOSE","cuit":"0","titular":"SANDE JUAN JOSE"},"384":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SANI TRES S.A.","cuit":"0","titular":"SANI TRES S.A."},"385":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANTAJULIANA M. ALEJ","cuit":"0","titular":"SANTAGIULIANA MARIA "},"386":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANTIRSO MARIA ROSAN","cuit":"0","titular":"SANTIRSO MARIA ROSAN"},"387":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SAURO ROBERTO CESAR","cuit":"0","titular":"SAURO ROBERTO CESAR"},"388":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SCARCELLA DIEGO JOSE","cuit":"0","titular":"SCARCELLA DIEGO JOSE"},"389":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SCHENCH ANDREA FABIA","cuit":"0","titular":"SCHENCK ANDREA FABIA"},"390":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SCHUMACHER ALFREDO Y","cuit":"0","titular":"SCHUMACHER ALFREDO Y"},"391":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SEMILLERA PAMPA FERT","cuit":"0","titular":"SEMILLERA PAMPA FERT"},"392":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SEQUEIRA CARLOS ENRI","cuit":"0","titular":"SEQUEIRA CARLOS ENRI"},"393":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ESTUDIO PANDOLFO","cuit":"0","titular":"SERRANO ELSA GLORIA"},"394":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SISTEMAS TERMODINAMI","cuit":"0","titular":"SISTEMAS TERMODINAMI"},"395":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"BERTEL SKOU SAAII Y ","cuit":"0","titular":"SKOU BERTEL S.A."},"396":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SOBANSKI VICTOR ADOL","cuit":"0","titular":"SOBANSKI VICTOR ADOL"},"397":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SOC. DE TRANSP.LIBRE","cuit":"0","titular":"SOC. DE TRANSP.LIBRE"},"398":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Clinica Privada Hisp","cuit":"0","titular":"SOC.ESPA\\u00d1OLA DE S.M"},"399":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"RED 24","cuit":"0","titular":"SOCOLOFF MARTIN IVAN"},"400":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SODA LA HUELLA S.R.L","cuit":"0","titular":"SODA LA HUELLA S.R.L"},"401":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SODE HORACIO ABEL","cuit":"0","titular":"SODE HORACIO ABEL"},"402":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SORIANO MIGUEL ANGEL","cuit":"0","titular":"SORIANO MIGUEL ANGEL"},"403":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SORIANO RAFAEL","cuit":"0","titular":"SORIANO RAFAEL"},"404":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Panificadora San Jua","cuit":"0","titular":"SOULE SERGIO OSVALDO"},"405":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TORRES CARIONI MARIA","cuit":"0","titular":"SOUMOULOU PABLO HERN"},"406":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SPENZA MARIANO M.","cuit":"0","titular":"SPENZA MARIANO MARTI"},"408":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"STARCEL PAMPA CENTRO","cuit":"0","titular":"STARCEL PAMPA CENTRO"},"410":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SUAREZ ADELA JOSEFIN","cuit":"0","titular":"SUAREZ ADELA JOSEFIN"},"411":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SUAREZ JORGE EDUARDO","cuit":"0","titular":"SUAREZ JORGE EDUARDO"},"412":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SUPERCARNE S.A.","cuit":"0","titular":"SUPERCARNE S.A."},"413":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SUPERMERCADO PLANETA","cuit":"0","titular":"SUPERMERCADO PLANETA"},"414":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SUR AGROPECUARIA S.A","cuit":"0","titular":"SUR AGROPECUARIA S.A"},"415":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Sandra Marisa Rivero","cuit":"0","titular":"TARABORELLI ALEJANDR"},"416":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TARABORELLI MARIO JE","cuit":"0","titular":"TARABORELLI MARIO JE"},"417":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TARANTELA ELVIRA ELS","cuit":"0","titular":"TARANTELA ELVIRA ELS"},"418":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TARJETA NARANJA SA.","cuit":"0","titular":"TARJETA NARANJA SA."},"419":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Estacion de Servicio","cuit":"0","titular":"TARTAGLINO Y CIA. SR"},"420":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TEILETCHE ENRIQUE Y ","cuit":"0","titular":"TEILETCHE ENRIQUE Y "},"421":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RECICLADOS TRES ARRO","cuit":"0","titular":"TERRASANTA MONICA"},"422":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TIEMERSMA SEBASTIAN","cuit":"0","titular":"TIEMERSMA SEBASTIAN"},"423":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TORRES CARIONI SANTI","cuit":"0","titular":"TORRES CARIONI SANTI"},"425":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"TOSTEX S.A.","cuit":"0","titular":"TOSTEX S.A."},"426":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TRAFER SAIC","cuit":"0","titular":"TRAFER SAIC"},"427":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TRANSPORTE GOIZUETA","cuit":"0","titular":"TRANSPORTE GOIZUETA"},"428":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TRAVERSO GUILLERMO H","cuit":"0","titular":"TRAVERSO GUILLERMO H"},"429":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TRESNECO S.A.","cuit":"0","titular":"TRESNECO S.A."},"431":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TRUCK EXPRESS S.R.L.","cuit":"0","titular":"TRUCK EXPRESS S.R.L."},"432":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TUMINI D. Y J. Y MEN","cuit":"0","titular":"TUMINI D. Y J. Y MEN"},"433":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TURINI PABLO","cuit":"0","titular":"TURINI PABLO RENATO"},"434":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ULLERUP RAUL ADOLFO","cuit":"0","titular":"ULLERUP RAUL ADOLFO"},"435":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"UNIVALORES S.A.","cuit":"0","titular":"UNIVALORES S.A."},"436":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"URBAN ANDERSEN MARCO","cuit":"0","titular":"URBAN ANDERSEN MARCO"},"437":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"URBIETA ANDRES","cuit":"0","titular":"URBIETA ANDRES"},"438":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"URRUTIA MARIA MARTA","cuit":"0","titular":"URRUTIA MARIA MARTA"},"440":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"UZCUDUN S.A.F.I.M.","cuit":"0","titular":"UZCUDUN S.A.F.I.M."},"441":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"UZIDINGER EDUARDO NI","cuit":"0","titular":"UZIDINGER EDUARDO NI"},"442":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VACCA REINALDO RUBEN","cuit":"0","titular":"VACCA REINALDO RUBEN"},"443":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Automotores Vazquez","cuit":"0","titular":"VAZQUEZ MIGUEL ANGEL"},"444":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VERGNANO RAUL ANDRES","cuit":"0","titular":"VERGNANO RAUL ANDRES"},"445":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VERKUYL ASTRID CINTI","cuit":"0","titular":"VERKUYL ASTRID CINTI"},"447":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VIGILAN S.R.L.AG.DE ","cuit":"0","titular":"VIGILAN S.R.L.AG.DE "},"448":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VILLAFRANCA MARTA S.","cuit":"0","titular":"VILLAFRANCA MARTA S."},"449":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Viviana A Villalva","cuit":"0","titular":"VILLALBA JORGE ALFRE"},"450":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"VILLALBA PEDRO","cuit":"0","titular":"VILLALBA PEDRO"},"452":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VILLEMUR GUSTAVO MIG","cuit":"0","titular":"VILLEMUR GUSTAVO MIG"},"453":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VINOTECA LOS TONELES","cuit":"0","titular":"VINOTECA LOS TONELES"},"454":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VIVIANI CARMEN","cuit":"0","titular":"VIVIANI CARMEN"},"455":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VIZZOLINI NESTOR J.","cuit":"0","titular":"VIZZOLINI NESTOR J."},"456":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"WEHRHANNE HORACIO MA","cuit":"0","titular":"WEHRHANNE HORACIO MA"},"457":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"WEST FERNANDO LUIS","cuit":"0","titular":"WEST FERNANDO LUIS"},"458":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ZIJLSTRA JORGE ROBER","cuit":"0","titular":"ZIJLSTRA JORGE ROBER"},"459":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ZIJLSTRA SILVINA","cuit":"0","titular":"ZIJLSTRA SILVINA ELE"},"460":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ZORRILLA HNOS. S.R.L","cuit":"0","titular":"ZORRILLA HNOS. S.R.L"},"461":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ZOTES SAUL FRANCISCO","cuit":"0","titular":"ZOTES SAUL FRANCISCO"},"462":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ZURITA HNOS. Y CIA.","cuit":"0","titular":"ZURITA HNOS. Y CIA."},"463":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"18 DE SETIEMBRE S.A","cuit":"0","titular":"18 DE SETIEMBRE S.A"},"464":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"LASO - 3 ARROYOS S.A","cuit":"0","titular":"3 ARROYOS S.A."},"465":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"3 NET S.A.","cuit":"0","titular":"3 NET S.A."}}', 465, '2015-07-03 04:07:36', '""', 0, 0, 465, 411, 0, 0, 54);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medidor`
--

CREATE TABLE IF NOT EXISTS `medidor` (
  `idmedidor` int(11) NOT NULL AUTO_INCREMENT,
  `nomyap` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `domicilio` varchar(20) NOT NULL,
  `importepago` varchar(10) NOT NULL,
  `numusuario` varchar(11) NOT NULL,
  `numsuministro` varchar(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fechadeultimopago` date NOT NULL,
  PRIMARY KEY (`idmedidor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3816 ;

--
-- Volcado de datos para la tabla `medidor`
--

INSERT INTO `medidor` (`idmedidor`, `nomyap`, `telefono`, `domicilio`, `importepago`, `numusuario`, `numsuministro`, `activo`, `fechadeultimopago`) VALUES
(3347, 'ABELLEIRA FABIAN-LEN', '00015611812', 'COLON 239', '50', '484901', '7712', 1, '2015-07-03'),
(3348, 'ACA SALUD COOPERATIV', '0', 'CHACABUCO 549', '87', '549033', '45768', 1, '2015-07-03'),
(3349, 'ACMC S.R.L.', '00000000000', 'MORENO 423', '50', '5597630', '8242', 1, '2015-07-03'),
(3350, 'AGF ALLIANZ ARG.CIA ', '00000000000', 'MAIPU 80', '50', '543770', '7919', 1, '2015-07-03'),
(3351, 'AGRO EL CARRETERO S.', '00000431650', 'R.PEÃ‘A 14', '87', '342458', '16068', 1, '2015-07-03'),
(3352, 'AGRO INDUSTRIA TRES ', '00000434443', 'P.INDUSTRIAL', '50', '410854', '40121', 1, '2015-07-03'),
(3353, 'AGRO-GILARDONI S.R.L', '00000000000', 'ALMAFUERTE 3500', '87', '588393', '23756', 1, '2015-07-03'),
(3354, 'AGROPAL S.A.', '00000423718', 'BELGRANO 571', '50', '327253', '9806', 1, '2015-07-03'),
(3355, 'AGROPRIMUS S.A', '00000000000', 'P.INDUSTRIAL', '50', '565886', '40139', 1, '2015-07-03'),
(3356, 'AGUADAS GOMEZ HNOS S', '00000000000', 'V.SARSFIELD 998', '87', '593052', '14445', 1, '2015-07-03'),
(3357, 'AIELLO JOSE E HIJOS ', '00000431430', 'P.INDUSTRIAL', '250', '319766', '40126', 1, '2015-07-03'),
(3358, 'AIELLO NATALIO', '00000423249', 'BELGRANO 333', '50', '162926', '9372', 1, '2015-07-03'),
(3359, 'ALARCON ANA VERONICA', '00000000000', '25 DE MAYO 345', '50', '486165', '7044', 1, '2015-07-03'),
(3360, 'ALBA E.A.DE Y G.ALBA', '00000426691', 'PUEYRREDON 987', '50', '229401', '2864', 1, '2015-07-03'),
(3361, 'ALBA MIRTA GRACIELA', '00000000000', 'ALSINA 745', '50', '310499', '16149', 1, '2015-07-03'),
(3362, 'ALBERCA FACUNDO SEBA', '00000000000', 'COLON 876', '50', '557865', '1628', 1, '2015-07-03'),
(3364, 'ALEGRO MARIA ANTONEL', '00000000000', 'H.YRIGOYEN 237', '50', '592563', '7271', 1, '2015-07-03'),
(3366, 'ALEMANI CARLOS DANIE', '00000429412', 'BALCARCE 459', '50', '286808', '16858', 1, '2015-07-03'),
(3367, 'ALONSO CARLOS ALBERT', '00000000000', 'SAAVEDRA 1284', '50', '531689', '2628', 1, '2015-07-03'),
(3368, 'ALONSO MARIA ROSARIO', '00000000000', 'I.LA CATOLICA 758', '50', '475420', '17632', 1, '2015-07-03'),
(3369, 'ALTUNA CARLOS F.', '00000431392', 'BELGRANO 665', '87', '318219', '10030', 1, '2015-07-03'),
(3370, 'ALVARADO S.A.', '00000433163', 'ALSINA 235', '87', '374130', '15993', 1, '2015-07-03'),
(3371, 'ALVAREZ TARGISE JUAN', '00015458621', 'ISTILART 715', '50', '250359', '10157', 1, '2015-07-03'),
(3372, 'ANA JORGE OSCAR', '00000422426', 'COLON 156', '50', '202260', '8137', 1, '2015-07-03'),
(3373, 'ANDERBERG FERNANDO A', '00000431422', 'MORENO 126', '50', '400956', '8566', 1, '2015-07-03'),
(3374, 'ANDREATTA GRACIELA D', '00000000000', 'LAMADRID 685', '50', '477772', '15132', 1, '2015-07-03'),
(3375, 'ANTONIO MACIEL S.R.L', '428475-15647166', 'AV.TRABAJADOR 846', '50', '567806', '3314', 1, '2015-07-03'),
(3376, 'AQUATICA S.A. E/F.', '00000000000', 'RIVADAVIA 334', '87', '593775', '40018', 1, '2015-07-03'),
(3377, 'ARAMBERRI LUIS ALFRE', '00000425047', 'CASTELLI 802', '87', '475723', '3089', 1, '2015-07-03'),
(3378, 'ARANEGUI KARINA BEAT', '00000000000', 'GUEMES 109', '50', '5594571', '5350', 1, '2015-07-03'),
(3379, 'ARENAL PABLO E.', '00000423179', 'I.LA CATOLICA 84', '50', '184322', '17719', 1, '2015-07-03'),
(3380, 'ARENAS OSVALDO ARIEL', '00000431506', 'MORENO 1004', '87', '251981', '1428', 1, '2015-07-03'),
(3381, 'ARIAS AMALIA-GROENEN', '00000000000', 'H.YRIGOYEN 63', '50', '552671', '8109', 1, '2015-07-03'),
(3383, 'ARISTEGUI SERGIO FAB', '00000000000', 'COLON 442', '50', '406280', '7897', 1, '2015-07-03'),
(3384, 'ARNAIS FERNANDO ALFO', '00000000000', 'CASTELLI 66', '50', '529484', '6004', 1, '2015-07-03'),
(3385, 'ARRECHEA JUAN FRANCI', '15404190', 'BETOLAZA 461', '50', '5596670', '45939', 1, '2015-07-03'),
(3386, 'ARTURE DE MARTINEZ C', '00000424010', 'COLON 379', '87', '261704', '7736', 1, '2015-07-03'),
(3387, 'ASEF EDUARDO RUBEN', '00000000000', 'MAIPU 585', '50', '479239', '6413', 1, '2015-07-03'),
(3388, 'ASOC. DE ABOGADOS DE', '00000000000', 'BRANDSEN 474', '87', '320980', '8982', 1, '2015-07-03'),
(3389, 'ASOC. MUTUAL DAN', '00000431623', 'MORENO 114', '87', '172446', '8598', 1, '2015-07-03'),
(3390, 'ASOC.PRO ENSEÃ‘ANZA ', '00000432616', 'DERIVACION NÃ¸4', '50', '355139', '40148', 1, '2015-07-03'),
(3391, 'ASTIZ JORGE ARIEL', '00000000000', 'LIBERTAD 303', '50', '480961', '2372', 1, '2015-07-03'),
(3392, 'ASTIZ MARIANA', '00000000000', 'SAAVEDRA 399', '50', '561152', '6406', 1, '2015-07-03'),
(3393, 'ASTIZ MARIO SANTIAGO', '00000000000', 'TACUARI 436', '50', '502360', '14420', 1, '2015-07-03'),
(3394, 'AUSTRAL MOTOR S.A.', '00000425777', 'MAGALLANES 1560', '87', '403537', '20729', 1, '2015-07-03'),
(3395, 'AYALA RAMON ANDRES', '00000420868', 'PELLEGRINI 6', '50', '400682', '8423', 1, '2015-07-03'),
(3396, 'BAQUEDANO MARTIN', 'VIMAX50', 'RIVADAVIA 199', '50', '494737', '16309', 1, '2015-07-03'),
(3397, 'BARAINCA EDUARDO JUA', '00000429228', 'R.PEÃ‘A 67', '50', '314455', '16093', 1, '2015-07-03'),
(3398, 'BARCALA SERGIO ANDRE', '00000425339', 'FALUCHO 134', '50', '389538', '9343', 1, '2015-07-03'),
(3399, 'BARRAZA MARIA MATILD', '00000420311', 'RIVADAVIA 320', '50', '450195', '6995', 1, '2015-07-03'),
(3400, 'BARRERAS ALBERTO MIG', '00000000000', 'ISTILART 568', '50', '537320', '9727', 1, '2015-07-03'),
(3401, 'BARUTTA VERONICA BEA', '00000000000', 'FALUCHO 366', '50', '594482', '9291', 1, '2015-07-03'),
(3402, 'BASSINI MARIA PAULA', '00000433523', 'GOMILA 146', '50', '543552', '15360', 1, '2015-07-03'),
(3403, 'BAZAR EL MUNDIAL S.R', '00000424221', '9 DE JULIO 200', '50', '425089', '7535', 1, '2015-07-03'),
(3404, 'BEITIA LUIS ALBERTO', '00000430689', 'QUINTANA 836', '50', '361837', '15571', 1, '2015-07-03'),
(3405, 'BENGOCHEA SUSANA MAR', '00000000000', 'SARMIENTO 205', '50', '565684', '8637', 1, '2015-07-03'),
(3406, 'BERESFORD S.A', '00000424445', 'RIVADAVIA 399', '87', '5595861', '17068', 1, '2015-07-03'),
(3407, 'BETTOMEO ROBERTO SAN', '00000430873-15646873', 'ALMAFUERTE 436', '50', '329954', '21414', 1, '2015-07-03'),
(3408, 'BIANCHI LUCIANO SEBA', '00000000000', 'J.INGENIEROS 148', '50', '541268', '21022', 1, '2015-07-03'),
(3409, 'BONIFACIO LILIANA', '00000000000', 'H.YRIGOYEN 14', '50', '532530', '8062', 1, '2015-07-03'),
(3410, 'BONINI JUAN CARLOS', '00000000000', 'CHACABUCO 227', '50', '473237', '7383', 1, '2015-07-03'),
(3411, 'BORIONI JUAN PABLO', '00000431095', 'ISTILART 78', '87', '451873', '8476', 1, '2015-07-03'),
(3412, 'BORRA JORGE RENATO', '00000426033', 'DORREGO 379', '50', '236018', '6789', 1, '2015-07-03'),
(3413, 'BRAJOVICH GUILLERMO ', '00000000000', 'SARMIENTO 282', '50', '456894', '8797', 1, '2015-07-03'),
(3414, 'BRAVO CARLOS-MARQUIS', '00000000000', 'CALLE 1810 68', '50', '552192', '8516', 1, '2015-07-03'),
(3415, 'BREA DIEGO ALBERTO', '00000422844', 'CALLE 1810 876', '50', '258876', '10372', 1, '2015-07-03'),
(3416, 'BREA OMAR', '00000428150', 'O.DUGGAN 1165', '50', '193571', '11758', 1, '2015-07-03'),
(3417, 'BUSTOS SILVINA LILIA', '00015552287', 'CASTELLI 1525', '50', '572709', '3254', 1, '2015-07-03'),
(3418, 'CABANE OSMAR ALBERTO', '00000000000', 'RIVADAVIA 164', '50', '509415', '7660', 1, '2015-07-03'),
(3419, 'CALVETE ESTEBAN DANI', '00000000000', 'LAVALLE 835', '50', '384823', '5664', 1, '2015-07-03'),
(3420, 'CAMBEX S.A.', '00000431383', 'MAIPU 37', '87', '383187', '7933', 1, '2015-07-03'),
(3421, 'CAMPAGNE MARIO CESAR', '00000423600', 'RIVADAVIA 351', '50', '240451', '17060', 1, '2015-07-03'),
(3422, 'CAMPAÃ‘A GERMAN MARC', '00000000000', 'OLAVARRIA 564', '50', '533931', '10488', 1, '2015-07-03'),
(3423, 'CAMPOS CARMEN', '00000000000', 'MAIPU 770', '50', '397100', '5895', 1, '2015-07-03'),
(3424, 'CAMUS FLORENCIA AGUS', '00000000000', 'CHACABUCO 261', '50', '599849', '7394', 1, '2015-07-03'),
(3425, 'CARBONETTI SEBASTIAN', '00000000000', '9 DE JULIO 84', '50', '507466', '7965', 1, '2015-07-03'),
(3426, 'CARRACEDO NORMA', '00000000000', 'RECONQUISTA 1036', '50', '543813', '19381', 1, '2015-07-03'),
(3427, 'CARRERA HNOS.', '00000000000', 'SARMIENTO 1077', '87', '530536', '1358', 1, '2015-07-03'),
(3428, 'CARRERA MARIA INES', '00000000000', 'CALLE 1810 59', '50', '502041', '8498', 1, '2015-07-03'),
(3429, 'CARRERA NELIDA SUSAN', '00000000000', 'CHACABUCO 425', '50', '575146', '7415', 1, '2015-07-03'),
(3430, 'CARRERA Y SALDUNA SO', '00000000000', 'COLON 509', '50', '506906', '7764', 1, '2015-07-03'),
(3431, 'CARRIL CLAUDIA ANAHI', '00000000000', 'COLON 264', '87', '5596361', '8031', 1, '2015-07-03'),
(3432, 'CASA HUMBERTO LUCAIO', '00000000000', 'CALLE 1810 356', '50', '457660', '40043', 1, '2015-07-03'),
(3433, 'CASTRO NELLY', '00000000000', 'B.DE IRIGOYEN 868', '50', '573562', '12978', 1, '2015-07-03'),
(3434, 'CATALANO MAURO ELIO', '00000000000', 'RIVADAVIA 623', '50', '584210', '18114', 1, '2015-07-03'),
(3435, 'CENTRO ACOPIADORES C', '00000423801', 'P.N.CARRERA 142', '87', '290166', '7451', 1, '2015-07-03'),
(3436, 'CENTRO BULONERO TS.A', '00000421144', 'SAN MARTIN 632', '87', '427979', '15875', 1, '2015-07-03'),
(3437, 'CEPEDA MARISOL GRACI', '00000000000', 'ISTILART 23', '50', '573184', '8459', 1, '2015-07-03'),
(3438, 'CEPEDA SILVIA MARIA', '00000000000', 'CHACABUCO 469', '50', '603881', '7419', 1, '2015-07-03'),
(3439, 'CEREALERA TRES ARROY', '00000432670', 'SAN MARTIN 1725', '87', '407173', '40074', 1, '2015-07-03'),
(3440, 'CERIANI NANCY GRACIE', '00000000000', '25 DE MAYO 62', '50', '564834', '7331', 1, '2015-07-03'),
(3441, 'CERRI CARLOS E HIJOS', '00000430300', 'J.INGENIEROS 1000', '87', '395601', '40051', 1, '2015-07-03'),
(3442, 'CERVINI MARIA SUSANA', '00000000000', 'MAIPU 210', '50', '291987', '7205', 1, '2015-07-03'),
(3443, 'CIA.DE SEG.LA MERCAN', '00000000000', 'MORENO 511', '250', '484220', '40034', 1, '2015-07-03'),
(3444, 'CLERCH AGUSTIN', '00000000000', 'DERIVACION NÃ¸4', '50', '609160', '21539', 1, '2015-07-03'),
(3445, 'CLERCH IGNACIO', '00000000000', 'RECONQUISTA 430', '50', '485852', '17430', 1, '2015-07-03'),
(3446, 'CLUB DE CAZADORES DE', '00000431505', 'V.SARSFIELD 285', '50', '175564', '14265', 1, '2015-07-03'),
(3447, 'COCIMANO LAURA ANDRE', '00000422295', 'COLON 265', '50', '554330', '7717', 1, '2015-07-03'),
(3448, 'COLANTONIO JOSE A.Y ', '00000426300', 'GUEMES 199', '50', '243191', '5359', 1, '2015-07-03'),
(3449, 'COLL PATRICIA', '00000000000', 'L.V.LOPEZ 569', '50', '582649', '9779', 1, '2015-07-03'),
(3450, 'COLLAZOS ALDO O.', '00000426344', 'RIVADAVIA 609', '87', '176949', '18109', 1, '2015-07-03'),
(3451, 'COLOMBO OSCAR LUIS', '00000423665', 'SAAVEDRA 445', '50', '213370', '6556', 1, '2015-07-03'),
(3452, 'COLONNA OMAR RODOLFO', '00000430136', 'COLON 299', '50', '340672', '7726', 1, '2015-07-03'),
(3453, 'COMASA S.A.', '00000000000', '9 DE JULIO 231', '50', '505475', '7235', 1, '2015-07-03'),
(3454, 'COMPAÃ‘IA EURO SRL.', '00000000000', 'MORENO 350', '50', '485230', '8431', 1, '2015-07-03'),
(3455, 'CONFITERIA LA PERLA ', '00000423152', 'MORENO 155', '50', '164089', '8216', 1, '2015-07-03'),
(3456, 'CONTI Y MELITA', '00000424885', 'BOLIVIA 950', '50', '182201', '717', 1, '2015-07-03'),
(3457, 'CONTRERAS LUIS ALBER', '00000429318', 'PELLEGRINI 319', '50', '304951', '9271', 1, '2015-07-03'),
(3458, 'COOP.AGRARIA DE TS.A', '431340', 'ALSINA 1015', '200', '53862', '40067', 1, '2015-07-03'),
(3459, 'COOP.DE TRANSP.DE TS', '00000426287', 'MATHEU 850', '87', '80187', '2879', 1, '2015-07-03'),
(3460, 'COOP.ELECT.LTDA.DE C', '00000432743', 'PELLEGRINI 102', '250', '237549', '8761', 1, '2015-07-03'),
(3461, 'COOP.RURAL LTDA.ALFA', '00000431839', 'SAAVEDRA 398', '87', '79426', '6623', 1, '2015-07-03'),
(3462, 'COSTANZO HUGO JUAN', '00000425757', 'BERUTTI 210', '50', '220020', '10175', 1, '2015-07-03'),
(3463, 'COTABARREN DANIEL', '00000000000', 'QUINTANA 501', '87', '472517', '15482', 1, '2015-07-03'),
(3464, 'CREDIL S.R.L.', '00000433096', 'BETOLAZA 70', '50', '455334', '8195', 1, '2015-07-03'),
(3465, 'CUMECHE S.R.L.', '00000000000', 'SAN MARTIN 495', '87', '460963', '40056', 1, '2015-07-03'),
(3466, 'DABIEN DE CHIRINO MA', '00000000000', 'ROCA 174', '50', '340685', '8715', 1, '2015-07-03'),
(3467, 'DAGUERRE CRISTINA JO', '00000000000', 'MITRE 514', '50', '382047', '9466', 1, '2015-07-03'),
(3468, 'D''ATRI SANDRA ELIZAB', '00000000000', 'BALCARCE 179', '50', '405717', '16759', 1, '2015-07-03'),
(3469, 'DAWSON S.A.', '00000431350', 'PELLEGRINI 15', '87', '190886', '40037', 1, '2015-07-03'),
(3470, 'DE ADURIZ MARIA JULI', '432113', 'B.OBRERO CASA 78', '50', '495822', '571', 1, '2015-07-03'),
(3471, 'DE BENEDETTO JUAN CA', '0', 'RIVADAVIA 785', '50', '271253', '42940', 1, '2015-07-03'),
(3472, 'DE LA CAL FRANCISCO', '00000422647', 'O.DUGGAN 675', '50', '319346', '11517', 1, '2015-07-03'),
(3473, 'DE LA PENNA JUAN CAR', '00000430652', 'RIVADAVIA 602', '50', '322391', '6266', 1, '2015-07-03'),
(3474, 'DE LA PENNA SEGURID.', '00000000000', 'CASEROS 955', '50', '569275', '19276', 1, '2015-07-03'),
(3475, 'DE MARTINO MARIA EST', '00000000000', 'H.YRIGOYEN 62', '50', '333007', '8053', 1, '2015-07-03'),
(3476, 'DE ZOETE SANDRA MARI', '00000000000', 'ROCA 814', '50', '498041', '10325', 1, '2015-07-03'),
(3477, 'DEJEAN ROBERTO OSCAR', '432479', 'CONSTITUYENTES 75', '50', '399087', '1421', 1, '2015-07-03'),
(3478, 'DEL CASTAÃ‘O ANGEL R', '00000430224', 'COLON 347', '87', '418603', '7730', 1, '2015-07-03'),
(3479, 'DEL GRANDE SERGIO FA', '00000426311', 'MORENO 1317', '50', '438034', '1564', 1, '2015-07-03'),
(3480, 'DEL VALLE MARIA LOUR', '00000000000', 'RECONQUISTA 281', '50', '479529', '16778', 1, '2015-07-03'),
(3481, 'DEL VALLE NELSON BER', '00000429188', 'TACUARI 615', '50', '420097', '13680', 1, '2015-07-03'),
(3482, 'DELGADO SONIA ALEJAN', '15510949', 'PRINGLES 327', '50', '5595502', '47705', 1, '2015-07-03'),
(3483, 'DEMATEO ROBERTO PABL', '0', 'RIVADAVIA 1148', '50', '5594425', '41613', 1, '2015-07-03'),
(3484, 'DI CROCE CLAUDIA ALE', '00000000000', 'LAVALLE 402', '50', '537854', '6613', 1, '2015-07-03'),
(3485, 'DI CROCE LAURA OFELI', '00000000000', 'FALUCHO 204', '50', '431194', '9319', 1, '2015-07-03'),
(3486, 'DI FELICE DORA NOEMI', '00015612128', 'BETOLAZA 787', '50', '582955', '6000', 1, '2015-07-03'),
(3487, 'DI FULVIO LUIS EUGEN', '00000000000', '1RA.JUNTA 536', '50', '287355', '10675', 1, '2015-07-03'),
(3488, 'DI MARCO JUAN E.', '00000423489', 'SAN MARTIN 390', '50', '199791', '15905', 1, '2015-07-03'),
(3489, 'DI ROCCO MARIA CECIL', '00000430479', 'MORENO 953', '50', '448323', '1597', 1, '2015-07-03'),
(3490, 'DI SALVI GUILLERMO E', '00000000000', 'R.MARGARITA 1405', '87', '465492', '11855', 1, '2015-07-03'),
(3491, 'DI SALVO GRACIELA ES', '00000000000', 'GARIBALDI 2200', '50', '534097', '23689', 1, '2015-07-03'),
(3492, 'DI SALVO S.A.', '00000423884', 'CALLE 1810 951', '50', '257345', '10566', 1, '2015-07-03'),
(3493, 'DI TOMMASO MARIO Y T', '00000431022', 'ROCHA 10', '87', '307255', '40058', 1, '2015-07-03'),
(3494, 'DI VITO CARMELO A.', '00000424649', 'B.DE IRIGOYEN 51', '87', '200312', '15755', 1, '2015-07-03'),
(3495, 'DI VITO CLAUDIA SUSA', '00000000000', 'COLON 178', '50', '427429', '8133', 1, '2015-07-03'),
(3496, 'DIAZ RAUL ALBERTO', '15505542', 'G.MOSCONI 35', '50', '451642', '20774', 1, '2015-07-03'),
(3497, 'DIFONZO & MARCHI', '00000423658', '1RA.JUNTA 667', '87', '234304', '10664', 1, '2015-07-03'),
(3498, 'DIMARCO ADRIANA GABR', '0', '9 DE JULIO 117', '50', '532585', '41853', 1, '2015-07-03'),
(3499, 'DOMINGUEZ MARIELA PA', '15618871', 'COUNTRY ZURITA 1', '50', '589156', '42307', 1, '2015-07-03'),
(3500, 'DUCHOSAL VERONICA', '00000000000', 'COLON 526', '50', '459967', '7880', 1, '2015-07-03'),
(3501, 'DUPUY STELLA MARIS', '00000000000', 'V.SARSFIELD 9', '50', '570200', '14194', 1, '2015-07-03'),
(3502, 'EICHLER EDUARDO HUGO', '00000425209', 'RIVADAVIA 501', '50', '295422', '17743', 1, '2015-07-03'),
(3503, 'ELCUAZ HECTOR A.', '00000424193', 'P.N.CARRERA 899', '87', '195012', '5649', 1, '2015-07-03'),
(3504, 'ELGART REYNALDO E Y ', '00000000000', 'SAN MARTIN 835', '87', '555845', '15818', 1, '2015-07-03'),
(3505, 'ELGART VERONICA Y EL', '00000000000', 'L.V.LOPEZ 465', '50', '580430', '9554', 1, '2015-07-03'),
(3506, 'ELICALDE NESTOR JUAN', '00000000000', 'MORENO 379', '50', '406075', '8240', 1, '2015-07-03'),
(3507, 'ERRAZU MARIA EMILIA', '00000000000', 'COLON 286', '50', '588380', '8024', 1, '2015-07-03'),
(3508, 'ESPELUSE RODOLFO Y C', '00000000000', 'ISTILART 76', '87', '528041', '8477', 1, '2015-07-03'),
(3509, 'ETCHEVERRY ALFREDO J', '00000432289', 'I.LA CATOLICA 815', '50', '317078', '17572', 1, '2015-07-03'),
(3510, 'ETERNET S.R.L.', '00015513040', 'ISTILART 255', '87', '479587', '9030', 1, '2015-07-03'),
(3511, 'EXPRESO EL VASQUITO ', '00000000000', 'J.INGENIEROS 770', '50', '589387', '11998', 1, '2015-07-03'),
(3512, 'FAGEMAR S.A.', '00000000000', 'CHACABUCO 587', '50', '576909', '7441', 1, '2015-07-03'),
(3513, 'FAMTEX S.R.L.', '00000000000', 'COLON 131', '87', '499745', '7704', 1, '2015-07-03'),
(3514, 'FARIAS MIRTA ANGELIC', '00000000000', 'COLON 59', '50', '461247', '7698', 1, '2015-07-03'),
(3515, 'FARINA AMERICO', '00000423608', 'BETOLAZA 843', '50', '132756', '5774', 1, '2015-07-03'),
(3516, 'FARMACIA TRES ARROYO', '00000000000', 'SAN MARTIN 733', '50', '5594842', '15794', 1, '2015-07-03'),
(3517, 'FERNANDEZ JAVIER EDU', '00000000000', 'COLON 375', '50', '533944', '7734', 1, '2015-07-03'),
(3518, 'FERNANDEZ MARIA CRIS', '420099', 'MAGALLANES 284', '50', '510222', '40901', 1, '2015-07-03'),
(3519, 'FERNANDEZ MIGUEL ANG', '00000430880', 'MORENO 609', '50', '320733', '8295', 1, '2015-07-03'),
(3520, 'FERNANDEZ RODOLFO Y ', '00000000000', 'DERQUI 53', '50', '497738', '15737', 1, '2015-07-03'),
(3521, 'FERNANDEZ VILLANUEVA', '00000425356', 'COLON 218', '87', '411369', '8044', 1, '2015-07-03'),
(3522, 'FERRARI RICARDO DOMI', '00000000000', 'SARMIENTO 375', '50', '421661', '8660', 1, '2015-07-03'),
(3523, 'FERRARIO GUILLERMO E', '00000424445', 'COLON 435', '50', '393144', '7747', 1, '2015-07-03'),
(3524, 'FERRARIO GUSTAVO ADR', '00000000000', 'AV.TRABAJADOR 46', '50', '394402', '1624', 1, '2015-07-03'),
(3525, 'FERRARO MARIO CESAR', '00000423106', 'ALSINA 654', '50', '283360', '16231', 1, '2015-07-03'),
(3526, 'FERREIROS DIEGO RUBE', '00000000000', 'P.N.CARRERA 985', '50', '592156', '5430', 1, '2015-07-03'),
(3527, 'FIDUCIARIA CASTELLI ', '00000431333', 'MORENO 322', '87', '5596868', '8456', 1, '2015-07-03'),
(3528, 'FINVERCAR S.A', '433795', '9 DE JULIO 210', '87', '491664', '7230', 1, '2015-07-03'),
(3529, 'FLECHA MARCELO ANGEL', '00000000000', 'LAPRIDA 246', '50', '583659', '13806', 1, '2015-07-03'),
(3530, 'FORTE SILVIA NOEMI', '00000000000', 'ROCA 421', '87', '294656', '9468', 1, '2015-07-03'),
(3531, 'FOSQUE MARIA ADELA', '00000000000', '9 DE JULIO 88', '50', '435251', '7963', 1, '2015-07-03'),
(3532, 'FRIGORIFICO CAPRIATA', '00000000000', 'GOMILA 268', '87', '516077', '40055', 1, '2015-07-03'),
(3533, 'FUCHS SANDRA CECILIA', '00000000000', '9 DE JULIO 358', '50', '592941', '6908', 1, '2015-07-03'),
(3534, 'GALENO ARGENTINA SOC', '00000000000', 'MAIPU 6', '87', '5594363', '7931', 1, '2015-07-03'),
(3535, 'GALILEA EUGENIO HECT', '00000424278', 'COLON 424', '87', '185127', '7900', 1, '2015-07-03'),
(3536, 'GALLARDO JAVIER NEST', '00015614365', 'BRANDSEN 772', '87', '420518', '42', 1, '2015-07-03'),
(3537, 'GANIM CESAR DAMIAN', '15521567', '17 DE AGOSTO', '50', '5597710', '49421', 1, '2015-07-03'),
(3538, 'GANIM NESTOR HUGO', '00000000000', 'PASSO 235', '50', '455291', '12882', 1, '2015-07-03'),
(3539, 'GARAT ELSA MARIA', '00000431200', 'DORREGO 966', '50', '380623', '2358', 1, '2015-07-03'),
(3540, 'GARCIA ANA CAROLINA', '0', 'S.COSTA 87', '50', '559191', '47804', 1, '2015-07-03'),
(3541, 'GARCIA GABRIEL Y GUS', '00000422856', 'SAN MARTIN 1760', '87', '399191', '20893', 1, '2015-07-03'),
(3542, 'GARCIA MARCONI ROCIO', '00000000000', '9 DE JULIO 62', '50', '530015', '7969', 1, '2015-07-03'),
(3543, 'GARCIA MARIA DEL CAR', '00000425641', '9 DE JULIO 131', '50', '345912', '7550', 1, '2015-07-03'),
(3544, 'GARCIA MAURICIO DAVI', '00015645479', 'MORENO 581', '50', '421238', '8284', 1, '2015-07-03'),
(3545, 'GARCIA SERGIO RAUL', '00000000000', 'ALVEAR 633', '87', '500089', '10274', 1, '2015-07-03'),
(3546, 'GASANEO Y AMESTOY', '00000000000', 'SARMIENTO 489', '50', '233336', '8667', 1, '2015-07-03'),
(3547, 'GASPAROLI ANA TERESA', '425361', 'H.PRIMO 991', '50', '568874', '777', 1, '2015-07-03'),
(3548, 'GEJO RUBEN Y RODOLFO', '00000000000', 'DORREGO 534', '50', '486758', '6851', 1, '2015-07-03'),
(3549, 'GENOVESI HNOS.S.R.L', '00000424926', 'RUTA 3 KM 496', '50', '248095', '23394', 1, '2015-07-03'),
(3550, 'GIACOMINO ANDREA SUS', '00000423268', 'R.PEÃ‘A 67', '87', '411705', '16082', 1, '2015-07-03'),
(3551, 'GIARDINO P Y DE TORR', '00000431320', 'H.PRIMO 442', '50', '435440', '9689', 1, '2015-07-03'),
(3552, 'GIDINI MARGARITA AGU', '00000432366', 'URQUIZA 47', '50', '431266', '1736', 1, '2015-07-03'),
(3553, 'GIMNASIO STADIUM', '00000000000', 'MORENO 715', '87', '302234', '1615', 1, '2015-07-03'),
(3554, 'GIUDICI ADRIAN ANDRE', '425685', 'CHACABUCO 101', '50', '493916', '42756', 1, '2015-07-03'),
(3555, 'GIULIANI HECTOR Y LU', '00000000000', 'ESTRADA 666', '50', '310040', '13521', 1, '2015-07-03'),
(3556, 'GONZALEZ JORGE VENTU', '00000000000', 'BROWN 176', '50', '516442', '16420', 1, '2015-07-03'),
(3557, 'GONZALEZ LUIS ALBERT', '427068', 'CONSTITUYENTES 174', '50', '379252', '1210', 1, '2015-07-03'),
(3558, 'GONZALEZ MARCELO GAB', '00000424023', '25 DE MAYO 275', '50', '365819', '7032', 1, '2015-07-03'),
(3559, 'GONZALEZ MARCELO OSC', '00000429920', 'O.DUGGAN 750', '50', '443647', '12471', 1, '2015-07-03'),
(3560, 'GONZALEZ MARIA LAURA', '00000000000', '9 DE JULIO 46', '50', '469012', '7975', 1, '2015-07-03'),
(3561, 'GRANDA LUCIANO', '00000000000', 'FRENCH 15', '50', '563983', '13138', 1, '2015-07-03'),
(3562, 'GROSSO CLAUDIA LUJAN', '00000000000', '25 DE MAYO 373', '50', '133519', '7046', 1, '2015-07-03'),
(3563, 'GRUAS Y MONTAJES IOR', '00000000000', 'G.MOSCONI 399', '87', '571614', '20800', 1, '2015-07-03'),
(3564, 'GUAZZORA ELSA CELICA', '00000426679', '25 DE MAYO 82', '50', '360595', '7330', 1, '2015-07-03'),
(3565, 'GUILLERMO ECHEVARRIA', '00334000401', 'SAN MARTIN 1080', '87', '472041', '20225', 1, '2015-07-03'),
(3566, 'GUISASOLA MARIA LEON', '00000000000', 'ALVARADO 325', '50', '215879', '9831', 1, '2015-07-03'),
(3567, 'GURIDI PAULA ANDREA', '00000000000', 'BETOLAZA 124', '50', '504465', '7629', 1, '2015-07-03'),
(3568, 'GUSTAVO FIORDA MAQUI', '00000000000', 'J.INGENIEROS 1020', '87', '580502', '11910', 1, '2015-07-03'),
(3569, 'HERNANDEZ HUGO SEBAS', '00000000000', 'FALUCHO 195', '50', '529064', '9164', 1, '2015-07-03'),
(3570, 'HERRERA F-HERRERA N-', '00000000000', 'URQUIZA 1300', '50', '583936', '4196', 1, '2015-07-03'),
(3571, 'HERRERO RAUL MARIO', '00000433530', 'MORENO 255', '87', '318769', '8225', 1, '2015-07-03'),
(3572, 'HID MARIO HORACIO', '00000000000', '1RA.JUNTA 367', '50', '382975', '10645', 1, '2015-07-03'),
(3573, 'HIDALGO MARIA EUGENI', '00000000000', 'CALLE 1810 15', '50', '507163', '8493', 1, '2015-07-03'),
(3574, 'HOJBJERG MYRIAN MABE', '00000000000', 'MORENO 999', '50', '5596036', '1593', 1, '2015-07-03'),
(3575, 'HOJOBAR S.A.', '00000000000', 'BELGRANO 495', '50', '519007', '9580', 1, '2015-07-03'),
(3576, 'HOLLENDER PEDRO MARC', '00000000000', 'R.PEÃ‘A 4200', '50', '468291', '21528', 1, '2015-07-03'),
(3577, 'IACOVIELLO HECTOR FR', '00000424649', 'SAN MARTIN 551', '50', '386481', '15752', 1, '2015-07-03'),
(3578, 'IELMINI NELIDA ESTER', '00000000000', 'BROWN 97', '50', '483571', '16016', 1, '2015-07-03'),
(3579, 'IGLESIAS JUAN CARLOS', '00000000000', 'CALLE 1810 58', '50', '524665', '8517', 1, '2015-07-03'),
(3580, 'INGENERARE SRL', '00000000000', 'ALVEAR 210', '50', '545211', '10363', 1, '2015-07-03'),
(3581, 'INSTITUTO BIOQUIMICO', '00000431347', 'RIVADAVIA 183', '87', '280617', '16307', 1, '2015-07-03'),
(3582, 'IRIART FERNANDO RAUL', '00000429221', 'TACUARI 585', '50', '257462', '14081', 1, '2015-07-03'),
(3583, 'IRIBARNE EDUARDO', '0', 'H.YRIGOYEN 769', '50', '610472', '40199', 1, '2015-07-03'),
(3584, 'IRIBARREN DANIEL CAR', '00000000000', '1RA.JUNTA 1074', '50', '420420', '507', 1, '2015-07-03'),
(3585, 'ISMAEL CLAUDIO ANIBA', '00000000000', 'BELGRANO 680', '50', '456689', '13466', 1, '2015-07-03'),
(3586, 'ITALIANI MARIA ELENA', '00000430189', 'MORENO 227', '50', '378314', '8223', 1, '2015-07-03'),
(3587, 'ITURBURU MARIA ISABE', '00000000000', 'MITRE 65', '50', '478069', '9385', 1, '2015-07-03'),
(3588, 'JACOBSEN ANDRES RAUL', '00000428097', 'FALUCHO 985', '50', '354695', '928', 1, '2015-07-03'),
(3589, 'JALLE ANDRES', '00000000000', 'CHACABUCO 75', '50', '572901', '7360', 1, '2015-07-03'),
(3590, 'JAUREGUIBEHERE LIA M', '00000000000', 'H.YRIGOYEN 172', '50', '467382', '7576', 1, '2015-07-03'),
(3591, 'JEANNERET JULIO', '00000422712', 'RIVADAVIA 545', '50', '205450', '17750', 1, '2015-07-03'),
(3592, 'JORGE ALBERTO', '00000000000', 'BRANDSEN 365', '50', '499123', '8893', 1, '2015-07-03'),
(3593, 'JUAN EDUARDO', '00000424361', 'D.VASQUEZ 924', '87', '393245', '12642', 1, '2015-07-03'),
(3594, 'JURORUSA S.A', '00000000000', 'MORENO 164', '87', '559074', '8530', 1, '2015-07-03'),
(3595, 'LA AGRICOLA GANAD.DE', '00000424312', 'SARMIENTO 221', '87', '19914', '8639', 1, '2015-07-03'),
(3596, 'LA CASA DE LOS BULON', '00000000000', 'LAVALLE 1', '50', '459840', '7893', 1, '2015-07-03'),
(3597, 'LA PERSEVERANCIA SEG', '00000430780', 'COLON 87', '250', '20167', '40026', 1, '2015-07-03'),
(3598, 'LABORDE CARLOS ALBER', '00000426811', 'COLON 627', '50', '222721', '7809', 1, '2015-07-03'),
(3599, 'LAGO S.A.', '00000000000', 'SAN MARTIN 1386', '87', '498416', '21069', 1, '2015-07-03'),
(3600, 'LAMBERTA JORGE MIGUE', '00000423118', 'BRANDSEN 134', '50', '459361', '9095', 1, '2015-07-03'),
(3601, 'LANCE FABIANA', '00000000000', 'COLON 481', '50', '570574', '7761', 1, '2015-07-03'),
(3602, 'LARA ROBERTO MARCELO', '00000429538', '1RA.JUNTA 226', '50', '391951', '10749', 1, '2015-07-03'),
(3603, 'LARRIESTRA BEATRIZ C', '00000000000', 'COLON 545', '50', '437776', '7787', 1, '2015-07-03'),
(3604, 'LARSEN CESAR GERARDO', '00000000000', 'RECONQUISTA 801', '50', '379005', '18730', 1, '2015-07-03'),
(3605, 'LAS MECHAS SOCIEDAD ', '00000000000', 'L.V.LOPEZ 9', '50', '566098', '8606', 1, '2015-07-03'),
(3606, 'LATORRE ALEJANDRO MA', '00000000000', 'B.DE IRIGOYEN 755', '50', '522993', '13286', 1, '2015-07-03'),
(3607, 'LATORRE JOAQUIN IGNA', '00000000000', 'LIBERTAD 115', '50', '550055', '1907', 1, '2015-07-03'),
(3608, 'LAVANDERIA TRES ARRO', '00000425350', 'DORREGO 502', '50', '229270', '6852', 1, '2015-07-03'),
(3609, 'LAVERENS NELSON A.', '00000000000', 'S.PEÃ‘A 135', '50', '220525', '15404', 1, '2015-07-03'),
(3610, 'LEGUIZAMON CLAUDIA I', '00000000000', 'LAVALLE 661', '50', '558282', '6107', 1, '2015-07-03'),
(3611, 'LEGUIZAMON ESTEBAN H', '00015562931', 'ALVARADO 675', '50', '558341', '9858', 1, '2015-07-03'),
(3612, 'LETAMENDI LUIS ANGEL', '00000420913', 'L.V.LOPEZ 1250', '50', '392671', '10921', 1, '2015-07-03'),
(3613, 'LIEBANA JORGE F.', '00000431615', 'SAN LORENZO 56', '50', '188359', '16701', 1, '2015-07-03'),
(3614, 'LIFIRON S.A', '00000000000', 'DERIVACION NÂ°2 2', '50', '548935', '22159', 1, '2015-07-03'),
(3615, 'LLANOS ALICIA CLALFI', '00000000000', 'COLON 430', '50', '594466', '7898', 1, '2015-07-03'),
(3616, 'LOFIEGO JOSE JUIS', '00000430152', 'ISTILART 630', '50', '406583', '9949', 1, '2015-07-03'),
(3617, 'LOPEZ IRMA ELENA', '00000000000', 'CALLE 1810 550', '50', '471305', '9756', 1, '2015-07-03'),
(3618, 'LOPEZ NESTOR FABIAN', '00000000000', 'LAVALLE 395', '50', '445931', '6871', 1, '2015-07-03'),
(3619, 'LOSADA RICARDO OSVAL', '00000423259', 'LAVALLE 410', '50', '346889', '6612', 1, '2015-07-03'),
(3620, 'LUCERO OLGA', '0', '9 DE JULIO 922', '50', '575364', '44961', 1, '2015-07-03'),
(3621, 'LUIS BLANCO S.A', '00000433533', 'BELGRANO 970', '87', '300357', '12532', 1, '2015-07-03'),
(3622, 'MACHADO ROBERTO OSCA', '00000432079', 'L.N.ALEM 546', '50', '396998', '2822', 1, '2015-07-03'),
(3623, 'MACIEL HERMANOS S.A.', '00000430680', 'SAN MARTIN 985', '250', '223744', '40059', 1, '2015-07-03'),
(3624, 'MADERAS S. JOSE DE L', '00000000000', 'S.COSTA 1009', '50', '536844', '10667', 1, '2015-07-03'),
(3625, 'M.A.M. S.A.', '00000424441', 'FORMOSA 1050', '87', '421456', '40050', 1, '2015-07-03'),
(3626, 'MARINO MONICA GRACIE', '00000000000', 'COLON 363', '50', '476791', '7733', 1, '2015-07-03'),
(3627, 'MARTINEZ CLAUDIO NES', '00000000000', 'URQUIZA 116', '50', '402745', '1993', 1, '2015-07-03'),
(3628, 'MARTINEZ DE CAMPOS A', '00000000000', 'CHACABUCO 325', '50', '456618', '7405', 1, '2015-07-03'),
(3629, 'MARTINEZ FRANKLIN SE', '00000433007', 'RIVADAVIA 885', '50', '411835', '18764', 1, '2015-07-03'),
(3630, 'MARTINEZ GUILLERMO O', '424748', 'BETOLAZA 711', '50', '483816', '42405', 1, '2015-07-03'),
(3631, 'MARTINEZ JULIO CESAR', '00000000000', 'COLON 346', '87', '548759', '7950', 1, '2015-07-03'),
(3632, 'MASCHI EDUARDO ERNES', '00000430870', 'SAN LORENZO 281', '50', '199485', '16417', 1, '2015-07-03'),
(3633, 'MASTROSIMONE GUSTAVO', '00000422231', 'BELGRANO 702', '50', '402370', '13136', 1, '2015-07-03'),
(3634, 'MAVIGLIA YAMILA BELE', '0', 'MORENO 598', '50', '5594953', '41377', 1, '2015-07-03'),
(3635, 'MAYER RICARDO AUTOMO', '00000428350', 'O.DUGGAN 875', '50', '530725', '11650', 1, '2015-07-03'),
(3636, 'MENNA ELIANA ANDREA', '00000000000', 'RIVADAVIA 599', '50', '599793', '17757', 1, '2015-07-03'),
(3637, 'MENNA JOSE ANGEL', '00000422842', 'CONSTITUYENTES 50', '50', '343471', '1417', 1, '2015-07-03'),
(3638, 'MENNA LORENZO N.', '00000426588', 'SAN LORENZO 184', '87', '187828', '16688', 1, '2015-07-03'),
(3639, 'MEO GUZMAN ENRIQUE F', '00000423287', 'DERQUI 134', '50', '399683', '15479', 1, '2015-07-03'),
(3640, 'MERLINO PLAN S.A.', '00000000000', 'H.YRIGOYEN 73', '87', '450661', '8110', 1, '2015-07-03'),
(3641, 'MERLO CARMEN HERMINI', '00000000000', 'ESTRADA 55', '50', '335421', '15664', 1, '2015-07-03'),
(3642, 'MESA DE FORCHETTI MO', '00000000000', 'SARMIENTO 201', '50', '354826', '8636', 1, '2015-07-03'),
(3643, 'MIEDAN ANA KARINA', '00000432829', 'H.YRIGOYEN 431', '50', '439826', '6677', 1, '2015-07-03'),
(3644, 'MILLA SUR S.A.', '00000000000', 'GUEMES 45', '87', '604774', '5347', 1, '2015-07-03'),
(3645, 'MIO FIGLIO  S.R.L.', '15507169', 'LAVALLE 52', '50', '5594994', '45928', 1, '2015-07-03'),
(3646, 'MOIRANO EVELIA LILIA', '00000000000', 'ROCA 13', '50', '512776', '8373', 1, '2015-07-03'),
(3647, 'MOIZZI JUAN JOSE', '00000000000', 'BROWN 1', '50', '468796', '16007', 1, '2015-07-03'),
(3648, 'MOLFESE ISIDRO', '00000432176', 'CANGALLO 664', '50', '351056', '13642', 1, '2015-07-03'),
(3649, 'MOLINA EUGENIO ALFRE', '00000423034', 'LAVALLE 357', '50', '386872', '6864', 1, '2015-07-03'),
(3650, 'MOLINA HECTOR MARIAN', '00000000000', 'COLON 255', '50', '561279', '7714', 1, '2015-07-03'),
(3651, 'MOLINOS TRES ARROYOS', '00000432494', 'P.INDUSTRIAL', '87', '400725', '40130', 1, '2015-07-03'),
(3652, 'MOLINOS ZALLA S.A.', '00000420759', 'RUTA 3 KM 495.5', '87', '525473', '40120', 1, '2015-07-03'),
(3653, 'MOLLER ARTURO', '00000429848', 'V.SARSFIELD 375', '50', '285436', '14299', 1, '2015-07-03'),
(3654, 'MONSALVO MARIA DE LO', '00000000000', 'MORENO 265', '50', '522980', '8227', 1, '2015-07-03'),
(3655, 'MONTESINOS JOSE MANU', '00000420783', 'L.V.LOPEZ 176', '87', '308092', '8839', 1, '2015-07-03'),
(3656, 'MORAN JORGE ANTONIO', '00000428895', 'LAMADRID 167', '50', '366021', '14983', 1, '2015-07-03'),
(3657, 'MORAN MARCELO ANTONI', '00000000000', '25 DE MAYO 299', '50', '492850', '7033', 1, '2015-07-03'),
(3658, 'MUNGAI MARIA MERCEDE', '00000000000', 'CORDOBA 44', '50', '566740', '10874', 1, '2015-07-03'),
(3659, 'MUTUAL FEDERADA 25 D', '431819', 'MORENO 456', '50', '5597222', '8400', 1, '2015-07-03'),
(3660, 'NALDO LOMBARDI S.A', '424178', 'CALLE 1810 75', '87', '555438', '40039', 1, '2015-07-03'),
(3661, 'NIKRO S.A', '00000433344', 'RIVADAVIA 620', '50', '532514', '6263', 1, '2015-07-03'),
(3662, 'NOICSA S.A.', '00000000000', 'MAZZINI 950', '87', '533638', '11665', 1, '2015-07-03'),
(3663, 'NOVILLO VIRGINIA VER', '00000000000', 'SALTA 321', '50', '513555', '4744', 1, '2015-07-03'),
(3664, 'OHACO RAUL BAUTISTA', '00000428430', 'CHACABUCO 390', '50', '336734', '7524', 1, '2015-07-03'),
(3665, 'OLEOHIDRAULICA DI RO', '00000423815', 'SAN MARTIN 1375', '50', '381516', '21130', 1, '2015-07-03'),
(3666, 'OLOCCO BARTOLO', '00000431844', 'H.YRIGOYEN 91', '50', '240116', '8113', 1, '2015-07-03'),
(3667, 'OLSEN CRISTIAN', '00000000000', 'LAMADRID 273', '50', '460093', '15019', 1, '2015-07-03'),
(3668, 'ONGARINI LIVIO', '00000426468', 'QUINTANA 375', '50', '195911', '15425', 1, '2015-07-03'),
(3669, 'OTERO OSCAR ALBERTO', '00000427339', 'ALSINA 32', '50', '268598', '16300', 1, '2015-07-03'),
(3670, 'PALLA SILVIA CRISTIN', '00000000000', 'MORENO 623', '50', '500757', '8297', 1, '2015-07-03'),
(3671, 'PALLADINO  S.A.', '00000424896', '1RA.JUNTA 999', '87', '392802', '534', 1, '2015-07-03'),
(3672, 'PALMA NORA', '00000000000', 'LAVALLE 196', '50', '488853', '7468', 1, '2015-07-03'),
(3673, 'PASCUAL SILVIA ADRIA', '00000430612', 'L.V.LOPEZ 81', '50', '398761', '8622', 1, '2015-07-03'),
(3674, 'PAZOS DE VELOSO MABE', '00000000000', 'H.YRIGOYEN 420', '50', '417071', '6671', 1, '2015-07-03'),
(3675, 'PC TRUCKS TRES ARROY', '00000000000', 'J.INGENIEROS 804', '50', '574455', '11996', 1, '2015-07-03'),
(3676, 'PEQUEÃ‘O JOSE', '00000424243', 'CHACABUCO 163', '50', '213817', '7377', 1, '2015-07-03'),
(3677, 'PEREYRA ESTEBAN CEFE', '00000000000', 'SAN MARTIN 1315', '50', '485386', '21074', 1, '2015-07-03'),
(3678, 'PEREZ DALSGAARD Y CI', '00000000000', 'MORENO 798', '87', '261225', '6', 1, '2015-07-03'),
(3679, 'PEREZ GUILLERMO LUIS', '00000429763', '1RA.JUNTA 250', '50', '271729', '10746', 1, '2015-07-03'),
(3680, 'PEREZ GUSTAVO MIGUEL', '00000000000', 'BELGRANO 625', '50', '431048', '10024', 1, '2015-07-03'),
(3681, 'PEREZ MARIA ISABEL', '00000000000', 'LIBERTAD 385', '50', '459938', '2362', 1, '2015-07-03'),
(3682, 'PEREZ NELSON ADRIAN', '00000000000', 'LAMADRID 436', '50', '480336', '15270', 1, '2015-07-03'),
(3683, 'PEREZ PAULA ANDREA', '00000000000', 'B.OBRERO CASA 54', '50', '464554', '603', 1, '2015-07-03'),
(3684, 'PEREZ RAUL MARTIN', '00000000000', 'CHACABUCO 39', '87', '363280', '7356', 1, '2015-07-03'),
(3685, 'PERTICARARI JUAN PAB', '15613025', 'SAN MARTIN 402', '50', '505840', '15902', 1, '2015-07-03'),
(3686, 'PETELA HECTOR', '00000420407', 'CATAMARCA 934', '87', '307138', '20521', 1, '2015-07-03'),
(3687, 'PIERINI CARLOS FABIA', '00000428707', 'SARMIENTO 1165', '50', '451206', '1352', 1, '2015-07-03'),
(3688, 'PINTURERIAS RUCCI S.', '00000422054', 'CHACABUCO 324', '87', '520667', '7533', 1, '2015-07-03'),
(3689, 'PIROSANTO CAMILO ALD', '00000427500', 'V.SARSFIELD 295', '50', '318613', '14266', 1, '2015-07-03'),
(3690, 'PODESTA MARIANA', '00000000000', 'BETOLAZA 114', '50', '491840', '7631', 1, '2015-07-03'),
(3691, 'PONCE EDUARDO ESTEBA', '00000429069', 'S.PEÃ‘A 460', '50', '336620', '14281', 1, '2015-07-03'),
(3692, 'POULSEN PEDRO-CAZEAU', '00000000000', 'BALCARCE 568', '50', '543871', '17001', 1, '2015-07-03'),
(3693, 'POZZOLI LAURA CECILI', '00000000000', 'MORENO 585', '50', '538880', '8278', 1, '2015-07-03'),
(3694, 'PRADO RUBEN OSCAR', '00000000000', 'CORDOBA 260', '87', '5596384', '10829', 1, '2015-07-03'),
(3695, 'PRIETO JUAN JOSE', '00000000000', 'PASSO 620', '50', '483148', '13086', 1, '2015-07-03'),
(3696, 'PROCACCINI FRANCISCO', '00015618430-434077-', 'ALMAFUERTE 40', '50', '265122', '21079', 1, '2015-07-03'),
(3697, 'QUIMICA MOLERO S.R.L', '00000000000', 'CASEROS 816', '50', '521811', '19295', 1, '2015-07-03'),
(3698, 'RACCIATTI PEDRO ALEJ', '00015458789', 'DERIVACION NÂ°2 0000', '50', '580313', '22151', 1, '2015-07-03'),
(3699, 'RANZINI MATIAS FEDER', '00000000000', 'ALSINA 469', '50', '581961', '16057', 1, '2015-07-03'),
(3700, 'RANZINI RICARDO VALE', '432553', 'J.INGENIEROS 360', '87', '434443', '21030', 1, '2015-07-03'),
(3701, 'RAVELLA RICARDO H.', '00000433507', 'LAS HERAS 455', '50', '237406', '17543', 1, '2015-07-03'),
(3702, 'RE MARIO CESAR', '00000431251', 'LAVALLE 155', '50', '460110', '7492', 1, '2015-07-03'),
(3703, 'RECARI MARIANO', '00000422878', 'GOMILA 798', '50', '446101', '13119', 1, '2015-07-03'),
(3704, 'REFAFLOTO S.A', '00000000000', 'COLON 399', '87', '507701', '7738', 1, '2015-07-03'),
(3705, 'RENDO DE PODESTA IRM', '00000425524', 'H.PRIMO 384', '50', '404374', '9708', 1, '2015-07-03'),
(3706, 'REY ANA MARIA', '00000430467', 'S.CABRAL 46', '87', '408574', '14937', 1, '2015-07-03'),
(3707, 'RIDINO EDUARDO NICOL', '00000000000', 'BETOLAZA 757', '50', '478825', '5995', 1, '2015-07-03'),
(3708, 'RIVOLTA JOSE EDUARDO', '15506110', 'QUINTANA 75', '50', '5597618', '49145', 1, '2015-07-03'),
(3709, 'ROAS SACIF', '42955800000000000', 'SAN MARTIN 461', '50', '585507', '15733', 1, '2015-07-03'),
(3710, 'RODERA FRANCISCO Y J', '00000000000', 'CHACABUCO 173', '50', '471565', '7378', 1, '2015-07-03'),
(3711, 'RODRIGUEZ ELSA TERES', '00000430930', '9 DE JULIO 216', '50', '399133', '7231', 1, '2015-07-03'),
(3712, 'RODRIGUEZ TERESA ANG', '00000000000', 'MAIPU 165', '50', '470933', '7519', 1, '2015-07-03'),
(3713, 'ROLANDO LUIS ROBERTO', '00000430479', 'SAN LORENZO 164', '87', '352691', '16691', 1, '2015-07-03'),
(3714, 'ROLDAN JUANA MARIELA', '00000000000', 'RIVADAVIA 223', '50', '470959', '16709', 1, '2015-07-03'),
(3715, 'ROLDAN LILIANA VALER', '00000000000', 'MATHEU 515', '50', '475866', '6067', 1, '2015-07-03'),
(3716, 'RUBIO DANIEL CECILIO', '00000429451', '1RA.JUNTA 531', '50', '312321', '10658', 1, '2015-07-03'),
(3717, 'RUTA 2 S.R.L.', '00000000000', 'L.DE LA TORRE 1496', '50', '261179', '40048', 1, '2015-07-03'),
(3718, 'SABATINI MARCELO EDM', '00000000000', 'R.PEÃ‘A 81', '50', '502490', '16084', 1, '2015-07-03'),
(3719, 'SAEZ JUAN EMILIO', '00000423535', 'CASEROS 601', '50', '5596738', '19223', 1, '2015-07-03'),
(3720, 'SAEZ SILVIA NELLY', '00000420847', 'CHACABUCO 299', '50', '348926', '7403', 1, '2015-07-03'),
(3721, 'SAGARDOY FERNANDO JO', '00000000000', 'GARIBALDI 354', '50', '514611', '11152', 1, '2015-07-03'),
(3722, 'SAINI SERGIO DANIEL', '00000427369', 'BELGRANO 560', '50', '430487', '13843', 1, '2015-07-03'),
(3723, 'SALOME JULIO', '00000000000', 'O.DUGGAN 610', '50', '256159', '12483', 1, '2015-07-03'),
(3724, 'SAN PELLEGRINI DE M.', '00000000000', 'J.INGENIEROS 255', '87', '78546', '21048', 1, '2015-07-03'),
(3725, 'SANCHEZ ELIZABETH', '00000000000', 'BETOLAZA 546', '50', '581828', '6485', 1, '2015-07-03'),
(3726, 'SANCHEZ MONICA LUJAN', '00000000000', 'ALSINA 298', '50', '572800', '16266', 1, '2015-07-03'),
(3727, 'SANCHEZ N.DE PEREYRA', '00000000000', 'FRENCH 536', '50', '401689', '13423', 1, '2015-07-03'),
(3728, 'SANCINETO VICTOR MAR', '00015612593', 'DERIVACION NÂ°6 0002', '50', '346788', '21601', 1, '2015-07-03'),
(3729, 'SANDE JUAN JOSE', '00000420682', 'SARMIENTO 456', '50', '349965', '8730', 1, '2015-07-03'),
(3730, 'SANI TRES S.A.', '00000000000', 'R.PEÃ‘A 235', '87', '544227', '16879', 1, '2015-07-03'),
(3731, 'SANTAGIULIANA MARIA ', '00000000000', 'ALSINA 854', '50', '444628', '16213', 1, '2015-07-03'),
(3732, 'SANTIRSO MARIA ROSAN', '00000000000', 'L.V.LOPEZ 1008', '50', '558976', '10792', 1, '2015-07-03'),
(3733, 'SAURO ROBERTO CESAR', '00000000000', '9 DE JULIO 109', '50', '360973', '7727', 1, '2015-07-03'),
(3734, 'SCARCELLA DIEGO JOSE', '00000000000', 'ROCHA 486', '50', '566304', '14399', 1, '2015-07-03'),
(3735, 'SCHENCK ANDREA FABIA', '00000000000', 'LAS HERAS 69', '50', '584441', '16143', 1, '2015-07-03'),
(3736, 'SCHUMACHER ALFREDO Y', '00000000000', 'SOLIS 929', '50', '576143', '3543', 1, '2015-07-03'),
(3737, 'SEMILLERA PAMPA FERT', '00000425092', 'CASEROS 668', '50', '326399', '19303', 1, '2015-07-03'),
(3738, 'SEQUEIRA CARLOS ENRI', '00000429131', 'COLON 357', '50', '229717', '7731', 1, '2015-07-03'),
(3739, 'SERRANO ELSA GLORIA', '00000000000', 'BRANDSEN 244', '87', '579782', '9060', 1, '2015-07-03'),
(3740, 'SISTEMAS TERMODINAMI', '00000427055', 'TACUARI 1050', '50', '463124', '11655', 1, '2015-07-03'),
(3741, 'SKOU BERTEL S.A.', '00000426783', 'CASEROS 10', '87', '176079', '19344', 1, '2015-07-03'),
(3742, 'SOBANSKI VICTOR ADOL', '00000421098', 'SAN LUIS 932', '50', '400044', '20590', 1, '2015-07-03'),
(3743, 'SOC. DE TRANSP.LIBRE', '00000000000', 'J.INGENIEROS 250', '87', '171263', '21024', 1, '2015-07-03'),
(3744, 'SOC.ESPAÃ‘OLA DE S.M', '00000431365', 'DORREGO 268', '87', '38928', '6929', 1, '2015-07-03'),
(3745, 'SOCOLOFF MARTIN IVAN', '15549858', '25 DE MAYO 146', '87', '588784', '42516', 1, '2015-07-03'),
(3746, 'SODA LA HUELLA S.R.L', '00000424828', 'S.CABRAL 1599', '87', '359225', '40076', 1, '2015-07-03'),
(3747, 'SODE HORACIO ABEL', '00000424337', 'B.MACHADO 1244', '50', '230928', '364', 1, '2015-07-03'),
(3748, 'SORIANO MIGUEL ANGEL', '00000431443', 'LINIERS 165', '50', '262714', '17785', 1, '2015-07-03'),
(3749, 'SORIANO RAFAEL', '00000433718', 'SAN MARTIN 345', '50', '233714', '15700', 1, '2015-07-03'),
(3750, 'SOULE SERGIO OSVALDO', '00015501624', 'SAN MARTIN 901', '87', '519850', '15840', 1, '2015-07-03'),
(3751, 'SOUMOULOU PABLO HERN', '00000422213', 'PASSO 550', '50', '375788', '13089', 1, '2015-07-03'),
(3752, 'SPENZA MARIANO MARTI', '15603805', 'V.SARSFIELD 367', '50', '5596458', '45371', 1, '2015-07-03'),
(3753, 'STALLONE JUDIT ELIZA', '00000000000', 'P.N.CARRERA 999', '50', '493466', '5432', 1, '2015-07-03'),
(3754, 'STARCEL PAMPA CENTRO', '00000000000', 'COLON 182', '50', '601728', '8132', 1, '2015-07-03'),
(3755, 'STIVABAD S.A', '15382871', 'COLON 153', '50', '5597773', '49697', 1, '2015-07-03'),
(3756, 'SUAREZ ADELA JOSEFIN', '431490', 'BRANDSEN 1176', '50', '474625', '1026', 1, '2015-07-03'),
(3757, 'SUAREZ JORGE EDUARDO', '00000431374', 'LAS HERAS 25', '87', '175766', '16141', 1, '2015-07-03'),
(3758, 'SUPERCARNE S.A.', '00000431381', 'RIVADAVIA 453', '87', '439969', '40063', 1, '2015-07-03'),
(3759, 'SUPERMERCADO PLANETA', '00000431359', 'ALSINA 6', '87', '310659', '16302', 1, '2015-07-03'),
(3760, 'SUR AGROPECUARIA S.A', '00000426600', 'O.DUGGAN 1415', '87', '565583', '11805', 1, '2015-07-03'),
(3761, 'TARABORELLI ALEJANDR', '00000000000', 'H.YRIGOYEN 765', '50', '505808', '5967', 1, '2015-07-03'),
(3762, 'TARABORELLI MARIO JE', '00000000000', '1RA.JUNTA 2', '50', '420550', '10802', 1, '2015-07-03'),
(3763, 'TARANTELA ELVIRA ELS', '00000000000', 'OLAVARRIA 66', '50', '548661', '10604', 1, '2015-07-03'),
(3764, 'TARJETA NARANJA SA.', '00000000000', 'CALLE 1810 72', '87', '561918', '8515', 1, '2015-07-03'),
(3765, 'TARTAGLINO Y CIA. SR', '00000424225', 'RIVADAVIA 402', '50', '315609', '40016', 1, '2015-07-03'),
(3766, 'TEILETCHE ENRIQUE Y ', '00000426605', 'COLON 102', '50', '189907', '8191', 1, '2015-07-03'),
(3767, 'TERRASANTA MONICA', '15618714', 'L.N.ALEM 1602', '50', '452359', '4105', 1, '2015-07-03'),
(3768, 'TIEMERSMA SEBASTIAN', '00000000000', 'PARQUESITO 2', '87', '520319', '23405', 1, '2015-07-03'),
(3769, 'TORRES CARIONI SANTI', '00000432313', 'MAZZINI 455', '50', '346140', '11238', 1, '2015-07-03'),
(3770, 'TORRES MARCELA NOEMI', '15572453', 'P.N.CARRERA 60', '50', '5597880', '50401', 1, '2015-07-03'),
(3771, 'TOSTEX S.A.', '00000000000', 'CASEROS 50', '250', '541691', '40065', 1, '2015-07-03'),
(3772, 'TRAFER SAIC', '00000424707', 'AV.TRABAJADOR 901', '87', '329749', '40009', 1, '2015-07-03'),
(3773, 'TRANSPORTE GOIZUETA', '00000426645', 'CASEROS 1360', '87', '366122', '20701', 1, '2015-07-03'),
(3774, 'TRAVERSO GUILLERMO H', '00000000000', 'ALSINA 541', '87', '482750', '16103', 1, '2015-07-03'),
(3775, 'TRESNECO S.A.', '00000000000', 'ROCA 12', '50', '552655', '8397', 1, '2015-07-03'),
(3776, 'TRONCOSO PEDRO ARTUR', '00000428931', 'E.DE LA CALLE 144', '50', '274502', '5137', 1, '2015-07-03'),
(3777, 'TRUCK EXPRESS S.R.L.', '00000000000', 'GUEMES 535', '87', '506498', '5391', 1, '2015-07-03'),
(3778, 'TUMINI D. Y J. Y MEN', '00000000000', 'GUEMES 297', '50', '311571', '5371', 1, '2015-07-03'),
(3779, 'TURINI PABLO RENATO', '00000000000', 'SAN MARTIN 799', '50', '587859', '15802', 1, '2015-07-03'),
(3780, 'ULLERUP RAUL ADOLFO', '00000000000', 'ESTRADA 1365', '50', '316811', '11033', 1, '2015-07-03'),
(3781, 'UNIVALORES S.A.', '00000422735', 'ISTILART 120', '50', '5594397', '8795', 1, '2015-07-03'),
(3782, 'URBAN ANDERSEN MARCO', '00000000000', 'BELGRANO 470', '50', '590367', '14184', 1, '2015-07-03'),
(3783, 'URBIETA ANDRES', '00000000000', 'V.SARSFIELD 725', '50', '5596845', '14378', 1, '2015-07-03'),
(3784, 'URRUTIA MARIA MARTA', '00000000000', 'MORENO 475', '87', '522300', '8248', 1, '2015-07-03'),
(3785, 'URTASUN ANA LIA', '00000000000', 'BALCARCE 351', '50', '571180', '16825', 1, '2015-07-03'),
(3786, 'UZCUDUN S.A.F.I.M.', '00000431496', 'MORENO 851', '87', '431413', '1607', 1, '2015-07-03'),
(3787, 'UZIDINGER EDUARDO NI', '00000000000', 'AMEGHINO 997', '50', '392479', '20062', 1, '2015-07-03'),
(3788, 'VACCA REINALDO RUBEN', '00000428087', 'G.MOSCONI 1650', '50', '311861', '23409', 1, '2015-07-03'),
(3789, 'VAZQUEZ MIGUEL ANGEL', '00000428230', 'SAN MARTIN 1497', '50', '264835', '21141', 1, '2015-07-03'),
(3790, 'VERGNANO RAUL ANDRES', '00000000000', 'AV.TRABAJADOR 842', '50', '524971', '3313', 1, '2015-07-03'),
(3791, 'VERKUYL ASTRID CINTI', '00000000000', 'MORENO 315', '50', '525792', '8232', 1, '2015-07-03'),
(3792, 'VIAL AGRO S.A.', '00000430610', 'SARMIENTO 757', '250', '225764', '12', 1, '2015-07-03'),
(3793, 'VIGILAN S.R.L.AG.DE ', '428811', 'SAN MARTIN 465', '50', '595160', '15735', 1, '2015-07-03'),
(3794, 'VILLAFRANCA MARTA S.', '00000422340', 'COLON 348', '50', '421528', '7947', 1, '2015-07-03'),
(3795, 'VILLALBA JORGE ALFRE', '00000430238', 'BRANDSEN 1285', '50', '229658', '1131', 1, '2015-07-03'),
(3796, 'VILLALBA PEDRO', '00000000000', 'CHACABUCO 222', '87', '536134', '7571', 1, '2015-07-03'),
(3797, 'VILLANUEVA JUAN CARL', '00000424464', 'LAVALLE 30', '50', '315638', '7889', 1, '2015-07-03'),
(3798, 'VILLEMUR GUSTAVO MIG', '00000000000', 'D.VASQUEZ 550', '50', '370477', '13951', 1, '2015-07-03'),
(3799, 'VINOTECA LOS TONELES', '00000422236', 'CASTELLI 374', '50', '598725', '5915', 1, '2015-07-03'),
(3800, 'VIVIANI CARMEN', '00000000000', 'COLON 284', '50', '209692', '8026', 1, '2015-07-03'),
(3801, 'VIZZOLINI NESTOR J.', '00000422775', 'RIVADAVIA 655', '50', '221043', '18116', 1, '2015-07-03'),
(3802, 'WEHRHANNE HORACIO MA', '00000429967', 'J.INGENIEROS 555', '50', '340816', '12072', 1, '2015-07-03'),
(3803, 'WEST FERNANDO LUIS', '00000000000', 'LIBERTAD 646', '50', '552336', '2918', 1, '2015-07-03'),
(3804, 'ZIJLSTRA JORGE ROBER', '00000431376', 'FRENCH 332', '87', '424255', '13437', 1, '2015-07-03'),
(3805, 'ZIJLSTRA SILVINA ELE', '00000000000', 'BERUTTI 145', '50', '586458', '10046', 1, '2015-07-03'),
(3806, 'ZORRILLA HNOS. S.R.L', '00000429380', 'COLON 899', '87', '5595870', '1836', 1, '2015-07-03'),
(3807, 'ZOTES SAUL FRANCISCO', '00000000000', 'MAZZINI 765', '50', '338943', '11544', 1, '2015-07-03'),
(3808, 'ZURITA HNOS. Y CIA.', '00000433469', 'ALMAFUERTE 1074', '87', '152897', '11731', 1, '2015-07-03'),
(3809, '18 DE SETIEMBRE S.A', '00000431428', 'CASEROS 1090', '87', '467715', '20547', 1, '2015-07-03'),
(3810, '3 ARROYOS S.A.', '00000000000', 'CHACO 350', '250', '583819', '40071', 1, '2015-07-03'),
(3811, '3 NET S.A.', '00000420903', 'CHACABUCO 98', '87', '532006', '7641', 1, '2015-07-03'),
(3812, 'Tito Puente', '123123', 'Moreno 856', '2', '123222', '5456464654', 1, '2015-07-16'),
(3814, 'From', '123123', 'Moreno 8567', '0.0', '0', '7712', 1, '2015-07-11'),
(3815, 'Tito Puente', '123123', 'Moreno 8567', '0.0', '1212', '5456464654', 1, '2015-07-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medidorempresa`
--

CREATE TABLE IF NOT EXISTS `medidorempresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idmedidor` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  KEY `idmedidor` (`idmedidor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE IF NOT EXISTS `permisos` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `csocio` tinyint(1) NOT NULL,
  `rsocio` tinyint(1) NOT NULL,
  `usocio` tinyint(1) NOT NULL,
  `dsocio` tinyint(1) NOT NULL,
  `cmedidor` tinyint(1) NOT NULL,
  `rmedidor` tinyint(1) NOT NULL,
  `umedidor` tinyint(1) NOT NULL,
  `dmedidor` tinyint(1) NOT NULL,
  `cci` tinyint(1) NOT NULL,
  `rci` tinyint(1) NOT NULL,
  `uci` tinyint(1) NOT NULL,
  `dci` tinyint(1) NOT NULL,
  `crol` tinyint(1) NOT NULL,
  `rrol` tinyint(1) NOT NULL,
  `urol` tinyint(1) NOT NULL,
  `drol` tinyint(1) NOT NULL,
  `cusuario` tinyint(1) NOT NULL,
  `rusuario` tinyint(1) NOT NULL,
  `uusuario` tinyint(1) NOT NULL,
  `dusuario` tinyint(1) NOT NULL,
  PRIMARY KEY (`idpermiso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `csocio`, `rsocio`, `usocio`, `dsocio`, `cmedidor`, `rmedidor`, `umedidor`, `dmedidor`, `cci`, `rci`, `uci`, `dci`, `crol`, `rrol`, `urol`, `drol`, `cusuario`, `rusuario`, `uusuario`, `dusuario`) VALUES
(5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL,
  `idpermisos` int(11) NOT NULL,
  PRIMARY KEY (`idrol`),
  KEY `idpermisos` (`idpermisos`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombre`, `idpermisos`) VALUES
(6, 'root', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubro`
--

CREATE TABLE IF NOT EXISTS `rubro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `rubro`
--

INSERT INTO `rubro` (`id`, `descripcion`) VALUES
(11, 'N/A'),
(12, 'Camnines');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonoempresa`
--

CREATE TABLE IF NOT EXISTS `telefonoempresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idempresa` int(11) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `telefonoempresa`
--

INSERT INTO `telefonoempresa` (`id`, `idempresa`, `telefono`, `descripcion`) VALUES
(2, 8652, '272727', ''),
(3, 8653, '272727', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL,
  `apellido` varchar(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(25) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `idrol` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `idrol` (`idrol`),
  KEY `idrol_2` (`idrol`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `username`, `password`, `activo`, `correo`, `idrol`) VALUES
(2, 'Alejandro', 'Cabane', 'qw3r7y', 'kapanga', 1, 'asd@asd.com', 6),
(3, 'sdfsdfsdf', 'Garrido', 'neg90', 'kapanga', 1, 'dsa@dsa.com', 6);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abonadoempresa`
--
ALTER TABLE `abonadoempresa`
  ADD CONSTRAINT `abonadoempresa_ibfk_2` FOREIGN KEY (`numabonado`) REFERENCES `abonado` (`numabonado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `abonadoempresa_ibfk_3` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contactoempresa`
--
ALTER TABLE `contactoempresa`
  ADD CONSTRAINT `contactoempresa_ibfk_1` FOREIGN KEY (`idcontacto`) REFERENCES `contacto` (`idcontacto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contactoempresa_ibfk_2` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `correoempresa`
--
ALTER TABLE `correoempresa`
  ADD CONSTRAINT `correoempresa_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `domicilioempresa`
--
ALTER TABLE `domicilioempresa`
  ADD CONSTRAINT `domicilioempresa_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresa_ibfk_2` FOREIGN KEY (`idrubro`) REFERENCES `rubro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `medidorempresa`
--
ALTER TABLE `medidorempresa`
  ADD CONSTRAINT `medidorempresa_ibfk_1` FOREIGN KEY (`idmedidor`) REFERENCES `medidor` (`idmedidor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medidorempresa_ibfk_2` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rol`
--
ALTER TABLE `rol`
  ADD CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`idpermisos`) REFERENCES `permisos` (`idpermiso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefonoempresa`
--
ALTER TABLE `telefonoempresa`
  ADD CONSTRAINT `telefonoempresa_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
