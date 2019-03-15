-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2019 a las 17:03:53
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_portal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `id` int(11) NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`id`, `usuario`, `password`) VALUES
(1, 'admin', '5ec402357b9ab518cc83d5fb5297dbb507cff3c56b5dbeafc785cf8ebf31f2ed');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `manzana` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `lote` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `titulares` varchar(500) COLLATE utf8mb4_spanish_ci NOT NULL,
  `dni` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `domicilio` varchar(500) COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `manzana`, `lote`, `titulares`, `dni`, `telefono`, `domicilio`) VALUES
(1, '250', '(Ahora 19) 1', 'WEINZTEL GISELA PAOLA', '31369381', '15572709', 'Larrea n° 233'),
(2, '250', '(Ahora 20) 2', 'GOBBER PAULA NEREA  Y MICAELA EUGENIA GOBBER', '36446840/33365271', '15612915', 'Entre Rios n° 1214'),
(3, '250', '(Ahora 21) 3', 'BAUDUCCO MARIANA CLAUDIA Y GASTON CARLOS NICOLI', '24489687/24188676', '432760/15597653', 'Poeta Lugones n° 969'),
(4, '250', '(Ahora 22) 4', 'BAUDUCCO MARIANA Y NICOLI GASTON', '24489687/24188676', '432760/15597653', 'Poeta Lugones n° 969'),
(5, '250', '(Ahora 23) 5', 'BASTIERA FEDERICO NORBERTO', '29363464', '15580557', '9 de Julio n°3868'),
(6, '250', '(Ahora 24) 6', 'SILVESTRO EMILIANO Y BERNAL TAMARA', '34669328/39502769', '15470263', 'Av Cervantes n° 2927'),
(7, '250', '(Ahora 25) 7', 'CORNEJO GUSTAVO - AVENDAÑO 2/3', '21864198/24523108', '15580457', 'Republica de Siria n° 3533'),
(8, '250', '(Ahora 26) 8', 'BERRONE ELEONORA TERESITA', '1352169', '427543/ 15629181', 'Av 9 de setiembre n°2241'),
(9, '250', '(Ahora 27) 9', 'FONTANA FEDERICO MARTIN', '29339901', '15607912', 'Italia n° 1386'),
(10, '250', '(Ahora 28)10', 'PORTA MARCELO', '28959579', '0353-156573580', 'Juan de Garay n° 1640'),
(11, '250', '(Ahora 29)11', 'GARCIA LUCIANA NATALI', '33365189', '', 'Los Cerezos n° 1937'),
(12, '250', '(Ahora 6) 12', 'NICOLA RUBEN RAMON ALEJANDRO', '21783466', '428009/15599883', 'Calle 78 n°537, Frontera '),
(13, '250', '(Ahora 7) 13', 'GARCIA ROSENDO LUIS', '13521660', '', 'Belisario Roldan n° 625'),
(14, '250', '(Ahora 8) 14', 'GINER NATALIA CARINA', '25196523', '15590707', 'Rosario de Santa Fe ° 3141'),
(15, '250', '(Ahora 9) 15', 'GINER NATALIA CARINA', '25196523', '15590707', 'Rosario de Santa Fe ° 3141'),
(16, '250', '(Ahora 10)16', 'GINER NATALIA CARINA', '25196523', '15590707', 'Rosario de Santa Fe ° 3141'),
(17, '250', '(Ahora 11)17', 'FINELLO ANTONELLA SOLEDAD', '34469121', '15520729/428001', 'Carlos Gilli n° 2613'),
(18, '250', '(Ahora 12)18', 'SANTINELLI SOFIA INES', '37872396', '429150/15586179', 'italia n°1841'),
(19, '250', '(Ahora 13)19', 'FRANCESCHI JORGE RODOLFO - VIANO NANCY ESTELA', '17596828/17596685', '', 'Paraguay n°2477'),
(20, '250', '(Ahora 14)20', 'CONERJO GUSTAVO - SEPEDA NOELIA 2/3', '21864198/32462558', '15580457', 'Republica de Siria n° 3533'),
(21, '250', '(Ahora 15)21', 'MONDINO MARIA ANGELICA', '20188948', '429214', 'Entre Rios n° 1214'),
(22, '250', '(Ahora 17)23', 'BERTINETTI CRISTIAN ERICK  Y DANIELA RODRIGUEZ', '37285418/38279110', '416732/ 435761', 'Drago n° 544'),
(23, '250', '(Ahora 18)24  ', 'SILEONE DARIO RUBEN Y BONO JULIETA CECILIA', '22423399/23527206', '15578783', 'Av Juan de Garay n°4016'),
(24, '255', '(Ahora 20) 2', 'NUÑEZ MATIAS ALEJANDRO', '36680157', '15524708', 'Mexico n° 3091'),
(25, '255', '(Ahora 21) 3', 'COLLINO GERARDO JOSE', '20699263', '15501182/ 15360920', 'San Luis n° 93'),
(26, '255', '(Ahora 22) 4', 'TORINO JOSE LUIS Y BAUDINO MARIANELA', '30866205/36185249', '15359311/15359312', 'Repulbica del Libano n° 145'),
(27, '255', '(Ahora 23) 5', 'BERTORELLO JORGE Y BORGOGNONE EMILIAN', '28908216/30238513', '15663018', 'Bv 25 de Mayo n° 1368 4B'),
(28, '255', '(Ahora 24) 6', 'CARRIZO CLAUDIO', '25752255', '15581037', 'Los Ciruelos n° 1817'),
(29, '255', '(Ahora 25) 7', 'LURGO SANTIAGO', '36935490', '15413607', 'Dominga Cullen n° 125'),
(30, '255', '(Ahora 26) 8', 'SALGADO Marcos Gonzalo - DELGADO Cecilia Carola', '29087728/25099686', '15475180', 'Iturraspe n° 2544'),
(31, '255', '(Ahora 27) 9', 'REQUENA JOSE MARIA', '30238729', '425892/15581491', 'Libertad n° 2850'),
(32, '255', '(Ahora 28)10', 'CAVALLERIS PABLO-ANGIOLINI LAURA', '29852278/34468711', '15643477', 'Gutierrez n°3879'),
(33, '255', '(Ahora 29)11', 'CARUBELLI NATALIA GUADALUPE', '28104660', '15686244', 'Jonas Salk n° 1531'),
(34, '255', '(Ahora 6) 12', 'BOSIO MARIELA Y MORLACHI ALFREDO', '33959130/34266400', '15524003', 'Fortunato Lacamera n°4251'),
(35, '255', '(Ahora 7) 13', 'PONCE DANIELA VERONICA y GUERCI German Andres', '29833051/29560381', '15634103/15338544', 'Alberdi n°958'),
(36, '255', '(Ahora 8) 14', 'FAVOT FEDERICO- REQUENA MARIA EUGENIA', '28374053/28565103', '426040/15571638', 'Libertad n° 1325'),
(37, '255', '(Ahora 9) 15', 'REINERO SERGIO FRANCISCO', '17596932', '15662642', 'Lavalle n°736'),
(38, '255', '(Ahora 10)16', 'SUPPO MONICA', '17490149', '02944-15412764/432149', ''),
(39, '255', '(Ahora 11)17', 'GINER NATALIA CARINA', '25196523', '15590707', 'Rosario de Santa Fe n°3141'),
(40, '255', '(Ahora 12)18', 'RIOS PAOLA SOLEDAD', '30846104', '15505239/15505691', 'Rivadavia n°714'),
(41, '255', '(Ahora 13)19', 'BIANCHOTTI LUCILA Y CORONEL JOAQUIN', '35278648/33748243', '15358657/15693023', 'Independencia n°3167 Dto 4'),
(42, '255', '(Ahora 14)20', 'BORDINO PABLO Y APENDINO CAROLINA', '24188779/28959649', '15521297/433733', 'Juan de Garay n°2007'),
(43, '255', '(Ahora 15)21', 'MAQUINARIA SAN FRANCISCO SRL', '30-53587962-9', '420382', 'Av Rosario de Santa Fe n°2106'),
(44, '255', '(Ahora 16)22', 'SALOMON MONICA Y ALTAMIRANO RICARDO', '14401273/11921498', '15656913/14', '9 de Julio n°704'),
(45, '255', '(Ahora 17)23', 'BRUNO JUAN CARLOS Y CLELIA MARIA', '13521232/6227847', '423502', 'Libertador Sur n°170'),
(46, '255', '(Ahora 18)24  ', 'BRUNO MATIAS', '31157471', '423502', 'Libertador Sur n°170'),
(47, '256', '(Ahora 19) 1', 'SILVA DIEGO MARTIN', '24188580', '418726/438220', 'Los Robles n° 1428'),
(48, '256', '(Ahora 20) 2', 'TROMBOTTO MARISEL LILIANA', '17169811', '15512977', 'Belisario Roldan n° 1527'),
(49, '256', '(Ahora 21) 3', 'OCHONGA MARIANO ANDRES', '33940732', '425963/15410222', 'Garibaldi n° 229'),
(50, '256', '(Ahora 22) 4', 'CASTELLANO FERNANDO OSCAR', '36680060', '15654138/425361', 'J Hernandez n°1670'),
(51, '256', '(Ahora 23) 5', 'TESIO FEDERICO Y CAMPRA DAMIAN', '32591372/32901385', '15562016/153009109', 'Tucuman n° 174'),
(52, '256', '(Ahora 24) 6', 'TESIO FEDERICO Y CAMPRA DAMIAN', '32591372/32901385', '15562016/153009109', 'Tucuman n° 174'),
(53, '256', '(Ahora 25) 7', 'CLEMENTE MATIAS Y GUDIÑO ROMINA', '29560172/29833031', '15502261', 'Consejal Fernando Sileoni n°1021'),
(54, '256', '(Ahora 26) 8', 'GRACIELA DEL CARMEN BONO', '13920663', '424912/15689970', 'Libertador Norte n°1053'),
(55, '256', '(Ahora 27) 9', 'CAVALLERIS PABLO-ANGIOLINI LAURA', '29852278/34468711', '15643477/15643475', 'Gutierrez n°3879'),
(56, '256', '(Ahora 28)10', 'DADOMO SUSANA JOSEFA', '13772210', '03533-15458788', 'Mateo Olivero n° 261, Fortin'),
(57, '256', '(Ahora 29)11', 'GIACHELLO LUCIANO DEL VALLE', '29015485', '434257/15512252', 'Belgrano n° 831'),
(58, '256', '(Ahora 6) 12', 'ACTIS BEATRIZ DEL CARMEN', '16752282', '03562-481142', 'Av Brinkmann n°436- Brinkmann'),
(59, '256', '(Ahora 7) 13', 'VALDEMARIN SANDRA DEL VALLE', '16856758', '430591/15511778', 'BvSaenz Peña n° 1846 Dpto 1'),
(60, '256', '(Ahora 8) 14', 'GENESIO ROSSANA DEL VALLE', '22647869', '15540061', 'General Paz n° 320'),
(61, '256', '(Ahora 9) 15', 'NAI, Cecilia Andrea y Ferreyra Matias', '37285451/36935433', '15570928', 'Cabrera n° 1847 - Italia n° 1329'),
(62, '256', '(Ahora 10)16', 'DADOMO SUSANA JOSEFA', '13772210', '03533-15458788', 'Mateo Olivero n° 261, Fortin'),
(63, '256', '(Ahora 11)17', 'VIGNOLO AGUSTIN Y TRUCCO FLORENCIA', '34177472/34965286', '15583840/15567335', 'Mexico n°2291'),
(64, '256', '(Ahora 12)18', 'COLOMBATTI LUCIA', '37196257', '15586652', 'Italia n° 1955'),
(65, '256', '(Ahora 13)19', 'CARLE OSCAR BERNARDO', '10155856', '03492-490151/490234', 'Rivadavia n°40 Santa Clara de Saguier '),
(66, '256', '(Ahora 14)20', 'PASSERA ALEJANDRO EUGENIO', '24844499', '422540', 'Lopez y Planes n°2597'),
(67, '256', '(Ahora 15)21', 'MARTINI JORGE R- ORTEGA ELMA AZUCENA', '22985766/28374039', '443496/15572466', 'Castelli n° 1134'),
(68, '256', '(Ahora 16)22', 'ASTRADA HERALDO RAMON', '14828024', '15500759', 'Los Paraisos n° 1876'),
(69, '256', '(Ahora 17)23', 'BIANCOTTI GABRIEL EDUARDO', '20076548', '0343-156210465', 'Juan de Garay n°2903'),
(70, '256', '(Ahora 18)24  ', 'BIANCOTTI GABRIEL EDUARDO', '20076548', '0343-156210465', 'Juan de Garay n° 2903'),
(71, '283', '1', 'GRIBAUDO MIRIAM CLOTILDA', '13920545', '425678/15639891', 'Almafuerte n° 751'),
(72, '283', '4', 'CASAGRANDE GYANA NAIR', '39546690', '', 'Belisario Roldan n°594'),
(73, '283', '5', 'PIUMATTI MARTIN', '28840496', '15639133', 'Los Chañaritos n| 1276'),
(74, '283', '6', 'BERTINETTI HECTOR Y CARRIZO ELIZABETH', '16628208/20188216', '', 'Ameghino n° 1135'),
(75, '283', '7', 'LOVERA GASTON NICOLAS', '38279064', '15567749', 'San Juan n° 1119'),
(76, '283', '8', 'MAZA, GONZALO', '23824660', '15642066', ''),
(77, '283', '9', 'VIOTTI ELSO ANTONIO', '6441839', '15677288/420413', '9 de Julio n°1874 Dpto 43 6° piso'),
(78, '283', '14', 'VIOTTI ELSO ANTONIO', '6441839', '15677288/420413', '9 de Julio n°1874 Dpto 43 6° piso'),
(79, '283', '15', 'CALCAGNO MARIA CELIA', '34266365', '15513191/422130', 'A del Valle n° 686'),
(80, '283', '16', 'MARCHETTI MARIA RAQUEL', '12554361', '15667455', 'Formosa n°458'),
(81, '283', '17', 'ABRATE CARLOS ADOLFO', '16746129', '15575655', 'Castelli n° 2126'),
(82, '283', '18', 'RE EVANGELINA Y GALASSO DAMIAN', '32464072/31038829', '15339076/03406-15643630', ''),
(83, '283', '20', 'MAQUINARIA SAN FRANCISCO SRL', '30-53587962-9', '420382', 'Av Rosario de Santa Fe n°2106'),
(84, '283', '21', 'MAQUINARIA SAN FRANCISCO SRL', '30-53587962-9', '420382', 'Av Rosario de Santa Fe n°2106'),
(85, '283', '22', 'BROGGI HORACIO FABIAN', '16467176', '432955', 'Alem n° 136'),
(86, '283', '23', 'ALGARBE MIGUEL ANGEL', '12018841', '15587342', 'Corrientes n° 391  -Josefina'),
(87, '283', '24', 'ALGARBE MIGUEL ANGEL', '12018841', '15587342', 'Corrientes n° 391  -Josefina'),
(88, '284', '1', 'LINEA AZUL SRL', '30-71216902-4', '15615155', 'Pje, Zanichelli n°1887 piso 1 Dpto D'),
(89, '284', '2', 'GRAU SERGIO GINO', '16016290', '3576-15465255', 'Avellaneda n° 711'),
(90, '284', '3', 'BRONZONE MARINA SOLEDAD', '28104758', '15657726/15657725', 'Calle 9 n°1835, Frontera, Santa Fe'),
(91, '284', '4', 'RACCA LEANDRO ANDRES Y YANINA SOLEDAD GOETTE', '33537888/33748272', '15691515', 'Jose Hernandez n° 2385'),
(92, '284', '5', 'TRAFFANO MARIA CRUZ', '29363343', '15579027', 'Roma n° 2197'),
(93, '284', '6', 'HERNANDEZ CINTIA Y SALVAI ALEJANDRO', '36680028/31480705', '15411630', '9 de Setiembre n° 2241'),
(94, '284', '7', 'BATTIONI SERGIO CARLOS', '22647813', '15629793', 'Boero Romano n°1195 PA'),
(95, '284', '8', 'FERRERO PABLO JOSE', '20699556', '15610101', 'Colon n° 943'),
(96, '284', '9', 'FERRERO ROBERTO ESTEBAN', '22423010', '351-156857890', 'Lote 13 Mza 89 El Remanso Valle Escondido Cba'),
(97, '284', '10', 'GIORDANO DANTE SANTIAGO', '13044788', '15560858', 'Ecuador n° 206'),
(98, '284', '11', 'FERRERO ROBERTO ESTEBAN', '22423010', '351-156857890', 'Lote 13 Mza 89 El Remanso Valle Escondido Cba'),
(99, '284', '12', 'TORTOSA VIRGINIA Y PONS FERNANDO', '31593234/32338296', '15470839/15336012', 'Santa Fe n° 635'),
(100, '284', '13', 'PORTA MARCELO', '28959579', '0353-156573580', 'Pueyrredon n° 1555'),
(101, '284', '14', 'MILLAN LELIS Y BOSSIO FACUNDO SEBASTIAN', '24884380/25081091', '351-155316664', 'Libertad n° 3870'),
(102, '284', '15', 'VATT EMILIO JOSE', '34266240', '15659159/430199', 'Ameghino n° 641'),
(103, '284', '16', 'PAIRONE ISMAEL FABIAN', '23613066', '15616211', 'Gobernador San Martin n°546'),
(104, '284', '17', 'PIPINO JUAN IGNACIO', '34469095', '15412809', 'Perú n° 1039'),
(105, '284', '18', 'CHIOSSO JOSE LUIS', '16424460', '15598488', 'Los Algarrobos n°1244'),
(106, '284', '19', 'LISA MARCELO HECTOR', '20699219', '421050/15665771', 'Echeverria n° 433'),
(107, '284', '20', 'CASAS LUCIANA PAULA', '28840426', '15628935', 'Moreno n° 556 Dpto 2'),
(108, '284', '21', 'TOMASSONI PABLO DAMIAN', '22884837', '15518559', 'Cabrera n° 3857 Dpto 4'),
(109, '284', '22', 'LINEA AZUL SRL', '30-71216902-4', '15615155', 'Pje, Zanichelli n°1887 piso 1 Dpto D'),
(110, '284', '23', 'LINEA AZUL SRL', '30-71216902-4', '15615155', 'Pje, Zanichelli n°1887 piso 1 Dpto D'),
(111, '284', '24', 'LINEA AZUL SRL', '30-71216902-4', '15615155', 'Pje, Zanichelli n°1887 piso 1 Dpto D'),
(112, '285', '2', 'ARMANDO ANDRES ALFREDO', '29897649', '351-155933488/466120', '12 de Octubre y Alberdi S/n- Freyre-Cba'),
(113, '285', '3', 'CAMERANESI OSCAR RENE', '16097567', '0385-154771713', 'Irigoyen Sur n°493, La Banda, Santiago del Estero'),
(114, '285', '4', 'FRANCESKIN VALERIA', '26844993', '351-156820614', 'Juan XXIII n° 4892'),
(115, '285', '5', 'FRANCESKIN VALERIA', '26844993', '351-156820614', 'Juan XXIII n° 4892'),
(116, '285', '6', 'BOTTERO NICOLAS- CEDIDO a Carlos Giletta', '29363149', '15641987', 'Mexico n°1756'),
(117, '285', '10', 'BIAZZI ALEJANDRO Y CHIAPPERO PAOLA', '28565242/31840520', '433481/15626813', 'Santa Fe n° 782'),
(118, '285', '15', 'CORRALON RACA SRL', '30-70959341-9', '426261', 'Av Rosario de Santa Fe n°2302'),
(119, '285', '16', 'CARELLI ROBERTO Y DOLCE ANTONELLA', '29363060/33365164', '15562503', 'Ituizaingo n°1306'),
(120, '285', '17', 'POI DIEGO FRANCISCO', '27867302', '15605585', 'Lavalle n°253 Dpto 3'),
(121, '285', '18', 'ANDREOTTO SILVIA BEATRIZ FLORINDA', '13521620', '420499', 'Juan XXIII n° 2214'),
(122, '285', '25', 'LONGO, NICOLAS', '36935075', '15562030', 'Larrea n° 1761'),
(123, '285', '26', 'MOINE ROGELIO DOMINGO Y RACCA GRACIELA', '6303249/12554237', '423698', 'Irigoyen n°669'),
(124, '286', '2', 'LOPEZ MACRI NICOLAS MANUEL', '34826609', '3547-15590368', 'Centenario n° 373, Rosario, Santa Fe'),
(125, '286', '3', 'LURGO MARCOS ALBERTO', '31593202', '15504203', 'Dante Alighieri n° 1847'),
(126, '286', '4', 'BRUNO DIEZ NINO Y RIORDA ANDREA', '35668748/35668,601', '423502', 'Carlos Boero Romano n°371'),
(127, '286', '5', 'BRUNO JUAN CARLOS Y DIEZ LILIANA', '13521232/12744266', '423502', 'Carlos Boero Romano n°371'),
(128, '286', '6', 'RIVOIRA ALEJANDRO ROMAN', '33020651', '421233/15625360', 'San Juan n° 694'),
(129, '286', '7', 'SUSANA MARIA QUAGLIA', '5657964', '15576830', 'Bv Roca n°2605'),
(130, '286', '8', 'GIORDANI VERONICA PAULA Y DOMINGUEZ MARCELO ', '23577860/23436569', '3492-421949/15598612', 'Bv Roca n°2611'),
(131, '286', '9', 'GUEVARA LUIS ROBERTO', '26309361', '15630497/420209', 'Capitan Giachino n° 1545'),
(132, '286', '11', 'OSELLA MAURICIO Y RODRIGUEZ ALEJANDRA', '18514146/23577857', '433160/15689723', 'Dean Funes n° 1143'),
(133, '286', '12', 'FOESTER RODOLFO EDUARDO', '32967291', '15604865', 'Rio Negro n°377'),
(134, '286', '13', 'MAQUINARIA SAN FRANCISCO SRL', '30-53587962-9', '420382', 'Av Rosario de Santa Fe n° 2106'),
(135, '286', '14', 'MAQUINARIA SAN FRANCISCO SRL', '30-53587962-9', '420382', 'Av Rosario de Santa Fe n° 2106'),
(136, '286', '15', 'MAQUINARIA SAN FRANCISCO SRL', '30-53587962-9', '420382', 'Av Rosario de Santa Fe n° 2106'),
(137, '286', '16', 'MARCHIONATTI DIEGO OMAR', '23577945', '15590707', 'Rosario de Santa Fe n| 3141'),
(138, '286', '17', 'ARRIETA DANIEL ALEJANDRO', '12751786', '3533-15434077', 'General Paz n° 290- SM Laspiur- Cba'),
(139, '286', '18', 'NAVARRO MARIA EUGENIA Y ABRATE PABLO', '31157780/31157603', '15611167/15670301', 'Cabrera n°1635, 1° Piso Dpto 3'),
(140, '286', '19', 'MASUERO LORENA ELISABETH', '24349964', '15565165', 'Lamadrid n°1425'),
(141, '286', '20', 'CORDOBA SEBASTIAN ANDRES', '29015357', '15664392', 'Iturraspe n° 1556'),
(142, '286', '21', 'BERNARDI EMANUEL', '32221387', '15647482/431197', 'Jonas Salk n°840'),
(143, '286', '22', 'DANGUISE CAROLINA Y ARANDA GASTON', '30846326/27850739', '15667656/15649434', 'España n° 174 Dpto C'),
(144, '286', '23', 'LOPEZ MACRI NICOLAS MANUEL', '34826609', '3547-15590368', 'Centenario n°373- Rosario Santa Fe'),
(145, '286', '24', 'MALACALZA PAULA', '33852443', '351-153456771', 'Mallat n° 15'),
(146, '286', '25', 'AVARO VIRGINIA BEATRIZ', '30418175', '428361/15695975', 'Moreno n° 1134'),
(147, '286', '26', 'PIOLI RITA Y YOAQUINO FERNANDO', '22953957/20188995', '15501580/428655', 'Caseros n° 303'),
(148, '287', '1', 'BUSATTO FEDERICO', '32591359', '15623135', 'Pje Zanichelli n° 1885 6B'),
(149, '287', '2', 'MENSA CAROLINA', '34908085', '15652440', 'España n° 294   '),
(150, '287', '3', 'BARRIOS MARTIN REYNALDO', '26035571', '15650544', 'Paraguay n°2137'),
(151, '287', '4', 'MAYORGA GRACIELA DEL VALLE', '13409791', '15582706/15646693', 'Av Rosario de Santa Fe n° 1822'),
(152, '287', '5', 'SEGALES ESTEFANIA Y AIMASSO JUAN PABLO', '32136977/29560115', '341-156467643', 'Bv Roca n° 2870'),
(153, '287', '6', 'BOTTA SABINA GUADALUPE', '31516005', '440673/342-154082427', 'Liwaski n°1705'),
(154, '287', '7', 'NEIRA RODOLFO EDUARDO', '32802423', '15670173', 'Italia n°3039'),
(155, '287', '8', 'BACCI FEDERICO ARIEL', '35786061', '15664572', 'Castelli n° 2691'),
(156, '287', '9', 'BLESIO JUAN CARLOS', '32967337', '15607491', 'Castelli n°2767'),
(157, '287', '10', 'PRAMPARO Fernando y MASUERO Carolina Cecilia', '25469122/27423267', '15672404/15667209', 'Roma n° 2417'),
(158, '287', '11', 'PRAMPARO Fernando y MASUERO Carolina Cecilia', '25469122/27423267', '15672404/15667209', 'Roma n° 2417'),
(159, '287', '12', 'PARISIA LUCIANA RAQUEL', '22013800', '15648079', 'San Juan n° 455'),
(160, '287', '13', 'GIAMPIERI HUGO CARLOS', '6445334', '15566997', 'Belgrano n°3690'),
(161, '287', '14', 'SCARAFIA LORENA', '25481018', '421106/15605696', 'Juan XXIII n°1229'),
(162, '287', '15', 'VALVERDI LAURA Y SARGNIOTTI ALDO', '12219688/8074875', '15651308', 'Brasil n° 547'),
(163, '287', '16', 'ALMADA HECTOR Y BULACIO SANDRA', '22123476/22423441', '15584061/15562841', 'Paraguay n° 543'),
(164, '287', '17', 'SILVA LEANDRO GABRIEL', '38278956', '15573860/423278', 'Mexico n°2549'),
(165, '287', '18', 'FERREYRA MARIANO ANDRES', '27655521', '15508425', 'Catamarca Sur n° 518'),
(166, '287', '19', 'PAVEGLIO DORIS DEL VALLE', '14622398', '428984/15625560', 'Florencio Sanchez n° 795'),
(167, '287', '20', 'BARRIOS MARTIN', '26035571', '15650544', 'Paraguay n°2137'),
(168, '287', '21', 'MOLINA EMANUEL DAVID', '32000045', '15413712', 'Pauster n°654'),
(169, '287', '22', 'CASTRO RODRIGO FACUNDO', '37285819', '156029960/435225', 'Ecuador n°1635'),
(170, '287', '23', 'MARTINUZZI MARIANO Y BONO JACQUELINE MARINA', '24844522/23252129', '', 'Castelli n°3037'),
(171, '287', '24', 'CHIAPPERO RITA INES Y BUTIGNOL SOFIA', '13319589/35225016', '429190/15651149', 'Honduras n°429'),
(172, '288', '3', 'COLOMBATTI Gabriel', '35668483', '011-1568274442', 'Colon n° 1594'),
(173, '288', '4', 'MARTINENGO MARIA ANGELICA', '14424621', '', 'Los Olmos n°1195'),
(174, '288', '5', 'MAQUINARIA SAN FRANCISCO SRL', '30-53587962-9', '420382', 'Av Rosario de Santa Fe n° 2106'),
(175, '288', '6', 'MAQUINARIA SAN FRANCISCO SRL', '30-53587962-9', '420382', 'Av Rosario de Santa Fe n° 2106'),
(176, '288', '7', 'BRODA MARCOS JOSE', '28565292', '15476437', 'Peru n° 316'),
(177, '288', '8', 'LONGO LUIS ALBERTO Y ALBARRACIN MARTA', '22953748/26311259', '15663049', 'Tucuman n° 181'),
(178, '288', '11', 'LONGO MARIA BELEN', '34100155', '15562030', 'Larrea n° 1761'),
(179, '288', '12', 'JULIO CESAR MARCHESSINI', '26707479', '15418680/426126', 'Suipacha n°656'),
(180, '288', '14', 'MONTIEL Silvina', '21554236', '15567097', 'Dean Funes n° 1915 Dpto 2'),
(181, '288', '15', 'LOSANO JUAN MARITIN Y SERRA VERONICA MARIA', '27003558/31059746', '', 'Bv 9 de Julio n°2968'),
(182, '288', '16', 'BRODA MARCOS JOSE', '28565292', '15476437', 'Peru n°316'),
(183, '288', '17', 'POPPINO PAULA', '36446987', '15661616', 'Bv Saenz Peña n° 3035'),
(184, '288', '18', 'POPPINO PAULA', '36446987', '15661616', 'Bv Saenz Peña n° 3035'),
(185, '288', '19', 'GUEVARA LUCAS JULIAN', '38108794', '15624863', 'Capitan Giachino n°1545'),
(186, '288', '20', 'JAFRANGALU SA', '33-71003184-9', '15415558', 'Poeta Lugones n°970'),
(187, '288', '21', 'FREY MONICA PATRICIA', '16150515', '15561065', 'Formosa n°358'),
(188, '288', '23', 'TUNINETTI Graciela', '25469154', '15578268', 'Gutierrez n°2515'),
(189, '288', '24', 'SILVESTRINI RENZO', '34266332', '15610733', 'Los Andes n° 1040'),
(190, '290', '1', 'MAQUINARIA SAN FRANCISCO SRL', '30-53587962-9', '420382', 'Av Rosario de Santa Fe n°2106'),
(191, '290', '2', 'OGGERO CRISTIAN Y MOYANO MIRIAM', '25469039/24844595', '435135/15647911', 'Ingenieros n°268'),
(192, '290', '3', 'GIECO LORENA VALERIA Y PINHA NICOLAS SANTIAGO', '29833341/26035864', '15666065', 'Tucuman n°107'),
(193, '290', '4', 'GIECO LORENA VALERIA Y PINHA NICOLAS SANTIAGO', '29833341/26035864', '15666065', 'Tucuman n°107'),
(194, '290', '5', 'VIGIL RAUL BERNARDO', '14538295', '15651634', 'Geronimo del Barco n°1073'),
(195, '290', '6', 'BERTOLIN GASTON CESAR', '33365231', '15616616', '9 de Setiembre n°3277'),
(196, '290', '7', 'TEDESCHI ADRIAN Y BARRIONUEVO GONZALO', '17597029/28104632', '15510124/15370333', 'Marconi n°173 - Perú n°421'),
(197, '290', '8', 'STICCA LEONARDO DANIEL Y MORO LILIANA BEATRIZ', '17372481/17596985', '15686804', 'Dante Alighieri n° 2769'),
(198, '290', '9', 'MAQUINARIA SAN FRANCISCO SRL', '30-53587962-9', '420382', 'Av Rosario de Santa Fe n° 2106'),
(199, '290', '10', 'LOZANO GERARDO Y BAILO MONICA', '23577803/22295045', '15413740', 'Paraguay n° 2967'),
(200, '290', '12', 'JUAREZ MARIA EUGENIA', '28565065', '15414435', 'Salta n°3836'),
(201, '290', '13', 'BERTHOLD MARCOS Y BERTHOLD DANIELA', '33365120/34965062', '420062/15585255', 'Dante Alighieri n°962'),
(202, '290', '14', 'RODRIGUEZ MARCELO IGNACIO', '25307297', '15662790', 'Las Acacias n° 1024'),
(203, '290', '15', 'RODRIGUEZ JULIO CESAR', '23190573', '15667754/15611158', 'Las Acacias n°1078'),
(204, '290', '16', 'PATRIGNANI WALTER', '21879119', '15623660/436231', 'Castelli n°2442 Dpto 3'),
(205, '290', '17', 'NARI ANDREA ALEJANDRA', '20699283', '15615378', 'Los Paraisos n° 1702'),
(206, '290', '18', 'FERREYRA NATALIA Y BORGNA SERGIO', '29833201/29560092', '15588084/427606', '25 de Mayo n°523'),
(207, '290', '19', 'CHIABRANDO GUSTAVO Y DUTTO MARIA', '21783546/23577674', '15414376/438109', 'Liniers n° 884'),
(208, '290', '20', 'GERBALDO ANDREA CARINA', '20-699-534', '429394/15413173', 'Echeverria n° 774'),
(209, '290', '21', 'MENARDI PATRICIA DEL VALLE', '16-372-030', '427569/15623347', 'Jose Hernandez n° 3212'),
(210, '290', '22', 'MAQUINARIA SAN FRANCISCO SRL', '30-53587962-9', '420382', 'Av Rosario de Santa Fe n° 2106'),
(211, '290', '23', 'MAQUINARIA SAN FRANCISCO SRL', '30-53587962-9', '420382', 'Av Rosario de Santa Fe n° 2106'),
(212, '290', '24', 'MAQUINARIA SAN FRANCISCO SRL', '30-53587962-6', '420382', 'Av Rosario de Santa Fe n° 2106'),
(213, '291', '4', 'MACORATTI EMILIA', '32338207', '15476169', 'Alberdi n°1105'),
(214, '291', '5', 'GONZALEZ RAMIRO', '30573905', '15628575', 'Los Sauces n° 2658'),
(215, '291', '6', 'MASUERO JULIO', '29833431', '15526128', 'Roma n° 2447'),
(216, '291', '7', 'AIASSA DIEGO FERNANDO', '27423622', '15419821', 'Cabrera n°2955'),
(217, '291', '8', 'FLESIA MARCOS ALEJANDRO', '35668960', '15583446', 'Dante Alighieri n° 2041'),
(218, '291', '9', 'BARAVALLE ELIAS NASIF', '35668488', '15629948/427402', 'Boero Romano n° 1340'),
(219, '291', '10', 'ZABALA DIANA MARIA', '12219823', '15650411', 'Peru n° 1249'),
(220, '291', '12', 'AGUIRRE EMANUEL GONZALO', '28840215', '422454/15503564', 'Peru n° 916'),
(221, '291', '13', 'DELL AVANZATTO FERNANDO', '16326965', '15520085', 'Almafuerte n°14 Dpto 3 1° piso'),
(222, '291', '14', 'DAVILA MAURICIO', '31157356', '15472883', 'Calle 76 n° 246, Frontera  Santa Fe'),
(223, '291', '15', 'VIOLA LEANDRO', '27870310', '15646873/15644198', 'Lamadrid Norte n° 4005'),
(224, '291', '16', 'FERNANDEZ JUAN PABLO Y GIECO MARINA DEL C', '28837224/27869058', '15631660', 'Ecuador n° 925'),
(225, '291', '17', 'MASSAGLI DIEGO RAUL', '27060515', '421273/415592926', 'Independencia n°2234'),
(226, '291', '18', 'RIOJA MARTIN JOSE', '33177926', '433692/15605023', '2 de Abril n° 1319'),
(227, '291', '19', 'RIOJA GUILLERMO NICOLAS', '31593247', '15605022', '2 de Abril n° 1319'),
(228, '291', '20', 'PUCHETA PAOLA ANDREA', '26309264', '', 'Italia n° 1386'),
(229, '291', '22', 'FRUTOS LEONARDO CESAR', '30499297', '433344/15476688', 'Primeros Colonizadores n°2442'),
(230, '291', '24', 'LONGO SEBASTIAN JOE', '36447353', '15562030', 'Larrea n° 1761'),
(231, '292', '1', 'GIAMPIERI HUGO CARLOS', '6445334', '15566997', 'Belgrano n° 3690'),
(232, '292', '2', 'MORERO LORENA - ISLEÑO EMANUEL', '23375120/39476395', '15659536/15608561', 'Gobernador San Martin n°951 Dpto 1'),
(233, '292', '3', 'BRUNO JAVIER FERNANDO', '24844120', '15519077', '1° de Mayo n° 670'),
(234, '292', '4', 'BALANGIONE DAMIAN - CLEMENTE CAROLINA', '28104788/30499268', '', 'Italia n° 1252'),
(235, '292', '5', 'PIZZI CLAUDIA ANDREA', '21402121', '421472/15618200', 'Cabrera n° 3136'),
(236, '292', '6', 'PIOLI PABLO JAVIER Y GIUSSIANO DANIELA ', '23252211/24522407', '422014/15416888', 'Mexico n° 2055'),
(237, '292', '7', 'CENA MARIA PAULA', '32967384', '15525182', 'Aristobulo del Valle n°458'),
(238, '292', '8', 'MORERO EZEQUIEL Y MOLINA ANTONELA', '31157383/37108814', '15528103', 'Dorrego n° 955'),
(239, '292', '9', 'POSSETTO MARIO JOSE', '16372203', '433283/15516868', 'Ituizaingo n° 741'),
(240, '292', '11', 'GILETTA JORGE ALBERTO', '13521212', '427493/15589127', 'Av Caseros n° 778'),
(241, '292', '12', 'GILETTA JORGE ALBERTO', '13521212', '427493/15589127', 'Av Caseros n° 778'),
(242, '292', '13', 'GILETTA ANIBAL GERMAN', '24575908', '15335094', 'San Lorenzo n° 275'),
(243, '292', '14', 'SALOMON MONICA Y ALTAMIRANO RICARDO', '14401273/11921498', '15656913/14', '9 de Julio n°704'),
(244, '292', '15', 'HERNANDEZ FLAVIO', '32221257', '15584950', 'Los Andes n°1387'),
(245, '292', '16', 'FRANCONE ANTONELLA', '36185369', '432035/15694672', 'Saenz Peña n° 2370'),
(246, '292', '17', 'FRANCONE ANTONELLA', '36185369', '432035/15694672', 'Saenz Peña n° 2370'),
(247, '292', '18', 'IBARRA FRANCO DANIEL', '34469168', '15670946', 'Intendente Dittrich'),
(248, '292', '19', 'LAZZARINI NOELIA Y TAGLIORETTI MARCOS', '32802472/32338301', '2477-15344896', 'Los Cerezos n° 1619'),
(249, '292', '20', 'FINETTI MARIA CELIA', '17597047', '15476824', 'Saenz Peña n° 23883'),
(250, '292', '22', 'GIRARDI FABRICIO', '25754761', '15692077', 'Saenz Peña n° 1363'),
(251, '292', '23', 'MARCUCCI NICOLAS Y CONTRERAS M ANGELA', '35668699/36680296', '15650276/15650429', 'Fleming n° 745'),
(252, '292', '24', 'SANCHEZ CHAZARRETA Anabel- CASTELLANO Ignacio ', '32053844/30499500', '15616171/15616272', 'Jose Hernandez n° 1670'),
(253, '292', '25', 'BOSIO MARCELO SANTIAGO', '35668968', '15606406', 'Belgrano n° 964'),
(254, '292', '26', 'GATTINO CECILIA - GIOINO Jose Ignacio', '30846192/30499333', '428280', 'Pelegrini n° 313'),
(255, '293', '1', 'VIGNOLO ESTEFANIA Y CAIMI DARIO', '29164097/29363189', '15602360/435540', 'Alberdi n°359'),
(256, '293', '2', 'FRANCO MARIA JIMENA', '28565040', '0351-1545989999', 'Italia n°1306'),
(257, '293', '3', 'TESIO GABRIEL JUAN', '26309050', '3492-15591422', 'Paraguay n° 3209'),
(258, '293', '4', 'PRIGIONI, Sergio y NADALIN, Jacqueline', '17596730/17099681', '15525053', '9 de Julio n° 1673 PA'),
(259, '293', '5', 'BUSTOS GASTON MIGUEL', '34266156', '15571842', 'Los Cerezos n°1824'),
(260, '293', '7', 'MARE DIEGO GUSTAVO', '20188939', '15563412', 'Paraguay n°3173'),
(261, '293', '8', 'CASTELLANO MARCELO OSCAR IGNACIO', '12219498', '425361/1565077', 'Jose Hernandez n° 1670'),
(262, '293', '9', 'FORLINI ALEJANDRO Y MOSCA SOFIA', '31889239/33748207', '15338405', 'Asuncion n°237'),
(263, '293', '10', 'CARVALLO MARCELO CARLOS', '17720502', '481867/15668452', 'Colon n° 623 - Devoto - Cba'),
(264, '293', '11', 'GOMEZ PRIMUCCI ANA  Y LUDUEÑA MARTI GABRIEL', '33514763/34266389', '15470993', 'Velez Sarfield n° 1159'),
(265, '293', '12', 'BORETTO RUBEN Y VOCOS ADRIANA', '12731942/17490248', '438737', 'Jose Hernandez n°1579'),
(266, '294', '4', 'ABRILE JOSE Y GATTI MARIA SUSANA', '21398200/21620464', '15665361/15575861', 'Dean Funes n° 1332'),
(267, '294', '10', 'ARTERO LUCIANA ANDREA', '31889290', '15608690/1548344', 'Ramon y Cajal n° 1178');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `indice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre`, `indice`) VALUES
(1, 'Citación previa', 1),
(2, 'Informe pedido', 2),
(3, 'Informe recibido', 3),
(4, 'Escritura firmada', 4),
(5, 'Escritura para retirar inscripta en escribanía', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `tramite` int(25) NOT NULL DEFAULT '0',
  `observacion` varchar(900) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'Sin observación',
  `lote` varchar(500) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `usuario` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `tramite`, `observacion`, `lote`, `start`, `end`, `usuario`, `estado`) VALUES
(30, 0, 'Sin observación', NULL, '2019-02-28 10:30:00', '2019-02-28 11:00:00', '21864198', 1),
(37, 0, 'Sin observación', NULL, '2019-02-26 09:30:00', '2019-02-26 10:00:00', '29339901', 3),
(44, 0, 'Sin observación', NULL, '2019-02-25 15:30:00', '2019-02-25 16:00:00', '31369381', 4),
(45, 0, 'Sin observación', NULL, '2019-02-27 09:00:00', '2019-02-27 09:30:00', '29363464', 1),
(46, 0, 'Sin observación', NULL, '2019-02-26 08:30:00', '2019-02-26 09:00:00', '1352169', 1),
(51, 0, 'Sin observación', NULL, '2019-02-28 11:00:00', '2019-02-28 11:30:00', '31369381', 2),
(53, 0, 'Sin observación', NULL, '2019-02-28 16:30:00', '2019-02-28 17:00:00', '36446840/33365271', 1),
(54, 0, 'Sin observación', NULL, '2019-03-18 11:00:00', '2019-03-18 11:30:00', '20188948', 1),
(60, 32763671, 'Sin observación', '(Ahora 10)16,(Ahora 11)17', '2019-03-29 10:30:00', '2019-03-29 11:00:00', '25196523', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
