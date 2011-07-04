-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 03-07-2011 a las 22:05:14
-- Versión del servidor: 5.1.54
-- Versión de PHP: 5.3.5-1ubuntu7.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `babydcc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancha`
--

CREATE TABLE IF NOT EXISTS `cancha` (
  `idCancha` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(200) CHARACTER SET ucs2 COLLATE ucs2_spanish_ci DEFAULT NULL,
  `contacto` varchar(100) CHARACTER SET ucs2 COLLATE ucs2_spanish_ci DEFAULT NULL,
  `fono` int(11) DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`idCancha`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_partido`
--

CREATE TABLE IF NOT EXISTS `datos_partido` (
  `idPartido` int(11) NOT NULL,
  `num_papeleta` int(4) DEFAULT NULL,
  `confirma_loc` tinyint(4) DEFAULT NULL,
  `confirma_vis` tinyint(4) DEFAULT NULL,
  `elmascapo` int(11) DEFAULT NULL,
  `fecha_numero` int(3) DEFAULT NULL,
  `arbitro1` int(11) DEFAULT NULL,
  `arbitro2` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPartido`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE IF NOT EXISTS `equipo` (
  `idEquipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `color_pri` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `color_sec` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `capitan` int(11) NOT NULL,
  `logo_name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pago_cuota` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idEquipo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE IF NOT EXISTS `jugador` (
  `idJugador` int(11) NOT NULL AUTO_INCREMENT,
  `RUT` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `email` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(11) NOT NULL,
  `apodo` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `departamento` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `avatar_name` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `avatar_width` int(11) NOT NULL,
  `avatar_height` int(11) NOT NULL,
  `equipo` int(40) NOT NULL,
  `condicion` int(1) NOT NULL COMMENT '0:pregrado;1:postgrado;2:academico;3:funcionario;4:exalumno;5:galleta;6:arbitro_ext;7:otro',
  PRIMARY KEY (`idJugador`),
  UNIQUE KEY `RUT` (`RUT`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador_en_partido`
--

CREATE TABLE IF NOT EXISTS `jugador_en_partido` (
  `idJugador` int(11) NOT NULL,
  `idPartido` int(11) NOT NULL,
  `goles` int(11) NOT NULL,
  `tarj_am` int(11) NOT NULL,
  `tarj_roj` int(11) NOT NULL,
  PRIMARY KEY (`idJugador`,`idPartido`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

CREATE TABLE IF NOT EXISTS `partido` (
  `idPartido` int(11) NOT NULL AUTO_INCREMENT,
  `local` int(40) DEFAULT NULL,
  `visita` int(40) DEFAULT NULL,
  `fecha_dia` date DEFAULT NULL,
  `cancha` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPartido`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario` int(11) NOT NULL,
  `contrasena` varchar(50) CHARACTER SET latin1 NOT NULL,
  `permisos` int(11) NOT NULL,
  `idJugador` int(11) NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
