-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2024 a las 17:21:31
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `farmacias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancarios`
--

CREATE TABLE `bancarios` (
  `Id` int(11) NOT NULL,
  `Cuenta_Bancaria` text NOT NULL,
  `Banco` text NOT NULL,
  `Titular_Cuenta` text NOT NULL,
  `Id_Farmacia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bancarios`
--

INSERT INTO `bancarios` (`Id`, `Cuenta_Bancaria`, `Banco`, `Titular_Cuenta`, `Id_Farmacia`) VALUES
(1, '11556545987', 'BBVA', 'Diego Hernandez', 5),
(2, '21556756778', 'BBVA', 'Miguel Garcia', 3),
(3, '3148976543219856000', 'Santander', 'Mariana Santiago', 7),
(4, '42976543219856000', 'Banamex', 'Agustin Chavez', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `farmacia`
--

CREATE TABLE `farmacia` (
  `Id` int(11) NOT NULL,
  `Nombre` text NOT NULL,
  `Direccion` text NOT NULL,
  `Telefono` text NOT NULL,
  `NombreEncargado` text NOT NULL,
  `Correo` text NOT NULL,
  `TransferBancaria` tinyint(1) NOT NULL,
  `ServicioDomicilio` tinyint(1) NOT NULL,
  `CostoServDomicilio` tinyint(1) NOT NULL,
  `Latitude` text NOT NULL,
  `Longitude` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `farmacia`
--

INSERT INTO `farmacia` (`Id`, `Nombre`, `Direccion`, `Telefono`, `NombreEncargado`, `Correo`, `TransferBancaria`, `ServicioDomicilio`, `CostoServDomicilio`, `Latitude`, `Longitude`) VALUES
(1, 'Farmacia Emanuel', 'Mar de las Crisis 4, Amp. Selene, Tláhuac, 13420 Ciudad de México, CDMX', '5689664216', 'Emmanuel', 'Emmanuel@gmail.com', 0, 0, 0, '19.28780475479433', '-98.99106777594076'),
(2, 'Farmcia Roma', 'Av Estanislao Ramírez Ruiz, Selene 1ra Secc, Tláhuac, 13430 Ciudad de México, CDMX', '5534907678', 'Agustin Chavez', 'roma@gmail.com', 1, 1, 0, '19.29232710662682', '-98.99865560462902'),
(3, 'Farmacia Güero', 'Av Estanislao Ramírez Ruiz 19, Selene 2da Secc, Tláhuac, 13420 Ciudad de México, CDMX', '5566778901', 'Miguel Garcia', 'miguel-velaz@hotmail.com', 1, 1, 35, '19.285345117981137', '-98.99957007570029'),
(4, 'Farmacia Lupita', 'Av Estanislao Ramírez Ruiz 146, Amp. Selene, Tláhuac, 13430 Ciudad de México, CDMX', '5633777918', 'Guadalupe', 'Lupe@hotmail.com', 0, 1, 35, '19.286095139354106', '-98.99922254965135'),
(5, 'Farmacia Selene', 'Oceano de las Tempestades Mz59 Lt11, Selene 2da Secc, Tláhuac, 13420 Ciudad de México, CDMX', '5526944073', 'Diego Hernandez', 'selene@gmail.com', 1, 1, 0, '19.28881256046', '-99.00503583337233'),
(6, 'Farmacia Susy', 'Oceano de las Tempestades 10, Selene 1ra Secc, Tláhuac, 13420 Ciudad de México, CDMX', '5643221901', 'Susy', 'susy@gmail.com', 0, 0, 0, '19.28877205414425', '-99.00501437570024'),
(7, 'Farmacia Hidalgo', 'Oceano de las Tempestades, Selene 1ra Secc, Tláhuac, 13420 Ciudad de México, CDMX', '5644128863', 'Mariana Santiago', 'hidalgo@gmail.com', 1, 1, 30, '19.2886569606334', '-99.00410560453633');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicinas`
--

CREATE TABLE `medicinas` (
  `Id` int(11) NOT NULL,
  `Id_Farmacia` int(11) NOT NULL,
  `Existencias` int(11) NOT NULL,
  `Precio` int(11) NOT NULL,
  `Nombre` text NOT NULL,
  `Descripcion` text NOT NULL,
  `Tipo` text NOT NULL,
  `Receta` tinyint(1) NOT NULL,
  `Compuestos` text NOT NULL,
  `Id_image` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medicinas`
--

INSERT INTO `medicinas` (`Id`, `Id_Farmacia`, `Existencias`, `Precio`, `Nombre`, `Descripcion`, `Tipo`, `Receta`, `Compuestos`, `Id_image`) VALUES
(1, 1, 6, 72, 'Omeprazol', 'Tableta 20 mg x 30', 'Antiacido', 0, 'omeprazol,hidróxido de aluminio', 1),
(2, 1, 9, 220, 'Riopan', 'Sobres 10ml x 20', 'Antiacido', 0, 'hidróxido de aluminio y magnesio', 2),
(3, 1, 3, 40, 'Tums', 'Tabletas x48', 'Antiacido', 0, 'carbonato de calcio', 3),
(4, 1, 18, 210, 'Galaver', 'Sobres 10ml x 20', 'Antiacido', 0, 'Magaldrato + dimeticona', 4),
(5, 1, 16, 350, 'Velmetia', 'Tableta 500mg x 28', 'biguanidas', 1, 'Metformina,Sitagliptina', 5),
(6, 1, 9, 370, 'Novorapid', 'Inyeccion 100ml x 1', 'biguanidas', 1, 'Insulina', 6),
(7, 1, 6, 120, 'Losartán', 'tableta 50 mg x 30', 'antagonistas del receptor de la angiotensina II', 1, 'Losartán', 7),
(9, 1, 11, 180, 'Motrin', 'gragea 600 mgx 20', 'analgésico', 0, 'Ibuprofeno', 9),
(10, 1, 12, 75, 'Onemer SL', 'tableta 10 mg x 10', 'analgésico', 0, 'ketorolaco', 10),
(11, 1, 19, 80, 'Alliviax', 'tableta 550mg x 10', 'analgésico', 0, 'NaproxenoSodico', 11),
(12, 1, 10, 40, 'Aspirina', 'tableta 500mg x 20', 'analgésico', 0, 'Acido acetilsalicilico', 12),
(13, 1, 2, 221, 'Iprikene', 'polvo 3mg x 10', 'antidiarreico', 0, 'Diosmectita', 13),
(14, 1, 5, 150, 'Terramicina', 'pastilla 125 mg x 24', 'antidiarreico', 0, 'Clorhidrato de oxitetraciclina', 14),
(15, 1, 12, 190, 'Lomotil', 'Tableta 2mg x 10', 'antidiarreico', 0, 'Clorhidrato de loperamida', 15),
(16, 1, 8, 190, 'Pepto Bismol', 'Suspension 236 ml', 'antidiarreico', 0, 'Subsalicilato de Bismuto', 16),
(17, 1, 20, 177, 'Bisolvon', 'jarabe 120 ml', 'Antitusígenos', 0, 'Bromhexina', 17),
(18, 1, 7, 133, 'Panatos', 'jarabe 100 ml', 'Antitusígenos', 0, 'Hedera helix', 18),
(19, 1, 3, 114, 'Histiacil', 'jarabe 140 ml', 'Antitusígenos', 0, 'Oxolamina', 19),
(20, 1, 9, 119, 'Mucosolvan', 'jarabe 600 ml', 'Antitusígenos', 0, 'Ambroxol', 20),
(21, 1, 15, 324, 'Amoxiclav', 'Tableta 500 mg x 15', 'Antibióticos', 1, 'Amoxicilina, Acido Clavulanico', 21),
(22, 1, 20, 324, 'Ciproxina', 'Tableta 500 mg x 14', 'Antibióticos', 1, 'Ciprofloxacino', 22),
(23, 1, 19, 456, 'Macrozit', 'Tableta 500mg x 5', 'Antibióticos', 1, 'Azitromicina', 23),
(24, 1, 4, 470, 'Bactrim', 'Tableta 400mg x 30', 'Antibióticos', 1, 'Sulfametoxazol', 24),
(25, 1, 4, 280, 'Cefaxona', 'Inyeccion 500 mg x 1', 'Antibióticos', 1, 'Ceftriaxona', 25),
(26, 1, 20, 98, 'Celestoderm', 'Crema 1mg x 1', 'Antibióticos', 1, 'Gentamicina', 26),
(27, 1, 5, 42, 'Rosel-T', 'Tableta 300mg x 15', 'Antigripal', 0, 'Paracetamol ,clorfenamina', 27),
(28, 1, 11, 34, 'Agrifen', 'Tableta 500 mg x 10', 'Antigripal', 0, 'Paracetamol,Clorhidrato De Fenilefrina', 28),
(29, 1, 16, 60, 'Tabcin', 'Tableta 500 mg x 12', 'Antigripal', 0, 'Ácido acetilsalicílico', 29),
(30, 1, 13, 150, 'Tempra', 'Jarabe 120 ml', 'Antigripal', 0, 'Paracetamol', 8),
(31, 1, 2, 78, 'next', 'Tableta 500 mg x 20', 'Antigripal', 0, 'Paracetamol,Fenilefrina', 31),
(32, 1, 16, 94, 'PostDay', '1 comprimido', 'Anticonceptivo', 0, 'Levonorgestrel', 32),
(33, 1, 1, 79, 'Sildenafil (Viagra)', 'Tabletas 50 mg x 4', 'inhibidores de la fosfodiesterasa', 0, 'Sildenafil', 33),
(34, 1, 10, 151, 'Buscapina', 'Tableta 20 mg x 10', 'antiespasmódico ', 0, 'Butilhioscina,Ibuprofeno', 34),
(35, 1, 3, 46, 'Dexametasona', 'Tablet 6 mg x 10', 'antinflamatorio', 0, 'corticosteroide', 35),
(36, 1, 19, 28, 'Diclofenaco', 'Tablet 100 mg x 10', 'antinflamatorio', 0, 'Diclofenaco', 36),
(37, 1, 17, 156, 'Tribedoce', 'Tabletas 100ml x 30', 'Multivitaminico', 0, 'ComplejoB,Diclofenaco', 37),
(38, 1, 18, 324, 'Bedoyecta', 'Capsulas x 30', 'Multivitaminico', 0, 'Vitamina b1 tiamina, Clorhidrato de piridoxina', 38),
(39, 1, 2, 158, 'Centrum', 'Tabletas 100ml x 30', 'Multivitaminico', 0, 'Vitamina a, Vitamina e, Beta caroteno', 39),
(40, 1, 12, 208, 'Canesten V', 'crema 1mg x 1 + 1 ovulo', 'Infecciones Vaginales', 0, 'Clotrimazol', 40),
(41, 1, 19, 170, 'Lomecan V', 'crema 1ml x1 + 1 ovulo', 'Infecciones Vaginales', 0, 'Clotrimazol', 41),
(42, 1, 18, 90, 'Tenescan V', 'crema 2ml x 1', 'Infecciones Vaginales', 0, 'Clotrimazol', 42),
(43, 1, 18, 210, 'Clindamicina', 'Tableta 300 ml x 16', 'Infecciones Vaginales', 0, 'Clindamicina', 43),
(44, 1, 19, 49, 'Barmicil', 'Crema 40 mg x 1', 'reconstituyente y regenerador epitelial', 0, 'Clotrimazol, Gentamicina,Betametazona', 0),
(45, 1, 13, 48, 'Vitacilina', 'Crema 16 mg x 1', 'reconstituyente y regenerador epitelial', 0, 'neomizina', 0),
(46, 1, 1, 130, 'Bephanten', 'Crema 16 mg x 2', 'Cuidado de piel', 0, 'Dexpantenol', 0),
(47, 1, 13, 270, 'Nesajar', 'Capsula 100mg x 16', 'Antiespasmodico', 0, 'Dimeticona, Bromuro de Pinaverio', 0),
(48, 1, 1, 350, 'NyQuilZ', 'Capsula 25 mg x 30', 'Insomnio', 0, 'Clorhidrato de difenhidramina', 0),
(49, 1, 15, 190, 'Caltrate', 'Tableta 300mg x 30', 'Calcificante', 0, 'Carbonato de calcio, Colecalciferol, Vitamina d3', 0),
(50, 1, 18, 210, 'Syncol', 'Tableta 300 mg x 30', 'antiespasmódico ', 0, 'Naproxeno Sódico, Paracetamol', 0),
(51, 1, 2, 130, 'Analgen+B40:B55', 'Tableta 220 mg x 12', 'antiespasmódico ', 0, 'Naproxeno Sódico, Paracetamol, Pamabrom', 0),
(52, 2, 11, 55, 'Omeprazol', 'Tableta 20 mg x 30', 'Antiacido', 0, 'omeprazol,hidróxido de aluminio', 1),
(53, 2, 14, 210, 'Riopan', 'Sobres 10ml x 20', 'Antiacido', 0, 'hidróxido de aluminio y magnesio', 2),
(54, 2, 16, 45, 'Tums', 'Tabletas x48', 'Antiacido', 0, 'carbonato de calcio', 3),
(55, 2, 17, 106, 'Galaver', 'Sobres 10ml x 20', 'Antiacido', 0, 'Magaldrato + dimeticona', 4),
(56, 2, 3, 430, 'Velmetia', 'Tableta 500mg x 28', 'biguanidas', 1, 'Metformina,Sitagliptina', 5),
(57, 2, 10, 410, 'Novorapid', 'Inyeccion 100ml x 1', 'biguanidas', 1, 'Insulina', 6),
(58, 2, 17, 140, 'Losartán', 'tableta 50 mg x 30', 'antagonistas del receptor de la angiotensina II', 1, 'Losartán', 7),
(60, 2, 8, 180, 'Motrin', 'gragea 600 mgx 20', 'analgésico', 0, 'Ibuprofeno', 9),
(61, 2, 3, 90, 'Onemer SL', 'tableta 10 mg x 10', 'analgésico', 0, 'ketorolaco', 10),
(62, 2, 10, 90, 'Alliviax', 'tableta 550mg x 10', 'analgésico', 0, 'NaproxenoSodico', 11),
(63, 2, 6, 35, 'Aspirina', 'tableta 500mg x 20', 'analgésico', 0, 'Acido acetilsalicilico', 12),
(64, 2, 15, 230, 'Iprikene', 'polvo 3mg x 10', 'antidiarreico', 0, 'Diosmectita', 13),
(65, 2, 6, 157, 'Terramicina', 'pastilla 125 mg x 24', 'antidiarreico', 0, 'Clorhidrato de oxitetraciclina', 14),
(66, 2, 8, 207, 'Lomotil', 'Tableta 2mg x 10', 'antidiarreico', 0, 'Clorhidrato de loperamida', 15),
(67, 2, 9, 180, 'Pepto Bismol', 'Suspension 236 ml', 'antidiarreico', 0, 'Subsalicilato de Bismuto', 16),
(68, 2, 14, 172, 'Bisolvon', 'jarabe 120 ml', 'Antitusígenos', 0, 'Bromhexina', 17),
(69, 2, 6, 190, 'Panatos', 'jarabe 100 ml', 'Antitusígenos', 0, 'Hedera helix', 18),
(70, 2, 9, 140, 'Histiacil', 'jarabe 140 ml', 'Antitusígenos', 0, 'Oxolamina', 19),
(71, 2, 4, 100, 'Mucosolvan', 'jarabe 600 ml', 'Antitusígenos', 0, 'Ambroxol', 20),
(72, 2, 13, 350, 'Amoxiclav', 'Tableta 500 mg x 15', 'Antibióticos', 1, 'Amoxicilina, Acido Clavulanico', 21),
(73, 2, 1, 390, 'Ciproxina', 'Tableta 500 mg x 14', 'Antibióticos', 1, 'Ciprofloxacino', 22),
(74, 2, 1, 420, 'Macrozit', 'Tableta 500mg x 5', 'Antibióticos', 1, 'Azitromicina', 23),
(75, 2, 3, 190, 'Bactrim', 'Tableta 400mg x 30', 'Antibióticos', 1, 'Sulfametoxazol', 24),
(76, 2, 2, 180, 'Cefaxona', 'Inyeccion 500 mg x 1', 'Antibióticos', 1, 'Ceftriaxona', 25),
(77, 2, 5, 75, 'Celestoderm', 'Crema 1mg x 1', 'Antibióticos', 1, 'Gentamicina', 26),
(78, 2, 17, 55, 'Rosel-T', 'Tableta 300mg x 15', 'Antigripal', 0, 'Paracetamol ,clorfenamina', 27),
(79, 2, 7, 45, 'Agrifen', 'Tableta 500 mg x 10', 'Antigripal', 0, 'Paracetamol,Clorhidrato De Fenilefrina', 28),
(80, 2, 1, 50, 'Tabcin', 'Tableta 500 mg x 12', 'Antigripal', 0, 'Ácido acetilsalicílico', 29),
(81, 2, 11, 130, 'Tempra', 'Jarabe 120 ml', 'Antigripal', 0, 'Paracetamol', 8),
(82, 2, 19, 80, 'next', 'Tableta 500 mg x 20', 'Antigripal', 0, 'Paracetamol,Fenilefrina', 31),
(83, 2, 7, 50, 'PostDay', '1 comprimido', 'Anticonceptivo', 0, 'Levonorgestrel', 32),
(84, 2, 17, 60, 'Sildenafil (Viagra)', 'Tabletas 50 mg x 4', 'inhibidores de la fosfodiesterasa', 0, 'Sildenafil', 33),
(85, 2, 20, 120, 'Buscapina', 'Tableta 20 mg x 10', 'antiespasmódico ', 0, 'Butilhioscina,Ibuprofeno', 34),
(86, 2, 4, 40, 'Dexametasona', 'Tablet 6 mg x 10', 'antinflamatorio', 0, 'corticosteroide', 35),
(87, 2, 19, 35, 'Diclofenaco', 'Tablet 100 mg x 10', 'antinflamatorio', 0, 'Diclofenaco', 36),
(88, 2, 19, 120, 'Tribedoce', 'Tabletas 100ml x 30', 'Multivitaminico', 0, 'ComplejoB,Diclofenaco', 37),
(89, 2, 4, 321, 'Bedoyecta', 'Capsulas x 30', 'Multivitaminico', 0, 'Vitamina b1 tiamina, Clorhidrato de piridoxina', 38),
(90, 2, 16, 140, 'Centrum', 'Tabletas 100ml x 30', 'Multivitaminico', 0, 'Vitamina a, Vitamina e, Beta caroteno', 39),
(91, 2, 1, 188, 'Canesten V', 'crema 1mg x 1 + 1 ovulo', 'Infecciones Vaginales', 0, 'Clotrimazol', 40),
(92, 2, 2, 133, 'Lomecan V', 'crema 1ml x1 + 1 ovulo', 'Infecciones Vaginales', 0, 'Clotrimazol', 41),
(93, 2, 2, 80, 'Tenescan V', 'crema 2ml x 1', 'Infecciones Vaginales', 0, 'Clotrimazol', 42),
(94, 2, 9, 166, 'Clindamicina', 'Tableta 300 ml x 16', 'Infecciones Vaginales', 0, 'Clindamicina', 43),
(95, 2, 17, 45, 'Barmicil', 'Crema 40 mg x 1', 'reconstituyente y regenerador epitelial', 0, 'Clotrimazol, Gentamicina,Betametazona', 0),
(96, 2, 10, 55, 'Vitacilina', 'Crema 16 mg x 1', 'reconstituyente y regenerador epitelial', 0, 'neomizina', 0),
(97, 2, 13, 180, 'Bephanten', 'Crema 16 mg x 2', 'Cuidado de piel', 0, 'Dexpantenol', 0),
(98, 2, 5, 190, 'Nesajar', 'Capsula 100mg x 16', 'Antiespasmodico', 0, 'Dimeticona, Bromuro de Pinaverio', 0),
(99, 2, 13, 245, 'NyQuilZ', 'Capsula 25 mg x 30', 'Insomnio', 0, 'Clorhidrato de difenhidramina', 0),
(100, 2, 11, 143, 'Caltrate', 'Tableta 300mg x 30', 'Calcificante', 0, 'Carbonato de calcio, Colecalciferol, Vitamina d3', 0),
(101, 2, 14, 115, 'Syncol', 'Tableta 300 mg x 30', 'antiespasmódico ', 0, 'Naproxeno Sódico, Paracetamol', 0),
(102, 2, 17, 85, 'Analgen+B40:B55', 'Tableta 220 mg x 12', 'antiespasmódico ', 0, 'Naproxeno Sódico, Paracetamol, Pamabrom', 0),
(103, 3, 15, 68, 'Omeprazol', 'Tableta 20 mg x 30', 'Antiacido', 0, 'omeprazol,hidróxido de aluminio', 1),
(104, 3, 2, 240, 'Riopan', 'Sobres 10ml x 20', 'Antiacido', 0, 'hidróxido de aluminio y magnesio', 2),
(105, 3, 9, 66, 'Tums', 'Tabletas x48', 'Antiacido', 0, 'carbonato de calcio', 3),
(106, 3, 15, 122, 'Galaver', 'Sobres 10ml x 20', 'Antiacido', 0, 'Magaldrato + dimeticona', 4),
(107, 3, 15, 590, 'Velmetia', 'Tableta 500mg x 28', 'biguanidas', 1, 'Metformina,Sitagliptina', 5),
(108, 3, 19, 437, 'Novorapid', 'Inyeccion 100ml x 1', 'biguanidas', 1, 'Insulina', 6),
(109, 3, 20, 169, 'Losartán', 'tableta 50 mg x 30', 'antagonistas del receptor de la angiotensina II', 1, 'Losartán', 7),
(111, 3, 9, 210, 'Motrin', 'gragea 600 mgx 20', 'analgésico', 0, 'Ibuprofeno', 9),
(112, 3, 18, 106, 'Onemer SL', 'tableta 10 mg x 10', 'analgésico', 0, 'ketorolaco', 10),
(113, 3, 17, 101, 'Alliviax', 'tableta 550mg x 10', 'analgésico', 0, 'NaproxenoSodico', 11),
(114, 3, 2, 28, 'Aspirina', 'tableta 500mg x 20', 'analgésico', 0, 'Acido acetilsalicilico', 12),
(115, 3, 7, 261, 'Iprikene', 'polvo 3mg x 10', 'antidiarreico', 0, 'Diosmectita', 13),
(116, 3, 15, 189, 'Terramicina', 'pastilla 125 mg x 24', 'antidiarreico', 0, 'Clorhidrato de oxitetraciclina', 14),
(117, 3, 3, 216, 'Lomotil', 'Tableta 2mg x 10', 'antidiarreico', 0, 'Clorhidrato de loperamida', 15),
(118, 3, 1, 205, 'Pepto Bismol', 'Suspension 236 ml', 'antidiarreico', 0, 'Subsalicilato de Bismuto', 16),
(119, 3, 5, 187, 'Bisolvon', 'jarabe 120 ml', 'Antitusígenos', 0, 'Bromhexina', 17),
(120, 3, 10, 253, 'Panatos', 'jarabe 100 ml', 'Antitusígenos', 0, 'Hedera helix', 18),
(121, 3, 10, 194, 'Histiacil', 'jarabe 140 ml', 'Antitusígenos', 0, 'Oxolamina', 19),
(122, 3, 4, 129, 'Mucosolvan', 'jarabe 600 ml', 'Antitusígenos', 0, 'Ambroxol', 20),
(123, 3, 13, 384, 'Amoxiclav', 'Tableta 500 mg x 15', 'Antibióticos', 1, 'Amoxicilina, Acido Clavulanico', 21),
(124, 3, 20, 440, 'Ciproxina', 'Tableta 500 mg x 14', 'Antibióticos', 1, 'Ciprofloxacino', 22),
(125, 3, 19, 507, 'Macrozit', 'Tableta 500mg x 5', 'Antibióticos', 1, 'Azitromicina', 23),
(126, 3, 13, 260, 'Bactrim', 'Tableta 400mg x 30', 'Antibióticos', 1, 'Sulfametoxazol', 24),
(127, 3, 4, 236, 'Cefaxona', 'Inyeccion 500 mg x 1', 'Antibióticos', 1, 'Ceftriaxona', 25),
(128, 3, 14, 98, 'Celestoderm', 'Crema 1mg x 1', 'Antibióticos', 1, 'Gentamicina', 26),
(129, 3, 7, 42, 'Rosel-T', 'Tableta 300mg x 15', 'Antigripal', 0, 'Paracetamol ,clorfenamina', 27),
(130, 3, 15, 34, 'Agrifen', 'Tableta 500 mg x 10', 'Antigripal', 0, 'Paracetamol,Clorhidrato De Fenilefrina', 28),
(131, 3, 17, 60, 'Tabcin', 'Tableta 500 mg x 12', 'Antigripal', 0, 'Ácido acetilsalicílico', 29),
(132, 3, 14, 150, 'Tempra', 'Jarabe 120 ml', 'Antigripal', 0, 'Paracetamol', 8),
(133, 3, 5, 78, 'next', 'Tableta 500 mg x 20', 'Antigripal', 0, 'Paracetamol,Fenilefrina', 31),
(134, 3, 17, 94, 'PostDay', '1 comprimido', 'Anticonceptivo', 0, 'Levonorgestrel', 32),
(135, 3, 10, 79, 'Sildenafil (Viagra)', 'Tabletas 50 mg x 4', 'inhibidores de la fosfodiesterasa', 0, 'Sildenafil', 33),
(136, 3, 9, 151, 'Buscapina', 'Tableta 20 mg x 10', 'antiespasmódico ', 0, 'Butilhioscina,Ibuprofeno', 34),
(137, 3, 2, 46, 'Dexametasona', 'Tablet 6 mg x 10', 'antinflamatorio', 0, 'corticosteroide', 35),
(138, 3, 13, 28, 'Diclofenaco', 'Tablet 100 mg x 10', 'antinflamatorio', 0, 'Diclofenaco', 36),
(139, 3, 13, 156, 'Tribedoce', 'Tabletas 100ml x 30', 'Multivitaminico', 0, 'ComplejoB,Diclofenaco', 37),
(140, 3, 4, 324, 'Bedoyecta', 'Capsulas x 30', 'Multivitaminico', 0, 'Vitamina b1 tiamina, Clorhidrato de piridoxina', 38),
(141, 3, 20, 158, 'Centrum', 'Tabletas 100ml x 30', 'Multivitaminico', 0, 'Vitamina a, Vitamina e, Beta caroteno', 39),
(142, 3, 8, 208, 'Canesten V', 'crema 1mg x 1 + 1 ovulo', 'Infecciones Vaginales', 0, 'Clotrimazol', 40),
(143, 3, 17, 158, 'Lomecan V', 'crema 1ml x1 + 1 ovulo', 'Infecciones Vaginales', 0, 'Clotrimazol', 41),
(144, 3, 13, 72, 'Tenescan V', 'crema 2ml x 1', 'Infecciones Vaginales', 0, 'Clotrimazol', 42),
(145, 3, 6, 184, 'Clindamicina', 'Tableta 300 ml x 16', 'Infecciones Vaginales', 0, 'Clindamicina', 43),
(146, 3, 11, 28, 'Barmicil', 'Crema 40 mg x 1', 'reconstituyente y regenerador epitelial', 0, 'Clotrimazol, Gentamicina,Betametazona', 0),
(147, 3, 7, 34, 'Vitacilina', 'Crema 16 mg x 1', 'reconstituyente y regenerador epitelial', 0, 'neomizina', 0),
(148, 3, 3, 168, 'Bephanten', 'Crema 16 mg x 2', 'Cuidado de piel', 0, 'Dexpantenol', 0),
(149, 3, 14, 242, 'Nesajar', 'Capsula 100mg x 16', 'Antiespasmodico', 0, 'Dimeticona, Bromuro de Pinaverio', 0),
(150, 3, 9, 305, 'NyQuilZ', 'Capsula 25 mg x 30', 'Insomnio', 0, 'Clorhidrato de difenhidramina', 0),
(151, 3, 3, 174, 'Caltrate', 'Tableta 300mg x 30', 'Calcificante', 0, 'Carbonato de calcio, Colecalciferol, Vitamina d3', 0),
(152, 3, 17, 142, 'Syncol', 'Tableta 300 mg x 30', 'antiespasmódico ', 0, 'Naproxeno Sódico, Paracetamol', 0),
(153, 3, 10, 94, 'Analgen+B40:B55', 'Tableta 220 mg x 12', 'antiespasmódico ', 0, 'Naproxeno Sódico, Paracetamol, Pamabrom', 0),
(154, 4, 20, 75, 'Omeprazol', 'Tableta 20 mg x 30', 'Antiacido', 0, 'omeprazol,hidróxido de aluminio', 1),
(155, 4, 9, 235, 'Riopan', 'Sobres 10ml x 20', 'Antiacido', 0, 'hidróxido de aluminio y magnesio', 2),
(156, 4, 1, 85, 'Tums', 'Tabletas x48', 'Antiacido', 0, 'carbonato de calcio', 3),
(157, 4, 10, 105, 'Galaver', 'Sobres 10ml x 20', 'Antiacido', 0, 'Magaldrato + dimeticona', 4),
(158, 4, 11, 595, 'Velmetia', 'Tableta 500mg x 28', 'biguanidas', 1, 'Metformina,Sitagliptina', 5),
(159, 4, 11, 420, 'Novorapid', 'Inyeccion 100ml x 1', 'biguanidas', 1, 'Insulina', 6),
(160, 4, 12, 150, 'Losartán', 'tableta 50 mg x 30', 'antagonistas del receptor de la angiotensina II', 1, 'Losartán', 7),
(162, 4, 13, 255, 'Motrin', 'gragea 600 mgx 20', 'analgésico', 0, 'Ibuprofeno', 9),
(163, 4, 9, 120, 'Onemer SL', 'tableta 10 mg x 10', 'analgésico', 0, 'ketorolaco', 10),
(164, 4, 9, 135, 'Alliviax', 'tableta 550mg x 10', 'analgésico', 0, 'NaproxenoSodico', 11),
(165, 4, 13, 45, 'Aspirina', 'tableta 500mg x 20', 'analgésico', 0, 'Acido acetilsalicilico', 12),
(166, 4, 6, 280, 'Iprikene', 'polvo 3mg x 10', 'antidiarreico', 0, 'Diosmectita', 13),
(167, 4, 3, 190, 'Terramicina', 'pastilla 125 mg x 24', 'antidiarreico', 0, 'Clorhidrato de oxitetraciclina', 14),
(168, 4, 9, 230, 'Lomotil', 'Tableta 2mg x 10', 'antidiarreico', 0, 'Clorhidrato de loperamida', 15),
(169, 4, 20, 230, 'Pepto Bismol', 'Suspension 236 ml', 'antidiarreico', 0, 'Subsalicilato de Bismuto', 16),
(170, 4, 12, 190, 'Bisolvon', 'jarabe 120 ml', 'Antitusígenos', 0, 'Bromhexina', 17),
(171, 4, 14, 280, 'Panatos', 'jarabe 100 ml', 'Antitusígenos', 0, 'Hedera helix', 18),
(172, 4, 19, 230, 'Histiacil', 'jarabe 140 ml', 'Antitusígenos', 0, 'Oxolamina', 19),
(173, 4, 20, 135, 'Mucosolvan', 'jarabe 600 ml', 'Antitusígenos', 0, 'Ambroxol', 20),
(174, 4, 4, 370, 'Amoxiclav', 'Tableta 500 mg x 15', 'Antibióticos', 1, 'Amoxicilina, Acido Clavulanico', 21),
(175, 4, 13, 420, 'Ciproxina', 'Tableta 500 mg x 14', 'Antibióticos', 1, 'Ciprofloxacino', 22),
(176, 4, 7, 507, 'Macrozit', 'Tableta 500mg x 5', 'Antibióticos', 1, 'Azitromicina', 23),
(177, 4, 14, 260, 'Bactrim', 'Tableta 400mg x 30', 'Antibióticos', 1, 'Sulfametoxazol', 24),
(178, 4, 12, 236, 'Cefaxona', 'Inyeccion 500 mg x 1', 'Antibióticos', 1, 'Ceftriaxona', 25),
(179, 4, 14, 98, 'Celestoderm', 'Crema 1mg x 1', 'Antibióticos', 1, 'Gentamicina', 26),
(180, 4, 6, 42, 'Rosel-T', 'Tableta 300mg x 15', 'Antigripal', 0, 'Paracetamol ,clorfenamina', 27),
(181, 4, 12, 34, 'Agrifen', 'Tableta 500 mg x 10', 'Antigripal', 0, 'Paracetamol,Clorhidrato De Fenilefrina', 28),
(182, 4, 10, 60, 'Tabcin', 'Tableta 500 mg x 12', 'Antigripal', 0, 'Ácido acetilsalicílico', 29),
(183, 4, 12, 150, 'Tempra', 'Jarabe 120 ml', 'Antigripal', 0, 'Paracetamol', 8),
(184, 4, 16, 78, 'next', 'Tableta 500 mg x 20', 'Antigripal', 0, 'Paracetamol,Fenilefrina', 31),
(185, 4, 16, 94, 'PostDay', '1 comprimido', 'Anticonceptivo', 0, 'Levonorgestrel', 32),
(186, 4, 19, 79, 'Sildenafil (Viagra)', 'Tabletas 50 mg x 4', 'inhibidores de la fosfodiesterasa', 0, 'Sildenafil', 33),
(187, 4, 9, 151, 'Buscapina', 'Tableta 20 mg x 10', 'antiespasmódico ', 0, 'Butilhioscina,Ibuprofeno', 34),
(188, 4, 11, 46, 'Dexametasona', 'Tablet 6 mg x 10', 'antinflamatorio', 0, 'corticosteroide', 35),
(189, 4, 18, 28, 'Diclofenaco', 'Tablet 100 mg x 10', 'antinflamatorio', 0, 'Diclofenaco', 36),
(190, 4, 6, 156, 'Tribedoce', 'Tabletas 100ml x 30', 'Multivitaminico', 0, 'ComplejoB,Diclofenaco', 37),
(191, 4, 2, 324, 'Bedoyecta', 'Capsulas x 30', 'Multivitaminico', 0, 'Vitamina b1 tiamina, Clorhidrato de piridoxina', 38),
(192, 4, 14, 158, 'Centrum', 'Tabletas 100ml x 30', 'Multivitaminico', 0, 'Vitamina a, Vitamina e, Beta caroteno', 39),
(193, 4, 12, 208, 'Canesten V', 'crema 1mg x 1 + 1 ovulo', 'Infecciones Vaginales', 0, 'Clotrimazol', 40),
(194, 4, 19, 158, 'Lomecan V', 'crema 1ml x1 + 1 ovulo', 'Infecciones Vaginales', 0, 'Clotrimazol', 41),
(195, 4, 15, 72, 'Tenescan V', 'crema 2ml x 1', 'Infecciones Vaginales', 0, 'Clotrimazol', 42),
(196, 4, 6, 184, 'Clindamicina', 'Tableta 300 ml x 16', 'Infecciones Vaginales', 0, 'Clindamicina', 43),
(197, 4, 9, 28, 'Barmicil', 'Crema 40 mg x 1', 'reconstituyente y regenerador epitelial', 0, 'Clotrimazol, Gentamicina,Betametazona', 0),
(198, 4, 16, 34, 'Vitacilina', 'Crema 16 mg x 1', 'reconstituyente y regenerador epitelial', 0, 'neomizina', 0),
(199, 4, 19, 168, 'Bephanten', 'Crema 16 mg x 2', 'Cuidado de piel', 0, 'Dexpantenol', 0),
(200, 4, 8, 242, 'Nesajar', 'Capsula 100mg x 16', 'Antiespasmodico', 0, 'Dimeticona, Bromuro de Pinaverio', 0),
(201, 4, 18, 305, 'NyQuilZ', 'Capsula 25 mg x 30', 'Insomnio', 0, 'Clorhidrato de difenhidramina', 0),
(202, 4, 8, 174, 'Caltrate', 'Tableta 300mg x 30', 'Calcificante', 0, 'Carbonato de calcio, Colecalciferol, Vitamina d3', 0),
(203, 4, 17, 142, 'Syncol', 'Tableta 300 mg x 30', 'antiespasmódico ', 0, 'Naproxeno Sódico, Paracetamol', 0),
(204, 4, 11, 94, 'Analgen+B40:B55', 'Tableta 220 mg x 12', 'antiespasmódico ', 0, 'Naproxeno Sódico, Paracetamol, Pamabrom', 0),
(205, 5, 15, 65, 'Omeprazol', 'Tableta 20 mg x 30', 'Antiacido', 0, 'omeprazol,hidróxido de aluminio', 1),
(206, 5, 12, 220, 'Riopan', 'Sobres 10ml x 20', 'Antiacido', 0, 'hidróxido de aluminio y magnesio', 2),
(207, 5, 9, 62, 'Tums', 'Tabletas x48', 'Antiacido', 0, 'carbonato de calcio', 3),
(208, 5, 13, 120, 'Galaver', 'Sobres 10ml x 20', 'Antiacido', 0, 'Magaldrato + dimeticona', 4),
(209, 5, 7, 389, 'Velmetia', 'Tableta 500mg x 28', 'biguanidas', 1, 'Metformina,Sitagliptina', 5),
(210, 5, 20, 419, 'Novorapid', 'Inyeccion 100ml x 1', 'biguanidas', 1, 'Insulina', 6),
(211, 5, 8, 145, 'Losartán', 'tableta 50 mg x 30', 'antagonistas del receptor de la angiotensina II', 1, 'Losartán', 7),
(213, 5, 17, 175, 'Motrin', 'gragea 600 mgx 20', 'analgésico', 0, 'Ibuprofeno', 9),
(214, 5, 7, 116, 'Onemer SL', 'tableta 10 mg x 10', 'analgésico', 0, 'ketorolaco', 10),
(215, 5, 18, 98, 'Alliviax', 'tableta 550mg x 10', 'analgésico', 0, 'NaproxenoSodico', 11),
(216, 5, 6, 38, 'Aspirina', 'tableta 500mg x 20', 'analgésico', 0, 'Acido acetilsalicilico', 12),
(217, 5, 18, 188, 'Iprikene', 'polvo 3mg x 10', 'antidiarreico', 0, 'Diosmectita', 13),
(218, 5, 1, 150, 'Terramicina', 'pastilla 125 mg x 24', 'antidiarreico', 0, 'Clorhidrato de oxitetraciclina', 14),
(219, 5, 20, 190, 'Lomotil', 'Tableta 2mg x 10', 'antidiarreico', 0, 'Clorhidrato de loperamida', 15),
(220, 5, 10, 204, 'Pepto Bismol', 'Suspension 236 ml', 'antidiarreico', 0, 'Subsalicilato de Bismuto', 16),
(221, 5, 20, 190, 'Bisolvon', 'jarabe 120 ml', 'Antitusígenos', 0, 'Bromhexina', 17),
(222, 5, 11, 233, 'Panatos', 'jarabe 100 ml', 'Antitusígenos', 0, 'Hedera helix', 18),
(223, 5, 18, 144, 'Histiacil', 'jarabe 140 ml', 'Antitusígenos', 0, 'Oxolamina', 19),
(224, 5, 17, 119, 'Mucosolvan', 'jarabe 600 ml', 'Antitusígenos', 0, 'Ambroxol', 20),
(225, 5, 18, 294, 'Amoxiclav', 'Tableta 500 mg x 15', 'Antibióticos', 1, 'Amoxicilina, Acido Clavulanico', 21),
(226, 5, 18, 390, 'Ciproxina', 'Tableta 500 mg x 14', 'Antibióticos', 1, 'Ciprofloxacino', 22),
(227, 5, 7, 410, 'Macrozit', 'Tableta 500mg x 5', 'Antibióticos', 1, 'Azitromicina', 23),
(228, 5, 11, 210, 'Bactrim', 'Tableta 400mg x 30', 'Antibióticos', 1, 'Sulfametoxazol', 24),
(229, 5, 18, 266, 'Cefaxona', 'Inyeccion 500 mg x 1', 'Antibióticos', 1, 'Ceftriaxona', 25),
(230, 5, 19, 80, 'Celestoderm', 'Crema 1mg x 1', 'Antibióticos', 1, 'Gentamicina', 26),
(231, 5, 19, 60, 'Rosel-T', 'Tableta 300mg x 15', 'Antigripal', 0, 'Paracetamol ,clorfenamina', 27),
(232, 5, 6, 45, 'Agrifen', 'Tableta 500 mg x 10', 'Antigripal', 0, 'Paracetamol,Clorhidrato De Fenilefrina', 28),
(233, 5, 7, 70, 'Tabcin', 'Tableta 500 mg x 12', 'Antigripal', 0, 'Ácido acetilsalicílico', 29),
(234, 5, 17, 145, 'Tempra', 'Jarabe 120 ml', 'Antigripal', 0, 'Paracetamol', 8),
(235, 5, 12, 88, 'next', 'Tableta 500 mg x 20', 'Antigripal', 0, 'Paracetamol,Fenilefrina', 31),
(236, 5, 4, 60, 'PostDay', '1 comprimido', 'Anticonceptivo', 0, 'Levonorgestrel', 32),
(237, 5, 20, 98, 'Sildenafil (Viagra)', 'Tabletas 50 mg x 4', 'inhibidores de la fosfodiesterasa', 0, 'Sildenafil', 33),
(238, 5, 1, 132, 'Buscapina', 'Tableta 20 mg x 10', 'antiespasmódico ', 0, 'Butilhioscina,Ibuprofeno', 34),
(239, 5, 16, 66, 'Dexametasona', 'Tablet 6 mg x 10', 'antinflamatorio', 0, 'corticosteroide', 35),
(240, 5, 1, 68, 'Diclofenaco', 'Tablet 100 mg x 10', 'antinflamatorio', 0, 'Diclofenaco', 36),
(241, 5, 3, 143, 'Tribedoce', 'Tabletas 100ml x 30', 'Multivitaminico', 0, 'ComplejoB,Diclofenaco', 37),
(242, 5, 16, 344, 'Bedoyecta', 'Capsulas x 30', 'Multivitaminico', 0, 'Vitamina b1 tiamina, Clorhidrato de piridoxina', 38),
(243, 5, 5, 170, 'Centrum', 'Tabletas 100ml x 30', 'Multivitaminico', 0, 'Vitamina a, Vitamina e, Beta caroteno', 39),
(244, 5, 7, 250, 'Canesten V', 'crema 1mg x 1 + 1 ovulo', 'Infecciones Vaginales', 0, 'Clotrimazol', 40),
(245, 5, 2, 189, 'Lomecan V', 'crema 1ml x1 + 1 ovulo', 'Infecciones Vaginales', 0, 'Clotrimazol', 41),
(246, 5, 20, 96, 'Tenescan V', 'crema 2ml x 1', 'Infecciones Vaginales', 0, 'Clotrimazol', 42),
(247, 5, 17, 198, 'Clindamicina', 'Tableta 300 ml x 16', 'Infecciones Vaginales', 0, 'Clindamicina', 43),
(248, 5, 8, 48, 'Barmicil', 'Crema 40 mg x 1', 'reconstituyente y regenerador epitelial', 0, 'Clotrimazol, Gentamicina,Betametazona', 0),
(249, 5, 8, 78, 'Vitacilina', 'Crema 16 mg x 1', 'reconstituyente y regenerador epitelial', 0, 'neomizina', 0),
(250, 5, 7, 165, 'Bephanten', 'Crema 16 mg x 2', 'Cuidado de piel', 0, 'Dexpantenol', 0),
(251, 5, 9, 232, 'Nesajar', 'Capsula 100mg x 16', 'Antiespasmodico', 0, 'Dimeticona, Bromuro de Pinaverio', 0),
(252, 5, 17, 289, 'NyQuilZ', 'Capsula 25 mg x 30', 'Insomnio', 0, 'Clorhidrato de difenhidramina', 0),
(253, 5, 11, 145, 'Caltrate', 'Tableta 300mg x 30', 'Calcificante', 0, 'Carbonato de calcio, Colecalciferol, Vitamina d3', 0),
(254, 5, 19, 135, 'Syncol', 'Tableta 300 mg x 30', 'antiespasmódico ', 0, 'Naproxeno Sódico, Paracetamol', 0),
(255, 5, 20, 99, 'Analgen+B40:B55', 'Tableta 220 mg x 12', 'antiespasmódico ', 0, 'Naproxeno Sódico, Paracetamol, Pamabrom', 0),
(256, 6, 19, 68, 'Omeprazol', 'Tableta 20 mg x 30', 'Antiacido', 0, 'omeprazol,hidróxido de aluminio', 1),
(257, 6, 9, 240, 'Riopan', 'Sobres 10ml x 20', 'Antiacido', 0, 'hidróxido de aluminio y magnesio', 2),
(258, 6, 18, 66, 'Tums', 'Tabletas x48', 'Antiacido', 0, 'carbonato de calcio', 3),
(259, 6, 8, 122, 'Galaver', 'Sobres 10ml x 20', 'Antiacido', 0, 'Magaldrato + dimeticona', 4),
(260, 6, 7, 590, 'Velmetia', 'Tableta 500mg x 28', 'biguanidas', 1, 'Metformina,Sitagliptina', 5),
(261, 6, 3, 437, 'Novorapid', 'Inyeccion 100ml x 1', 'biguanidas', 1, 'Insulina', 6),
(262, 6, 15, 169, 'Losartán', 'tableta 50 mg x 30', 'antagonistas del receptor de la angiotensina II', 1, 'Losartán', 7),
(264, 6, 12, 210, 'Motrin', 'gragea 600 mgx 20', 'analgésico', 0, 'Ibuprofeno', 9),
(265, 6, 17, 106, 'Onemer SL', 'tableta 10 mg x 10', 'analgésico', 0, 'ketorolaco', 10),
(266, 6, 5, 101, 'Alliviax', 'tableta 550mg x 10', 'analgésico', 0, 'NaproxenoSodico', 11),
(267, 6, 17, 28, 'Aspirina', 'tableta 500mg x 20', 'analgésico', 0, 'Acido acetilsalicilico', 12),
(268, 6, 14, 261, 'Iprikene', 'polvo 3mg x 10', 'antidiarreico', 0, 'Diosmectita', 13),
(269, 6, 14, 189, 'Terramicina', 'pastilla 125 mg x 24', 'antidiarreico', 0, 'Clorhidrato de oxitetraciclina', 14),
(270, 6, 14, 216, 'Lomotil', 'Tableta 2mg x 10', 'antidiarreico', 0, 'Clorhidrato de loperamida', 15),
(271, 6, 19, 205, 'Pepto Bismol', 'Suspension 236 ml', 'antidiarreico', 0, 'Subsalicilato de Bismuto', 16),
(272, 6, 10, 187, 'Bisolvon', 'jarabe 120 ml', 'Antitusígenos', 0, 'Bromhexina', 17),
(273, 6, 20, 253, 'Panatos', 'jarabe 100 ml', 'Antitusígenos', 0, 'Hedera helix', 18),
(274, 6, 8, 194, 'Histiacil', 'jarabe 140 ml', 'Antitusígenos', 0, 'Oxolamina', 19),
(275, 6, 7, 129, 'Mucosolvan', 'jarabe 600 ml', 'Antitusígenos', 0, 'Ambroxol', 20),
(276, 6, 11, 384, 'Amoxiclav', 'Tableta 500 mg x 15', 'Antibióticos', 1, 'Amoxicilina, Acido Clavulanico', 21),
(277, 6, 9, 440, 'Ciproxina', 'Tableta 500 mg x 14', 'Antibióticos', 1, 'Ciprofloxacino', 22),
(278, 6, 20, 507, 'Macrozit', 'Tableta 500mg x 5', 'Antibióticos', 1, 'Azitromicina', 23),
(279, 6, 11, 260, 'Bactrim', 'Tableta 400mg x 30', 'Antibióticos', 1, 'Sulfametoxazol', 24),
(280, 6, 3, 236, 'Cefaxona', 'Inyeccion 500 mg x 1', 'Antibióticos', 1, 'Ceftriaxona', 25),
(281, 6, 11, 98, 'Celestoderm', 'Crema 1mg x 1', 'Antibióticos', 1, 'Gentamicina', 26),
(282, 6, 18, 42, 'Rosel-T', 'Tableta 300mg x 15', 'Antigripal', 0, 'Paracetamol ,clorfenamina', 27),
(283, 6, 16, 34, 'Agrifen', 'Tableta 500 mg x 10', 'Antigripal', 0, 'Paracetamol,Clorhidrato De Fenilefrina', 28),
(284, 6, 10, 60, 'Tabcin', 'Tableta 500 mg x 12', 'Antigripal', 0, 'Ácido acetilsalicílico', 29),
(285, 6, 14, 150, 'Tempra', 'Jarabe 120 ml', 'Antigripal', 0, 'Paracetamol', 8),
(286, 6, 15, 78, 'next', 'Tableta 500 mg x 20', 'Antigripal', 0, 'Paracetamol,Fenilefrina', 31),
(287, 6, 4, 94, 'PostDay', '1 comprimido', 'Anticonceptivo', 0, 'Levonorgestrel', 32),
(288, 6, 8, 79, 'Sildenafil (Viagra)', 'Tabletas 50 mg x 4', 'inhibidores de la fosfodiesterasa', 0, 'Sildenafil', 33),
(289, 6, 10, 151, 'Buscapina', 'Tableta 20 mg x 10', 'antiespasmódico ', 0, 'Butilhioscina,Ibuprofeno', 34),
(290, 6, 7, 46, 'Dexametasona', 'Tablet 6 mg x 10', 'antinflamatorio', 0, 'corticosteroide', 35),
(291, 6, 20, 28, 'Diclofenaco', 'Tablet 100 mg x 10', 'antinflamatorio', 0, 'Diclofenaco', 36),
(292, 6, 18, 156, 'Tribedoce', 'Tabletas 100ml x 30', 'Multivitaminico', 0, 'ComplejoB,Diclofenaco', 37),
(293, 6, 17, 324, 'Bedoyecta', 'Capsulas x 30', 'Multivitaminico', 0, 'Vitamina b1 tiamina, Clorhidrato de piridoxina', 38),
(294, 6, 20, 158, 'Centrum', 'Tabletas 100ml x 30', 'Multivitaminico', 0, 'Vitamina a, Vitamina e, Beta caroteno', 39),
(295, 6, 15, 208, 'Canesten V', 'crema 1mg x 1 + 1 ovulo', 'Infecciones Vaginales', 0, 'Clotrimazol', 40),
(296, 6, 20, 158, 'Lomecan V', 'crema 1ml x1 + 1 ovulo', 'Infecciones Vaginales', 0, 'Clotrimazol', 41),
(297, 6, 5, 72, 'Tenescan V', 'crema 2ml x 1', 'Infecciones Vaginales', 0, 'Clotrimazol', 42),
(298, 6, 6, 184, 'Clindamicina', 'Tableta 300 ml x 16', 'Infecciones Vaginales', 0, 'Clindamicina', 43),
(299, 6, 2, 28, 'Barmicil', 'Crema 40 mg x 1', 'reconstituyente y regenerador epitelial', 0, 'Clotrimazol, Gentamicina,Betametazona', 0),
(300, 6, 14, 34, 'Vitacilina', 'Crema 16 mg x 1', 'reconstituyente y regenerador epitelial', 0, 'neomizina', 0),
(301, 6, 15, 168, 'Bephanten', 'Crema 16 mg x 2', 'Cuidado de piel', 0, 'Dexpantenol', 0),
(302, 6, 6, 242, 'Nesajar', 'Capsula 100mg x 16', 'Antiespasmodico', 0, 'Dimeticona, Bromuro de Pinaverio', 0),
(303, 6, 9, 305, 'NyQuilZ', 'Capsula 25 mg x 30', 'Insomnio', 0, 'Clorhidrato de difenhidramina', 0),
(304, 6, 10, 174, 'Caltrate', 'Tableta 300mg x 30', 'Calcificante', 0, 'Carbonato de calcio, Colecalciferol, Vitamina d3', 0),
(305, 6, 6, 142, 'Syncol', 'Tableta 300 mg x 30', 'antiespasmódico ', 0, 'Naproxeno Sódico, Paracetamol', 0),
(306, 6, 12, 94, 'Analgen+B40:B55', 'Tableta 220 mg x 12', 'antiespasmódico ', 0, 'Naproxeno Sódico, Paracetamol, Pamabrom', 0),
(307, 7, 20, 70, 'Omeprazol', 'Tableta 20 mg x 30', 'Antiacido', 0, 'omeprazol,hidróxido de aluminio', 1),
(308, 7, 3, 265, 'Riopan', 'Sobres 10ml x 20', 'Antiacido', 0, 'hidróxido de aluminio y magnesio', 2),
(309, 7, 12, 75, 'Tums', 'Tabletas x48', 'Antiacido', 0, 'carbonato de calcio', 3),
(310, 7, 11, 133, 'Galaver', 'Sobres 10ml x 20', 'Antiacido', 0, 'Magaldrato + dimeticona', 4),
(311, 7, 3, 460, 'Velmetia', 'Tableta 500mg x 28', 'biguanidas', 1, 'Metformina,Sitagliptina', 5),
(312, 7, 6, 410, 'Novorapid', 'Inyeccion 100ml x 1', 'biguanidas', 1, 'Insulina', 6),
(313, 7, 15, 160, 'Losartán', 'tableta 50 mg x 30', 'antagonistas del receptor de la angiotensina II', 1, 'Losartán', 7),
(315, 7, 8, 200, 'Motrin', 'gragea 600 mgx 20', 'analgésico', 0, 'Ibuprofeno', 9),
(316, 7, 15, 100, 'Onemer SL', 'tableta 10 mg x 10', 'analgésico', 0, 'ketorolaco', 10),
(317, 7, 16, 100, 'Alliviax', 'tableta 550mg x 10', 'analgésico', 0, 'NaproxenoSodico', 11),
(318, 7, 8, 35, 'Aspirina', 'tableta 500mg x 20', 'analgésico', 0, 'Acido acetilsalicilico', 12),
(319, 7, 15, 260, 'Iprikene', 'polvo 3mg x 10', 'antidiarreico', 0, 'Diosmectita', 13),
(320, 7, 15, 190, 'Terramicina', 'pastilla 125 mg x 24', 'antidiarreico', 0, 'Clorhidrato de oxitetraciclina', 14),
(321, 7, 17, 245, 'Lomotil', 'Tableta 2mg x 10', 'antidiarreico', 0, 'Clorhidrato de loperamida', 15),
(322, 7, 16, 215, 'Pepto Bismol', 'Suspension 236 ml', 'antidiarreico', 0, 'Subsalicilato de Bismuto', 16),
(323, 7, 13, 180, 'Bisolvon', 'jarabe 120 ml', 'Antitusígenos', 0, 'Bromhexina', 17),
(324, 7, 19, 255, 'Panatos', 'jarabe 100 ml', 'Antitusígenos', 0, 'Hedera helix', 18),
(325, 7, 4, 210, 'Histiacil', 'jarabe 140 ml', 'Antitusígenos', 0, 'Oxolamina', 19),
(326, 7, 15, 140, 'Mucosolvan', 'jarabe 600 ml', 'Antitusígenos', 0, 'Ambroxol', 20),
(327, 7, 11, 390, 'Amoxiclav', 'Tableta 500 mg x 15', 'Antibióticos', 1, 'Amoxicilina, Acido Clavulanico', 21),
(328, 7, 15, 450, 'Ciproxina', 'Tableta 500 mg x 14', 'Antibióticos', 1, 'Ciprofloxacino', 22),
(329, 7, 11, 510, 'Macrozit', 'Tableta 500mg x 5', 'Antibióticos', 1, 'Azitromicina', 23),
(330, 7, 14, 270, 'Bactrim', 'Tableta 400mg x 30', 'Antibióticos', 1, 'Sulfametoxazol', 24),
(331, 7, 1, 250, 'Cefaxona', 'Inyeccion 500 mg x 1', 'Antibióticos', 1, 'Ceftriaxona', 25),
(332, 7, 1, 110, 'Celestoderm', 'Crema 1mg x 1', 'Antibióticos', 1, 'Gentamicina', 26),
(333, 7, 4, 50, 'Rosel-T', 'Tableta 300mg x 15', 'Antigripal', 0, 'Paracetamol ,clorfenamina', 27),
(334, 7, 5, 30, 'Agrifen', 'Tableta 500 mg x 10', 'Antigripal', 0, 'Paracetamol,Clorhidrato De Fenilefrina', 28),
(335, 7, 17, 55, 'Tabcin', 'Tableta 500 mg x 12', 'Antigripal', 0, 'Ácido acetilsalicílico', 29),
(336, 7, 11, 120, 'Tempra', 'Jarabe 120 ml', 'Antigripal', 0, 'Paracetamol', 8),
(337, 7, 18, 70, 'next', 'Tableta 500 mg x 20', 'Antigripal', 0, 'Paracetamol,Fenilefrina', 31),
(338, 7, 5, 90, 'PostDay', '1 comprimido', 'Anticonceptivo', 0, 'Levonorgestrel', 32),
(339, 7, 19, 80, 'Sildenafil (Viagra)', 'Tabletas 50 mg x 4', 'inhibidores de la fosfodiesterasa', 0, 'Sildenafil', 33),
(340, 7, 17, 170, 'Buscapina', 'Tableta 20 mg x 10', 'antiespasmódico ', 0, 'Butilhioscina,Ibuprofeno', 34),
(341, 7, 13, 60, 'Dexametasona', 'Tablet 6 mg x 10', 'antinflamatorio', 0, 'corticosteroide', 35),
(342, 7, 19, 35, 'Diclofenaco', 'Tablet 100 mg x 10', 'antinflamatorio', 0, 'Diclofenaco', 36),
(343, 7, 13, 180, 'Tribedoce', 'Tabletas 100ml x 30', 'Multivitaminico', 0, 'ComplejoB,Diclofenaco', 37),
(344, 7, 11, 330, 'Bedoyecta', 'Capsulas x 30', 'Multivitaminico', 0, 'Vitamina b1 tiamina, Clorhidrato de piridoxina', 38),
(345, 7, 18, 180, 'Centrum', 'Tabletas 100ml x 30', 'Multivitaminico', 0, 'Vitamina a, Vitamina e, Beta caroteno', 39),
(346, 7, 17, 230, 'Canesten V', 'crema 1mg x 1 + 1 ovulo', 'Infecciones Vaginales', 0, 'Clotrimazol', 40),
(347, 7, 7, 180, 'Lomecan V', 'crema 1ml x1 + 1 ovulo', 'Infecciones Vaginales', 0, 'Clotrimazol', 41),
(348, 7, 14, 90, 'Tenescan V', 'crema 2ml x 1', 'Infecciones Vaginales', 0, 'Clotrimazol', 42),
(349, 7, 5, 190, 'Clindamicina', 'Tableta 300 ml x 16', 'Infecciones Vaginales', 0, 'Clindamicina', 43),
(350, 7, 9, 35, 'Barmicil', 'Crema 40 mg x 1', 'reconstituyente y regenerador epitelial', 0, 'Clotrimazol, Gentamicina,Betametazona', 0),
(351, 7, 18, 50, 'Vitacilina', 'Crema 16 mg x 1', 'reconstituyente y regenerador epitelial', 0, 'neomizina', 0),
(352, 7, 10, 180, 'Bephanten', 'Crema 16 mg x 2', 'Cuidado de piel', 0, 'Dexpantenol', 0),
(353, 7, 10, 250, 'Nesajar', 'Capsula 100mg x 16', 'Antiespasmodico', 0, 'Dimeticona, Bromuro de Pinaverio', 0),
(354, 7, 11, 330, 'NyQuilZ', 'Capsula 25 mg x 30', 'Insomnio', 0, 'Clorhidrato de difenhidramina', 0),
(355, 7, 8, 180, 'Caltrate', 'Tableta 300mg x 30', 'Calcificante', 0, 'Carbonato de calcio, Colecalciferol, Vitamina d3', 0),
(356, 7, 9, 170, 'Syncol', 'Tableta 300 mg x 30', 'antiespasmódico ', 0, 'Naproxeno Sódico, Paracetamol', 0),
(357, 7, 13, 100, 'Analgen+B40:B55', 'Tableta 220 mg x 12', 'antiespasmódico ', 0, 'Naproxeno Sódico, Paracetamol, Pamabrom', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicina_image`
--

CREATE TABLE `medicina_image` (
  `Id` int(11) NOT NULL,
  `Nombre` text NOT NULL,
  `path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medicina_image`
--

INSERT INTO `medicina_image` (`Id`, `Nombre`, `path`) VALUES
(1, 'omeprazol', 'http://localhost/mvc/public/images/omeprazol.png'),
(2, 'Riopan', 'http://localhost/mvc/public/images/riopan.png'),
(3, 'Tums', 'http://localhost/mvc/public/images/tums.png'),
(4, 'Galaver', 'http://localhost/mvc/public/images/galaver.png'),
(5, 'Velmetia', 'http://localhost/mvc/public/images/velmetia.png'),
(6, 'Nivarapid', 'http://localhost/mvc/public/images/nivarapid.png'),
(7, 'Losartán', 'http://localhost/mvc/public/images/losartán.png'),
(8, 'Tempra', 'http://localhost/mvc/public/images/tempra.png'),
(9, 'Motrin', 'http://localhost/mvc/public/images/motrin.png'),
(10, 'Onemer SL', 'http://localhost/mvc/public/images/onemer sl.png'),
(11, 'Alliviax', 'http://localhost/mvc/public/images/alliviax.png'),
(12, 'Aspirina', 'http://localhost/mvc/public/images/aspirina.png'),
(13, 'Iprikene', 'http://localhost/mvc/public/images/iprikene.png'),
(14, 'Terramicina', 'http://localhost/mvc/public/images/terramicina.png'),
(15, 'Lomotil', 'http://localhost/mvc/public/images/lomotil.png'),
(16, 'Pepto Bismol', 'http://localhost/mvc/public/images/pepto bismol.png'),
(17, 'Bisolvon', 'http://localhost/mvc/public/images/bisolvon.png'),
(18, 'Panatos', 'http://localhost/mvc/public/images/panatos.png'),
(19, 'Histiacil', 'http://localhost/mvc/public/images/histiacil.png'),
(20, 'Mucosolvan', 'http://localhost/mvc/public/images/mucosolvan.png'),
(21, 'Amoxiclav', 'http://localhost/mvc/public/images/amoxiclav.png'),
(22, 'Ciproxina', 'http://localhost/mvc/public/images/ciproxina.png'),
(23, 'Macrozit', 'http://localhost/mvc/public/images/macrozit.png'),
(24, ' Bactrim', 'http://localhost/mvc/public/images/ bactrim.png'),
(25, 'Cefaxona', 'http://localhost/mvc/public/images/cefaxona.png'),
(26, ' Celestoderm', 'http://localhost/mvc/public/images/ celestoderm.png'),
(27, 'Rosel-T', 'http://localhost/mvc/public/images/rosel-t.png'),
(28, 'Agrifen', 'http://localhost/mvc/public/images/agrifen.png'),
(29, 'Tabcin', 'http://localhost/mvc/public/images/tabcin.png'),
(30, 'Tempra', 'http://localhost/mvc/public/images/tempra.png'),
(31, 'next', 'http://localhost/mvc/public/images/next.png'),
(32, 'PostDay', 'http://localhost/mvc/public/images/postday.png'),
(33, 'Sildenafil  (Viagra)', 'http://localhost/mvc/public/images/sildenafil.png'),
(34, 'Buscapina', 'http://localhost/mvc/public/images/buscapina.png'),
(35, 'Dexametasona', 'http://localhost/mvc/public/images/dexametasona.png'),
(36, 'Diclofenaco', 'http://localhost/mvc/public/images/diclofenaco.png'),
(37, 'Tribedoce', 'http://localhost/mvc/public/images/tribedoce.png'),
(38, 'Bedoyecta', 'http://localhost/mvc/public/images/bedoyecta.png'),
(39, 'Centrum', 'http://localhost/mvc/public/images/centrum.png'),
(40, 'Canesten V', 'http://localhost/mvc/public/images/canesten v.png'),
(41, 'Lomecan V', 'http://localhost/mvc/public/images/lomecan v.png'),
(42, 'Tenescan V', 'http://localhost/mvc/public/images/tenescan v.png'),
(43, 'Clindamicina', 'http://localhost/mvc/public/images/clindamicina.png'),
(44, 'Barmicil', 'http://localhost/mvc/public/images/barmicil.png'),
(45, 'Vitacilina', 'http://localhost/mvc/public/images/vitacilina.png'),
(46, 'Bephanten', 'http://localhost/mvc/public/images/bephanten.png'),
(47, 'Nesajar', 'http://localhost/mvc/public/images/nesajar.png'),
(48, 'NyQuilZ', 'http://localhost/mvc/public/images/nyquilz.png'),
(49, 'Caltrate', 'http://localhost/mvc/public/images/caltrate.png'),
(50, 'Syncol', 'http://localhost/mvc/public/images/syncol.png'),
(51, 'Analgen', 'http://localhost/mvc/public/images/analgen.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bancarios`
--
ALTER TABLE `bancarios`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Cuenta_Farmacia` (`Id_Farmacia`);

--
-- Indices de la tabla `farmacia`
--
ALTER TABLE `farmacia`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `medicinas`
--
ALTER TABLE `medicinas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_image` (`Id_image`),
  ADD KEY `Id_Farmacia` (`Id_Farmacia`);

--
-- Indices de la tabla `medicina_image`
--
ALTER TABLE `medicina_image`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bancarios`
--
ALTER TABLE `bancarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `farmacia`
--
ALTER TABLE `farmacia`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `medicinas`
--
ALTER TABLE `medicinas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;

--
-- AUTO_INCREMENT de la tabla `medicina_image`
--
ALTER TABLE `medicina_image`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bancarios`
--
ALTER TABLE `bancarios`
  ADD CONSTRAINT `FK_Cuenta_Farmacia` FOREIGN KEY (`Id_Farmacia`) REFERENCES `farmacia` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
