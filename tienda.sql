-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2021 a las 06:07:42
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `idArticulo` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Descripcion` text NOT NULL,
  `Marca` varchar(100) NOT NULL,
  `Precio` float NOT NULL,
  `Unidad` varchar(100) NOT NULL,
  `Existencias` int(11) NOT NULL,
  `Imagen` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritocompras`
--

CREATE TABLE `carritocompras` (
  `idCarritoCompra` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idArticulo` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`idDepartamento`, `nombre`, `descripcion`) VALUES
(1, 'Almacen', 'Aquellas personas que tienen privilegios de usos dentro de las funciones respectivas la departamento de almacén.'),
(2, 'Ventas', 'Departamento correspondiente a los puntos de venta.'),
(3, 'Administración', 'Departamento correspondiente a los administradores del sistema web.'),
(4, 'Clientes', 'Departamento que indica que el usuario con dicha dupla es un cliente de la tienda web.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `idDetallePedido` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `idArticulo` int(11) NOT NULL,
  `idFormaPago` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formaspago`
--

CREATE TABLE `formaspago` (
  `idFormasPago` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nCuenta` varchar(255) NOT NULL,
  `fechaVencimiento` datetime NOT NULL,
  `opcionPago` varchar(255) NOT NULL COMMENT 'Mastecard, Visa o Paypal',
  `CVV` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idDetallePedido` int(11) NOT NULL,
  `fechaPedido` datetime NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idTipoUsuario`, `descripcion`) VALUES
(1, 'Cliente'),
(2, 'Empleado'),
(3, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `idTipoUsuario` int(11) NOT NULL,
  `idDepartamento` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `genero` char(1) NOT NULL,
  `domicilio` text NOT NULL COMMENT 'calle, numero, colonia, ciudad, cp, email y telefono',
  `rfc` varchar(100) NOT NULL,
  `puesto` varchar(100) NOT NULL,
  `salario` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `idTipoUsuario`, `idDepartamento`, `email`, `contrasena`, `nombre`, `apellidos`, `genero`, `domicilio`, `rfc`, `puesto`, `salario`) VALUES
(1, 2, 1, 'isaias@gmail.com', 'isaias', 'Isaias', 'Flores Magaña', 'M', 'Calle 501, Michoacán #12 Fracc. Lomas', 'AFGHTYUFG55J', 'Jefe almacén', 23000),
(2, 2, 1, 'carlos@gmail.com', 'carlos', 'Carlos', 'Torres Romero', 'M', 'Calle 992 Villas de victoria, Av principal #12 Fracc. Lomas verde', 'ADJFHEYCHR66', 'Almacenista', 5600),
(3, 2, 1, 'july56@gmail.com', 'july56', 'Julieta', 'Flores Calva', 'F', 'GUERRERO NO. 1758, LAS REYNAS, 36660', 'JULY5698GHT', 'Almacenista', 6300),
(4, 1, 4, 'isaaccore@gmail.com', 'isaaccore', 'Isaac', 'Arenas Prado', 'M', 'AV. JUAREZ SUR NO. 304 S/N, TULANCINGO CENTRO, 43600', 'ISSAC5698GHT', '', 0),
(5, 1, 4, 'hector25@gmail.com', 'hector25', 'Héctor ', 'Medel Negrete', 'M', 'AV. GUADALUPE S/N6005 M2', 'HECEJ6797', '', 0),
(6, 3, 3, 'gigi56@gmail.com', 'gigi56', 'Mariana', 'Prado Flores', 'F', 'AV. GUADALUPE S/N68963 M2 Zona 3', 'ASWOCJ6797', 'Administrador auxiliar', 4820);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`idArticulo`),
  ADD KEY `llaveCategoria` (`idCategoria`);

--
-- Indices de la tabla `carritocompras`
--
ALTER TABLE `carritocompras`
  ADD PRIMARY KEY (`idCarritoCompra`),
  ADD KEY `llaveUsuario` (`idUsuario`),
  ADD KEY `llaveArt` (`idArticulo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`idDepartamento`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`idDetallePedido`),
  ADD KEY `llavePedido` (`idPedido`),
  ADD KEY `keyArticulo` (`idArticulo`),
  ADD KEY `llaFormaPago` (`idFormaPago`);

--
-- Indices de la tabla `formaspago`
--
ALTER TABLE `formaspago`
  ADD PRIMARY KEY (`idFormasPago`),
  ADD KEY `llaU` (`idUsuario`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `llaveUser` (`idUsuario`),
  ADD KEY `llaveDetalle` (`idDetallePedido`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idTipoUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `llaveTipuser` (`idTipoUsuario`),
  ADD KEY `llaveDepar` (`idDepartamento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `llaveCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`);

--
-- Filtros para la tabla `carritocompras`
--
ALTER TABLE `carritocompras`
  ADD CONSTRAINT `carritocompras_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `llaveArt` FOREIGN KEY (`idArticulo`) REFERENCES `articulo` (`idArticulo`);

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `keyArticulo` FOREIGN KEY (`idArticulo`) REFERENCES `articulo` (`idArticulo`),
  ADD CONSTRAINT `llaFormaPago` FOREIGN KEY (`idFormaPago`) REFERENCES `formaspago` (`idFormasPago`),
  ADD CONSTRAINT `llavePedido` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`);

--
-- Filtros para la tabla `formaspago`
--
ALTER TABLE `formaspago`
  ADD CONSTRAINT `formaspago_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `llaveDetalle` FOREIGN KEY (`idDetallePedido`) REFERENCES `detallepedido` (`idDetallePedido`),
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `llaveDepar` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`idDepartamento`),
  ADD CONSTRAINT `llaveTipuser` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
