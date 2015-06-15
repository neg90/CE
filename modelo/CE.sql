-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-06-2015 a las 09:37:29
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
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `descripcion`) VALUES
(2, 'Minorista'),
(3, 'asdasdasdasd'),
(4, '123'),
(5, 'asdas'),
(6, '123123'),
(7, '456456'),
(8, 'hh'),
(9, '11'),
(10, 'aaa'),
(11, '555555'),
(12, 'asddsaadsdasdasadsadsdadaasdsdadas'),
(13, 'qwerwerwerwer');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=155 ;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`idcontacto`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo`, `asociadosm`, `activo`, `tipodocumento`, `documento`) VALUES
(153, 'Nelson', 'Nisman', '(011) 15-3858-7990', 'Moreno 8567', 'neg90@hotmail.com', 0, 1, 'DU', '3541424'),
(154, 'asd', 'asd', 'asd', 'asd', 'asd', 1, 1, 'asd', '123123');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=559 ;

--
-- Volcado de datos para la tabla `contactoempresa`
--

INSERT INTO `contactoempresa` (`id`, `idcontacto`, `idempresa`, `relacion`) VALUES
(538, 153, 40, ''),
(539, 154, 40, ''),
(540, 154, 40, ''),
(541, 153, 40, ''),
(542, 154, 40, ''),
(543, 154, 40, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Volcado de datos para la tabla `correoempresa`
--

INSERT INTO `correoempresa` (`id`, `idempresa`, `correo`, `descripcion`) VALUES
(30, 40, 'pichi@asd', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Volcado de datos para la tabla `domicilioempresa`
--

INSERT INTO `domicilioempresa` (`id`, `idempresa`, `domicilio`, `descripcion`) VALUES
(30, 40, 'Moreno 400', '');

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
  `nrosocio` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `importemensual` double NOT NULL,
  `fechafundacion` date NOT NULL,
  `cuit` varchar(100) NOT NULL,
  `web` varchar(100) NOT NULL,
  PRIMARY KEY (`idempresa`),
  KEY `idrubro` (`idrubro`),
  KEY `idcategoria` (`idcategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idempresa`, `denominacion`, `idrubro`, `detactividad`, `cantempleados`, `idcategoria`, `fechainicioce`, `nrosocio`, `activo`, `importemensual`, `fechafundacion`, `cuit`, `web`) VALUES
(40, 'Mercantil Andina ', 3, '', 4, 2, '2015-06-24', 569586, 1, 45, '0000-00-00', '20354140447', 'www.merecantil.com');

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
  PRIMARY KEY (`idmedidor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `medidor`
--

INSERT INTO `medidor` (`idmedidor`, `nomyap`, `telefono`, `domicilio`, `importepago`, `numusuario`, `numsuministro`, `activo`) VALUES
(5, 'Nelson Garrido', '(011) 15-3858-7990', 'Moreno 8567', '0.0', '5', '123', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `medidorempresa`
--

INSERT INTO `medidorempresa` (`id`, `idmedidor`, `idempresa`) VALUES
(22, 5, 40);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `rubro`
--

INSERT INTO `rubro` (`id`, `descripcion`) VALUES
(3, '123'),
(4, 'asdasd'),
(5, '123123'),
(6, '45456'),
(7, 'hh'),
(8, 'aa'),
(9, 'qqq'),
(10, '555555');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Volcado de datos para la tabla `telefonoempresa`
--

INSERT INTO `telefonoempresa` (`id`, `idempresa`, `telefono`, `descripcion`) VALUES
(32, 40, '2222222', '');

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
