-- phpMyAdmin SQL Dump
-- version 4.2.6deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 25-06-2015 a las 12:07:52
-- Versión del servidor: 5.5.43-0ubuntu0.14.10.1
-- Versión de PHP: 5.5.12-2ubuntu4.4

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
`numabonado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonadoempresa`
--

CREATE TABLE IF NOT EXISTS `abonadoempresa` (
`id` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `numabonado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
`id` int(11) NOT NULL,
  `descripcion` varchar(500) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

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
(13, 'qwerwerwerwer'),
(14, 'CUAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE IF NOT EXISTS `contacto` (
`idcontacto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `asociadosm` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `tipodocumento` varchar(4) NOT NULL,
  `documento` varchar(100) NOT NULL
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
`id` int(11) NOT NULL,
  `idcontacto` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `relacion` varchar(30) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correoempresa`
--

CREATE TABLE IF NOT EXISTS `correoempresa` (
`id` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `correoempresa`
--

INSERT INTO `correoempresa` (`id`, `idempresa`, `correo`, `descripcion`) VALUES
(1, 122, 'sistemas@cresta.edu.ar', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilioempresa`
--

CREATE TABLE IF NOT EXISTS `domicilioempresa` (
`id` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=301 ;

--
-- Volcado de datos para la tabla `domicilioempresa`
--

INSERT INTO `domicilioempresa` (`id`, `idempresa`, `domicilio`, `descripcion`) VALUES
(300, 122, 'Maipu 270', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
`idempresa` int(11) NOT NULL,
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
  `idabonadoce` int(11) NOT NULL,
  `numusuario` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=123 ;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idempresa`, `denominacion`, `idrubro`, `detactividad`, `cantempleados`, `idcategoria`, `fechainicioce`, `nrosocio`, `activo`, `importemensual`, `fechafundacion`, `cuit`, `web`, `idabonadoce`, `numusuario`) VALUES
(122, 'Parque Hotel', 3, '', 0, 2, '2015-06-18', 0, 1, 1, '0000-00-00', '111', '', 0, 7712);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medidor`
--

CREATE TABLE IF NOT EXISTS `medidor` (
`idmedidor` int(11) NOT NULL,
  `nomyap` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `domicilio` varchar(20) NOT NULL,
  `importepago` varchar(10) NOT NULL,
  `numusuario` varchar(11) NOT NULL,
  `numsuministro` varchar(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fechadeultimopago` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=936 ;

--
-- Volcado de datos para la tabla `medidor`
--

INSERT INTO `medidor` (`idmedidor`, `nomyap`, `telefono`, `domicilio`, `importepago`, `numusuario`, `numsuministro`, `activo`, `fechadeultimopago`) VALUES
(935, 'tito', '00015611812', 'COLON 239', '50', '484901', '7712', 1, '2015-06-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medidorempresa`
--

CREATE TABLE IF NOT EXISTS `medidorempresa` (
`id` int(11) NOT NULL,
  `idmedidor` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Volcado de datos para la tabla `medidorempresa`
--

INSERT INTO `medidorempresa` (`id`, `idmedidor`, `idempresa`) VALUES
(30, 935, 122);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE IF NOT EXISTS `permisos` (
`idpermiso` int(11) NOT NULL,
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
  `dusuario` tinyint(1) NOT NULL
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
`idrol` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `idpermisos` int(11) NOT NULL
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
`id` int(11) NOT NULL,
  `descripcion` varchar(500) NOT NULL
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
`id` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=196 ;

--
-- Volcado de datos para la tabla `telefonoempresa`
--

INSERT INTO `telefonoempresa` (`id`, `idempresa`, `telefono`, `descripcion`) VALUES
(195, 122, '213', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
`idusuario` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `apellido` varchar(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(25) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `idrol` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `username`, `password`, `activo`, `correo`, `idrol`) VALUES
(2, 'Alejandro', 'Cabane', 'qw3r7y', 'kapanga', 1, 'asd@asd.com', 6),
(3, 'Nelson', 'Garrido', 'neg90', 'kapanga', 1, 'dsa@dsa.com', 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonado`
--
ALTER TABLE `abonado`
 ADD PRIMARY KEY (`numabonado`);

--
-- Indices de la tabla `abonadoempresa`
--
ALTER TABLE `abonadoempresa`
 ADD PRIMARY KEY (`id`), ADD KEY `numabonado` (`numabonado`), ADD KEY `idempresa` (`idempresa`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
 ADD PRIMARY KEY (`idcontacto`);

--
-- Indices de la tabla `contactoempresa`
--
ALTER TABLE `contactoempresa`
 ADD PRIMARY KEY (`id`), ADD KEY `idcontacto` (`idcontacto`), ADD KEY `idempresa` (`idempresa`);

--
-- Indices de la tabla `correoempresa`
--
ALTER TABLE `correoempresa`
 ADD PRIMARY KEY (`id`), ADD KEY `idempresa` (`idempresa`);

--
-- Indices de la tabla `domicilioempresa`
--
ALTER TABLE `domicilioempresa`
 ADD PRIMARY KEY (`id`), ADD KEY `idempresa` (`idempresa`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
 ADD PRIMARY KEY (`idempresa`), ADD KEY `idrubro` (`idrubro`), ADD KEY `idcategoria` (`idcategoria`), ADD KEY `idabonadoce` (`idabonadoce`);

--
-- Indices de la tabla `medidor`
--
ALTER TABLE `medidor`
 ADD PRIMARY KEY (`idmedidor`);

--
-- Indices de la tabla `medidorempresa`
--
ALTER TABLE `medidorempresa`
 ADD PRIMARY KEY (`id`), ADD KEY `idempresa` (`idempresa`), ADD KEY `idmedidor` (`idmedidor`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
 ADD PRIMARY KEY (`idpermiso`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
 ADD PRIMARY KEY (`idrol`), ADD KEY `idpermisos` (`idpermisos`);

--
-- Indices de la tabla `rubro`
--
ALTER TABLE `rubro`
 ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`);

--
-- Indices de la tabla `telefonoempresa`
--
ALTER TABLE `telefonoempresa`
 ADD PRIMARY KEY (`id`), ADD KEY `idempresa` (`idempresa`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`idusuario`), ADD KEY `idrol` (`idrol`), ADD KEY `idrol_2` (`idrol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abonado`
--
ALTER TABLE `abonado`
MODIFY `numabonado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `abonadoempresa`
--
ALTER TABLE `abonadoempresa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
MODIFY `idcontacto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT de la tabla `contactoempresa`
--
ALTER TABLE `contactoempresa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `correoempresa`
--
ALTER TABLE `correoempresa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `domicilioempresa`
--
ALTER TABLE `domicilioempresa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=301;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
MODIFY `idempresa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT de la tabla `medidor`
--
ALTER TABLE `medidor`
MODIFY `idmedidor` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=936;
--
-- AUTO_INCREMENT de la tabla `medidorempresa`
--
ALTER TABLE `medidorempresa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `rubro`
--
ALTER TABLE `rubro`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `telefonoempresa`
--
ALTER TABLE `telefonoempresa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=196;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
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
