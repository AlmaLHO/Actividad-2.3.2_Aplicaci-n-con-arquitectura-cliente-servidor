-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-05-2022 a las 04:25:10
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dulceaventura`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bajas_inventario`
--

CREATE TABLE `bajas_inventario` (
  `rowid` int(11) NOT NULL,
  `codigo_producto` text NOT NULL,
  `nombre_producto` text NOT NULL,
  `numero_piezas` decimal(11,2) NOT NULL,
  `razon_baja` text NOT NULL,
  `usuario` tinytext NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `rowid` int(11) NOT NULL,
  `caja_chica` decimal(11,2) UNSIGNED NOT NULL,
  `ventas` decimal(11,2) NOT NULL,
  `gastos` decimal(11,2) NOT NULL,
  `fecha` datetime NOT NULL,
  `no_venta` text NOT NULL,
  `usuario` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`rowid`, `caja_chica`, `ventas`, `gastos`, `fecha`, `no_venta`, `usuario`) VALUES
(4, '0.00', '146.00', '0.00', '2022-05-14 02:46:34', '1', 'usuarioadm01'),
(5, '1000.00', '0.00', '0.00', '2022-05-14 02:49:17', 'null', 'usuarioadm01'),
(6, '0.00', '0.00', '200.00', '2022-05-14 02:49:55', 'null', 'usuarioadm01'),
(7, '0.00', '140.00', '0.00', '2022-05-14 03:00:46', '2', 'usuarioemp01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_empresa`
--

CREATE TABLE `datos_empresa` (
  `rowid` int(11) NOT NULL,
  `nombre` tinytext NOT NULL,
  `telefono` tinytext NOT NULL,
  `rfc` text DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `colonia` text DEFAULT NULL,
  `codigo_postal` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `rowid` int(11) NOT NULL,
  `importe` decimal(11,2) UNSIGNED NOT NULL,
  `concepto` text NOT NULL,
  `descripcion` text NOT NULL,
  `numero_remision` text DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `usuario` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`rowid`, `importe`, `concepto`, `descripcion`, `numero_remision`, `fecha`, `usuario`) VALUES
(1, '200.00', 'viatico', 'pago de gasolina', '0001', '2022-05-14 02:49:55', 'usuarioadm01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `rowid` int(11) NOT NULL,
  `codigo` text NOT NULL,
  `nombre` text NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `utilidad` decimal(11,2) NOT NULL,
  `existencia` decimal(11,2) NOT NULL,
  `stock` decimal(11,2) NOT NULL,
  `familia` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`rowid`, `codigo`, `nombre`, `precio_compra`, `precio_venta`, `utilidad`, `existencia`, `stock`, `familia`) VALUES
(4, '0009', 'BONOBONO', '24.00', '28.00', '4.00', '54.00', '25.00', 'RICOLINO'),
(5, '0010', 'CHOCOLATE', '50.00', '70.00', '20.00', '11.00', '15.00', 'FERRERO'),
(6, '0011', 'PALETAPAYASO', '28.00', '30.00', '2.00', '27.00', '10.00', 'RICOLINO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `rowid` int(11) NOT NULL,
  `nombre` tinytext NOT NULL,
  `palabra_secreta` tinytext NOT NULL,
  `administrador` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`rowid`, `nombre`, `palabra_secreta`, `administrador`) VALUES
(1, 'usuarioadm01', '$2y$10$oAdnaAGkoy9n/dyR0Y4ZseoL4BzR8fdXrlMrxlrpGliGO14pWEb/e', b'1'),
(2, 'usuariotun', '$2y$10$G5EjYiZ1l9S0t0kjUnR5RerpbGI2FYFBFUSThRuX50G/8s6VoQnna', b'1'),
(3, 'usuarioemp01', '$2y$10$gBsqDqhVKW47LTtqo4DY8O09eUVy6Tdv92S9otLBKAVBvBjRuEoMO', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `numero_venta` int(11) NOT NULL,
  `codigo_producto` text NOT NULL,
  `nombre_producto` text NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `fecha` datetime NOT NULL,
  `numero_productos` decimal(11,2) NOT NULL,
  `usuario` tinytext NOT NULL,
  `familia` tinytext NOT NULL,
  `utilidad` decimal(8,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`numero_venta`, `codigo_producto`, `nombre_producto`, `total`, `fecha`, `numero_productos`, `usuario`, `familia`, `utilidad`) VALUES
(1, '0009', 'BONOBONO', '56.00', '2022-05-14 02:46:32', '2.00', 'usuarioadm01', 'RICOLINO', '8.00'),
(1, '0011', 'PALETAPAYASO', '90.00', '2022-05-14 02:46:34', '3.00', 'usuarioadm01', 'RICOLINO', '6.00'),
(2, '0009', 'BONOBONO', '140.00', '2022-05-14 03:00:46', '5.00', 'usuarioemp01', 'RICOLINO', '20.00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bajas_inventario`
--
ALTER TABLE `bajas_inventario`
  ADD PRIMARY KEY (`rowid`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`rowid`);

--
-- Indices de la tabla `datos_empresa`
--
ALTER TABLE `datos_empresa`
  ADD PRIMARY KEY (`rowid`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`rowid`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`rowid`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`rowid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bajas_inventario`
--
ALTER TABLE `bajas_inventario`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `datos_empresa`
--
ALTER TABLE `datos_empresa`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
