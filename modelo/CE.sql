-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 13, 2015 at 02:47 AM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `CE`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id`, `descripcion`) VALUES
(2, 'Minorista');

-- --------------------------------------------------------

--
-- Table structure for table `contacto`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=154 ;

--
-- Dumping data for table `contacto`
--

INSERT INTO `contacto` (`idcontacto`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo`, `asociadosm`, `activo`, `tipodocumento`, `documento`) VALUES
(153, 'Nelson', 'Nisman', '(011) 15-3858-7990', 'Moreno 8567', 'neg90@hotmail.com', 0, 1, 'DU', '3541424');

-- --------------------------------------------------------

--
-- Table structure for table `contactoempresa`
--

CREATE TABLE IF NOT EXISTS `contactoempresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcontacto` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `relacion` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idcontacto` (`idcontacto`),
  KEY `idempresa` (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `correoempresa`
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
-- Table structure for table `domicilioempresa`
--

CREATE TABLE IF NOT EXISTS `domicilioempresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idempresa` int(11) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `medidor`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `medidor`
--

INSERT INTO `medidor` (`idmedidor`, `nomyap`, `telefono`, `domicilio`, `importepago`, `numusuario`, `numsuministro`, `activo`) VALUES
(1, 'Sebastian Martinez', '2983400440', 'Azcuenaga 999', '40.35', '1264339', '009827635', 1),
(4, 'Perez Juan', '', '', '99,99', '72837', '5653654', 1);

-- --------------------------------------------------------

--
-- Table structure for table `medidorempresa`
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
-- Table structure for table `permisos`
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
-- Dumping data for table `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `csocio`, `rsocio`, `usocio`, `dsocio`, `cmedidor`, `rmedidor`, `umedidor`, `dmedidor`, `cci`, `rci`, `uci`, `dci`, `crol`, `rrol`, `urol`, `drol`, `cusuario`, `rusuario`, `uusuario`, `dusuario`) VALUES
(5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL,
  `idpermisos` int(11) NOT NULL,
  PRIMARY KEY (`idrol`),
  KEY `idpermisos` (`idpermisos`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`idrol`, `nombre`, `idpermisos`) VALUES
(6, 'root', 5);

-- --------------------------------------------------------

--
-- Table structure for table `rubro`
--

CREATE TABLE IF NOT EXISTS `rubro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rubro`
--

INSERT INTO `rubro` (`id`, `descripcion`) VALUES
(1, 'Economia');

-- --------------------------------------------------------

--
-- Table structure for table `telefonoempresa`
--

CREATE TABLE IF NOT EXISTS `telefonoempresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idempresa` int(11) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
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
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `username`, `password`, `activo`, `correo`, `idrol`) VALUES
(2, 'Alejandro', 'Cabane', 'qw3r7y', 'kapanga', 1, 'asd@asd.com', 6),
(3, 'Nelson', 'Garrido', 'neg90', 'kapanga', 1, 'dsa@dsa.com', 6);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contactoempresa`
--
ALTER TABLE `contactoempresa`
  ADD CONSTRAINT `contactoempresa_ibfk_1` FOREIGN KEY (`idcontacto`) REFERENCES `contacto` (`idcontacto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contactoempresa_ibfk_2` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `correoempresa`
--
ALTER TABLE `correoempresa`
  ADD CONSTRAINT `correoempresa_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `domicilioempresa`
--
ALTER TABLE `domicilioempresa`
  ADD CONSTRAINT `domicilioempresa_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresa_ibfk_2` FOREIGN KEY (`idrubro`) REFERENCES `rubro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medidorempresa`
--
ALTER TABLE `medidorempresa`
  ADD CONSTRAINT `medidorempresa_ibfk_1` FOREIGN KEY (`idmedidor`) REFERENCES `medidor` (`idmedidor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medidorempresa_ibfk_2` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rol`
--
ALTER TABLE `rol`
  ADD CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`idpermisos`) REFERENCES `permisos` (`idpermiso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `telefonoempresa`
--
ALTER TABLE `telefonoempresa`
  ADD CONSTRAINT `telefonoempresa_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
