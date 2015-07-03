-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 03-07-2015 a las 01:42:51
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `abonado`
--

INSERT INTO `abonado` (`importe`, `fechadeultimopago`, `activo`, `numabonado`) VALUES
(2, '2015-07-08', 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `descripcion`) VALUES
(15, 'N/A');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=164 ;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`idcontacto`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo`, `asociadosm`, `activo`, `tipodocumento`, `documento`) VALUES
(162, 'Fer', 'Nisman', '(011) 15-3858-7990', 'Moreno 8567', 'financiera.naveyra@gmail.com', 0, 1, 'DU', '35414241'),
(163, 'Nelson', 'Nisman', '(011) 15-3858-7990', 'Moreno 856', 'neg90@hotmail.com', 0, 1, 'DU', '123213132123');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=304 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `idempresa` int(11) NOT NULL AUTO_INCREMENT,
  `denominacion` varchar(20) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3445 ;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idempresa`, `denominacion`, `idrubro`, `detactividad`, `cantempleados`, `idcategoria`, `fechainicioce`, `activo`, `importemensual`, `fechafundacion`, `cuit`, `web`, `numusuario`) VALUES
(2972, '3 NET S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.3net.com.ar/', 0),
(2973, 'ABELLEIRA FABIAN-LEN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2974, 'Aberturas Alemani', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2975, 'ACA SALUD', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2976, 'ACMC SRL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2977, 'Acosta Juan Enrique', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2978, 'AGENCIA ISIDORO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2979, 'AGF ALLIANZ ARG.CIA ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2980, 'AGRO EL CARRETERO S.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.agroelcarretero.com.ar/', 0),
(2981, 'AGRO INDUSTRIA TRES ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2982, 'AGRO-GILARDONI S.R.L', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2983, 'Agromar SA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2984, 'AGROPAL S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.agropal.com/', 0),
(2985, 'AGROPRIMUS S.A', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.agroprimus.com.ar/', 0),
(2986, 'AGUADAS GOMEZ HNOS S', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.pisosgomez.com.ar/', 0),
(2987, 'Agustin Clerch', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2988, 'AIELLO JOSE E HIJOS ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.aielloehijos.com.ar/', 0),
(2989, 'AIELLO NATALIO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2990, 'ALARCON ANA VERONICA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2991, 'ALBA E.A.DE Y G.ALBA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2992, 'ALBERCA FACUNDO SEBA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2993, 'ALEGRO MARIA ANTONEL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2994, 'ALONSO CARLOS ALBERT', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2995, 'ALONSO MARIA ROSARIO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2996, 'ALTUNA CARLOS F.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2997, 'ALVARADO S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2998, 'ALVAREZ TARGISE JUAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(2999, 'Amestoy Automotores ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3000, 'ANA JORGE OSCAR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3001, 'ANDERBERG FERNANDO A', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3002, 'ANDORNO GABRIELA ROS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3003, 'ANDREATTA GRACIELA D', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3004, 'Antuen S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3005, 'AQUATICA S.A. E/F.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.complejoaquatica.com/', 0),
(3006, 'ARAMBERRI LUIS ALFRE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3007, 'ARANEGUI KARINA BEAT', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3008, 'ARENAS OSVALDO ARIEL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.arenasneumaticos.com.ar/', 0),
(3009, 'ARIAS AMALIA-GROENEN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3010, 'ARISTEGUI SERGIO FAB', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3011, 'ARRACHEA BARRIOS SRL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3012, 'ARTURE DE MARTINEZ C', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3013, 'ASEF EDUARDO RUBEN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3014, 'ASOC. DE ABOGADOS DE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3015, 'ASOC. MUTUAL DAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://mutualdan.com.ar/', 0),
(3016, 'ASTIZ JORGE ARIEL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3017, 'ASTIZ MARIANA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3018, 'AUSTRAL MOTOR S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.australmotor.com.ar/', 0),
(3019, 'Automotores Vazquez', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.automotoresvazquez.com.ar/', 0),
(3020, 'AYALA RAMON ANDRES', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3021, 'AZTIZ MARIO SANTIAGO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3022, 'BAQUEDANO MARTIN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3023, 'Barainca Eduardo', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3024, 'BARAINCA EDUARDO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3025, 'BARCALA SERGIO ANDRE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3026, 'BARRAZA MARIA MATILD', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3027, 'BARRERAS ALBERTO MIG', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3028, 'BASSINI MARIA PAULA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3029, 'BAZAR EL MUNDIAL S.R', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3030, 'BEITIA LUIS ALBERTO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3031, 'BELOQUI ALBERTO Y IR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3032, 'BENGOCHEA SUSANA MAR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3033, 'BERESFORD S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3034, 'BERGARMO LUCIANA CAR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3035, 'BERTEL SKOU SAAII Y ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3036, 'BETTOMEO ROBERTO SAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3037, 'BIANCHI LUCIANO SEBA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3038, 'Bodycare', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3039, 'BONIFACIO LILIANA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3040, 'BONINI JUAN CARLOS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3041, 'BORIONI JUAN PABLO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3042, 'BRACCO LAURA NOEMI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3043, 'BRAJOVICH GUILLERMO ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3044, 'BRAVO CARLOS-MARQUIS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3045, 'BREA DIEGO ALBERTO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3046, 'BREA OMAR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3047, 'BUSTOS SILVINA LILIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3048, 'CABANE OSMAR ALBERTO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3049, 'CAMBEX S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3050, 'CAMPAGNE MARIO CESAR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3051, 'CAMPOS CARMEN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3052, 'CAMUS FLORENCIA AGUS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3053, 'CAPRISTO FLORENCIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3054, 'CARRERA HNOS.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3055, 'CARRERA MARIA INES', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3056, 'CARRERA NELIDA SUSAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3057, 'CARRERA Y SALDUNA SO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3058, 'CASA HUMBERTO LUCAIO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3059, 'CASTRO NELLY', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3060, 'CATALANO MAURO ELIO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3061, 'CELTA-COOP.OB.Y S.PU', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.celtatsas.com.ar/', 0),
(3062, 'CENTRO ACOPIADORES C', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3063, 'CENTRO BULONERO TS.A', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3064, 'CEPEDA MARISOL GRACI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3065, 'CEPEDA SILVIA MARIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3066, 'CEREALERA TRES ARROY', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3067, 'CERIANI NANCY GRACIE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3068, 'CERVINI MARIA SUSANA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3069, 'CHACHERO GUILLERMO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3070, 'Childrens Wish', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3071, 'CHIQUETTE NESTOR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3072, 'CIA.DE SEG.LA MERCAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'https://www.mercantilandina.com.ar/', 0),
(3073, 'Ciancaglini Cesar Ma', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3074, 'Clerch Ignacio Agust', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3075, 'Clinica Privada Hisp', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3076, 'CLUB DE CAZADORES DE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.clubcazadores.com.ar/', 0),
(3077, 'COLANTONIO JOSE A.Y ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3078, 'COLLAZOS ALDO O.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3079, 'COLONNA OMAR RODOLFO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3080, 'COMASA S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3081, 'COMPAÃ‘IA EURO SRL.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3082, 'Compu3', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.compu3.com.ar/', 0),
(3083, 'CONFITERIA LA PERLA ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3084, 'CONSULTORA RH -TRES ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3085, 'CONTRERAS LUIS ALBER', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3086, 'COOP.DE TRANSP.DE TS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3087, 'COOP.ELECT.LTDA.DE C', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://celcla.com.ar/', 0),
(3088, 'COOP.RURAL LTDA.ALFA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.coopalfa.com.ar/', 0),
(3089, 'Cooperativa Agraria ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3090, 'CREDIL S.R.L.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3091, 'CUELLO ROLANDO FABIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3092, 'CUMECHE S.R.L.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3093, 'CUMECHE SRL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3094, 'DABIEN DE CHIRINO MA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3095, 'DAGUERRE CRISTINA JO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3096, 'DALESA S.R.L.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3097, 'DANUNZZIO MARIANELA ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3098, 'DANUNZZIO VALERIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3099, 'DATRI SANDRA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3100, 'DE BENEDETTO AUGUSTO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3101, 'DE LA CAL FRANCISCO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3102, 'DE LA PENNA JUAN CAR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3103, 'DE ZOETE SANDRA MARI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3104, 'DEJEAN ROBERTO OSCAR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3105, 'DEL CASTAÃ‘O ANGEL R', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3106, 'DEL GRANDE SERGIO FA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3107, 'DEL VALLE MARIA LOUR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3108, 'DEL VALLE NELSON BER', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3109, 'Delgado Sonia Alejan', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3110, 'Despensa El Gauchito', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3111, 'DESTAIN ANA KARINA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3112, 'DI BELLO GABRIEL GUI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3113, 'DI CROCE CLAUDIA ALE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3114, 'DI FULVIO LUIS EUGEN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3115, 'DI MARCO JUAN E.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3116, 'DI ROCCO GUILLERMINA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3117, 'DI ROCCO MARIA CECIL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3118, 'DI SALVO GRACIELA ES', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3119, 'DI SALVO GUILLERMO E', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3120, 'DI SALVO S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3121, 'DI TOMMASO MARIO Y T', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3122, 'DI VITO CARMELO A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3123, 'DI VITO CLAUDIA SUSA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3124, 'DIAZ RAUL ALBERTO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3125, 'DIAZ ROSANA BEATRIZ ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3126, 'DIEZ PATRICIA ANDREA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3127, 'DIFONZO & MARCHI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3128, 'Dragon Rojo', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'www.dragonrojotaekwondo.com.ar', 0),
(3129, 'DUPUY STELLA MARIS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3130, 'E.I.L.A. S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'Ver Facebook', 0),
(3131, 'Eduardo Ramon Jatib', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3132, 'EDUARDO SANTIAGO JUA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3133, 'EICHLER EDUARDO HUGO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3134, 'ELCUAZ HECTOR A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3135, 'ELEBAR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.elebar.com.ar/', 0),
(3136, 'ELGART REYNALDO E Y ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3137, 'ELGART VERONICA Y EL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3138, 'ELICALDE NESTOR JUAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3139, 'Elsa Maria Garat', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3140, 'ELUSTONDO ALICIA BEA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.federada.com/', 0),
(3141, 'ERRAZU MARIA EMILIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3142, 'ESPELUSE RODOLFO Y C', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3143, 'Estacion de Servicio', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3144, 'ESTUDIO ANDRENACCI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3145, 'ESTUDIO PANDOLFO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3146, 'ESTUDIO SALIM', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3147, 'ETCHETO ENRIQUE ANDR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3148, 'ETCHEVERRY ALFREDO J', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3149, 'ETERNET S.R.L.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.eternet.cc/', 0),
(3150, 'EXPRESO EL VASQUITO ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.expresoelvasquito.com.ar/', 0),
(3151, 'FAGEMAR S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3152, 'FAMTEX S.R.L.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3153, 'FARINA AMERICO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3154, 'FARMACIA TRES ARROYO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3155, 'FAVACARD S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.favacardweb.com.ar/', 0),
(3156, 'FERNANDEZ CRISTINA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3157, 'FERNANDEZ DESTAIN CE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3158, 'FERNANDEZ MIGUEL ANG', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3159, 'FERNANDEZ PABLO O Y ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3160, 'FERNANDEZ RODOLFO Y ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3161, 'FERNANDEZ VILLANUEVA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3162, 'FERRARI RICARDO DOMI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3163, 'FERRARI RODRIGO EDUA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3164, 'FERRARIO GUSTAVO ADR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3165, 'FINVERCAR S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3166, 'FLYING MOTORS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'www.flyingmotors.com.ar', 0),
(3167, 'FOSQUE MARIA ADELA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3168, 'FRIGORIFICO CAPRIATA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3169, 'FUCHS SANDRA CECILIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3170, 'FUSION VIAJES S.R.L', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3171, 'GALLARDO JAVIER NEST', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.istilart.com.ar/inicio/', 0),
(3172, 'Ganim Nestor Hugo', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3173, 'GARCIA GABRIEL Y GUS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3174, 'GARCIA MARIA DEL CAR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3175, 'GARCIA MAURICIO DAVI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3176, 'GARCIA ROCIO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3177, 'GARCIA SERGIO RAUL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3178, 'GASANEO JUAN PEDRO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3179, 'GASPAROLI ANA TERESA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3180, 'GEJO RUBEN Y RODOLFO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3181, 'GENOVESI HNOS.S.R.L', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.estaciongenovesihnossrl.com/', 0),
(3182, 'Gestion Inmobiliaria', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3183, 'GIACOMINO ANDREA SUS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3184, 'GIANELLI MARIA VICTO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3185, 'GIMNASIO STADIUM', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://stadiumgim.com.ar/', 0),
(3186, 'GIULIANI HECTOR Y LU', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3187, 'GONZALEZ JORGE VENTU', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3188, 'GONZALEZ LUIS ALBERT', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3189, 'GONZALEZ MARCELO GAB', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3190, 'GONZALEZ MARCELO OSC', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3191, 'GONZALEZ MARIA LAURA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3192, 'GRANDA LUCIANO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3193, 'GROSSO CLAUDIA LUJAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3194, 'GRUAS Y MONTAJES IOR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.ioriogruas.com.ar/', 0),
(3195, 'GUAZZORA ELSA CELICA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3196, 'GUILLERMO ECHEVARRIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3197, 'GUISASOLA MARIA LEON', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3198, 'GUSTAVO FIORDA MAQUI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.fiordagustavo.com.ar/', 0),
(3199, 'HERNANDEZ HUGO SEBAS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3200, 'HERRERA F-HERRERA N-', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3201, 'HERRERO RAUL MARIO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3202, 'HOJOBAR S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3203, 'HOLLENDER PEDRO MARC', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3204, 'Hotel Elegance', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.elegancetresarroyos.com.ar/', 0),
(3205, 'Hugo Costanzo', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3206, 'IELMINI NELIDA ESTER', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3207, 'INGENERARE SRL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://fluorless.com.ar/', 0),
(3208, 'INMOBILIARIA VENTO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3209, 'INSEL INGENIERIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.inselingenieria.com/', 0),
(3210, 'INSTITUTO BIOQUIMICO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.ibta.com.ar/', 0),
(3211, 'IRIART FERNANDO RAUL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3212, 'IRIBARNE EDUARDO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3213, 'ISMAEL CLAUDIO ANIBA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3214, 'ITALIANI MARIA ELENA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3215, 'JACOBSEN ANDRES RAUL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3216, 'JALLE ANDRES', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3217, 'JAUREGUIBEHERE LIA M', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3218, 'JEANNERET JULIO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3219, 'JORGE ALBERTO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3220, 'LA AGRICOLA GANAD.DE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.laagricolaganadera.com.ar/', 0),
(3221, 'La Atomica Carlos Ce', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.laatomica.com.ar/', 0),
(3222, 'LA CASA DE LOS BULON', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.lacasadelosbulones.com.ar/', 0),
(3223, 'La casa del pantalon', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3224, 'LA PERSEVERANCIA SEG', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3225, 'La Voz del Pueblo', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3226, 'LABORDE CARLOS ALBER', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3227, 'LAGO S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.chevroletlago.com.ar/', 0),
(3228, 'LAMBERTA JORGE MIGUE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3229, 'LANCE FABIANA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3230, 'LARA ROBERTO MARCELO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3231, 'LARRIESTRA BEATRIZ C', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3232, 'LARSEN CESAR GERARDO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3233, 'LAS MECHAS SOCIEDAD ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3234, 'LASO - 3 ARROYOS S.A', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.laso.com.ar/laempresa.htm', 0),
(3235, 'LATORRE ALEJANDRO MA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3236, 'LATORRE JOAQUIN IGNA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3237, 'LAVANDERIA TRES ARRO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3238, 'LAVERENS GUSTAVO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3239, 'Leguizamon Esteban H', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3240, 'LETAMENDI LUIS ANGEL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3241, 'LIEBANA JORGE F.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3242, 'LIFIRON S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3243, 'LLANOS ALICIA CLALFI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3244, 'LOFIEGO JOSE JUIS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3245, 'LOPEZ IRMA ELENA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3246, 'LOPEZ NESTOR FABIAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3247, 'LOSADA RICARDO OSVAL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3248, 'LUIS BLANCO S.A', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3249, 'M.A.M. S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.mam-sa.com/contacto.php', 0),
(3250, 'MACHADO ROBERTO OSCA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3251, 'MACHADO ROBERTO OSCA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3252, 'MACIEL HERMANOS S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3253, 'MADERAS S. JOSE DE L', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3254, 'MAPFRE ARGENTINA SEG', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3255, 'Marco Polo', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3256, 'Marea', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3257, 'MARINO MONICA GRACIE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3258, 'MARKON MARIA TERESA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3259, 'MARTINEZ CLAUDIO NES', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3260, 'MARTINEZ DE CAMPOS A', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3261, 'MARTINEZ JULIO CESAR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3262, 'MARTINEZ RUBEN OSCAR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3263, 'MARTIN-GUIDO-PERALTA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3264, 'MASCHI EDUARDO ERNES', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.eduardomaschi.com.ar/', 0),
(3265, 'MASTROSIMONE GUSTAVO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3266, 'MAYER RICARDO AUTOMO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3267, 'MENNA CEREALES', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3268, 'MENNA ELIANA ANDREA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3269, 'MENNA LORENZO N.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3270, 'MEO GUZMAN ENRIQUE F', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3271, 'Mera Fernando Omar', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3272, 'MERLINO PLAN S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3273, 'MERLO CARMEN HERMINI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3274, 'MESA DE FORCHETTI MO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3275, 'METALURGICA MOLINA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3276, 'Miedan, Ana Karina', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3277, 'MILLA SUR S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.grupo-milla.com.ar/', 0),
(3278, 'MIO FIGLIO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3279, 'MOIRANO EVELIA LILIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3280, 'MOIZZI JUAN JOSE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3281, 'MOLINA HECTOR MARIAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3282, 'MOLINOS TRES ARROYOS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3283, 'MOLINOS ZALLA S.A', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.molinoszalla.com.ar/', 0),
(3284, 'MOLLER GUSTAVO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3285, 'MONSALVO MARIA DE LO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3286, 'MONTESINOS JOSE MANU', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3287, 'MORA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3288, 'MORAN JORGE ANTONIO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3289, 'MULLER DE PRADO BLAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3290, 'NIELSEN SILVINA ANA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3291, 'NIKRO S.A', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3292, 'NOICSA S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3293, 'OHACO RAUL BAUTISTA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3294, 'OLEOHIDRAULICA DI RO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3295, 'OLOCCO BARTOLO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3296, 'OLSEN CRISTIAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3297, 'ONGARINI LIVIO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3298, 'PALLA SILVIA CRISTIN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3299, 'PALLADINO  S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3300, 'PALMA NORA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3301, 'Panaderia San Agusti', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3302, 'Panificadora San Jua', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3303, 'PANNELLA SERGIO RAUL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3304, 'PARDO ALBERTO ARNALD', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.castelliypardo.com/', 0),
(3305, 'Parque Hotel', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.parquehotel.com.ar/', 0),
(3306, 'PARRAVICINI EDUARDO ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3307, 'PASCUAL SILVIA ADRIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3308, 'PAZOS DE VELOSO MABE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3309, 'PC TRUCKS TRES ARROY', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.pctrucks.com.ar/', 0),
(3310, 'PELLITERO MARIA LAUR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3311, 'Penelope Lanas', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3312, 'PENNINI MARIO A Y DE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3313, 'PEQUEÃ‘O JOSE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3314, 'PERCON MATERIALES Y ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3315, 'PEREZ DALSGAARD Y CI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3316, 'PEREZ GUILLERMO LUIS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3317, 'PEREZ GUSTAVO MIGUEL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3318, 'PEREZ MARIA ISABEL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3319, 'PEREZ NELSON ADRIAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3320, 'PEREZ PAULA ANDREA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3321, 'Perfumeria Beatriz', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3322, 'PERTICARARI JUAN PAB', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3323, 'PETELA HECTOR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3324, 'PIERINI CARLOS FABIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3325, 'PINTURERIAS RUCCI S.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3326, 'PIROSANTO CAMILO ALD', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3327, 'Pizza 3', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.pizza-3.com/legal', 0),
(3328, 'PODESTA MARIANA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3329, 'POLIMED DE TRES ARRO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3330, 'PONCE EDUARDO ESTEBA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3331, 'POULSEN PEDRO-CAZEAU', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3332, 'PRIETO JUAN JOSE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3333, 'PROCACCINI FRANCISCO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3334, 'PRODYSER S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3335, 'Quimera Travel Group', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3336, 'QUIMICA MOLERO S.R.L', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3337, 'Quintana Roberto Mar', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3338, 'RANZINI MATIAS FEDER', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3339, 'RAVELLA RICARDO H.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3340, 'RE MARIO CESAR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3341, 'RECARI MARIANO (Pana', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3342, 'RECICLADOS TRES ARRO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3343, 'RED 24', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3344, 'REFAFLOTO S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3345, 'REFRESH', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3346, 'RENDO DE PODESTA IRM', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3347, 'REY ANA MARIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3348, 'RIDINO EDUARDO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3349, 'ROAS SACIF', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://roas.com.ar/', 0),
(3350, 'RODERA FRANCISCO Y J', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3351, 'RODRIGUEZ TERESA ANG', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3352, 'ROLANDO LUIS ROBERTO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3353, 'RUBIO DANIEL CECILIO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3354, 'SABATINI MARCELO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3355, 'SAEZ SILVIA NELLY', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3356, 'SAGARDOY FERNANDO JO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3357, 'SAINI SERGIO DANIEL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3358, 'SALOME JULIO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3359, 'SAN PELLEGRINI DE M.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3360, 'SANCHEZ ELIZABETH', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3361, 'SANCHEZ GRACIELA NOE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3362, 'SANCHEZ MONICA LUJAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3363, 'SANCHEZ N.DE PEREYRA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3364, 'SANDE JUAN JOSE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3365, 'Sandra Marisa Rivero', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3366, 'SANI TRES S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3367, 'SANTAJULIANA M. ALEJ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3368, 'SANTIRSO MARIA ROSAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3369, 'SANTOS NESTOR HUGO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3370, 'SAURO ROBERTO CESAR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3371, 'SCARCELLA DIEGO JOSE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3372, 'SCHENCH ANDREA FABIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3373, 'SCHUMACHER ALFREDO Y', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.oleodinamicatrh.com.ar/', 0),
(3374, 'Sebastian Rosales', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3375, 'SEGURID. FENIX S.A', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3376, 'SEMILLERA PAMPA FERT', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.pampafertilsemillas.com.ar/', 0),
(3377, 'SEQUEIRA CARLOS ENRI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3378, 'SISTEMAS TERMODINAMI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.trezzo.com.ar/', 0),
(3379, 'SOBANSKI VICTOR ADOL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3380, 'SOC. DE TRANSP.LIBRE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3381, 'SODA LA HUELLA S.R.L', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3382, 'SODE HORACIO ABEL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.implementossode.com.ar/', 0),
(3383, 'SORIANO MIGUEL ANGEL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3384, 'SORIANO RAFAEL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://sorianoinmobiliaria.com.ar/', 0),
(3385, 'SPENZA MARIANO M.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3386, 'STARCEL PAMPA CENTRO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3387, 'SUAREZ ADELA JOSEFIN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3388, 'SUAREZ JORGE EDUARDO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.jorgesuarezsa.com.ar/', 0),
(3389, 'SUPERCARNE S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3390, 'SUPERMERCADO PLANETA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.supermercadoplaneta.com.ar/', 0),
(3391, 'SUR AGROPECUARIA S.A', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3392, 'SURIA ISMAEL C.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3393, 'TARABORELLI MARIO JE', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3394, 'TARANTELA ELVIRA ELS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3395, 'TARJETA NARANJA SA.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.tarjetanaranja.com/', 0),
(3396, 'TARQUINUS ALEJANDRA ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3397, 'TEILETCHE ENRIQUE Y ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3398, 'TIEMERSMA SEBASTIAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3399, 'Tito Otero', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.titootero.com/', 0),
(3400, 'TORRES CARIONI MARIA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3401, 'TORRES CARIONI SANTI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3402, 'TOSTEX S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.tostex.com.ar/', 0),
(3403, 'TRAFER SAIC', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.trafer.com.ar/', 0),
(3404, 'TRANSPORTE GOIZUETA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3405, 'TRAVERSO GUILLERMO H', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3406, 'Trelactea', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://trelactea.com/', 0),
(3407, 'TRESNECO S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3408, 'TRIBIÃ‘O ALBERTO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3409, 'TRUCK EXPRESS S.R.L.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.transportetrucksexpress.com/', 0),
(3410, 'TUMINI D. Y J. Y MEN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3411, 'TURINI PABLO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3412, 'UGALDE ALDO FABIAN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3413, 'ULLERUP RAUL ADOLFO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3414, 'UNIVALORES S.A.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3415, 'URBAN ANDERSEN MARCO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3416, 'URBIETA ANDRES', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3417, 'URRUTIA MARIA MARTA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3418, 'UZCUDUN S.A.F.I.M.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3419, 'UZIDINGER EDUARDO NI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3420, 'VACCA REINALDO RUBEN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3421, 'Venecia Turismo', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3422, 'VERGNANO RAUL ANDRES', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3423, 'VERKUYL ASTRID CINTI', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3424, 'VETERINARIA EL MOLIN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3425, 'VIGILAN S.R.L.AG.DE ', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', 'http://www.securitas.com/ar/', 0),
(3426, 'VILLAFRANCA MARTA S.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3427, 'VILLALBA PEDRO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3428, 'VILLEMUR GUSTAVO MIG', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3429, 'VINOTECA LOS TONELES', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3430, 'Viviana A Villalva', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3431, 'VIVIANI CARMEN', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3432, 'VIZZOLINI HUGO CESAR', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3433, 'VIZZOLINI NESTOR J.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3434, 'WEHRHANNE HORACIO MA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3435, 'WEST FERNANDO LUIS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3436, 'ZIJLSTRA JORGE ROBER', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3437, 'ZIJLSTRA SILVINA', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3438, 'ZORRILLA HNOS. S.R.L', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3439, 'ZOTES SAUL FRANCISCO', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3440, 'ZURITA HNOS. Y CIA.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3441, 'RUTA 2 S.R.L.', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0);
INSERT INTO `empresa` (`idempresa`, `denominacion`, `idrubro`, `detactividad`, `cantempleados`, `idcategoria`, `fechainicioce`, `activo`, `importemensual`, `fechafundacion`, `cuit`, `web`, `numusuario`) VALUES
(3442, 'MIO FIGLIO SRL', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3443, 'NALDO LOMBARDI S.A', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0),
(3444, 'EL CONSTRUCTOR DE TS', 11, 'Sin completar', 0, 15, '2015-07-03', 0, 0, '2015-07-03', '0', '', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `infmedidorexcel`
--

INSERT INTO `infmedidorexcel` (`id`, `actualizados`, `totalregistros`, `fecha`, `fallados`, `medidorInsertado`, `registroNoInsertado`, `medidorActualizado`, `empresaActualizada`, `relacionInsertada`, `medidorSinEmpresaInsertado`, `medidorSinEmpresaActualizado`) VALUES
(6, '""', 4, '2015-07-02 03:07:14', '{"4":{"numusuario":"Correcto","numsuministros":"Correcto","apeynom":"Revisar","importe":"Correcto","numerodefila":4}}', 0, 1, 3, 0, 0, 0, 2),
(7, '{"3":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Mercantil ","cuit":"1","titular":"ACMC S.R.L."}}', 4, '2015-07-02 03:07:43', '{"4":{"numusuario":"Correcto","numsuministros":"Correcto","apeynom":"Revisar","importe":"Correcto","numerodefila":4}}', 0, 1, 3, 1, 0, 0, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1022 ;

--
-- Volcado de datos para la tabla `medidor`
--

INSERT INTO `medidor` (`idmedidor`, `nomyap`, `telefono`, `domicilio`, `importepago`, `numusuario`, `numsuministro`, `activo`, `fechadeultimopago`) VALUES
(1018, 'ABELLEIRA FABIAN-LEN', '00015611812', 'COLON 239', '50', '484901', '7712', 1, '2015-07-01'),
(1019, 'ACA SALUD COOPERATIV', '0', 'CHACABUCO 549', '87', '549033', '45768', 1, '2015-07-01'),
(1020, 'ACMC S.R.L.', '00000000000', 'MORENO 423', '50', '5597630', '8242', 1, '2015-07-01'),
(1021, 'AGF ALLIANZ ARG.CIA ', '00000000000', 'MAIPU 80', '50', '543770', '7919', 1, '2015-07-01');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `rubro`
--

INSERT INTO `rubro` (`id`, `descripcion`) VALUES
(11, 'N/A');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=199 ;

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
(3, 'Nelson', 'Garrido', 'neg90', 'kapanga', 1, 'dsa@dsa.com', 6);

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
