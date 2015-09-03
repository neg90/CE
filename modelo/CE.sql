-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 03-09-2015 a las 00:52:04
-- Versión del servidor: 5.5.44-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.11

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `descripcion`) VALUES
(24, 'N/A'),
(25, 'asd');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`idcontacto`, `nombre`, `apellido`, `telefono`, `domicilio`, `correo`, `asociadosm`, `activo`, `tipodocumento`, `documento`) VALUES
(1, 'Nelson', 'Garrido', '2983612548', 'Moreno 854', 'asd@asd.com', 0, 1, 'LE', '35414241');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `domicilioempresa`
--

INSERT INTO `domicilioempresa` (`id`, `idempresa`, `domicilio`, `descripcion`) VALUES
(15, 13856, '223', ''),
(27, 13868, '223', '');

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
  `importemensual` varchar(10) NOT NULL,
  `fechafundacion` date NOT NULL,
  `cuit` varchar(100) NOT NULL,
  `web` varchar(100) NOT NULL,
  `numusuario` int(11) NOT NULL,
  `prestaservicio` tinyint(1) NOT NULL,
  PRIMARY KEY (`idempresa`),
  KEY `idrubro` (`idrubro`),
  KEY `idcategoria` (`idcategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13869 ;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idempresa`, `denominacion`, `idrubro`, `detactividad`, `cantempleados`, `idcategoria`, `fechainicioce`, `activo`, `importemensual`, `fechafundacion`, `cuit`, `web`, `numusuario`, `prestaservicio`) VALUES
(13856, 'Familia asd', 18, '', 2, 24, '2015-08-31', 1, '566', '0000-00-00', '20354140447', 'www.facebook.com', 0, 1),
(13867, 'amelio', 18, '', 3, 24, '2015-09-01', 1, '566', '0000-00-00', '20354140447', 'www.facebook.com', 0, 0),
(13868, 'DexterLabs', 18, '', 3, 24, '2015-09-01', 1, '123', '0000-00-00', '20354140447', 'www.facebook.com', 0, 1);

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
  `adjunto` longtext NOT NULL,
  `mensaje` longtext NOT NULL,
  `asunto` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `infcorreo`
--

INSERT INTO `infcorreo` (`id`, `cantempresas`, `cantcontactos`, `arrayempresas`, `fecha`, `adjunto`, `mensaje`, `asunto`) VALUES
(0, 2, 0, '["12893"]', '2015-07-20 09:07:06', '{"name":"ButtersStotch.png","type":"image\\/png","tmp_name":"\\/tmp\\/phpLKrTXf","error":0,"size":132844}', '<p>Holaa</p>', 'Hola');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `infmedidorexcel`
--

INSERT INTO `infmedidorexcel` (`id`, `actualizados`, `totalregistros`, `fecha`, `fallados`, `medidorInsertado`, `registroNoInsertado`, `medidorActualizado`, `empresaActualizada`, `relacionInsertada`, `medidorSinEmpresaInsertado`, `medidorSinEmpresaActualizado`) VALUES
(21, '""', 465, '2015-07-16 07:07:43', '""', 465, 0, 0, 0, 0, 465, 0);
INSERT INTO `infmedidorexcel` (`id`, `actualizados`, `totalregistros`, `fecha`, `fallados`, `medidorInsertado`, `registroNoInsertado`, `medidorActualizado`, `empresaActualizada`, `relacionInsertada`, `medidorSinEmpresaInsertado`, `medidorSinEmpresaActualizado`) VALUES
(22, '{"1":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ABELLEIRA FABIAN-LENTOCHNIK C.","cuit":"0","titular":"ABELLEIRA FABIAN-LEN"},"2":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ACA SALUD","cuit":"0","titular":"ACA SALUD COOPERATIV"},"3":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ACMC SRL","cuit":"0","titular":"ACMC S.R.L."},"4":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGF ALLIANZ ARG.CIA SEGUROS SS","cuit":"0","titular":"AGF ALLIANZ ARG.CIA "},"5":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AGRO EL CARRETERO S.A.","cuit":"0","titular":"AGRO EL CARRETERO S."},"6":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGRO INDUSTRIA TRES ARROYOS","cuit":"0","titular":"AGRO INDUSTRIA TRES "},"7":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AGRO-GILARDONI S.R.L.","cuit":"0","titular":"AGRO-GILARDONI S.R.L"},"8":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGROPAL S.A.","cuit":"0","titular":"AGROPAL S.A."},"9":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGROPRIMUS S.A","cuit":"0","titular":"AGROPRIMUS S.A"},"10":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AGUADAS GOMEZ HNOS S.R.L.","cuit":"0","titular":"AGUADAS GOMEZ HNOS S"},"11":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"AIELLO JOSE E HIJOS S.A.","cuit":"0","titular":"AIELLO JOSE E HIJOS "},"12":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AIELLO NATALIO","cuit":"0","titular":"AIELLO NATALIO"},"13":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALARCON ANA VERONICA","cuit":"0","titular":"ALARCON ANA VERONICA"},"14":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALBA E.A.DE Y G.ALBA","cuit":"0","titular":"ALBA E.A.DE Y G.ALBA"},"15":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VIZZOLINI HUGO CESAR","cuit":"0","titular":"ALBA MIRTA GRACIELA"},"16":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALBERCA FACUNDO SEBASTIAN","cuit":"0","titular":"ALBERCA FACUNDO SEBA"},"18":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALEGRO MARIA ANTONELA","cuit":"0","titular":"ALEGRO MARIA ANTONEL"},"20":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Aberturas Alemani","cuit":"0","titular":"ALEMANI CARLOS DANIE"},"21":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALONSO CARLOS ALBERTO","cuit":"0","titular":"ALONSO CARLOS ALBERT"},"22":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALONSO MARIA ROSARIO","cuit":"0","titular":"ALONSO MARIA ROSARIO"},"23":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ALTUNA CARLOS F.","cuit":"0","titular":"ALTUNA CARLOS F."},"24":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ALVARADO S.A.","cuit":"0","titular":"ALVARADO S.A."},"25":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ALVAREZ TARGISE JUAN CARLOS","cuit":"0","titular":"ALVAREZ TARGISE JUAN"},"26":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ANA JORGE OSCAR","cuit":"0","titular":"ANA JORGE OSCAR"},"27":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ANDERBERG FERNANDO ALFREDO","cuit":"0","titular":"ANDERBERG FERNANDO A"},"28":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ANDREATTA GRACIELA DEL CARMEN","cuit":"0","titular":"ANDREATTA GRACIELA D"},"29":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"La Voz del Pueblo","cuit":"0","titular":"ANTONIO MACIEL S.R.L"},"30":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AQUATICA S.A. E\\/F.","cuit":"0","titular":"AQUATICA S.A. E\\/F."},"31":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ARAMBERRI LUIS ALFREDO","cuit":"0","titular":"ARAMBERRI LUIS ALFRE"},"32":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ARANEGUI KARINA BEATRIZ","cuit":"0","titular":"ARANEGUI KARINA BEAT"},"33":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Eduardo Ramon Jatib","cuit":"0","titular":"ARENAL PABLO E."},"34":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ARENAS OSVALDO ARIEL","cuit":"0","titular":"ARENAS OSVALDO ARIEL"},"35":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ARIAS AMALIA-GROENENBERG E.S.H","cuit":"0","titular":"ARIAS AMALIA-GROENEN"},"37":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ARISTEGUI SERGIO FABIAN","cuit":"0","titular":"ARISTEGUI SERGIO FAB"},"39":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Antuen S.A.","cuit":"0","titular":"ARRECHEA JUAN FRANCI"},"40":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ARTURE DE MARTINEZ CANEL M. J.","cuit":"0","titular":"ARTURE DE MARTINEZ C"},"41":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ASEF EDUARDO RUBEN","cuit":"0","titular":"ASEF EDUARDO RUBEN"},"42":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ASOC. DE ABOGADOS DE TS.AS.","cuit":"0","titular":"ASOC. DE ABOGADOS DE"},"43":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ASOC. MUTUAL DAN","cuit":"0","titular":"ASOC. MUTUAL DAN"},"45":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ASTIZ JORGE ARIEL","cuit":"0","titular":"ASTIZ JORGE ARIEL"},"46":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ASTIZ MARIANA","cuit":"0","titular":"ASTIZ MARIANA"},"47":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AZTIZ MARIO SANTIAGO","cuit":"0","titular":"ASTIZ MARIO SANTIAGO"},"48":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"AUSTRAL MOTOR S.A.","cuit":"0","titular":"AUSTRAL MOTOR S.A."},"49":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AYALA RAMON ANDRES","cuit":"0","titular":"AYALA RAMON ANDRES"},"50":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BAQUEDANO MARTIN","cuit":"0","titular":"BAQUEDANO MARTIN"},"51":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Barainca Eduardo","cuit":"0","titular":"BARAINCA EDUARDO JUA"},"52":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BARCALA SERGIO ANDRES","cuit":"0","titular":"BARCALA SERGIO ANDRE"},"53":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BARRAZA MARIA MATILDE","cuit":"0","titular":"BARRAZA MARIA MATILD"},"54":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BARRERAS ALBERTO MIGUEL","cuit":"0","titular":"BARRERAS ALBERTO MIG"},"56":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BASSINI MARIA PAULA","cuit":"0","titular":"BASSINI MARIA PAULA"},"57":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BAZAR EL MUNDIAL S.R.L.","cuit":"0","titular":"BAZAR EL MUNDIAL S.R"},"58":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BEITIA LUIS ALBERTO","cuit":"0","titular":"BEITIA LUIS ALBERTO"},"59":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BENGOCHEA SUSANA MARILENA","cuit":"0","titular":"BENGOCHEA SUSANA MAR"},"60":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"BERESFORD S.A.","cuit":"0","titular":"BERESFORD S.A"},"61":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BETTOMEO ROBERTO SANTIAGO","cuit":"0","titular":"BETTOMEO ROBERTO SAN"},"62":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BIANCHI LUCIANO SEBASTIAN","cuit":"0","titular":"BIANCHI LUCIANO SEBA"},"63":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BONIFACIO LILIANA","cuit":"0","titular":"BONIFACIO LILIANA"},"64":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BONINI JUAN CARLOS","cuit":"0","titular":"BONINI JUAN CARLOS"},"65":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"BORIONI JUAN PABLO","cuit":"0","titular":"BORIONI JUAN PABLO"},"66":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CONSULTORA RH -TRES ARROYOS Y ","cuit":"0","titular":"BORRA JORGE RENATO"},"67":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BRAJOVICH GUILLERMO PEDRO","cuit":"0","titular":"BRAJOVICH GUILLERMO "},"68":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BRAVO CARLOS-MARQUIS MARTA SH","cuit":"0","titular":"BRAVO CARLOS-MARQUIS"},"69":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BREA DIEGO ALBERTO","cuit":"0","titular":"BREA DIEGO ALBERTO"},"70":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BREA OMAR","cuit":"0","titular":"BREA OMAR"},"71":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"BUSTOS SILVINA LILIANA","cuit":"0","titular":"BUSTOS SILVINA LILIA"},"72":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CABANE OSMAR ALBERTO","cuit":"0","titular":"CABANE OSMAR ALBERTO"},"74":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CAMBEX S.A.","cuit":"0","titular":"CAMBEX S.A."},"75":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CAMPAGNE MARIO CESAR","cuit":"0","titular":"CAMPAGNE MARIO CESAR"},"77":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CAMPOS CARMEN","cuit":"0","titular":"CAMPOS CARMEN"},"78":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CAMUS FLORENCIA AGUSTINA","cuit":"0","titular":"CAMUS FLORENCIA AGUS"},"80":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Venecia Turismo","cuit":"0","titular":"CARRACEDO NORMA"},"81":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CARRERA HNOS.","cuit":"0","titular":"CARRERA HNOS."},"82":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CARRERA MARIA INES","cuit":"0","titular":"CARRERA MARIA INES"},"83":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CARRERA NELIDA SUSANA","cuit":"0","titular":"CARRERA NELIDA SUSAN"},"84":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CARRERA Y SALDUNA SOC.DE HECHO","cuit":"0","titular":"CARRERA Y SALDUNA SO"},"86":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CASA HUMBERTO LUCAIOLI S.A.","cuit":"0","titular":"CASA HUMBERTO LUCAIO"},"87":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CASTRO NELLY","cuit":"0","titular":"CASTRO NELLY"},"88":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CATALANO MAURO ELIO","cuit":"0","titular":"CATALANO MAURO ELIO"},"89":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CENTRO ACOPIADORES CEREALES","cuit":"0","titular":"CENTRO ACOPIADORES C"},"90":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CENTRO BULONERO TS.AS. S.R.L.","cuit":"0","titular":"CENTRO BULONERO TS.A"},"91":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CEPEDA MARISOL GRACIELA","cuit":"0","titular":"CEPEDA MARISOL GRACI"},"92":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CEPEDA SILVIA MARIA","cuit":"0","titular":"CEPEDA SILVIA MARIA"},"93":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CEREALERA TRES ARROYOS","cuit":"0","titular":"CEREALERA TRES ARROY"},"94":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CERIANI NANCY GRACIELA","cuit":"0","titular":"CERIANI NANCY GRACIE"},"95":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"La Atomica Carlos Cerri e Hijo","cuit":"0","titular":"CERRI CARLOS E HIJOS"},"96":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CERVINI MARIA SUSANA","cuit":"0","titular":"CERVINI MARIA SUSANA"},"97":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"CIA.DE SEG.LA MERCANTIL ANDINA","cuit":"0","titular":"CIA.DE SEG.LA MERCAN"},"98":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Agustin Clerch","cuit":"0","titular":"CLERCH AGUSTIN"},"99":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Clerch Ignacio Agustin","cuit":"0","titular":"CLERCH IGNACIO"},"100":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CLUB DE CAZADORES DE TS.AS.","cuit":"0","titular":"CLUB DE CAZADORES DE"},"102":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"COLANTONIO JOSE A.Y MARTIN A.","cuit":"0","titular":"COLANTONIO JOSE A.Y "},"104":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"COLLAZOS ALDO O.","cuit":"0","titular":"COLLAZOS ALDO O."},"106":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"COLONNA OMAR RODOLFO","cuit":"0","titular":"COLONNA OMAR RODOLFO"},"107":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"COMASA S.A.","cuit":"0","titular":"COMASA S.A."},"108":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"COMPA\\u00d1IA EURO SRL.","cuit":"0","titular":"COMPA\\u00d1IA EURO SRL."},"109":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CONFITERIA LA PERLA S.A.","cuit":"0","titular":"CONFITERIA LA PERLA "},"111":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CONTRERAS LUIS ALBERTO","cuit":"0","titular":"CONTRERAS LUIS ALBER"},"112":{"ModImpo":"Si","Empresa":"Actualizada","imp":200,"Medidor":"Actualizado","denominacion":"Cooperativa Agraria de Ts As L","cuit":"0","titular":"COOP.AGRARIA DE TS.A"},"113":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"COOP.DE TRANSP.DE TS.AS.LTDA.","cuit":"0","titular":"COOP.DE TRANSP.DE TS"},"114":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"COOP.ELECT.LTDA.DE CLAROMECO","cuit":"0","titular":"COOP.ELECT.LTDA.DE C"},"115":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"COOP.RURAL LTDA.ALFA","cuit":"0","titular":"COOP.RURAL LTDA.ALFA"},"116":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Hugo Costanzo","cuit":"0","titular":"COSTANZO HUGO JUAN"},"118":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"CREDIL S.R.L.","cuit":"0","titular":"CREDIL S.R.L."},"119":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"CUMECHE SRL","cuit":"0","titular":"CUMECHE S.R.L."},"120":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DABIEN DE CHIRINO MARIA ROSA","cuit":"0","titular":"DABIEN DE CHIRINO MA"},"121":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DAGUERRE CRISTINA JOSEFA","cuit":"0","titular":"DAGUERRE CRISTINA JO"},"122":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DATRI SANDRA","cuit":"0","titular":"D''ATRI SANDRA ELIZAB"},"123":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Parque Hotel","cuit":"0","titular":"DAWSON S.A."},"126":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DE LA CAL FRANCISCO","cuit":"0","titular":"DE LA CAL FRANCISCO"},"127":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DE LA PENNA JUAN CARLOS","cuit":"0","titular":"DE LA PENNA JUAN CAR"},"128":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SEGURID. FENIX S.A","cuit":"0","titular":"DE LA PENNA SEGURID."},"129":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Perfumeria Beatriz","cuit":"0","titular":"DE MARTINO MARIA EST"},"130":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DE ZOETE SANDRA MARINA","cuit":"0","titular":"DE ZOETE SANDRA MARI"},"131":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DEJEAN ROBERTO OSCAR","cuit":"0","titular":"DEJEAN ROBERTO OSCAR"},"132":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DEL CASTA\\u00d1O ANGEL RAUL","cuit":"0","titular":"DEL CASTA\\u00d1O ANGEL R"},"133":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DEL GRANDE SERGIO FABIAN","cuit":"0","titular":"DEL GRANDE SERGIO FA"},"134":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DEL VALLE MARIA LOURDES","cuit":"0","titular":"DEL VALLE MARIA LOUR"},"135":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DEL VALLE NELSON BERNARDO","cuit":"0","titular":"DEL VALLE NELSON BER"},"136":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Delgado Sonia Alejandra","cuit":"0","titular":"DELGADO SONIA ALEJAN"},"138":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI CROCE CLAUDIA ALEJANDRA","cuit":"0","titular":"DI CROCE CLAUDIA ALE"},"139":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Trelactea","cuit":"0","titular":"DI CROCE LAURA OFELI"},"140":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MORA","cuit":"0","titular":"DI FELICE DORA NOEMI"},"141":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI FULVIO LUIS EUGENIO","cuit":"0","titular":"DI FULVIO LUIS EUGEN"},"142":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI MARCO JUAN E.","cuit":"0","titular":"DI MARCO JUAN E."},"143":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI ROCCO MARIA CECILIA","cuit":"0","titular":"DI ROCCO MARIA CECIL"},"144":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DI SALVO GUILLERMO ENRIQUE","cuit":"0","titular":"DI SALVI GUILLERMO E"},"145":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI SALVO GRACIELA ESTER","cuit":"0","titular":"DI SALVO GRACIELA ES"},"146":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI SALVO S.A.","cuit":"0","titular":"DI SALVO S.A."},"147":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DI TOMMASO MARIO Y TOMAS","cuit":"0","titular":"DI TOMMASO MARIO Y T"},"148":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DI VITO CARMELO A.","cuit":"0","titular":"DI VITO CARMELO A."},"149":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DI VITO CLAUDIA SUSANA","cuit":"0","titular":"DI VITO CLAUDIA SUSA"},"150":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DIAZ RAUL ALBERTO","cuit":"0","titular":"DIAZ RAUL ALBERTO"},"151":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"DIFONZO & MARCHI","cuit":"0","titular":"DIFONZO & MARCHI"},"154":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TRIBI\\u00d1O ALBERTO","cuit":"0","titular":"DUCHOSAL VERONICA"},"155":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DUPUY STELLA MARIS","cuit":"0","titular":"DUPUY STELLA MARIS"},"156":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"EICHLER EDUARDO HUGO","cuit":"0","titular":"EICHLER EDUARDO HUGO"},"157":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ELCUAZ HECTOR A.","cuit":"0","titular":"ELCUAZ HECTOR A."},"158":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ELGART REYNALDO E Y ABEL","cuit":"0","titular":"ELGART REYNALDO E Y "},"159":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ELGART VERONICA Y ELGART MARIA","cuit":"0","titular":"ELGART VERONICA Y EL"},"160":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ELICALDE NESTOR JUAN","cuit":"0","titular":"ELICALDE NESTOR JUAN"},"161":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ERRAZU MARIA EMILIA","cuit":"0","titular":"ERRAZU MARIA EMILIA"},"162":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ESPELUSE RODOLFO Y CIA.SOC.COL","cuit":"0","titular":"ESPELUSE RODOLFO Y C"},"163":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ETCHEVERRY ALFREDO JUAN","cuit":"0","titular":"ETCHEVERRY ALFREDO J"},"164":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ETERNET S.R.L.","cuit":"0","titular":"ETERNET S.R.L."},"165":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"EXPRESO EL VASQUITO S.A.","cuit":"0","titular":"EXPRESO EL VASQUITO "},"166":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FAGEMAR S.A.","cuit":"0","titular":"FAGEMAR S.A."},"167":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"FAMTEX S.R.L.","cuit":"0","titular":"FAMTEX S.R.L."},"169":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FARINA AMERICO","cuit":"0","titular":"FARINA AMERICO"},"170":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FARMACIA TRES ARROYOS S C S","cuit":"0","titular":"FARMACIA TRES ARROYO"},"171":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Marco Polo","cuit":"0","titular":"FERNANDEZ JAVIER EDU"},"172":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERNANDEZ CRISTINA","cuit":"0","titular":"FERNANDEZ MARIA CRIS"},"173":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERNANDEZ MIGUEL ANGEL","cuit":"0","titular":"FERNANDEZ MIGUEL ANG"},"174":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERNANDEZ RODOLFO Y RAUL","cuit":"0","titular":"FERNANDEZ RODOLFO Y "},"175":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"FERNANDEZ VILLANUEVA JUAN ALDO","cuit":"0","titular":"FERNANDEZ VILLANUEVA"},"176":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERRARI RICARDO DOMINGO","cuit":"0","titular":"FERRARI RICARDO DOMI"},"177":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"REFRESH","cuit":"0","titular":"FERRARIO GUILLERMO E"},"178":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FERRARIO GUSTAVO ADRIAN","cuit":"0","titular":"FERRARIO GUSTAVO ADR"},"185":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FOSQUE MARIA ADELA","cuit":"0","titular":"FOSQUE MARIA ADELA"},"186":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"FRIGORIFICO CAPRIATA S.A.","cuit":"0","titular":"FRIGORIFICO CAPRIATA"},"187":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FUCHS SANDRA CECILIA","cuit":"0","titular":"FUCHS SANDRA CECILIA"},"189":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"La casa del pantalon","cuit":"0","titular":"GALILEA EUGENIO HECT"},"190":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GALLARDO JAVIER NESTOR","cuit":"0","titular":"GALLARDO JAVIER NEST"},"192":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Ganim Nestor Hugo","cuit":"0","titular":"GANIM NESTOR HUGO"},"193":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Elsa Maria Garat","cuit":"0","titular":"GARAT ELSA MARIA"},"194":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Childrens Wish","cuit":"0","titular":"GARCIA ANA CAROLINA"},"195":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GARCIA GABRIEL Y GUSTAVO","cuit":"0","titular":"GARCIA GABRIEL Y GUS"},"196":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GARCIA ROCIO","cuit":"0","titular":"GARCIA MARCONI ROCIO"},"197":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GARCIA MARIA DEL CARMEN","cuit":"0","titular":"GARCIA MARIA DEL CAR"},"198":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GARCIA MAURICIO DAVID","cuit":"0","titular":"GARCIA MAURICIO DAVI"},"199":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GARCIA SERGIO RAUL","cuit":"0","titular":"GARCIA SERGIO RAUL"},"200":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Amestoy Automotores \\/ AMESTOY ","cuit":"0","titular":"GASANEO Y AMESTOY"},"201":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GASPAROLI ANA TERESA","cuit":"0","titular":"GASPAROLI ANA TERESA"},"202":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GEJO RUBEN Y RODOLFO","cuit":"0","titular":"GEJO RUBEN Y RODOLFO"},"203":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GENOVESI HNOS.S.R.L","cuit":"0","titular":"GENOVESI HNOS.S.R.L"},"204":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GIACOMINO ANDREA SUSANA","cuit":"0","titular":"GIACOMINO ANDREA SUS"},"206":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Acosta Juan Enrique","cuit":"0","titular":"GIDINI MARGARITA AGU"},"207":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GIMNASIO STADIUM","cuit":"0","titular":"GIMNASIO STADIUM"},"209":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GIULIANI HECTOR Y LUCIO","cuit":"0","titular":"GIULIANI HECTOR Y LU"},"210":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ JORGE VENTURA","cuit":"0","titular":"GONZALEZ JORGE VENTU"},"211":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ LUIS ALBERTO","cuit":"0","titular":"GONZALEZ LUIS ALBERT"},"212":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ MARCELO GABRIEL","cuit":"0","titular":"GONZALEZ MARCELO GAB"},"213":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ MARCELO OSCAR","cuit":"0","titular":"GONZALEZ MARCELO OSC"},"214":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GONZALEZ MARIA LAURA","cuit":"0","titular":"GONZALEZ MARIA LAURA"},"215":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GRANDA LUCIANO","cuit":"0","titular":"GRANDA LUCIANO"},"216":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GROSSO CLAUDIA LUJAN","cuit":"0","titular":"GROSSO CLAUDIA LUJAN"},"217":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GRUAS Y MONTAJES IORIO S.A.","cuit":"0","titular":"GRUAS Y MONTAJES IOR"},"218":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GUAZZORA ELSA CELICA","cuit":"0","titular":"GUAZZORA ELSA CELICA"},"219":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GUILLERMO ECHEVARRIA S.A.","cuit":"0","titular":"GUILLERMO ECHEVARRIA"},"220":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"GUISASOLA MARIA LEONOR","cuit":"0","titular":"GUISASOLA MARIA LEON"},"222":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"GUSTAVO FIORDA MAQUINARIAS S.A","cuit":"0","titular":"GUSTAVO FIORDA MAQUI"},"223":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"HERNANDEZ HUGO SEBASTIAN","cuit":"0","titular":"HERNANDEZ HUGO SEBAS"},"224":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"HERRERA F-HERRERA N-GEREZ D SH","cuit":"0","titular":"HERRERA F-HERRERA N-"},"225":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"HERRERO RAUL MARIO","cuit":"0","titular":"HERRERO RAUL MARIO"},"226":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MACHADO ROBERTO OSCAR","cuit":"0","titular":"HID MARIO HORACIO"},"227":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Marea","cuit":"0","titular":"HIDALGO MARIA EUGENI"},"229":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"HOJOBAR S.A.","cuit":"0","titular":"HOJOBAR S.A."},"230":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"HOLLENDER PEDRO MARCELO","cuit":"0","titular":"HOLLENDER PEDRO MARC"},"232":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"IELMINI NELIDA ESTER","cuit":"0","titular":"IELMINI NELIDA ESTER"},"234":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"INGENERARE SRL","cuit":"0","titular":"INGENERARE SRL"},"235":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"INSTITUTO BIOQUIMICO TS.AS.","cuit":"0","titular":"INSTITUTO BIOQUIMICO"},"236":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"IRIART FERNANDO RAUL","cuit":"0","titular":"IRIART FERNANDO RAUL"},"237":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"IRIBARNE EDUARDO","cuit":"0","titular":"IRIBARNE EDUARDO"},"239":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ISMAEL CLAUDIO ANIBAL","cuit":"0","titular":"ISMAEL CLAUDIO ANIBA"},"240":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ITALIANI MARIA ELENA","cuit":"0","titular":"ITALIANI MARIA ELENA"},"241":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VETERINARIA EL MOLINO","cuit":"0","titular":"ITURBURU MARIA ISABE"},"242":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JACOBSEN ANDRES RAUL","cuit":"0","titular":"JACOBSEN ANDRES RAUL"},"243":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JALLE ANDRES","cuit":"0","titular":"JALLE ANDRES"},"244":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JAUREGUIBEHERE LIA MARIA JOSE","cuit":"0","titular":"JAUREGUIBEHERE LIA M"},"245":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JEANNERET JULIO","cuit":"0","titular":"JEANNERET JULIO"},"246":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"JORGE ALBERTO","cuit":"0","titular":"JORGE ALBERTO"},"247":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"EDUARDO SANTIAGO JUAN","cuit":"0","titular":"JUAN EDUARDO"},"248":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Pizza 3","cuit":"0","titular":"JURORUSA S.A"},"249":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"LA AGRICOLA GANAD.DE TS.AS.","cuit":"0","titular":"LA AGRICOLA GANAD.DE"},"250":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LA CASA DE LOS BULONES NECOCHE","cuit":"0","titular":"LA CASA DE LOS BULON"},"251":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"LA PERSEVERANCIA SEGUROS S.A.","cuit":"0","titular":"LA PERSEVERANCIA SEG"},"252":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LABORDE CARLOS ALBERTO","cuit":"0","titular":"LABORDE CARLOS ALBER"},"253":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"LAGO S.A.","cuit":"0","titular":"LAGO S.A."},"254":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LAMBERTA JORGE MIGUEL","cuit":"0","titular":"LAMBERTA JORGE MIGUE"},"255":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LANCE FABIANA","cuit":"0","titular":"LANCE FABIANA"},"256":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LARA ROBERTO MARCELO","cuit":"0","titular":"LARA ROBERTO MARCELO"},"257":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LARRIESTRA BEATRIZ CARLOTA","cuit":"0","titular":"LARRIESTRA BEATRIZ C"},"258":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LARSEN CESAR GERARDO","cuit":"0","titular":"LARSEN CESAR GERARDO"},"259":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LAS MECHAS SOCIEDAD DE HECHO","cuit":"0","titular":"LAS MECHAS SOCIEDAD "},"260":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LATORRE ALEJANDRO MARTIN","cuit":"0","titular":"LATORRE ALEJANDRO MA"},"261":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LATORRE JOAQUIN IGNACIO","cuit":"0","titular":"LATORRE JOAQUIN IGNA"},"262":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LAVANDERIA TRES ARROYOS","cuit":"0","titular":"LAVANDERIA TRES ARRO"},"264":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Dragon Rojo","cuit":"0","titular":"LEGUIZAMON CLAUDIA I"},"265":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Leguizamon Esteban Horacio","cuit":"0","titular":"LEGUIZAMON ESTEBAN H"},"266":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LETAMENDI LUIS ANGEL","cuit":"0","titular":"LETAMENDI LUIS ANGEL"},"267":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LIEBANA JORGE F.","cuit":"0","titular":"LIEBANA JORGE F."},"268":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LIFIRON S.A.","cuit":"0","titular":"LIFIRON S.A"},"269":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LLANOS ALICIA CLALFIRA","cuit":"0","titular":"LLANOS ALICIA CLALFI"},"270":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LOFIEGO JOSE JUIS","cuit":"0","titular":"LOFIEGO JOSE JUIS"},"271":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LOPEZ IRMA ELENA","cuit":"0","titular":"LOPEZ IRMA ELENA"},"272":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LOPEZ NESTOR FABIAN","cuit":"0","titular":"LOPEZ NESTOR FABIAN"},"273":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"LOSADA RICARDO OSVALDO","cuit":"0","titular":"LOSADA RICARDO OSVAL"},"274":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Despensa El Gauchito\\"","cuit":"0","titular":"LUCERO OLGA"},"275":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"LUIS BLANCO S.A","cuit":"0","titular":"LUIS BLANCO S.A"},"276":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MACHADO ROBERTO OSCAR","cuit":"0","titular":"MACHADO ROBERTO OSCA"},"277":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"MACIEL HERMANOS S.A.E.C.I.","cuit":"0","titular":"MACIEL HERMANOS S.A."},"278":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MADERAS S. JOSE DE LOS ARROYOS","cuit":"0","titular":"MADERAS S. JOSE DE L"},"279":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"M.A.M. S.A.","cuit":"0","titular":"M.A.M. S.A."},"280":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MARINO MONICA GRACIELA","cuit":"0","titular":"MARINO MONICA GRACIE"},"281":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MARTINEZ CLAUDIO NESTOR","cuit":"0","titular":"MARTINEZ CLAUDIO NES"},"282":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MARTINEZ DE CAMPOS ARSENIO","cuit":"0","titular":"MARTINEZ DE CAMPOS A"},"283":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Agromar SA","cuit":"0","titular":"MARTINEZ FRANKLIN SE"},"284":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Compu3","cuit":"0","titular":"MARTINEZ GUILLERMO O"},"285":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MARTINEZ JULIO CESAR","cuit":"0","titular":"MARTINEZ JULIO CESAR"},"286":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MASCHI EDUARDO ERNESTO","cuit":"0","titular":"MASCHI EDUARDO ERNES"},"287":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MASTROSIMONE GUSTAVO DOMINGO","cuit":"0","titular":"MASTROSIMONE GUSTAVO"},"289":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MAYER RICARDO AUTOMOTORES S.A.","cuit":"0","titular":"MAYER RICARDO AUTOMO"},"290":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MENNA ELIANA ANDREA","cuit":"0","titular":"MENNA ELIANA ANDREA"},"291":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MENNA CEREALES","cuit":"0","titular":"MENNA JOSE ANGEL"},"292":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MENNA LORENZO N.","cuit":"0","titular":"MENNA LORENZO N."},"293":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MEO GUZMAN ENRIQUE FELIX","cuit":"0","titular":"MEO GUZMAN ENRIQUE F"},"294":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MERLINO PLAN S.A.","cuit":"0","titular":"MERLINO PLAN S.A."},"295":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MERLO CARMEN HERMINIA","cuit":"0","titular":"MERLO CARMEN HERMINI"},"296":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MESA DE FORCHETTI MONICA","cuit":"0","titular":"MESA DE FORCHETTI MO"},"297":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Miedan, Ana Karina","cuit":"0","titular":"MIEDAN ANA KARINA"},"298":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MILLA SUR S.A.","cuit":"0","titular":"MILLA SUR S.A."},"299":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MIO FIGLIO","cuit":"0","titular":"MIO FIGLIO  S.R.L."},"300":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MOIRANO EVELIA LILIAN","cuit":"0","titular":"MOIRANO EVELIA LILIA"},"301":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MOIZZI JUAN JOSE","cuit":"0","titular":"MOIZZI JUAN JOSE"},"303":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"METALURGICA MOLINA","cuit":"0","titular":"MOLINA EUGENIO ALFRE"},"304":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MOLINA HECTOR MARIANO","cuit":"0","titular":"MOLINA HECTOR MARIAN"},"305":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MOLINOS TRES ARROYOS S.A.","cuit":"0","titular":"MOLINOS TRES ARROYOS"},"306":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MOLINOS ZALLA S.A","cuit":"0","titular":"MOLINOS ZALLA S.A."},"307":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MOLLER GUSTAVO","cuit":"0","titular":"MOLLER ARTURO"},"308":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MONSALVO MARIA DE LOS ANGELES","cuit":"0","titular":"MONSALVO MARIA DE LO"},"309":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"MONTESINOS JOSE MANUEL","cuit":"0","titular":"MONTESINOS JOSE MANU"},"310":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"MORAN JORGE ANTONIO","cuit":"0","titular":"MORAN JORGE ANTONIO"},"312":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"DE BENEDETTO AUGUSTO","cuit":"0","titular":"MUNGAI MARIA MERCEDE"},"314":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"NALDO LOMBARDI S.A","cuit":"0","titular":"NALDO LOMBARDI S.A"},"315":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"NIKRO S.A","cuit":"0","titular":"NIKRO S.A"},"316":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"NOICSA S.A.","cuit":"0","titular":"NOICSA S.A."},"317":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Mera Fernando Omar","cuit":"0","titular":"NOVILLO VIRGINIA VER"},"318":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"OHACO RAUL BAUTISTA","cuit":"0","titular":"OHACO RAUL BAUTISTA"},"319":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"OLEOHIDRAULICA DI ROCCO S.A.","cuit":"0","titular":"OLEOHIDRAULICA DI RO"},"320":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"OLOCCO BARTOLO","cuit":"0","titular":"OLOCCO BARTOLO"},"321":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"OLSEN CRISTIAN","cuit":"0","titular":"OLSEN CRISTIAN"},"322":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ONGARINI LIVIO","cuit":"0","titular":"ONGARINI LIVIO"},"323":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Tito Otero","cuit":"0","titular":"OTERO OSCAR ALBERTO"},"324":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PALLA SILVIA CRISTINA","cuit":"0","titular":"PALLA SILVIA CRISTIN"},"325":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"PALLADINO  S.A.","cuit":"0","titular":"PALLADINO  S.A."},"326":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PALMA NORA","cuit":"0","titular":"PALMA NORA"},"327":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PASCUAL SILVIA ADRIANA","cuit":"0","titular":"PASCUAL SILVIA ADRIA"},"328":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PAZOS DE VELOSO MABEL","cuit":"0","titular":"PAZOS DE VELOSO MABE"},"329":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PC TRUCKS TRES ARROYOS","cuit":"0","titular":"PC TRUCKS TRES ARROY"},"330":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEQUE\\u00d1O JOSE","cuit":"0","titular":"PEQUE\\u00d1O JOSE"},"331":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"FLYING MOTORS","cuit":"0","titular":"PEREYRA ESTEBAN CEFE"},"332":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"PEREZ DALSGAARD Y CIA.","cuit":"0","titular":"PEREZ DALSGAARD Y CI"},"333":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ GUILLERMO LUIS","cuit":"0","titular":"PEREZ GUILLERMO LUIS"},"334":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ GUSTAVO MIGUEL","cuit":"0","titular":"PEREZ GUSTAVO MIGUEL"},"335":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ MARIA ISABEL","cuit":"0","titular":"PEREZ MARIA ISABEL"},"336":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ NELSON ADRIAN","cuit":"0","titular":"PEREZ NELSON ADRIAN"},"337":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PEREZ PAULA ANDREA","cuit":"0","titular":"PEREZ PAULA ANDREA"},"338":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Gestion Inmobiliaria","cuit":"0","titular":"PEREZ RAUL MARTIN"},"339":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PERTICARARI JUAN PABLO","cuit":"0","titular":"PERTICARARI JUAN PAB"},"340":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"PETELA HECTOR","cuit":"0","titular":"PETELA HECTOR"},"341":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PIERINI CARLOS FABIAN","cuit":"0","titular":"PIERINI CARLOS FABIA"},"342":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"PINTURERIAS RUCCI S.A","cuit":"0","titular":"PINTURERIAS RUCCI S."},"343":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PIROSANTO CAMILO ALDO","cuit":"0","titular":"PIROSANTO CAMILO ALD"},"344":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PODESTA MARIANA","cuit":"0","titular":"PODESTA MARIANA"},"345":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PONCE EDUARDO ESTEBAN","cuit":"0","titular":"PONCE EDUARDO ESTEBA"},"346":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"POULSEN PEDRO-CAZEAUX FABIAN","cuit":"0","titular":"POULSEN PEDRO-CAZEAU"},"347":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Bodycare","cuit":"0","titular":"POZZOLI LAURA CECILI"},"349":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PRIETO JUAN JOSE","cuit":"0","titular":"PRIETO JUAN JOSE"},"350":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"PROCACCINI FRANCISCO ALFREDO Y","cuit":"0","titular":"PROCACCINI FRANCISCO"},"351":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"QUIMICA MOLERO S.R.L.","cuit":"0","titular":"QUIMICA MOLERO S.R.L"},"353":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RANZINI MATIAS FEDERICO","cuit":"0","titular":"RANZINI MATIAS FEDER"},"355":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RAVELLA RICARDO H.","cuit":"0","titular":"RAVELLA RICARDO H."},"356":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RE MARIO CESAR","cuit":"0","titular":"RE MARIO CESAR"},"357":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RECARI MARIANO (Panader\\u00eda Bel","cuit":"0","titular":"RECARI MARIANO"},"358":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"REFAFLOTO S.A.","cuit":"0","titular":"REFAFLOTO S.A"},"359":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RENDO DE PODESTA IRMA MABEL","cuit":"0","titular":"RENDO DE PODESTA IRM"},"360":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"REY ANA MARIA","cuit":"0","titular":"REY ANA MARIA"},"361":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RIDINO EDUARDO","cuit":"0","titular":"RIDINO EDUARDO NICOL"},"363":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ROAS SACIF","cuit":"0","titular":"ROAS SACIF"},"364":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RODERA FRANCISCO Y JORGE","cuit":"0","titular":"RODERA FRANCISCO Y J"},"365":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Penelope Lanas","cuit":"0","titular":"RODRIGUEZ ELSA TERES"},"366":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RODRIGUEZ TERESA ANGELICA","cuit":"0","titular":"RODRIGUEZ TERESA ANG"},"367":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ROLANDO LUIS ROBERTO","cuit":"0","titular":"ROLANDO LUIS ROBERTO"},"368":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"AGENCIA ISIDORO","cuit":"0","titular":"ROLDAN JUANA MARIELA"},"370":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RUBIO DANIEL CECILIO","cuit":"0","titular":"RUBIO DANIEL CECILIO"},"371":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RUTA 2 S.R.L.","cuit":"0","titular":"RUTA 2 S.R.L."},"372":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SABATINI MARCELO","cuit":"0","titular":"SABATINI MARCELO EDM"},"374":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SAEZ SILVIA NELLY","cuit":"0","titular":"SAEZ SILVIA NELLY"},"375":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SAGARDOY FERNANDO JOSE","cuit":"0","titular":"SAGARDOY FERNANDO JO"},"376":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SAINI SERGIO DANIEL","cuit":"0","titular":"SAINI SERGIO DANIEL"},"377":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SALOME JULIO","cuit":"0","titular":"SALOME JULIO"},"378":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SAN PELLEGRINI DE M.CARMEN DOR","cuit":"0","titular":"SAN PELLEGRINI DE M."},"379":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANCHEZ ELIZABETH","cuit":"0","titular":"SANCHEZ ELIZABETH"},"380":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANCHEZ MONICA LUJAN","cuit":"0","titular":"SANCHEZ MONICA LUJAN"},"381":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANCHEZ N.DE PEREYRA MARIA S.","cuit":"0","titular":"SANCHEZ N.DE PEREYRA"},"382":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Quintana Roberto Mario","cuit":"0","titular":"SANCINETO VICTOR MAR"},"383":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANDE JUAN JOSE","cuit":"0","titular":"SANDE JUAN JOSE"},"384":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SANI TRES S.A.","cuit":"0","titular":"SANI TRES S.A."},"385":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANTAJULIANA M. ALEJANDRA","cuit":"0","titular":"SANTAGIULIANA MARIA "},"386":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SANTIRSO MARIA ROSANA","cuit":"0","titular":"SANTIRSO MARIA ROSAN"},"387":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SAURO ROBERTO CESAR","cuit":"0","titular":"SAURO ROBERTO CESAR"},"388":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SCARCELLA DIEGO JOSE","cuit":"0","titular":"SCARCELLA DIEGO JOSE"},"389":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SCHENCH ANDREA FABIANA","cuit":"0","titular":"SCHENCK ANDREA FABIA"},"390":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SCHUMACHER ALFREDO Y LUCAS","cuit":"0","titular":"SCHUMACHER ALFREDO Y"},"391":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SEMILLERA PAMPA FERTIL","cuit":"0","titular":"SEMILLERA PAMPA FERT"},"392":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SEQUEIRA CARLOS ENRIQUE","cuit":"0","titular":"SEQUEIRA CARLOS ENRI"},"393":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ESTUDIO PANDOLFO","cuit":"0","titular":"SERRANO ELSA GLORIA"},"394":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SISTEMAS TERMODINAMICOS S.R.L.","cuit":"0","titular":"SISTEMAS TERMODINAMI"},"395":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"BERTEL SKOU SAAII Y C","cuit":"0","titular":"SKOU BERTEL S.A."},"396":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SOBANSKI VICTOR ADOLFO","cuit":"0","titular":"SOBANSKI VICTOR ADOL"},"397":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SOC. DE TRANSP.LIBRES TS.AS.","cuit":"0","titular":"SOC. DE TRANSP.LIBRE"},"398":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Clinica Privada Hispano","cuit":"0","titular":"SOC.ESPA\\u00d1OLA DE S.M"},"399":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"RED 24","cuit":"0","titular":"SOCOLOFF MARTIN IVAN"},"400":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SODA LA HUELLA S.R.L.","cuit":"0","titular":"SODA LA HUELLA S.R.L"},"401":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SODE HORACIO ABEL","cuit":"0","titular":"SODE HORACIO ABEL"},"402":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SORIANO MIGUEL ANGEL","cuit":"0","titular":"SORIANO MIGUEL ANGEL"},"403":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SORIANO RAFAEL","cuit":"0","titular":"SORIANO RAFAEL"},"404":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"Panificadora San Juan","cuit":"0","titular":"SOULE SERGIO OSVALDO"},"405":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TORRES CARIONI MARIANA","cuit":"0","titular":"SOUMOULOU PABLO HERN"},"406":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SPENZA MARIANO M.","cuit":"0","titular":"SPENZA MARIANO MARTI"},"408":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"STARCEL PAMPA CENTRO S.A","cuit":"0","titular":"STARCEL PAMPA CENTRO"},"410":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"SUAREZ ADELA JOSEFINA","cuit":"0","titular":"SUAREZ ADELA JOSEFIN"},"411":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SUAREZ JORGE EDUARDO S.A","cuit":"0","titular":"SUAREZ JORGE EDUARDO"},"412":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SUPERCARNE S.A.","cuit":"0","titular":"SUPERCARNE S.A."},"413":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SUPERMERCADO PLANETA S.A.","cuit":"0","titular":"SUPERMERCADO PLANETA"},"414":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"SUR AGROPECUARIA S.A.","cuit":"0","titular":"SUR AGROPECUARIA S.A"},"415":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Sandra Marisa Rivero","cuit":"0","titular":"TARABORELLI ALEJANDR"},"416":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TARABORELLI MARIO JESUS","cuit":"0","titular":"TARABORELLI MARIO JE"},"417":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TARANTELA ELVIRA ELSA","cuit":"0","titular":"TARANTELA ELVIRA ELS"},"418":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TARJETA NARANJA SA.","cuit":"0","titular":"TARJETA NARANJA SA."},"419":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Estacion de Servicio Tartaglin","cuit":"0","titular":"TARTAGLINO Y CIA. SR"},"420":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TEILETCHE ENRIQUE Y CIA.","cuit":"0","titular":"TEILETCHE ENRIQUE Y "},"421":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"RECICLADOS TRES ARROYOS","cuit":"0","titular":"TERRASANTA MONICA"},"422":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TIEMERSMA SEBASTIAN","cuit":"0","titular":"TIEMERSMA SEBASTIAN"},"423":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TORRES CARIONI SANTIAGO nestor","cuit":"0","titular":"TORRES CARIONI SANTI"},"425":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"TOSTEX S.A.","cuit":"0","titular":"TOSTEX S.A."},"426":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TRAFER SAIC","cuit":"0","titular":"TRAFER SAIC"},"427":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TRANSPORTE GOIZUETA","cuit":"0","titular":"TRANSPORTE GOIZUETA"},"428":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TRAVERSO GUILLERMO HERNAN","cuit":"0","titular":"TRAVERSO GUILLERMO H"},"429":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TRESNECO S.A.","cuit":"0","titular":"TRESNECO S.A."},"431":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"TRUCK EXPRESS S.R.L.","cuit":"0","titular":"TRUCK EXPRESS S.R.L."},"432":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TUMINI D. Y J. Y MENNA H.","cuit":"0","titular":"TUMINI D. Y J. Y MEN"},"433":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"TURINI PABLO","cuit":"0","titular":"TURINI PABLO RENATO"},"434":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ULLERUP RAUL ADOLFO","cuit":"0","titular":"ULLERUP RAUL ADOLFO"},"435":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"UNIVALORES S.A.","cuit":"0","titular":"UNIVALORES S.A."},"436":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"URBAN ANDERSEN MARCOS G.","cuit":"0","titular":"URBAN ANDERSEN MARCO"},"437":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"URBIETA ANDRES","cuit":"0","titular":"URBIETA ANDRES"},"438":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"URRUTIA MARIA MARTA","cuit":"0","titular":"URRUTIA MARIA MARTA"},"440":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"UZCUDUN S.A.F.I.M.","cuit":"0","titular":"UZCUDUN S.A.F.I.M."},"441":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"UZIDINGER EDUARDO NICOLAS","cuit":"0","titular":"UZIDINGER EDUARDO NI"},"442":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VACCA REINALDO RUBEN","cuit":"0","titular":"VACCA REINALDO RUBEN"},"443":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Automotores Vazquez","cuit":"0","titular":"VAZQUEZ MIGUEL ANGEL"},"444":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VERGNANO RAUL ANDRES","cuit":"0","titular":"VERGNANO RAUL ANDRES"},"445":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VERKUYL ASTRID CINTIA","cuit":"0","titular":"VERKUYL ASTRID CINTI"},"447":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VIGILAN S.R.L.AG.DE INV.Y SEG.","cuit":"0","titular":"VIGILAN S.R.L.AG.DE "},"448":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VILLAFRANCA MARTA S. Y MARIA E","cuit":"0","titular":"VILLAFRANCA MARTA S."},"449":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"Viviana A Villalva","cuit":"0","titular":"VILLALBA JORGE ALFRE"},"450":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"VILLALBA PEDRO","cuit":"0","titular":"VILLALBA PEDRO"},"452":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VILLEMUR GUSTAVO MIGUEL","cuit":"0","titular":"VILLEMUR GUSTAVO MIG"},"453":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VINOTECA LOS TONELES S.A.","cuit":"0","titular":"VINOTECA LOS TONELES"},"454":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VIVIANI CARMEN","cuit":"0","titular":"VIVIANI CARMEN"},"455":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"VIZZOLINI NESTOR J.","cuit":"0","titular":"VIZZOLINI NESTOR J."},"456":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"WEHRHANNE HORACIO MARIO","cuit":"0","titular":"WEHRHANNE HORACIO MA"},"457":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"WEST FERNANDO LUIS","cuit":"0","titular":"WEST FERNANDO LUIS"},"458":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ZIJLSTRA JORGE ROBERTO","cuit":"0","titular":"ZIJLSTRA JORGE ROBER"},"459":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ZIJLSTRA SILVINA","cuit":"0","titular":"ZIJLSTRA SILVINA ELE"},"460":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ZORRILLA HNOS. S.R.L.","cuit":"0","titular":"ZORRILLA HNOS. S.R.L"},"461":{"ModImpo":"Si","Empresa":"Actualizada","imp":50,"Medidor":"Actualizado","denominacion":"ZOTES SAUL FRANCISCO","cuit":"0","titular":"ZOTES SAUL FRANCISCO"},"462":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"ZURITA HNOS. Y CIA.","cuit":"0","titular":"ZURITA HNOS. Y CIA."},"463":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"18 DE SETIEMBRE S.A","cuit":"0","titular":"18 DE SETIEMBRE S.A"},"464":{"ModImpo":"Si","Empresa":"Actualizada","imp":250,"Medidor":"Actualizado","denominacion":"LASO - 3 ARROYOS S.A.","cuit":"0","titular":"3 ARROYOS S.A."},"465":{"ModImpo":"Si","Empresa":"Actualizada","imp":87,"Medidor":"Actualizado","denominacion":"3 NET S.A.","cuit":"0","titular":"3 NET S.A."}}', 465, '2015-07-18 08:07:23', '""', 0, 0, 465, 411, 0, 0, 54);
INSERT INTO `infmedidorexcel` (`id`, `actualizados`, `totalregistros`, `fecha`, `fallados`, `medidorInsertado`, `registroNoInsertado`, `medidorActualizado`, `empresaActualizada`, `relacionInsertada`, `medidorSinEmpresaInsertado`, `medidorSinEmpresaActualizado`) VALUES
(23, '""', 465, '2015-07-21 07:07:54', '""', 0, 0, 465, 0, 0, 0, 54),
(24, '""', 465, '2015-07-21 07:07:55', '""', 0, 0, 465, 0, 0, 0, 54),
(25, '""', 465, '2015-07-21 07:07:52', '""', 0, 0, 465, 0, 0, 0, 54),
(26, '""', 465, '2015-07-21 07:07:18', '""', 0, 0, 465, 0, 0, 0, 54),
(27, '""', 465, '2015-07-21 07:07:07', '""', 0, 0, 465, 0, 0, 0, 54),
(28, '""', 465, '2015-07-21 07:07:33', '""', 0, 0, 465, 0, 0, 0, 54),
(29, '""', 465, '2015-07-21 07:07:57', '""', 0, 0, 465, 0, 0, 0, 54),
(30, '""', 465, '2015-07-21 07:07:20', '""', 0, 0, 465, 0, 0, 0, 54),
(31, '""', 465, '2015-07-21 07:07:33', '""', 0, 0, 465, 0, 0, 0, 54),
(32, '""', 465, '2015-07-21 07:07:47', '""', 0, 0, 465, 0, 0, 0, 54),
(33, '""', 465, '2015-07-21 07:07:18', '""', 0, 0, 465, 0, 0, 0, 54);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4286 ;

--
-- Volcado de datos para la tabla `medidor`
--

INSERT INTO `medidor` (`idmedidor`, `nomyap`, `telefono`, `domicilio`, `importepago`, `numusuario`, `numsuministro`, `activo`, `fechadeultimopago`) VALUES
(3820, 'ABELLEIRA FABIAN-LEN', '00015611812', 'COLON 239', '50', '484901', '7712', 1, '2015-07-21'),
(3821, 'ACA SALUD COOPERATIV', '0', 'CHACABUCO 549', '87', '549033', '45768', 1, '2015-07-21'),
(3822, 'ACMC S.R.L.', '00000000000', 'MORENO 423', '50', '5597630', '8242', 1, '2015-07-21'),
(3823, 'AGF ALLIANZ ARG.CIA ', '00000000000', 'MAIPU 80', '50', '543770', '7919', 1, '2015-07-21'),
(3824, 'AGRO EL CARRETERO S.', '00000431650', 'R.PEÃ‘A 14', '87', '342458', '16068', 1, '2015-07-21'),
(3825, 'AGRO INDUSTRIA TRES ', '00000434443', 'P.INDUSTRIAL', '50', '410854', '40121', 1, '2015-07-21'),
(3826, 'AGRO-GILARDONI S.R.L', '00000000000', 'ALMAFUERTE 3500', '87', '588393', '23756', 1, '2015-07-21'),
(3827, 'AGROPAL S.A.', '00000423718', 'BELGRANO 571', '50', '327253', '9806', 1, '2015-07-21'),
(3828, 'AGROPRIMUS S.A', '00000000000', 'P.INDUSTRIAL', '50', '565886', '40139', 1, '2015-07-21'),
(3829, 'AGUADAS GOMEZ HNOS S', '00000000000', 'V.SARSFIELD 998', '87', '593052', '14445', 1, '2015-07-21'),
(3830, 'AIELLO JOSE E HIJOS ', '00000431430', 'P.INDUSTRIAL', '250', '319766', '40126', 1, '2015-07-21'),
(3831, 'AIELLO NATALIO', '00000423249', 'BELGRANO 333', '50', '162926', '9372', 1, '2015-07-21'),
(3832, 'ALARCON ANA VERONICA', '00000000000', '25 DE MAYO 345', '50', '486165', '7044', 1, '2015-07-21'),
(3833, 'ALBA E.A.DE Y G.ALBA', '00000426691', 'PUEYRREDON 987', '50', '229401', '2864', 1, '2015-07-21'),
(3834, 'ALBA MIRTA GRACIELA', '00000000000', 'ALSINA 745', '50', '310499', '16149', 1, '2015-07-21'),
(3835, 'ALBERCA FACUNDO SEBA', '00000000000', 'COLON 876', '50', '557865', '1628', 1, '2015-07-21'),
(3836, 'ALEGRE AGUSTIN', '00000000000', 'CASEROS 153', '87', '5594344', '19121', 1, '2015-07-21'),
(3837, 'ALEGRO MARIA ANTONEL', '00000000000', 'H.YRIGOYEN 237', '50', '592563', '7271', 1, '2015-07-21'),
(3838, 'ALEJANDRO BRACERAS S', '00000427003', 'RIVADAVIA 130', '87', '486846', '7662', 1, '2015-07-21'),
(3839, 'ALEMANI CARLOS DANIE', '00000429412', 'BALCARCE 459', '50', '286808', '16858', 1, '2015-07-21'),
(3840, 'ALONSO CARLOS ALBERT', '00000000000', 'SAAVEDRA 1284', '50', '531689', '2628', 1, '2015-07-21'),
(3841, 'ALONSO MARIA ROSARIO', '00000000000', 'I.LA CATOLICA 758', '50', '475420', '17632', 1, '2015-07-21'),
(3842, 'ALTUNA CARLOS F.', '00000431392', 'BELGRANO 665', '87', '318219', '10030', 1, '2015-07-21'),
(3843, 'ALVARADO S.A.', '00000433163', 'ALSINA 235', '87', '374130', '15993', 1, '2015-07-21'),
(3844, 'ALVAREZ TARGISE JUAN', '00015458621', 'ISTILART 715', '50', '250359', '10157', 1, '2015-07-21'),
(3845, 'ANA JORGE OSCAR', '00000422426', 'COLON 156', '50', '202260', '8137', 1, '2015-07-21'),
(3846, 'ANDERBERG FERNANDO A', '00000431422', 'MORENO 126', '50', '400956', '8566', 1, '2015-07-21'),
(3847, 'ANDREATTA GRACIELA D', '00000000000', 'LAMADRID 685', '50', '477772', '15132', 1, '2015-07-21'),
(3848, 'ANTONIO MACIEL S.R.L', '428475-15647166', 'AV.TRABAJADOR 846', '50', '567806', '3314', 1, '2015-07-21'),
(3849, 'AQUATICA S.A. E/F.', '00000000000', 'RIVADAVIA 334', '87', '593775', '40018', 1, '2015-07-21'),
(3850, 'ARAMBERRI LUIS ALFRE', '00000425047', 'CASTELLI 802', '87', '475723', '3089', 1, '2015-07-21'),
(3851, 'ARANEGUI KARINA BEAT', '00000000000', 'GUEMES 109', '50', '5594571', '5350', 1, '2015-07-21'),
(3852, 'ARENAL PABLO E.', '00000423179', 'I.LA CATOLICA 84', '50', '184322', '17719', 1, '2015-07-21'),
(3853, 'ARENAS OSVALDO ARIEL', '00000431506', 'MORENO 1004', '87', '251981', '1428', 1, '2015-07-21'),
(3854, 'ARIAS AMALIA-GROENEN', '00000000000', 'H.YRIGOYEN 63', '50', '552671', '8109', 1, '2015-07-21'),
(3855, 'ARISTEGUI CARLOS MAR', '00000000000', 'BRANDSEN 243', '50', '463762', '8872', 1, '2015-07-21'),
(3856, 'ARISTEGUI SERGIO FAB', '00000000000', 'COLON 442', '50', '406280', '7897', 1, '2015-07-21'),
(3857, 'ARNAIS FERNANDO ALFO', '00000000000', 'CASTELLI 66', '50', '529484', '6004', 1, '2015-07-21'),
(3858, 'ARRECHEA JUAN FRANCI', '15404190', 'BETOLAZA 461', '50', '5596670', '45939', 1, '2015-07-21'),
(3859, 'ARTURE DE MARTINEZ C', '00000424010', 'COLON 379', '87', '261704', '7736', 1, '2015-07-21'),
(3860, 'ASEF EDUARDO RUBEN', '00000000000', 'MAIPU 585', '50', '479239', '6413', 1, '2015-07-21'),
(3861, 'ASOC. DE ABOGADOS DE', '00000000000', 'BRANDSEN 474', '87', '320980', '8982', 1, '2015-07-21'),
(3862, 'ASOC. MUTUAL DAN', '00000431623', 'MORENO 114', '87', '172446', '8598', 1, '2015-07-21'),
(3863, 'ASOC.PRO ENSEÃ‘ANZA ', '00000432616', 'DERIVACION NÃ¸4', '50', '355139', '40148', 1, '2015-07-21'),
(3864, 'ASTIZ JORGE ARIEL', '00000000000', 'LIBERTAD 303', '50', '480961', '2372', 1, '2015-07-21'),
(3865, 'ASTIZ MARIANA', '00000000000', 'SAAVEDRA 399', '50', '561152', '6406', 1, '2015-07-21'),
(3866, 'ASTIZ MARIO SANTIAGO', '00000000000', 'TACUARI 436', '50', '502360', '14420', 1, '2015-07-21'),
(3867, 'AUSTRAL MOTOR S.A.', '00000425777', 'MAGALLANES 1560', '87', '403537', '20729', 1, '2015-07-21'),
(3868, 'AYALA RAMON ANDRES', '00000420868', 'PELLEGRINI 6', '50', '400682', '8423', 1, '2015-07-21'),
(3869, 'BAQUEDANO MARTIN', 'VIMAX50', 'RIVADAVIA 199', '50', '494737', '16309', 1, '2015-07-21'),
(3870, 'BARAINCA EDUARDO JUA', '00000429228', 'R.PEÃ‘A 67', '50', '314455', '16093', 1, '2015-07-21'),
(3871, 'BARCALA SERGIO ANDRE', '00000425339', 'FALUCHO 134', '50', '389538', '9343', 1, '2015-07-21'),
(3872, 'BARRAZA MARIA MATILD', '00000420311', 'RIVADAVIA 320', '50', '450195', '6995', 1, '2015-07-21'),
(3873, 'BARRERAS ALBERTO MIG', '00000000000', 'ISTILART 568', '50', '537320', '9727', 1, '2015-07-21'),
(3874, 'BARUTTA VERONICA BEA', '00000000000', 'FALUCHO 366', '50', '594482', '9291', 1, '2015-07-21'),
(3875, 'BASSINI MARIA PAULA', '00000433523', 'GOMILA 146', '50', '543552', '15360', 1, '2015-07-21'),
(3876, 'BAZAR EL MUNDIAL S.R', '00000424221', '9 DE JULIO 200', '50', '425089', '7535', 1, '2015-07-21'),
(3877, 'BEITIA LUIS ALBERTO', '00000430689', 'QUINTANA 836', '50', '361837', '15571', 1, '2015-07-21'),
(3878, 'BENGOCHEA SUSANA MAR', '00000000000', 'SARMIENTO 205', '50', '565684', '8637', 1, '2015-07-21'),
(3879, 'BERESFORD S.A', '00000424445', 'RIVADAVIA 399', '87', '5595861', '17068', 1, '2015-07-21'),
(3880, 'BETTOMEO ROBERTO SAN', '00000430873-15646873', 'ALMAFUERTE 436', '50', '329954', '21414', 1, '2015-07-21'),
(3881, 'BIANCHI LUCIANO SEBA', '00000000000', 'J.INGENIEROS 148', '50', '541268', '21022', 1, '2015-07-21'),
(3882, 'BONIFACIO LILIANA', '00000000000', 'H.YRIGOYEN 14', '50', '532530', '8062', 1, '2015-07-21'),
(3883, 'BONINI JUAN CARLOS', '00000000000', 'CHACABUCO 227', '50', '473237', '7383', 1, '2015-07-21'),
(3884, 'BORIONI JUAN PABLO', '00000431095', 'ISTILART 78', '87', '451873', '8476', 1, '2015-07-21'),
(3885, 'BORRA JORGE RENATO', '00000426033', 'DORREGO 379', '50', '236018', '6789', 1, '2015-07-21'),
(3886, 'BRAJOVICH GUILLERMO ', '00000000000', 'SARMIENTO 282', '50', '456894', '8797', 1, '2015-07-21'),
(3887, 'BRAVO CARLOS-MARQUIS', '00000000000', 'CALLE 1810 68', '50', '552192', '8516', 1, '2015-07-21'),
(3888, 'BREA DIEGO ALBERTO', '00000422844', 'CALLE 1810 876', '50', '258876', '10372', 1, '2015-07-21'),
(3889, 'BREA OMAR', '00000428150', 'O.DUGGAN 1165', '50', '193571', '11758', 1, '2015-07-21'),
(3890, 'BUSTOS SILVINA LILIA', '00015552287', 'CASTELLI 1525', '50', '572709', '3254', 1, '2015-07-21'),
(3891, 'CABANE OSMAR ALBERTO', '00000000000', 'RIVADAVIA 164', '50', '509415', '7660', 1, '2015-07-21'),
(3892, 'CALVETE ESTEBAN DANI', '00000000000', 'LAVALLE 835', '50', '384823', '5664', 1, '2015-07-21'),
(3893, 'CAMBEX S.A.', '00000431383', 'MAIPU 37', '87', '383187', '7933', 1, '2015-07-21'),
(3894, 'CAMPAGNE MARIO CESAR', '00000423600', 'RIVADAVIA 351', '50', '240451', '17060', 1, '2015-07-21'),
(3895, 'CAMPAÃ‘A GERMAN MARC', '00000000000', 'OLAVARRIA 564', '50', '533931', '10488', 1, '2015-07-21'),
(3896, 'CAMPOS CARMEN', '00000000000', 'MAIPU 770', '50', '397100', '5895', 1, '2015-07-21'),
(3897, 'CAMUS FLORENCIA AGUS', '00000000000', 'CHACABUCO 261', '50', '599849', '7394', 1, '2015-07-21'),
(3898, 'CARBONETTI SEBASTIAN', '00000000000', '9 DE JULIO 84', '50', '507466', '7965', 1, '2015-07-21'),
(3899, 'CARRACEDO NORMA', '00000000000', 'RECONQUISTA 1036', '50', '543813', '19381', 1, '2015-07-21'),
(3900, 'CARRERA HNOS.', '00000000000', 'SARMIENTO 1077', '87', '530536', '1358', 1, '2015-07-21'),
(3901, 'CARRERA MARIA INES', '00000000000', 'CALLE 1810 59', '50', '502041', '8498', 1, '2015-07-21'),
(3902, 'CARRERA NELIDA SUSAN', '00000000000', 'CHACABUCO 425', '50', '575146', '7415', 1, '2015-07-21'),
(3903, 'CARRERA Y SALDUNA SO', '00000000000', 'COLON 509', '50', '506906', '7764', 1, '2015-07-21'),
(3904, 'CARRIL CLAUDIA ANAHI', '00000000000', 'COLON 264', '87', '5596361', '8031', 1, '2015-07-21'),
(3905, 'CASA HUMBERTO LUCAIO', '00000000000', 'CALLE 1810 356', '50', '457660', '40043', 1, '2015-07-21'),
(3906, 'CASTRO NELLY', '00000000000', 'B.DE IRIGOYEN 868', '50', '573562', '12978', 1, '2015-07-21'),
(3907, 'CATALANO MAURO ELIO', '00000000000', 'RIVADAVIA 623', '50', '584210', '18114', 1, '2015-07-21'),
(3908, 'CENTRO ACOPIADORES C', '00000423801', 'P.N.CARRERA 142', '87', '290166', '7451', 1, '2015-07-21'),
(3909, 'CENTRO BULONERO TS.A', '00000421144', 'SAN MARTIN 632', '87', '427979', '15875', 1, '2015-07-21'),
(3910, 'CEPEDA MARISOL GRACI', '00000000000', 'ISTILART 23', '50', '573184', '8459', 1, '2015-07-21'),
(3911, 'CEPEDA SILVIA MARIA', '00000000000', 'CHACABUCO 469', '50', '603881', '7419', 1, '2015-07-21'),
(3912, 'CEREALERA TRES ARROY', '00000432670', 'SAN MARTIN 1725', '87', '407173', '40074', 1, '2015-07-21'),
(3913, 'CERIANI NANCY GRACIE', '00000000000', '25 DE MAYO 62', '50', '564834', '7331', 1, '2015-07-21'),
(3914, 'CERRI CARLOS E HIJOS', '00000430300', 'J.INGENIEROS 1000', '87', '395601', '40051', 1, '2015-07-21'),
(3915, 'CERVINI MARIA SUSANA', '00000000000', 'MAIPU 210', '50', '291987', '7205', 1, '2015-07-21'),
(3916, 'CIA.DE SEG.LA MERCAN', '00000000000', 'MORENO 511', '250', '484220', '40034', 1, '2015-07-21'),
(3917, 'CLERCH AGUSTIN', '00000000000', 'DERIVACION NÃ¸4', '50', '609160', '21539', 1, '2015-07-21'),
(3918, 'CLERCH IGNACIO', '00000000000', 'RECONQUISTA 430', '50', '485852', '17430', 1, '2015-07-21'),
(3919, 'CLUB DE CAZADORES DE', '00000431505', 'V.SARSFIELD 285', '50', '175564', '14265', 1, '2015-07-21'),
(3920, 'COCIMANO LAURA ANDRE', '00000422295', 'COLON 265', '50', '554330', '7717', 1, '2015-07-21'),
(3921, 'COLANTONIO JOSE A.Y ', '00000426300', 'GUEMES 199', '50', '243191', '5359', 1, '2015-07-21'),
(3922, 'COLL PATRICIA', '00000000000', 'L.V.LOPEZ 569', '50', '582649', '9779', 1, '2015-07-21'),
(3923, 'COLLAZOS ALDO O.', '00000426344', 'RIVADAVIA 609', '87', '176949', '18109', 1, '2015-07-21'),
(3924, 'COLOMBO OSCAR LUIS', '00000423665', 'SAAVEDRA 445', '50', '213370', '6556', 1, '2015-07-21'),
(3925, 'COLONNA OMAR RODOLFO', '00000430136', 'COLON 299', '50', '340672', '7726', 1, '2015-07-21'),
(3926, 'COMASA S.A.', '00000000000', '9 DE JULIO 231', '50', '505475', '7235', 1, '2015-07-21'),
(3927, 'COMPAÃ‘IA EURO SRL.', '00000000000', 'MORENO 350', '50', '485230', '8431', 1, '2015-07-21'),
(3928, 'CONFITERIA LA PERLA ', '00000423152', 'MORENO 155', '50', '164089', '8216', 1, '2015-07-21'),
(3929, 'CONTI Y MELITA', '00000424885', 'BOLIVIA 950', '50', '182201', '717', 1, '2015-07-21'),
(3930, 'CONTRERAS LUIS ALBER', '00000429318', 'PELLEGRINI 319', '50', '304951', '9271', 1, '2015-07-21'),
(3931, 'COOP.AGRARIA DE TS.A', '431340', 'ALSINA 1015', '200', '53862', '40067', 1, '2015-07-21'),
(3932, 'COOP.DE TRANSP.DE TS', '00000426287', 'MATHEU 850', '87', '80187', '2879', 1, '2015-07-21'),
(3933, 'COOP.ELECT.LTDA.DE C', '00000432743', 'PELLEGRINI 102', '250', '237549', '8761', 1, '2015-07-21'),
(3934, 'COOP.RURAL LTDA.ALFA', '00000431839', 'SAAVEDRA 398', '87', '79426', '6623', 1, '2015-07-21'),
(3935, 'COSTANZO HUGO JUAN', '00000425757', 'BERUTTI 210', '50', '220020', '10175', 1, '2015-07-21'),
(3936, 'COTABARREN DANIEL', '00000000000', 'QUINTANA 501', '87', '472517', '15482', 1, '2015-07-21'),
(3937, 'CREDIL S.R.L.', '00000433096', 'BETOLAZA 70', '50', '455334', '8195', 1, '2015-07-21'),
(3938, 'CUMECHE S.R.L.', '00000000000', 'SAN MARTIN 495', '87', '460963', '40056', 1, '2015-07-21'),
(3939, 'DABIEN DE CHIRINO MA', '00000000000', 'ROCA 174', '50', '340685', '8715', 1, '2015-07-21'),
(3940, 'DAGUERRE CRISTINA JO', '00000000000', 'MITRE 514', '50', '382047', '9466', 1, '2015-07-21'),
(3941, 'D''ATRI SANDRA ELIZAB', '00000000000', 'BALCARCE 179', '50', '405717', '16759', 1, '2015-07-21'),
(3942, 'DAWSON S.A.', '00000431350', 'PELLEGRINI 15', '87', '190886', '40037', 1, '2015-07-21'),
(3943, 'DE ADURIZ MARIA JULI', '432113', 'B.OBRERO CASA 78', '50', '495822', '571', 1, '2015-07-21'),
(3944, 'DE BENEDETTO JUAN CA', '0', 'RIVADAVIA 785', '50', '271253', '42940', 1, '2015-07-21'),
(3945, 'DE LA CAL FRANCISCO', '00000422647', 'O.DUGGAN 675', '50', '319346', '11517', 1, '2015-07-21'),
(3946, 'DE LA PENNA JUAN CAR', '00000430652', 'RIVADAVIA 602', '50', '322391', '6266', 1, '2015-07-21'),
(3947, 'DE LA PENNA SEGURID.', '00000000000', 'CASEROS 955', '50', '569275', '19276', 1, '2015-07-21'),
(3948, 'DE MARTINO MARIA EST', '00000000000', 'H.YRIGOYEN 62', '50', '333007', '8053', 1, '2015-07-21'),
(3949, 'DE ZOETE SANDRA MARI', '00000000000', 'ROCA 814', '50', '498041', '10325', 1, '2015-07-21'),
(3950, 'DEJEAN ROBERTO OSCAR', '432479', 'CONSTITUYENTES 75', '50', '399087', '1421', 1, '2015-07-21'),
(3951, 'DEL CASTAÃ‘O ANGEL R', '00000430224', 'COLON 347', '87', '418603', '7730', 1, '2015-07-21'),
(3952, 'DEL GRANDE SERGIO FA', '00000426311', 'MORENO 1317', '50', '438034', '1564', 1, '2015-07-21'),
(3953, 'DEL VALLE MARIA LOUR', '00000000000', 'RECONQUISTA 281', '50', '479529', '16778', 1, '2015-07-21'),
(3954, 'DEL VALLE NELSON BER', '00000429188', 'TACUARI 615', '50', '420097', '13680', 1, '2015-07-21'),
(3955, 'DELGADO SONIA ALEJAN', '15510949', 'PRINGLES 327', '50', '5595502', '47705', 1, '2015-07-21'),
(3956, 'DEMATEO ROBERTO PABL', '0', 'RIVADAVIA 1148', '50', '5594425', '41613', 1, '2015-07-21'),
(3957, 'DI CROCE CLAUDIA ALE', '00000000000', 'LAVALLE 402', '50', '537854', '6613', 1, '2015-07-21'),
(3958, 'DI CROCE LAURA OFELI', '00000000000', 'FALUCHO 204', '50', '431194', '9319', 1, '2015-07-21'),
(3959, 'DI FELICE DORA NOEMI', '00015612128', 'BETOLAZA 787', '50', '582955', '6000', 1, '2015-07-21'),
(3960, 'DI FULVIO LUIS EUGEN', '00000000000', '1RA.JUNTA 536', '50', '287355', '10675', 1, '2015-07-21'),
(3961, 'DI MARCO JUAN E.', '00000423489', 'SAN MARTIN 390', '50', '199791', '15905', 1, '2015-07-21'),
(3962, 'DI ROCCO MARIA CECIL', '00000430479', 'MORENO 953', '50', '448323', '1597', 1, '2015-07-21'),
(3963, 'DI SALVI GUILLERMO E', '00000000000', 'R.MARGARITA 1405', '87', '465492', '11855', 1, '2015-07-21'),
(3964, 'DI SALVO GRACIELA ES', '00000000000', 'GARIBALDI 2200', '50', '534097', '23689', 1, '2015-07-21'),
(3965, 'DI SALVO S.A.', '00000423884', 'CALLE 1810 951', '50', '257345', '10566', 1, '2015-07-21'),
(3966, 'DI TOMMASO MARIO Y T', '00000431022', 'ROCHA 10', '87', '307255', '40058', 1, '2015-07-21'),
(3967, 'DI VITO CARMELO A.', '00000424649', 'B.DE IRIGOYEN 51', '87', '200312', '15755', 1, '2015-07-21'),
(3968, 'DI VITO CLAUDIA SUSA', '00000000000', 'COLON 178', '50', '427429', '8133', 1, '2015-07-21'),
(3969, 'DIAZ RAUL ALBERTO', '15505542', 'G.MOSCONI 35', '50', '451642', '20774', 1, '2015-07-21'),
(3970, 'DIFONZO & MARCHI', '00000423658', '1RA.JUNTA 667', '87', '234304', '10664', 1, '2015-07-21'),
(3971, 'DIMARCO ADRIANA GABR', '0', '9 DE JULIO 117', '50', '532585', '41853', 1, '2015-07-21'),
(3972, 'DOMINGUEZ MARIELA PA', '15618871', 'COUNTRY ZURITA 1', '50', '589156', '42307', 1, '2015-07-21'),
(3973, 'DUCHOSAL VERONICA', '00000000000', 'COLON 526', '50', '459967', '7880', 1, '2015-07-21'),
(3974, 'DUPUY STELLA MARIS', '00000000000', 'V.SARSFIELD 9', '50', '570200', '14194', 1, '2015-07-21'),
(3975, 'EICHLER EDUARDO HUGO', '00000425209', 'RIVADAVIA 501', '50', '295422', '17743', 1, '2015-07-21'),
(3976, 'ELCUAZ HECTOR A.', '00000424193', 'P.N.CARRERA 899', '87', '195012', '5649', 1, '2015-07-21'),
(3977, 'ELGART REYNALDO E Y ', '00000000000', 'SAN MARTIN 835', '87', '555845', '15818', 1, '2015-07-21'),
(3978, 'ELGART VERONICA Y EL', '00000000000', 'L.V.LOPEZ 465', '50', '580430', '9554', 1, '2015-07-21'),
(3979, 'ELICALDE NESTOR JUAN', '00000000000', 'MORENO 379', '50', '406075', '8240', 1, '2015-07-21'),
(3980, 'ERRAZU MARIA EMILIA', '00000000000', 'COLON 286', '50', '588380', '8024', 1, '2015-07-21'),
(3981, 'ESPELUSE RODOLFO Y C', '00000000000', 'ISTILART 76', '87', '528041', '8477', 1, '2015-07-21'),
(3982, 'ETCHEVERRY ALFREDO J', '00000432289', 'I.LA CATOLICA 815', '50', '317078', '17572', 1, '2015-07-21'),
(3983, 'ETERNET S.R.L.', '00015513040', 'ISTILART 255', '87', '479587', '9030', 1, '2015-07-21'),
(3984, 'EXPRESO EL VASQUITO ', '00000000000', 'J.INGENIEROS 770', '50', '589387', '11998', 1, '2015-07-21'),
(3985, 'FAGEMAR S.A.', '00000000000', 'CHACABUCO 587', '50', '576909', '7441', 1, '2015-07-21'),
(3986, 'FAMTEX S.R.L.', '00000000000', 'COLON 131', '87', '499745', '7704', 1, '2015-07-21'),
(3987, 'FARIAS MIRTA ANGELIC', '00000000000', 'COLON 59', '50', '461247', '7698', 1, '2015-07-21'),
(3988, 'FARINA AMERICO', '00000423608', 'BETOLAZA 843', '50', '132756', '5774', 1, '2015-07-21'),
(3989, 'FARMACIA TRES ARROYO', '00000000000', 'SAN MARTIN 733', '50', '5594842', '15794', 1, '2015-07-21'),
(3990, 'FERNANDEZ JAVIER EDU', '00000000000', 'COLON 375', '50', '533944', '7734', 1, '2015-07-21'),
(3991, 'FERNANDEZ MARIA CRIS', '420099', 'MAGALLANES 284', '50', '510222', '40901', 1, '2015-07-21'),
(3992, 'FERNANDEZ MIGUEL ANG', '00000430880', 'MORENO 609', '50', '320733', '8295', 1, '2015-07-21'),
(3993, 'FERNANDEZ RODOLFO Y ', '00000000000', 'DERQUI 53', '50', '497738', '15737', 1, '2015-07-21'),
(3994, 'FERNANDEZ VILLANUEVA', '00000425356', 'COLON 218', '87', '411369', '8044', 1, '2015-07-21'),
(3995, 'FERRARI RICARDO DOMI', '00000000000', 'SARMIENTO 375', '50', '421661', '8660', 1, '2015-07-21'),
(3996, 'FERRARIO GUILLERMO E', '00000424445', 'COLON 435', '50', '393144', '7747', 1, '2015-07-21'),
(3997, 'FERRARIO GUSTAVO ADR', '00000000000', 'AV.TRABAJADOR 46', '50', '394402', '1624', 1, '2015-07-21'),
(3998, 'FERRARO MARIO CESAR', '00000423106', 'ALSINA 654', '50', '283360', '16231', 1, '2015-07-21'),
(3999, 'FERREIROS DIEGO RUBE', '00000000000', 'P.N.CARRERA 985', '50', '592156', '5430', 1, '2015-07-21'),
(4000, 'FIDUCIARIA CASTELLI ', '00000431333', 'MORENO 322', '87', '5596868', '8456', 1, '2015-07-21'),
(4001, 'FINVERCAR S.A', '433795', '9 DE JULIO 210', '87', '491664', '7230', 1, '2015-07-21'),
(4002, 'FLECHA MARCELO ANGEL', '00000000000', 'LAPRIDA 246', '50', '583659', '13806', 1, '2015-07-21'),
(4003, 'FORTE SILVIA NOEMI', '00000000000', 'ROCA 421', '87', '294656', '9468', 1, '2015-07-21'),
(4004, 'FOSQUE MARIA ADELA', '00000000000', '9 DE JULIO 88', '50', '435251', '7963', 1, '2015-07-21'),
(4005, 'FRIGORIFICO CAPRIATA', '00000000000', 'GOMILA 268', '87', '516077', '40055', 1, '2015-07-21'),
(4006, 'FUCHS SANDRA CECILIA', '00000000000', '9 DE JULIO 358', '50', '592941', '6908', 1, '2015-07-21'),
(4007, 'GALENO ARGENTINA SOC', '00000000000', 'MAIPU 6', '87', '5594363', '7931', 1, '2015-07-21'),
(4008, 'GALILEA EUGENIO HECT', '00000424278', 'COLON 424', '87', '185127', '7900', 1, '2015-07-21'),
(4009, 'GALLARDO JAVIER NEST', '00015614365', 'BRANDSEN 772', '87', '420518', '42', 1, '2015-07-21'),
(4010, 'GANIM CESAR DAMIAN', '15521567', '17 DE AGOSTO', '50', '5597710', '49421', 1, '2015-07-21'),
(4011, 'GANIM NESTOR HUGO', '00000000000', 'PASSO 235', '50', '455291', '12882', 1, '2015-07-21'),
(4012, 'GARAT ELSA MARIA', '00000431200', 'DORREGO 966', '50', '380623', '2358', 1, '2015-07-21'),
(4013, 'GARCIA ANA CAROLINA', '0', 'S.COSTA 87', '50', '559191', '47804', 1, '2015-07-21'),
(4014, 'GARCIA GABRIEL Y GUS', '00000422856', 'SAN MARTIN 1760', '87', '399191', '20893', 1, '2015-07-21'),
(4015, 'GARCIA MARCONI ROCIO', '00000000000', '9 DE JULIO 62', '50', '530015', '7969', 1, '2015-07-21'),
(4016, 'GARCIA MARIA DEL CAR', '00000425641', '9 DE JULIO 131', '50', '345912', '7550', 1, '2015-07-21'),
(4017, 'GARCIA MAURICIO DAVI', '00015645479', 'MORENO 581', '50', '421238', '8284', 1, '2015-07-21'),
(4018, 'GARCIA SERGIO RAUL', '00000000000', 'ALVEAR 633', '87', '500089', '10274', 1, '2015-07-21'),
(4019, 'GASANEO Y AMESTOY', '00000000000', 'SARMIENTO 489', '50', '233336', '8667', 1, '2015-07-21'),
(4020, 'GASPAROLI ANA TERESA', '425361', 'H.PRIMO 991', '50', '568874', '777', 1, '2015-07-21'),
(4021, 'GEJO RUBEN Y RODOLFO', '00000000000', 'DORREGO 534', '50', '486758', '6851', 1, '2015-07-21'),
(4022, 'GENOVESI HNOS.S.R.L', '00000424926', 'RUTA 3 KM 496', '50', '248095', '23394', 1, '2015-07-21'),
(4023, 'GIACOMINO ANDREA SUS', '00000423268', 'R.PEÃ‘A 67', '87', '411705', '16082', 1, '2015-07-21'),
(4024, 'GIARDINO P Y DE TORR', '00000431320', 'H.PRIMO 442', '50', '435440', '9689', 1, '2015-07-21'),
(4025, 'GIDINI MARGARITA AGU', '00000432366', 'URQUIZA 47', '50', '431266', '1736', 1, '2015-07-21'),
(4026, 'GIMNASIO STADIUM', '00000000000', 'MORENO 715', '87', '302234', '1615', 1, '2015-07-21'),
(4027, 'GIUDICI ADRIAN ANDRE', '425685', 'CHACABUCO 101', '50', '493916', '42756', 1, '2015-07-21'),
(4028, 'GIULIANI HECTOR Y LU', '00000000000', 'ESTRADA 666', '50', '310040', '13521', 1, '2015-07-21'),
(4029, 'GONZALEZ JORGE VENTU', '00000000000', 'BROWN 176', '50', '516442', '16420', 1, '2015-07-21'),
(4030, 'GONZALEZ LUIS ALBERT', '427068', 'CONSTITUYENTES 174', '50', '379252', '1210', 1, '2015-07-21'),
(4031, 'GONZALEZ MARCELO GAB', '00000424023', '25 DE MAYO 275', '50', '365819', '7032', 1, '2015-07-21'),
(4032, 'GONZALEZ MARCELO OSC', '00000429920', 'O.DUGGAN 750', '50', '443647', '12471', 1, '2015-07-21'),
(4033, 'GONZALEZ MARIA LAURA', '00000000000', '9 DE JULIO 46', '50', '469012', '7975', 1, '2015-07-21'),
(4034, 'GRANDA LUCIANO', '00000000000', 'FRENCH 15', '50', '563983', '13138', 1, '2015-07-21'),
(4035, 'GROSSO CLAUDIA LUJAN', '00000000000', '25 DE MAYO 373', '50', '133519', '7046', 1, '2015-07-21'),
(4036, 'GRUAS Y MONTAJES IOR', '00000000000', 'G.MOSCONI 399', '87', '571614', '20800', 1, '2015-07-21'),
(4037, 'GUAZZORA ELSA CELICA', '00000426679', '25 DE MAYO 82', '50', '360595', '7330', 1, '2015-07-21'),
(4038, 'GUILLERMO ECHEVARRIA', '00334000401', 'SAN MARTIN 1080', '87', '472041', '20225', 1, '2015-07-21'),
(4039, 'GUISASOLA MARIA LEON', '00000000000', 'ALVARADO 325', '50', '215879', '9831', 1, '2015-07-21'),
(4040, 'GURIDI PAULA ANDREA', '00000000000', 'BETOLAZA 124', '50', '504465', '7629', 1, '2015-07-21'),
(4041, 'GUSTAVO FIORDA MAQUI', '00000000000', 'J.INGENIEROS 1020', '87', '580502', '11910', 1, '2015-07-21'),
(4042, 'HERNANDEZ HUGO SEBAS', '00000000000', 'FALUCHO 195', '50', '529064', '9164', 1, '2015-07-21'),
(4043, 'HERRERA F-HERRERA N-', '00000000000', 'URQUIZA 1300', '50', '583936', '4196', 1, '2015-07-21'),
(4044, 'HERRERO RAUL MARIO', '00000433530', 'MORENO 255', '87', '318769', '8225', 1, '2015-07-21'),
(4045, 'HID MARIO HORACIO', '00000000000', '1RA.JUNTA 367', '50', '382975', '10645', 1, '2015-07-21'),
(4046, 'HIDALGO MARIA EUGENI', '00000000000', 'CALLE 1810 15', '50', '507163', '8493', 1, '2015-07-21'),
(4047, 'HOJBJERG MYRIAN MABE', '00000000000', 'MORENO 999', '50', '5596036', '1593', 1, '2015-07-21'),
(4048, 'HOJOBAR S.A.', '00000000000', 'BELGRANO 495', '50', '519007', '9580', 1, '2015-07-21'),
(4049, 'HOLLENDER PEDRO MARC', '00000000000', 'R.PEÃ‘A 4200', '50', '468291', '21528', 1, '2015-07-21'),
(4050, 'IACOVIELLO HECTOR FR', '00000424649', 'SAN MARTIN 551', '50', '386481', '15752', 1, '2015-07-21'),
(4051, 'IELMINI NELIDA ESTER', '00000000000', 'BROWN 97', '50', '483571', '16016', 1, '2015-07-21'),
(4052, 'IGLESIAS JUAN CARLOS', '00000000000', 'CALLE 1810 58', '50', '524665', '8517', 1, '2015-07-21'),
(4053, 'INGENERARE SRL', '00000000000', 'ALVEAR 210', '50', '545211', '10363', 1, '2015-07-21'),
(4054, 'INSTITUTO BIOQUIMICO', '00000431347', 'RIVADAVIA 183', '87', '280617', '16307', 1, '2015-07-21'),
(4055, 'IRIART FERNANDO RAUL', '00000429221', 'TACUARI 585', '50', '257462', '14081', 1, '2015-07-21'),
(4056, 'IRIBARNE EDUARDO', '0', 'H.YRIGOYEN 769', '50', '610472', '40199', 1, '2015-07-21'),
(4057, 'IRIBARREN DANIEL CAR', '00000000000', '1RA.JUNTA 1074', '50', '420420', '507', 1, '2015-07-21'),
(4058, 'ISMAEL CLAUDIO ANIBA', '00000000000', 'BELGRANO 680', '50', '456689', '13466', 1, '2015-07-21'),
(4059, 'ITALIANI MARIA ELENA', '00000430189', 'MORENO 227', '50', '378314', '8223', 1, '2015-07-21'),
(4060, 'ITURBURU MARIA ISABE', '00000000000', 'MITRE 65', '50', '478069', '9385', 1, '2015-07-21'),
(4061, 'JACOBSEN ANDRES RAUL', '00000428097', 'FALUCHO 985', '50', '354695', '928', 1, '2015-07-21'),
(4062, 'JALLE ANDRES', '00000000000', 'CHACABUCO 75', '50', '572901', '7360', 1, '2015-07-21'),
(4063, 'JAUREGUIBEHERE LIA M', '00000000000', 'H.YRIGOYEN 172', '50', '467382', '7576', 1, '2015-07-21'),
(4064, 'JEANNERET JULIO', '00000422712', 'RIVADAVIA 545', '50', '205450', '17750', 1, '2015-07-21'),
(4065, 'JORGE ALBERTO', '00000000000', 'BRANDSEN 365', '50', '499123', '8893', 1, '2015-07-21'),
(4066, 'JUAN EDUARDO', '00000424361', 'D.VASQUEZ 924', '87', '393245', '12642', 1, '2015-07-21'),
(4067, 'JURORUSA S.A', '00000000000', 'MORENO 164', '87', '559074', '8530', 1, '2015-07-21'),
(4068, 'LA AGRICOLA GANAD.DE', '00000424312', 'SARMIENTO 221', '87', '19914', '8639', 1, '2015-07-21'),
(4069, 'LA CASA DE LOS BULON', '00000000000', 'LAVALLE 1', '50', '459840', '7893', 1, '2015-07-21'),
(4070, 'LA PERSEVERANCIA SEG', '00000430780', 'COLON 87', '250', '20167', '40026', 1, '2015-07-21'),
(4071, 'LABORDE CARLOS ALBER', '00000426811', 'COLON 627', '50', '222721', '7809', 1, '2015-07-21'),
(4072, 'LAGO S.A.', '00000000000', 'SAN MARTIN 1386', '87', '498416', '21069', 1, '2015-07-21'),
(4073, 'LAMBERTA JORGE MIGUE', '00000423118', 'BRANDSEN 134', '50', '459361', '9095', 1, '2015-07-21'),
(4074, 'LANCE FABIANA', '00000000000', 'COLON 481', '50', '570574', '7761', 1, '2015-07-21'),
(4075, 'LARA ROBERTO MARCELO', '00000429538', '1RA.JUNTA 226', '50', '391951', '10749', 1, '2015-07-21'),
(4076, 'LARRIESTRA BEATRIZ C', '00000000000', 'COLON 545', '50', '437776', '7787', 1, '2015-07-21'),
(4077, 'LARSEN CESAR GERARDO', '00000000000', 'RECONQUISTA 801', '50', '379005', '18730', 1, '2015-07-21'),
(4078, 'LAS MECHAS SOCIEDAD ', '00000000000', 'L.V.LOPEZ 9', '50', '566098', '8606', 1, '2015-07-21'),
(4079, 'LATORRE ALEJANDRO MA', '00000000000', 'B.DE IRIGOYEN 755', '50', '522993', '13286', 1, '2015-07-21'),
(4080, 'LATORRE JOAQUIN IGNA', '00000000000', 'LIBERTAD 115', '50', '550055', '1907', 1, '2015-07-21'),
(4081, 'LAVANDERIA TRES ARRO', '00000425350', 'DORREGO 502', '50', '229270', '6852', 1, '2015-07-21'),
(4082, 'LAVERENS NELSON A.', '00000000000', 'S.PEÃ‘A 135', '50', '220525', '15404', 1, '2015-07-21'),
(4083, 'LEGUIZAMON CLAUDIA I', '00000000000', 'LAVALLE 661', '50', '558282', '6107', 1, '2015-07-21'),
(4084, 'LEGUIZAMON ESTEBAN H', '00015562931', 'ALVARADO 675', '50', '558341', '9858', 1, '2015-07-21'),
(4085, 'LETAMENDI LUIS ANGEL', '00000420913', 'L.V.LOPEZ 1250', '50', '392671', '10921', 1, '2015-07-21'),
(4086, 'LIEBANA JORGE F.', '00000431615', 'SAN LORENZO 56', '50', '188359', '16701', 1, '2015-07-21'),
(4087, 'LIFIRON S.A', '00000000000', 'DERIVACION NÂ°2 2', '50', '548935', '22159', 1, '2015-07-21'),
(4088, 'LLANOS ALICIA CLALFI', '00000000000', 'COLON 430', '50', '594466', '7898', 1, '2015-07-21'),
(4089, 'LOFIEGO JOSE JUIS', '00000430152', 'ISTILART 630', '50', '406583', '9949', 1, '2015-07-21'),
(4090, 'LOPEZ IRMA ELENA', '00000000000', 'CALLE 1810 550', '50', '471305', '9756', 1, '2015-07-21'),
(4091, 'LOPEZ NESTOR FABIAN', '00000000000', 'LAVALLE 395', '50', '445931', '6871', 1, '2015-07-21'),
(4092, 'LOSADA RICARDO OSVAL', '00000423259', 'LAVALLE 410', '50', '346889', '6612', 1, '2015-07-21'),
(4093, 'LUCERO OLGA', '0', '9 DE JULIO 922', '50', '575364', '44961', 1, '2015-07-21'),
(4094, 'LUIS BLANCO S.A', '00000433533', 'BELGRANO 970', '87', '300357', '12532', 1, '2015-07-21'),
(4095, 'MACHADO ROBERTO OSCA', '00000432079', 'L.N.ALEM 546', '50', '396998', '2822', 1, '2015-07-21'),
(4096, 'MACIEL HERMANOS S.A.', '00000430680', 'SAN MARTIN 985', '250', '223744', '40059', 1, '2015-07-21'),
(4097, 'MADERAS S. JOSE DE L', '00000000000', 'S.COSTA 1009', '50', '536844', '10667', 1, '2015-07-21'),
(4098, 'M.A.M. S.A.', '00000424441', 'FORMOSA 1050', '87', '421456', '40050', 1, '2015-07-21'),
(4099, 'MARINO MONICA GRACIE', '00000000000', 'COLON 363', '50', '476791', '7733', 1, '2015-07-21'),
(4100, 'MARTINEZ CLAUDIO NES', '00000000000', 'URQUIZA 116', '50', '402745', '1993', 1, '2015-07-21'),
(4101, 'MARTINEZ DE CAMPOS A', '00000000000', 'CHACABUCO 325', '50', '456618', '7405', 1, '2015-07-21'),
(4102, 'MARTINEZ FRANKLIN SE', '00000433007', 'RIVADAVIA 885', '50', '411835', '18764', 1, '2015-07-21'),
(4103, 'MARTINEZ GUILLERMO O', '424748', 'BETOLAZA 711', '50', '483816', '42405', 1, '2015-07-21'),
(4104, 'MARTINEZ JULIO CESAR', '00000000000', 'COLON 346', '87', '548759', '7950', 1, '2015-07-21'),
(4105, 'MASCHI EDUARDO ERNES', '00000430870', 'SAN LORENZO 281', '50', '199485', '16417', 1, '2015-07-21'),
(4106, 'MASTROSIMONE GUSTAVO', '00000422231', 'BELGRANO 702', '50', '402370', '13136', 1, '2015-07-21'),
(4107, 'MAVIGLIA YAMILA BELE', '0', 'MORENO 598', '50', '5594953', '41377', 1, '2015-07-21'),
(4108, 'MAYER RICARDO AUTOMO', '00000428350', 'O.DUGGAN 875', '50', '530725', '11650', 1, '2015-07-21'),
(4109, 'MENNA ELIANA ANDREA', '00000000000', 'RIVADAVIA 599', '50', '599793', '17757', 1, '2015-07-21'),
(4110, 'MENNA JOSE ANGEL', '00000422842', 'CONSTITUYENTES 50', '50', '343471', '1417', 1, '2015-07-21'),
(4111, 'MENNA LORENZO N.', '00000426588', 'SAN LORENZO 184', '87', '187828', '16688', 1, '2015-07-21'),
(4112, 'MEO GUZMAN ENRIQUE F', '00000423287', 'DERQUI 134', '50', '399683', '15479', 1, '2015-07-21'),
(4113, 'MERLINO PLAN S.A.', '00000000000', 'H.YRIGOYEN 73', '87', '450661', '8110', 1, '2015-07-21'),
(4114, 'MERLO CARMEN HERMINI', '00000000000', 'ESTRADA 55', '50', '335421', '15664', 1, '2015-07-21'),
(4115, 'MESA DE FORCHETTI MO', '00000000000', 'SARMIENTO 201', '50', '354826', '8636', 1, '2015-07-21'),
(4116, 'MIEDAN ANA KARINA', '00000432829', 'H.YRIGOYEN 431', '50', '439826', '6677', 1, '2015-07-21'),
(4117, 'MILLA SUR S.A.', '00000000000', 'GUEMES 45', '87', '604774', '5347', 1, '2015-07-21'),
(4118, 'MIO FIGLIO  S.R.L.', '15507169', 'LAVALLE 52', '50', '5594994', '45928', 1, '2015-07-21'),
(4119, 'MOIRANO EVELIA LILIA', '00000000000', 'ROCA 13', '50', '512776', '8373', 1, '2015-07-21'),
(4120, 'MOIZZI JUAN JOSE', '00000000000', 'BROWN 1', '50', '468796', '16007', 1, '2015-07-21'),
(4121, 'MOLFESE ISIDRO', '00000432176', 'CANGALLO 664', '50', '351056', '13642', 1, '2015-07-21'),
(4122, 'MOLINA EUGENIO ALFRE', '00000423034', 'LAVALLE 357', '50', '386872', '6864', 1, '2015-07-21'),
(4123, 'MOLINA HECTOR MARIAN', '00000000000', 'COLON 255', '50', '561279', '7714', 1, '2015-07-21'),
(4124, 'MOLINOS TRES ARROYOS', '00000432494', 'P.INDUSTRIAL', '87', '400725', '40130', 1, '2015-07-21'),
(4125, 'MOLINOS ZALLA S.A.', '00000420759', 'RUTA 3 KM 495.5', '87', '525473', '40120', 1, '2015-07-21'),
(4126, 'MOLLER ARTURO', '00000429848', 'V.SARSFIELD 375', '50', '285436', '14299', 1, '2015-07-21'),
(4127, 'MONSALVO MARIA DE LO', '00000000000', 'MORENO 265', '50', '522980', '8227', 1, '2015-07-21'),
(4128, 'MONTESINOS JOSE MANU', '00000420783', 'L.V.LOPEZ 176', '87', '308092', '8839', 1, '2015-07-21'),
(4129, 'MORAN JORGE ANTONIO', '00000428895', 'LAMADRID 167', '50', '366021', '14983', 1, '2015-07-21'),
(4130, 'MORAN MARCELO ANTONI', '00000000000', '25 DE MAYO 299', '50', '492850', '7033', 1, '2015-07-21'),
(4131, 'MUNGAI MARIA MERCEDE', '00000000000', 'CORDOBA 44', '50', '566740', '10874', 1, '2015-07-21'),
(4132, 'MUTUAL FEDERADA 25 D', '431819', 'MORENO 456', '50', '5597222', '8400', 1, '2015-07-21'),
(4133, 'NALDO LOMBARDI S.A', '424178', 'CALLE 1810 75', '87', '555438', '40039', 1, '2015-07-21'),
(4134, 'NIKRO S.A', '00000433344', 'RIVADAVIA 620', '50', '532514', '6263', 1, '2015-07-21'),
(4135, 'NOICSA S.A.', '00000000000', 'MAZZINI 950', '87', '533638', '11665', 1, '2015-07-21'),
(4136, 'NOVILLO VIRGINIA VER', '00000000000', 'SALTA 321', '50', '513555', '4744', 1, '2015-07-21'),
(4137, 'OHACO RAUL BAUTISTA', '00000428430', 'CHACABUCO 390', '50', '336734', '7524', 1, '2015-07-21'),
(4138, 'OLEOHIDRAULICA DI RO', '00000423815', 'SAN MARTIN 1375', '50', '381516', '21130', 1, '2015-07-21'),
(4139, 'OLOCCO BARTOLO', '00000431844', 'H.YRIGOYEN 91', '50', '240116', '8113', 1, '2015-07-21'),
(4140, 'OLSEN CRISTIAN', '00000000000', 'LAMADRID 273', '50', '460093', '15019', 1, '2015-07-21'),
(4141, 'ONGARINI LIVIO', '00000426468', 'QUINTANA 375', '50', '195911', '15425', 1, '2015-07-21'),
(4142, 'OTERO OSCAR ALBERTO', '00000427339', 'ALSINA 32', '50', '268598', '16300', 1, '2015-07-21'),
(4143, 'PALLA SILVIA CRISTIN', '00000000000', 'MORENO 623', '50', '500757', '8297', 1, '2015-07-21'),
(4144, 'PALLADINO  S.A.', '00000424896', '1RA.JUNTA 999', '87', '392802', '534', 1, '2015-07-21'),
(4145, 'PALMA NORA', '00000000000', 'LAVALLE 196', '50', '488853', '7468', 1, '2015-07-21'),
(4146, 'PASCUAL SILVIA ADRIA', '00000430612', 'L.V.LOPEZ 81', '50', '398761', '8622', 1, '2015-07-21'),
(4147, 'PAZOS DE VELOSO MABE', '00000000000', 'H.YRIGOYEN 420', '50', '417071', '6671', 1, '2015-07-21'),
(4148, 'PC TRUCKS TRES ARROY', '00000000000', 'J.INGENIEROS 804', '50', '574455', '11996', 1, '2015-07-21'),
(4149, 'PEQUEÃ‘O JOSE', '00000424243', 'CHACABUCO 163', '50', '213817', '7377', 1, '2015-07-21'),
(4150, 'PEREYRA ESTEBAN CEFE', '00000000000', 'SAN MARTIN 1315', '50', '485386', '21074', 1, '2015-07-21'),
(4151, 'PEREZ DALSGAARD Y CI', '00000000000', 'MORENO 798', '87', '261225', '6', 1, '2015-07-21'),
(4152, 'PEREZ GUILLERMO LUIS', '00000429763', '1RA.JUNTA 250', '50', '271729', '10746', 1, '2015-07-21'),
(4153, 'PEREZ GUSTAVO MIGUEL', '00000000000', 'BELGRANO 625', '50', '431048', '10024', 1, '2015-07-21'),
(4154, 'PEREZ MARIA ISABEL', '00000000000', 'LIBERTAD 385', '50', '459938', '2362', 1, '2015-07-21'),
(4155, 'PEREZ NELSON ADRIAN', '00000000000', 'LAMADRID 436', '50', '480336', '15270', 1, '2015-07-21'),
(4156, 'PEREZ PAULA ANDREA', '00000000000', 'B.OBRERO CASA 54', '50', '464554', '603', 1, '2015-07-21'),
(4157, 'PEREZ RAUL MARTIN', '00000000000', 'CHACABUCO 39', '87', '363280', '7356', 1, '2015-07-21'),
(4158, 'PERTICARARI JUAN PAB', '15613025', 'SAN MARTIN 402', '50', '505840', '15902', 1, '2015-07-21'),
(4159, 'PETELA HECTOR', '00000420407', 'CATAMARCA 934', '87', '307138', '20521', 1, '2015-07-21'),
(4160, 'PIERINI CARLOS FABIA', '00000428707', 'SARMIENTO 1165', '50', '451206', '1352', 1, '2015-07-21'),
(4161, 'PINTURERIAS RUCCI S.', '00000422054', 'CHACABUCO 324', '87', '520667', '7533', 1, '2015-07-21'),
(4162, 'PIROSANTO CAMILO ALD', '00000427500', 'V.SARSFIELD 295', '50', '318613', '14266', 1, '2015-07-21'),
(4163, 'PODESTA MARIANA', '00000000000', 'BETOLAZA 114', '50', '491840', '7631', 1, '2015-07-21'),
(4164, 'PONCE EDUARDO ESTEBA', '00000429069', 'S.PEÃ‘A 460', '50', '336620', '14281', 1, '2015-07-21'),
(4165, 'POULSEN PEDRO-CAZEAU', '00000000000', 'BALCARCE 568', '50', '543871', '17001', 1, '2015-07-21'),
(4166, 'POZZOLI LAURA CECILI', '00000000000', 'MORENO 585', '50', '538880', '8278', 1, '2015-07-21'),
(4167, 'PRADO RUBEN OSCAR', '00000000000', 'CORDOBA 260', '87', '5596384', '10829', 1, '2015-07-21'),
(4168, 'PRIETO JUAN JOSE', '00000000000', 'PASSO 620', '50', '483148', '13086', 1, '2015-07-21'),
(4169, 'PROCACCINI FRANCISCO', '00015618430-434077-', 'ALMAFUERTE 40', '50', '265122', '21079', 1, '2015-07-21'),
(4170, 'QUIMICA MOLERO S.R.L', '00000000000', 'CASEROS 816', '50', '521811', '19295', 1, '2015-07-21'),
(4171, 'RACCIATTI PEDRO ALEJ', '00015458789', 'DERIVACION NÂ°2 0000', '50', '580313', '22151', 1, '2015-07-21'),
(4172, 'RANZINI MATIAS FEDER', '00000000000', 'ALSINA 469', '50', '581961', '16057', 1, '2015-07-21'),
(4173, 'RANZINI RICARDO VALE', '432553', 'J.INGENIEROS 360', '87', '434443', '21030', 1, '2015-07-21'),
(4174, 'RAVELLA RICARDO H.', '00000433507', 'LAS HERAS 455', '50', '237406', '17543', 1, '2015-07-21'),
(4175, 'RE MARIO CESAR', '00000431251', 'LAVALLE 155', '50', '460110', '7492', 1, '2015-07-21'),
(4176, 'RECARI MARIANO', '00000422878', 'GOMILA 798', '50', '446101', '13119', 1, '2015-07-21'),
(4177, 'REFAFLOTO S.A', '00000000000', 'COLON 399', '87', '507701', '7738', 1, '2015-07-21'),
(4178, 'RENDO DE PODESTA IRM', '00000425524', 'H.PRIMO 384', '50', '404374', '9708', 1, '2015-07-21'),
(4179, 'REY ANA MARIA', '00000430467', 'S.CABRAL 46', '87', '408574', '14937', 1, '2015-07-21'),
(4180, 'RIDINO EDUARDO NICOL', '00000000000', 'BETOLAZA 757', '50', '478825', '5995', 1, '2015-07-21'),
(4181, 'RIVOLTA JOSE EDUARDO', '15506110', 'QUINTANA 75', '50', '5597618', '49145', 1, '2015-07-21'),
(4182, 'ROAS SACIF', '42955800000000000', 'SAN MARTIN 461', '50', '585507', '15733', 1, '2015-07-21'),
(4183, 'RODERA FRANCISCO Y J', '00000000000', 'CHACABUCO 173', '50', '471565', '7378', 1, '2015-07-21'),
(4184, 'RODRIGUEZ ELSA TERES', '00000430930', '9 DE JULIO 216', '50', '399133', '7231', 1, '2015-07-21'),
(4185, 'RODRIGUEZ TERESA ANG', '00000000000', 'MAIPU 165', '50', '470933', '7519', 1, '2015-07-21'),
(4186, 'ROLANDO LUIS ROBERTO', '00000430479', 'SAN LORENZO 164', '87', '352691', '16691', 1, '2015-07-21'),
(4187, 'ROLDAN JUANA MARIELA', '00000000000', 'RIVADAVIA 223', '50', '470959', '16709', 1, '2015-07-21'),
(4188, 'ROLDAN LILIANA VALER', '00000000000', 'MATHEU 515', '50', '475866', '6067', 1, '2015-07-21'),
(4189, 'RUBIO DANIEL CECILIO', '00000429451', '1RA.JUNTA 531', '50', '312321', '10658', 1, '2015-07-21'),
(4190, 'RUTA 2 S.R.L.', '00000000000', 'L.DE LA TORRE 1496', '50', '261179', '40048', 1, '2015-07-21'),
(4191, 'SABATINI MARCELO EDM', '00000000000', 'R.PEÃ‘A 81', '50', '502490', '16084', 1, '2015-07-21'),
(4192, 'SAEZ JUAN EMILIO', '00000423535', 'CASEROS 601', '50', '5596738', '19223', 1, '2015-07-21'),
(4193, 'SAEZ SILVIA NELLY', '00000420847', 'CHACABUCO 299', '50', '348926', '7403', 1, '2015-07-21'),
(4194, 'SAGARDOY FERNANDO JO', '00000000000', 'GARIBALDI 354', '50', '514611', '11152', 1, '2015-07-21'),
(4195, 'SAINI SERGIO DANIEL', '00000427369', 'BELGRANO 560', '50', '430487', '13843', 1, '2015-07-21'),
(4196, 'SALOME JULIO', '00000000000', 'O.DUGGAN 610', '50', '256159', '12483', 1, '2015-07-21'),
(4197, 'SAN PELLEGRINI DE M.', '00000000000', 'J.INGENIEROS 255', '87', '78546', '21048', 1, '2015-07-21'),
(4198, 'SANCHEZ ELIZABETH', '00000000000', 'BETOLAZA 546', '50', '581828', '6485', 1, '2015-07-21'),
(4199, 'SANCHEZ MONICA LUJAN', '00000000000', 'ALSINA 298', '50', '572800', '16266', 1, '2015-07-21'),
(4200, 'SANCHEZ N.DE PEREYRA', '00000000000', 'FRENCH 536', '50', '401689', '13423', 1, '2015-07-21'),
(4201, 'SANCINETO VICTOR MAR', '00015612593', 'DERIVACION NÂ°6 0002', '50', '346788', '21601', 1, '2015-07-21'),
(4202, 'SANDE JUAN JOSE', '00000420682', 'SARMIENTO 456', '50', '349965', '8730', 1, '2015-07-21'),
(4203, 'SANI TRES S.A.', '00000000000', 'R.PEÃ‘A 235', '87', '544227', '16879', 1, '2015-07-21'),
(4204, 'SANTAGIULIANA MARIA ', '00000000000', 'ALSINA 854', '50', '444628', '16213', 1, '2015-07-21'),
(4205, 'SANTIRSO MARIA ROSAN', '00000000000', 'L.V.LOPEZ 1008', '50', '558976', '10792', 1, '2015-07-21'),
(4206, 'SAURO ROBERTO CESAR', '00000000000', '9 DE JULIO 109', '50', '360973', '7727', 1, '2015-07-21'),
(4207, 'SCARCELLA DIEGO JOSE', '00000000000', 'ROCHA 486', '50', '566304', '14399', 1, '2015-07-21'),
(4208, 'SCHENCK ANDREA FABIA', '00000000000', 'LAS HERAS 69', '50', '584441', '16143', 1, '2015-07-21'),
(4209, 'SCHUMACHER ALFREDO Y', '00000000000', 'SOLIS 929', '50', '576143', '3543', 1, '2015-07-21'),
(4210, 'SEMILLERA PAMPA FERT', '00000425092', 'CASEROS 668', '50', '326399', '19303', 1, '2015-07-21'),
(4211, 'SEQUEIRA CARLOS ENRI', '00000429131', 'COLON 357', '50', '229717', '7731', 1, '2015-07-21'),
(4212, 'SERRANO ELSA GLORIA', '00000000000', 'BRANDSEN 244', '87', '579782', '9060', 1, '2015-07-21'),
(4213, 'SISTEMAS TERMODINAMI', '00000427055', 'TACUARI 1050', '50', '463124', '11655', 1, '2015-07-21'),
(4214, 'SKOU BERTEL S.A.', '00000426783', 'CASEROS 10', '87', '176079', '19344', 1, '2015-07-21'),
(4215, 'SOBANSKI VICTOR ADOL', '00000421098', 'SAN LUIS 932', '50', '400044', '20590', 1, '2015-07-21'),
(4216, 'SOC. DE TRANSP.LIBRE', '00000000000', 'J.INGENIEROS 250', '87', '171263', '21024', 1, '2015-07-21'),
(4217, 'SOC.ESPAÃ‘OLA DE S.M', '00000431365', 'DORREGO 268', '87', '38928', '6929', 1, '2015-07-21'),
(4218, 'SOCOLOFF MARTIN IVAN', '15549858', '25 DE MAYO 146', '87', '588784', '42516', 1, '2015-07-21'),
(4219, 'SODA LA HUELLA S.R.L', '00000424828', 'S.CABRAL 1599', '87', '359225', '40076', 1, '2015-07-21'),
(4220, 'SODE HORACIO ABEL', '00000424337', 'B.MACHADO 1244', '50', '230928', '364', 1, '2015-07-21'),
(4221, 'SORIANO MIGUEL ANGEL', '00000431443', 'LINIERS 165', '50', '262714', '17785', 1, '2015-07-21'),
(4222, 'SORIANO RAFAEL', '00000433718', 'SAN MARTIN 345', '50', '233714', '15700', 1, '2015-07-21'),
(4223, 'SOULE SERGIO OSVALDO', '00015501624', 'SAN MARTIN 901', '87', '519850', '15840', 1, '2015-07-21'),
(4224, 'SOUMOULOU PABLO HERN', '00000422213', 'PASSO 550', '50', '375788', '13089', 1, '2015-07-21'),
(4225, 'SPENZA MARIANO MARTI', '15603805', 'V.SARSFIELD 367', '50', '5596458', '45371', 1, '2015-07-21'),
(4226, 'STALLONE JUDIT ELIZA', '00000000000', 'P.N.CARRERA 999', '50', '493466', '5432', 1, '2015-07-21'),
(4227, 'STARCEL PAMPA CENTRO', '00000000000', 'COLON 182', '50', '601728', '8132', 1, '2015-07-21'),
(4228, 'STIVABAD S.A', '15382871', 'COLON 153', '50', '5597773', '49697', 1, '2015-07-21'),
(4229, 'SUAREZ ADELA JOSEFIN', '431490', 'BRANDSEN 1176', '50', '474625', '1026', 1, '2015-07-21'),
(4230, 'SUAREZ JORGE EDUARDO', '00000431374', 'LAS HERAS 25', '87', '175766', '16141', 1, '2015-07-21'),
(4231, 'SUPERCARNE S.A.', '00000431381', 'RIVADAVIA 453', '87', '439969', '40063', 1, '2015-07-21'),
(4232, 'SUPERMERCADO PLANETA', '00000431359', 'ALSINA 6', '87', '310659', '16302', 1, '2015-07-21'),
(4233, 'SUR AGROPECUARIA S.A', '00000426600', 'O.DUGGAN 1415', '87', '565583', '11805', 1, '2015-07-21'),
(4234, 'TARABORELLI ALEJANDR', '00000000000', 'H.YRIGOYEN 765', '50', '505808', '5967', 1, '2015-07-21'),
(4235, 'TARABORELLI MARIO JE', '00000000000', '1RA.JUNTA 2', '50', '420550', '10802', 1, '2015-07-21'),
(4236, 'TARANTELA ELVIRA ELS', '00000000000', 'OLAVARRIA 66', '50', '548661', '10604', 1, '2015-07-21'),
(4237, 'TARJETA NARANJA SA.', '00000000000', 'CALLE 1810 72', '87', '561918', '8515', 1, '2015-07-21'),
(4238, 'TARTAGLINO Y CIA. SR', '00000424225', 'RIVADAVIA 402', '50', '315609', '40016', 1, '2015-07-21'),
(4239, 'TEILETCHE ENRIQUE Y ', '00000426605', 'COLON 102', '50', '189907', '8191', 1, '2015-07-21'),
(4240, 'TERRASANTA MONICA', '15618714', 'L.N.ALEM 1602', '50', '452359', '4105', 1, '2015-07-21'),
(4241, 'TIEMERSMA SEBASTIAN', '00000000000', 'PARQUESITO 2', '87', '520319', '23405', 1, '2015-07-21'),
(4242, 'TORRES CARIONI SANTI', '00000432313', 'MAZZINI 455', '50', '346140', '11238', 1, '2015-07-21'),
(4243, 'TORRES MARCELA NOEMI', '15572453', 'P.N.CARRERA 60', '50', '5597880', '50401', 1, '2015-07-21'),
(4244, 'TOSTEX S.A.', '00000000000', 'CASEROS 50', '250', '541691', '40065', 1, '2015-07-21'),
(4245, 'TRAFER SAIC', '00000424707', 'AV.TRABAJADOR 901', '87', '329749', '40009', 1, '2015-07-21'),
(4246, 'TRANSPORTE GOIZUETA', '00000426645', 'CASEROS 1360', '87', '366122', '20701', 1, '2015-07-21'),
(4247, 'TRAVERSO GUILLERMO H', '00000000000', 'ALSINA 541', '87', '482750', '16103', 1, '2015-07-21'),
(4248, 'TRESNECO S.A.', '00000000000', 'ROCA 12', '50', '552655', '8397', 1, '2015-07-21'),
(4249, 'TRONCOSO PEDRO ARTUR', '00000428931', 'E.DE LA CALLE 144', '50', '274502', '5137', 1, '2015-07-21'),
(4250, 'TRUCK EXPRESS S.R.L.', '00000000000', 'GUEMES 535', '87', '506498', '5391', 1, '2015-07-21'),
(4251, 'TUMINI D. Y J. Y MEN', '00000000000', 'GUEMES 297', '50', '311571', '5371', 1, '2015-07-21'),
(4252, 'TURINI PABLO RENATO', '00000000000', 'SAN MARTIN 799', '50', '587859', '15802', 1, '2015-07-21'),
(4253, 'ULLERUP RAUL ADOLFO', '00000000000', 'ESTRADA 1365', '50', '316811', '11033', 1, '2015-07-21'),
(4254, 'UNIVALORES S.A.', '00000422735', 'ISTILART 120', '50', '5594397', '8795', 1, '2015-07-21'),
(4255, 'URBAN ANDERSEN MARCO', '00000000000', 'BELGRANO 470', '50', '590367', '14184', 1, '2015-07-21'),
(4256, 'URBIETA ANDRES', '00000000000', 'V.SARSFIELD 725', '50', '5596845', '14378', 1, '2015-07-21'),
(4257, 'URRUTIA MARIA MARTA', '00000000000', 'MORENO 475', '87', '522300', '8248', 1, '2015-07-21'),
(4258, 'URTASUN ANA LIA', '00000000000', 'BALCARCE 351', '50', '571180', '16825', 1, '2015-07-21'),
(4259, 'UZCUDUN S.A.F.I.M.', '00000431496', 'MORENO 851', '87', '431413', '1607', 1, '2015-07-21'),
(4260, 'UZIDINGER EDUARDO NI', '00000000000', 'AMEGHINO 997', '50', '392479', '20062', 1, '2015-07-21'),
(4261, 'VACCA REINALDO RUBEN', '00000428087', 'G.MOSCONI 1650', '50', '311861', '23409', 1, '2015-07-21'),
(4262, 'VAZQUEZ MIGUEL ANGEL', '00000428230', 'SAN MARTIN 1497', '50', '264835', '21141', 1, '2015-07-21'),
(4263, 'VERGNANO RAUL ANDRES', '00000000000', 'AV.TRABAJADOR 842', '50', '524971', '3313', 1, '2015-07-21'),
(4264, 'VERKUYL ASTRID CINTI', '00000000000', 'MORENO 315', '50', '525792', '8232', 1, '2015-07-21'),
(4265, 'VIAL AGRO S.A.', '00000430610', 'SARMIENTO 757', '250', '225764', '12', 1, '2015-07-21'),
(4266, 'VIGILAN S.R.L.AG.DE ', '428811', 'SAN MARTIN 465', '50', '595160', '15735', 1, '2015-07-21'),
(4267, 'VILLAFRANCA MARTA S.', '00000422340', 'COLON 348', '50', '421528', '7947', 1, '2015-07-21'),
(4268, 'VILLALBA JORGE ALFRE', '00000430238', 'BRANDSEN 1285', '50', '229658', '1131', 1, '2015-07-21'),
(4269, 'VILLALBA PEDRO', '00000000000', 'CHACABUCO 222', '87', '536134', '7571', 1, '2015-07-21'),
(4270, 'VILLANUEVA JUAN CARL', '00000424464', 'LAVALLE 30', '50', '315638', '7889', 1, '2015-07-21'),
(4271, 'VILLEMUR GUSTAVO MIG', '00000000000', 'D.VASQUEZ 550', '50', '370477', '13951', 1, '2015-07-21'),
(4272, 'VINOTECA LOS TONELES', '00000422236', 'CASTELLI 374', '50', '598725', '5915', 1, '2015-07-21'),
(4273, 'VIVIANI CARMEN', '00000000000', 'COLON 284', '50', '209692', '8026', 1, '2015-07-21'),
(4274, 'VIZZOLINI NESTOR J.', '00000422775', 'RIVADAVIA 655', '50', '221043', '18116', 1, '2015-07-21'),
(4275, 'WEHRHANNE HORACIO MA', '00000429967', 'J.INGENIEROS 555', '50', '340816', '12072', 1, '2015-07-21'),
(4276, 'WEST FERNANDO LUIS', '00000000000', 'LIBERTAD 646', '50', '552336', '2918', 1, '2015-07-21'),
(4277, 'ZIJLSTRA JORGE ROBER', '00000431376', 'FRENCH 332', '87', '424255', '13437', 1, '2015-07-21'),
(4278, 'ZIJLSTRA SILVINA ELE', '00000000000', 'BERUTTI 145', '50', '586458', '10046', 1, '2015-07-21'),
(4279, 'ZORRILLA HNOS. S.R.L', '00000429380', 'COLON 899', '87', '5595870', '1836', 1, '2015-07-21'),
(4280, 'ZOTES SAUL FRANCISCO', '00000000000', 'MAZZINI 765', '50', '338943', '11544', 1, '2015-07-21'),
(4281, 'ZURITA HNOS. Y CIA.', '00000433469', 'ALMAFUERTE 1074', '87', '152897', '11731', 1, '2015-07-21'),
(4282, '18 DE SETIEMBRE S.A', '00000431428', 'CASEROS 1090', '87', '467715', '20547', 1, '2015-07-21'),
(4283, '3 ARROYOS S.A.', '00000000000', 'CHACO 350', '250', '583819', '40071', 1, '2015-07-21'),
(4284, '3 NET S.A.', '00000420903', 'CHACABUCO 98', '87', '532006', '7641', 1, '2015-07-21'),
(4285, 'Juan Carlos Garcia', '2983612548', '123123', '300', '1', '5555', 1, '2015-01-08');

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
  `enviarcorreo` tinyint(1) NOT NULL,
  `cargarexcelmedidor` tinyint(1) NOT NULL,
  `verinfexcelmedidor` tinyint(1) NOT NULL,
  `verinfcorreo` tinyint(1) NOT NULL,
  PRIMARY KEY (`idpermiso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `csocio`, `rsocio`, `usocio`, `dsocio`, `cmedidor`, `rmedidor`, `umedidor`, `dmedidor`, `cci`, `rci`, `uci`, `dci`, `crol`, `rrol`, `urol`, `drol`, `cusuario`, `rusuario`, `uusuario`, `dusuario`, `enviarcorreo`, `cargarexcelmedidor`, `verinfexcelmedidor`, `verinfcorreo`) VALUES
(8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombre`, `idpermisos`) VALUES
(11, 'roota', 8),
(14, 'pedros', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubro`
--

CREATE TABLE IF NOT EXISTS `rubro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `rubro`
--

INSERT INTO `rubro` (`id`, `descripcion`) VALUES
(18, 'N/A'),
(19, 'picadora');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE IF NOT EXISTS `servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idempresarecibe` int(11) NOT NULL,
  `idempresaofrece` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id`, `idempresarecibe`, `idempresaofrece`) VALUES
(26, 13867, 13856),
(27, 13867, 13868);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `telefonoempresa`
--

INSERT INTO `telefonoempresa` (`id`, `idempresa`, `telefono`, `descripcion`) VALUES
(15, 13856, '23', ''),
(26, 13867, '23', ''),
(27, 13868, '23', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `username`, `password`, `activo`, `correo`, `idrol`) VALUES
(5, 'Camara', 'Economica', 'CE', '16072015', 1, 'administracion@camaratsas.com', 11),
(6, 'Nelson', 'Garrido', 'neg90', 'kapanga', 0, 'neg90@hotmail.com', 14);

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
