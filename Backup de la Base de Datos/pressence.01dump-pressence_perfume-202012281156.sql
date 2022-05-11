-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: pressence_perfume
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `id_persona` int(11) NOT NULL,
  PRIMARY KEY (`id_persona`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1000);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (10,'mujer'),(11,'hombre'),(12,'niños');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_persona` int(11) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `telefono` int(11) NOT NULL,
  `genero` varchar(15) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id_persona`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1001,'ehuayllasco@unsa.edu.pe',983467823,'masculino','1997-06-14'),(1002,'ale@gmail.com',959423578,'femenino','1977-05-05'),(1003,'walR@gmail.com',984503353,'masculino','1967-09-08'),(1004,'keyly@gmail.com',982345123,'femenino','2004-05-10'),(1005,'valery@gmail.com',983478240,'femenino','2005-05-14'),(1006,'jim@gmail.com',980245134,'masculino','2001-07-18'),(1007,'shyndell@gmail.com',981234131,'femenino','2002-10-23'),(1008,'luisaHermosa@gmail.com',900123142,'femenino','2001-02-12'),(1009,'kathita@gmail.com',980078230,'femenino','2001-06-09'),(1010,'prueba@gmail.com',954222911,'femenino','2002-10-11');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_evalua_perfume`
--

DROP TABLE IF EXISTS `cliente_evalua_perfume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_evalua_perfume` (
  `id_persona_cliente` int(11) NOT NULL,
  `id_perfume` int(11) NOT NULL,
  `puntuacion` int(11) NOT NULL,
  `opinion` mediumtext NOT NULL,
  PRIMARY KEY (`id_persona_cliente`,`id_perfume`),
  KEY `id_perfume` (`id_perfume`),
  CONSTRAINT `cliente_evalua_perfume_ibfk_1` FOREIGN KEY (`id_persona_cliente`) REFERENCES `cliente` (`id_persona`),
  CONSTRAINT `cliente_evalua_perfume_ibfk_2` FOREIGN KEY (`id_perfume`) REFERENCES `perfume` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_evalua_perfume`
--

LOCK TABLES `cliente_evalua_perfume` WRITE;
/*!40000 ALTER TABLE `cliente_evalua_perfume` DISABLE KEYS */;
INSERT INTO `cliente_evalua_perfume` VALUES (1001,1,4,'Se ha converido en uno de mis perfumes favoritos, me encantó el diseño.'),(1001,22,3,'Me gustó mucho el perfume, tiene un diseño elegante.'),(1001,36,5,'El aroma es muy bueno.'),(1002,4,4,'Uno de mis perfumes favoritos.'),(1002,6,4,'Me gustó el perfume, pero es muy caro.'),(1002,11,2,'La verdad me decepciono el producto, pero le pongo 2 puntos porque el servicio es increíble, monitoreas el recorrido del producto hasta que este en tus manos.'),(1002,44,4,'Me encanto solo que su precio es muy elevado.'),(1003,38,5,'No me quejo, es un buen producto. Esto satisfecho con mi compra.'),(1004,46,1,'Le compre a mi hermano este perfume, y no tiene nada de aroma, parece agua. No lo recomiendo'),(1005,10,4,'A mi tío le agrado el producto, me gustaría que haya promociones o descuentos para poder comprar más ya que los precios están algo elevados.'),(1005,22,5,'Se lo compre a mi papá y esta muy alegre con su regalo. Además de que el servicio de entrega es muy bueno y cumple con las medidas de salubridad.'),(1006,21,1,'Nunca mas vuelvo a comprar en esta pagina, el pedido se demoro 1 mes en llegar y el cumpleaños de mi mamá ya habia pasado.'),(1007,14,3,'Me encanta su aroma pero prefiero seguir usando mi perfume de siempre.'),(1008,49,5,'A mi hermanita le fascino el producto, le gusta mucho las princesas por eso se lo compre y ahora vuele como ellas.'),(1009,9,5,'Me gusta mucho el perfume a pesar de su precio creo que es un producto que vale la pena comprar. A partir de ahora siempre la usare.'),(1010,1,5,'Uno de mis perfumes favoritos.');
/*!40000 ALTER TABLE `cliente_evalua_perfume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_gusta_perfume`
--

DROP TABLE IF EXISTS `cliente_gusta_perfume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_gusta_perfume` (
  `id_persona_cliente` int(11) NOT NULL,
  `id_perfume` int(11) NOT NULL,
  PRIMARY KEY (`id_perfume`,`id_persona_cliente`),
  KEY `id_persona_cliente` (`id_persona_cliente`),
  CONSTRAINT `cliente_gusta_perfume_ibfk_1` FOREIGN KEY (`id_persona_cliente`) REFERENCES `cliente` (`id_persona`),
  CONSTRAINT `cliente_gusta_perfume_ibfk_2` FOREIGN KEY (`id_perfume`) REFERENCES `perfume` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_gusta_perfume`
--

LOCK TABLES `cliente_gusta_perfume` WRITE;
/*!40000 ALTER TABLE `cliente_gusta_perfume` DISABLE KEYS */;
INSERT INTO `cliente_gusta_perfume` VALUES (1010,1),(1001,3),(1002,6),(1001,26),(1001,34),(1001,36),(1002,45);
/*!40000 ALTER TABLE `cliente_gusta_perfume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona_cliente` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  `codigo_postal` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_persona_cliente`),
  KEY `id_persona_cliente` (`id_persona_cliente`),
  CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`id_persona_cliente`) REFERENCES `cliente` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (101,1001,954222911,'Calleprueba','Provinciaprueba','Peru','Arequipa','Av. Siempre Viva',0),(102,1001,954333911,'Calle1','Provinciaprueba','Peru','Tacna','ref',123),(103,1001,954111321,'calle2','provincia2','peru2','piura','ref2',123),(104,1001,987543211,'calle3','provincia3','peru3','Tacna','reff3',1234),(105,1001,923456712,'Calleprueba2','Provinciaprueba2','Perú','Puno','referencia',123432),(106,1002,987234111,'SiempreViva','provincia3','Perú','Lima','stonebridge',123);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (20,'Channel'),(21,'Carolina Herrera'),(22,'Gucci'),(23,'Calvin Klein'),(24,'Marc Jacobs'),(25,'Jimmy Choo'),(26,'Yves Saint Laurent'),(27,'Paco Rabanne'),(28,'Roberto Cavalli'),(29,'Hugo Boss'),(30,'Versace'),(31,'Moschino'),(32,'Esika');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cuenta` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `fecha_pago` date NOT NULL,
  `total_precio` double(5,2) NOT NULL,
  `id_persona_cliente` int(11) NOT NULL,
  `numero_tarjeta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cuenta` (`id_cuenta`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_persona_cliente` (`id_persona_cliente`),
  KEY `numero_tarjeta` (`numero_tarjeta`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id`),
  CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `pago_ibfk_3` FOREIGN KEY (`id_persona_cliente`) REFERENCES `pedido` (`id_persona_cliente`),
  CONSTRAINT `pago_ibfk_4` FOREIGN KEY (`id_persona_cliente`) REFERENCES `cuenta` (`id_persona_cliente`),
  CONSTRAINT `pago_ibfk_5` FOREIGN KEY (`numero_tarjeta`) REFERENCES `tarjeta` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,103,1,'2020-12-27',551.86,1001,678543),(2,104,3,'2020-12-27',57.98,1001,987),(3,104,4,'2020-11-27',97.99,1001,14586),(4,106,2,'2020-12-27',274.50,1002,762341),(5,106,5,'2020-12-27',25.99,1002,7853),(6,105,7,'2020-09-27',394.86,1001,75432),(7,101,8,'2020-12-27',5.99,1001,12398);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona_cliente` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `id_pago` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_persona_cliente`),
  KEY `id_persona_cliente` (`id_persona_cliente`),
  KEY `id_pago` (`id_pago`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_persona_cliente`) REFERENCES `cliente` (`id_persona`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1001,'2020-12-26',1),(2,1002,'2020-12-26',4),(3,1001,'2020-12-27',2),(4,1001,'2020-12-27',3),(5,1002,'2020-12-27',5),(6,1002,'2020-12-27',NULL),(7,1001,'2020-12-27',6),(8,1001,'2020-12-27',7),(9,1001,'2020-12-28',NULL);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_perfume`
--

DROP TABLE IF EXISTS `pedido_perfume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_perfume` (
  `id_pedido` int(11) NOT NULL,
  `id_perfume` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_persona_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_pedido`,`id_perfume`,`id_persona_cliente`),
  KEY `id_perfume` (`id_perfume`),
  KEY `id_persona_cliente` (`id_persona_cliente`),
  CONSTRAINT `pedido_perfume_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `pedido_perfume_ibfk_2` FOREIGN KEY (`id_perfume`) REFERENCES `perfume` (`id`),
  CONSTRAINT `pedido_perfume_ibfk_3` FOREIGN KEY (`id_persona_cliente`) REFERENCES `pedido` (`id_persona_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_perfume`
--

LOCK TABLES `pedido_perfume` WRITE;
/*!40000 ALTER TABLE `pedido_perfume` DISABLE KEYS */;
INSERT INTO `pedido_perfume` VALUES (1,1,2,1001),(1,3,12,1001),(1,4,1,1001),(1,5,1,1001),(1,12,1,1001),(1,45,1,1001),(2,1,3,1002),(2,8,2,1002),(2,20,1,1002),(3,22,1,1001),(3,49,1,1001),(4,15,1,1001),(4,23,1,1001),(5,37,1,1002),(6,26,1,1002),(6,34,3,1002),(7,3,4,1001),(7,12,2,1001),(7,22,1,1001),(7,23,2,1001),(7,29,1,1001),(7,36,3,1001),(7,45,1,1001),(8,45,1,1001),(9,23,2,1001);
/*!40000 ALTER TABLE `pedido_perfume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfume`
--

DROP TABLE IF EXISTS `perfume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona_administrador` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `precio` double(5,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_persona_administrador` (`id_persona_administrador`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_tipo` (`id_tipo`),
  KEY `id_marca` (`id_marca`),
  CONSTRAINT `perfume_ibfk_1` FOREIGN KEY (`id_persona_administrador`) REFERENCES `administrador` (`id_persona`),
  CONSTRAINT `perfume_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  CONSTRAINT `perfume_ibfk_3` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id`),
  CONSTRAINT `perfume_ibfk_4` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfume`
--

LOCK TABLES `perfume` WRITE;
/*!40000 ALTER TABLE `perfume` DISABLE KEYS */;
INSERT INTO `perfume` VALUES (1,1000,10,2,21,'212 VIP','La nueva fragancia femenina de Carolina Herrera. Una deslumbrante explosión floriental, sensual y chispeante con notas de salida de bergamota, un delicioso corazón de flores y una sensual base de vainilla y almizcle. Verdaderamente glamoroso, fresco y seductor encerrado en una deslumbrante botella dorada.',46.50,20,'2020-07-30'),(2,1000,10,3,20,'Coco Mademoiselle','CHANEL COCO MADEMOISELLE EAU DE PARFUM SPRAY\r\n\r\nLa esencia de una mujer libre y atrevida. Una fragancia oriental con una fuerte personalidad, pero sorprendentemente fresca.\r\n\r\nEl eau de parfum viene en formato spray para una aplicación sin esfuerzo sobre la piel o la ropa. También está disponible un ritual perfumante completo para el baño y el cuerpo para realzar la estela de la fragancia.',57.00,10,'2020-03-12'),(3,1000,10,2,25,'Flash','Conviértete en la estrella brillante en cada fiesta con el nuevo accesorio definitivo de Jimmy Choo, el compañero perfecto para la chica fiestera que todos llevamos dentro.\r\n\r\nAhora puedes tener el brillo y el glamour de Jimmy Choo de pies a cabeza, con los zapatos brillantes, el bolso y ahora la fragancia para completar el look de fiesta. Prepárate para deslumbrar y dar vida a la noche con Jimmy Choo Flash Eau de Parfum.\r\n\r\nLos destellos de pimienta rosa, mandarina y fresa introducen un destello de flores blancas y tuberosa en esta fragancia de Eau De Parfum. Embriagador y peligrosamente sexy, el aroma desfila en una pasarela de los adictivos Powdery Woods.',24.99,56,'2019-12-14'),(4,1000,10,2,26,'Black Opium','El eau de parfum Black Opium original. \r\nUn cautivador aroma floral gourmand, mezclado con una sobredosis de café negro, para una inyección de adrenalina. Energía, sensualidad, junto con ese toque único de YSL. \r\nEl característico acorde de café negro se combina con una sensual vainilla, enriquecida por la suavidad de las flores blancas y el azahar, sobre una base de pachulí y reconfortante almizcle blanco. \r\nUn atrevido contraste de luz y oscuridad, para una fragancia femenina que hechiza con su estela.',56.00,34,'2020-07-12'),(5,1000,10,3,20,'N5','N ° 5, la esencia misma de la feminidad. Un ramo de flores en polvo alojado en una botella icónica con un diseño minimalista. Una fragancia atemporal y legendaria.\r\n\r\nEl eau de parfum viene en spray para una aplicación suave y flexible sobre la piel o la ropa.\r\n\r\nPara revivir las notas de la fragancia a lo largo del día, el spray también viene en un práctico formato de viaje que puedes guardar en tu bolso y llevar contigo a cualquier parte.\r\n\r\nTambién está disponible un ritual de perfumado completo para el baño y el cuerpo para realzar el rastro olfativo de la fragancia.',57.00,23,'2020-02-11'),(6,1000,10,1,22,'Bamboo','Inspirándose en el simbolismo de la fuerza y ​​la elegancia, esta seductora fragancia traduce la esencia de la mujer multifacética de hoy. La mujer moderna de Gucci comparte las características de confianza y aplomo de Bamboo. La fragancia es suave e intensa a la vez que irradia poder y feminidad.',34.99,56,'2019-12-06'),(7,1000,10,4,27,'Olympea','Inspirándose en los reinos de la mitología griega, Olympéa de Paco Rabanne es una fragancia celestial para la diosa moderna.\r\n\r\nUna fusión de contrastes, desde los matices de vainilla salada hasta la base de madera de cachemira, llamará tu atención a la primera pulverización. Lo que comienza como dulce se transforma en una mezcla más sofisticada de flores (jazmín, lirio) y ámbar gris embriagador, lo que le da a la fragancia una mayor versatilidad. ¿Pasar del escritorio a la cena? Este es el equipaje de mano que su bolso estaba esperando.',48.00,61,'2020-01-25'),(8,1000,10,1,22,'Diamonds Rose','Una versión más fresca de Diamonds original.',42.00,11,'2020-09-05'),(9,1000,10,4,20,'Coco Mademoiselle','Una fragancia oriental amaderada y ambarina con un carácter con cuerpo: sensual, profundo y adictivo. COCO MADEMOISELLE Eau de Parfum Intense es una fragancia oriental, amaderada y ambarina de carácter extremo. La fragancia se estructura en torno a una sobredosis de pachulí, calentada por un acorde ambarino de absoluto de vainilla y haba tonka. Un corazón de rosa y jazmín y la frescura contrastante de los cítricos añaden sus notas para escribir esta poderosa partitura. El Eau de Parfum Intense viene en spray para una aplicación fácil y generosa sobre la piel o la ropa. Para una sensualidad instantánea, aplicar todos los días, todas las noches y en cada ocasión en las muñecas, detrás de las orejas y en la parte posterior de las rodillas.',86.00,34,'2020-05-13'),(10,1000,10,2,28,'Roberto Cavalli','El perfume Roberto Cavalli pertenece a la familia floral ambarina. Una fragancia exuberante que irradia una fuerza genuina de carácter, estimula y fascina desde el primer contacto ... esencialmente adictivo.',29.99,57,'2020-06-03'),(11,1000,10,2,22,'Diamonds','Perfecto si descubres que eres un amante tanto de las flores elegantes como de los golosos dulces deliciosos, esta fragancia marca la línea entre ambas familias de fragancias. Comenzando con una explosión de notas afrutadas de lichi y frambuesa, al principio, es refrescante y juvenil. Pero, lo dulce se instala rápidamente en un sofisticado ramo de flores: piense en la rosa floreciente, la fresia y el lirio de los valles.',43.00,56,'2019-06-13'),(12,1000,10,1,22,'Guilty Black','Los amantes de Guilty Black sacan a relucir los lados más escandalosos el uno del otro: solos son magníficos, juntos irreprimibles. Sin miedo en su pasión, son descarados, descarados, impredecibles, listos para todos y cada uno de los encuentros explosivos. Su atracción es instintiva: van donde huelen el peligro y entre ellos.\r\n\r\nDemasiado nunca es suficiente para nuestros jóvenes hedonistas, que se impulsan mutuamente a oscurecerse cada vez más. La vida es emocionante y está pensada para vivirla al máximo. Una y otra vez, ceden al placer y la emoción de romper las reglas.\r\n\r\nGucci Guilty Black es un sensual floral oriental que lo invita a disfrutar de sus ardientes deseos.',39.99,32,'2020-05-01'),(13,1000,10,2,23,'Eternity For Women','Una fragancia clásica que transmite una elegancia atemporal. Eternity for Women es simple pero sofisticado. Floral, pero picante.\r\n\r\nInspirado en el romance moderno, el perfume Eternity for Women Eau de Toilette tiene notas florales de lirio blanco y bergamota. Pasa a esencias de rosa blanca y violeta, y se completa con notas secas y especiadas de sándalo y ámbar dorado.\r\n\r\nUna fragancia clásica para la mujer contemporánea.',35.00,20,'2020-08-01'),(14,1000,10,1,25,'Women Fall','Levanta una copa por la ciudad que nunca duerme. Al igual que Times Square en la temporada navideña, DKNY Original Women\'s Fall Limited Edition Eau de Toilette es una fragancia floral afrutada que embotella las vistas y los aromas de las mejores festividades de Nueva York.\r\n\r\nAl igual que Times Square en la temporada navideña, DKNY Original Women\'s Fall Limited Edition Eau de Toilette es una fragancia floral afrutada que embotella las vistas y los aromas de las mejores festividades de Nueva York.',19.90,56,'2020-12-25'),(15,1000,10,4,27,'Lady Million','Tan brillante como un diamante, una fragancia para seducir. Un rastro de flores blancas frescas, calentado con maderas. Estallido: neroli y naranja amarga chocan con una onda de frambuesa. Intenso: absoluto de flor de naranjo y jazmín sambac. Adictivo: entrelazado, miel y sexy pachulí.\r\n\r\nDiamante brillante y atrevido. Brillar para que todos lo vean. Tamaño, corte, brillo; inspirado en el \"Regente\" del Louvre. El diamante más grande del mundo. Es un cabujón cortado en oro. Arquitectónico con curvas. Por Noah Duchaufour- Lawrance.',48.00,34,'2020-04-16'),(16,1000,10,2,26,'Black Opium Storm Illusion','Experimente YSL Black Opium, la fragancia de alta costura rock para mujeres de Yves Saint Laurent.\r\nAdictivo, sin igual en provocación, deliberadamente seductor.\r\nFrente a la embajadora global de fragancias y maquillaje de YSL Beauty, Zoë Kravitz.\r\n\r\nYSL Beauty continúa remasterizando su siempre épico perfume y presenta una NUEVA botella de edición limitada para la firma Black Opium Eau de Parfum. Esta temporada presenta un relámpago brillante y de gran tamaño, para ese toque extra de rock and roll de YSL.',78.00,10,'2019-07-06'),(17,1000,10,4,23,'Angel Nova','Trasciende la realidad de tus sueños. Disfruta de una experiencia olfativa única.\r\nInnovador. Comprometido. Explora Angel Nova: la nueva estrella.\r\n\r\nCombinando la destilación clásica con la innovación biotecnológica, CK ha desarrollado un enfoque más respetuoso con el medio ambiente para sus fragancias: el reciclaje. Este proceso único y exclusivo produce la\r\nrosa sobrenatural de CK , que revela un nuevo olor y revitaliza un ingrediente previamente destilado.',94.00,67,'2019-09-07'),(18,1000,10,1,23,'Alien Mirage','Alien Mirage es la nueva fragancia de edición limitada de CK. La fragancia Floral Aquatic Amber combina notas de pimienta rosa, flor de loto y ámbar blanco para una edición extraordinaria del Alien original. Esta fragancia cristalina es como un soplo de aire fresco y fresco, presentado en la icónica botella con forma de joya de Alien, \"con un toque gris azulado puro y claro.',36.99,67,'2020-11-13'),(19,1000,10,4,21,'212 VIP Rose','DEFINICIÓN DE GLAMOUR\r\n\r\nUn icono ultrafemenino, este nuevo tono de 212 VIP inyecta diversión y color en la ciudad, dando nueva vida a la escena social con emotiva confianza. 212 VIP ROSÉ contiene la esencia de la fiesta más exclusiva de Nueva York presentada en una sofisticada y juguetonamente femenina botella VIP de color rosado mate.\r\n\r\nCOMPLETAMENTE IRRESISTIBLE\r\n\r\nA una apertura glamorosa de Champagne Rosé le sigue un corazón juguetón y seductor de flor de melocotón. El lujoso Queen Wood y el radiante ámbar completan la base colorida y femenina.',39.99,34,'2020-10-21'),(20,1000,10,2,21,'Good Girl','Blanco y negro ... oscuro y claro ... buena chica, mala chica. GOOD GIRL es una fragancia sensual y evocadora nacida de las bellas contradicciones y la dualidad siempre presente de la mujer moderna y la vida moderna.\r\n\r\nEsta fragancia innovadora, fresca y oscura, captura la maravillosa complejidad de una mujer con ingredientes sorprendentes y excepcionales. Las dulces y seductoras cualidades del jazmín le dan a GOOD GIRL su brillo y feminidad. El lado más oscuro de GOOD GIRL se crea con cacao ricamente fragante y tonka embriagadora. La almendra y el café le dan a GOOD GIRL su vitalidad inmediata. El nardo, extraído de una nueva forma que crea una rica delicadeza, es el comodín de la fragancia, que aporta fluidez y feminidad. GOOD GIRL ejemplifica la elegancia sin esfuerzo y el ingenio de la Casa de Herrera.',51.00,15,'2020-10-04'),(21,1000,11,1,27,'1 Million Lucky','Busque sensaciones. Sin limites. Crea tu propia suerte sobre la marcha. ¡La vida es un juego! 1 MILLÓN de suerte. Las notas de salida amaderadas pulsan sobre la adictiva avellana. Una fragancia con ritmo. Estimulando los sentidos.',49.99,23,'2020-10-27'),(22,1000,11,1,21,'Bad Boy','',47.99,24,'2020-10-18'),(23,1000,11,3,32,'Boss Bottled Night','La loción para después del afeitado BOSS BOTTLED para hombres está destinada a convertirse en el arma secreta en el arsenal de seducción del hombre BOSS, infundiéndole la misma presencia convincente que sustenta su éxito durante el día. Una composición única entre elegancia y seducción. Una fragancia intensa y especiada con un carácter decidido, atrevido y masculino. Las maderas son clave en la fragancia: BOSS BOTTLED Night presenta una réplica de la fragancia de una nueva madera rica y exótica, Louro Amarelo.',49.99,22,'2020-11-20'),(24,1000,11,3,30,'Man Eau Fraiche','Una mezcla sexy de notas modernas y un ambiente clásico. Versace Man es una combinación elegante y elegante de notas mediterráneas ligeras y frescas como el neroli y la pimienta negra mezcladas con notas picantes y sensuales de azafrán, cardamomo y tabaco.',21.99,14,'2020-03-12'),(25,1000,11,2,31,'Moschino Forever','Creado para un hombre clásico, con una fuerte personalidad que le permite ser original y único. Una fragancia fresca y sensual con un acorde fougère moderno y sorprendente.',22.99,53,'2020-12-08'),(26,1000,11,4,25,'Le Male','Agregará un toque distinguido a la colección de cualquier hombre. Distinguido por su botella cincelada de inspiración marinera (un homenaje a la musa del diseñador), se destaca tanto a primera vista como al primer rocío, lo que hará que sea fácil de alcanzar por las mañanas antes de un largo día. de trabajo.',44.99,12,'2020-08-28'),(27,1000,11,1,27,'Invictus','Eufóricamente adictivo, una poderosa inyección de adrenalina para los ganadores en serie. Poder, coraje, victoria destilada en una atrevida explosión de frescura y calor. Cuando estás en esto para ganar.',44.99,10,'2020-12-19'),(28,1000,11,4,20,'Polo Red Rush','Una fragancia masculina moderna, Red Rush presenta notas de salida frescas y audaces de manzana y mandarina crujientes. Las notas de salida se complementan con notas medias de menta verde que dan energía y vigorizan. Las notas de fondo de madera de cedro y almizcle completan el secado limpio y moderno. Red Rush es una adición versátil a cualquier armario de fragancias.',26.99,35,'2020-06-13'),(29,1000,11,3,26,'Pod Pure Blue','Se puede llevar en la mano como equipaje de mano a bordo de aviones en cualquier parte del mundo. Perfume Pod tiene un sistema de regulación de presión único que asegura que la botella se ajuste a los cambios de presión de aire durante los vuelos, evitando fugas y permitiéndole estar completamente preparado para el aterrizaje.',3.99,13,'2020-02-05'),(30,1000,11,1,24,'Only The Brave High','Una variación más fresca de la fragancia original. Only The Brave High apunta a la euforia: esa sensación lúcida y embriagadora de estar en la cima del mundo. Conquista el mundo, elévate. Ve más y más alto. Elévate por encima del horizonte. Respire el olor del éxito.',29.50,12,'2020-09-12'),(31,1000,11,1,28,'L\'eauma JEURED','Una nueva fragancia que se inspira en el agua, como símbolo masculino de fuerza y ​​movimiento.',44.99,13,'2019-03-02'),(32,1000,11,1,23,'Homme','Ideal para un hombre al que le gusta mostrar su individualidad moderna, la atrevida botella fucsia es a la vez atrevida y marcando tendencias, y contiene un jugo complejo en su interior.\r\n\r\nLa loción para después del afeitado se abre con notas de salida frescas y cítricas de azahar y bergamota como un aroma inicial atractivo. Pasando a un corazón picante de canela, calentándose a través de cada nota individual, antes de secarse a una base ámbar persistente. ',34.99,14,'2020-10-17'),(33,1000,11,3,24,'Legend Spirit','Una nueva fragancia fresca, aromática y amaderada para hombres.',24.99,17,'2020-08-15'),(34,1000,11,2,29,'BOSS In Motion','BOSS IN MOTION para después del afeitado de BOSS es un fougere oriental compuesto por una mezcla de aceites dulces y especiados con notas frescas de madera. En las notas de salida, notas de naranja brillante y burbujeante rodean el aroma inicial con un estallido de frescura vital. Las notas de corazón incluyen canela, cardomom y nuez moscada que exudan poder energético. En la base, un velo de maderas y notas almizcleras aportan seguridad en sí mismo y sensualidad a esta fragancia masculina ultra contemporánea. La fragancia ideal para hombres.',32.99,17,'2020-12-16'),(35,1000,11,1,22,'Guilty Eau','Gucci Guilty Eau es una evolución del universo de fragancias Gucci Guilty. Una interpretación suave y ligera de las fragancias clásicas Guilty para mujeres y hombres, rompe con la tradición de los eau de toilettes chispeantes y frescos, transmitiendo una actitud más delicada y romántica.\r\n\r\nGuilty Eau para él crea una embriagadora mezcla aromática contrastante de notas de salida de limón y bergamota con noble lirio amaderado, aportando una infusión intrigante a la firma de flor de naranja de la fragancia original. En la base, una suave mezcla de pachulí y almizcle crea el timbre aromático.',34.99,69,'2020-07-19'),(36,1000,11,2,23,'CK IN2U Man','Calvin Klein, una de las marcas de estilo de vida líderes en el mundo, es sinónimo de auténtico estilo minimalista moderno. Todo lo que crea (ropa, accesorios, diseño del hogar) se convierte en un clásico atemporal. Las fragancias premiadas de la etiqueta no son una excepción. El portafolio de fragancias icónicas y atrevidas de Calvin Klein continúa redefiniendo el mundo del perfume.',18.99,80,'2020-11-14'),(37,1000,11,1,23,'CK One','CK One encarna un espíritu universal para un mundo diverso. Es una fragancia icónica que es descaradamente audaz, pero que irradia una simplicidad fresca y juvenil. Celebrando la individualidad y la unidad, esta fragancia evoca la emoción de las oportunidades ilimitadas.\r\n\r\nCombina notas refrescantes de té verde, papaya y bergamota. Perfectamente equilibrado con suaves acentos de nuez moscada, violeta, cardamomo y rosa. Conmovedor y dinámico, CK One es un diálogo entre lo masculino y lo femenino.\r\n\r\nCK One es revolucionario, rechaza los estereotipos de género tradicionales y armoniza el almizcle femenino y masculino en una única fragancia unisex, que atrae a hombres y mujeres por igual.\r\n\r\nEsta fragancia lleva notas frescas de té verde mientras abraza la dulzura del ámbar y el almizcle.',25.99,67,'2020-08-15'),(38,1000,11,2,23,'Eternity For Men','El hombre romántico se enamorará de Calvin Klein Eternity For Men Eau de Toilette; una fragancia masculina sensible pero masculina, fuerte pero refinada. Eternity for Men es fresco pero amaderado, combinando notas frescas y frescas con ingredientes más cálidos. Un clásico que sigue siendo moderno, Calvin Klein Eternity es para el hombre que se trata de familia, trabajo, salud y felicidad. Está a gusto consigo mismo, sus relaciones y su mundo.',36.99,79,'2020-12-24'),(39,1000,11,1,28,'Nuit d\'Issey','Un Eau de Toilette correoso, amaderado y fresco. Una fragancia luminosa entre tensión y atracción.',29.99,18,'2020-07-12'),(40,1000,11,1,30,'L\'Homme Timeless','Una expresión carismática de la elegancia masculina revive la frescura icónica de la fragancia original. Amaderada, especiada y aromática, esta Eau de Toilette para hombres se abre con el inesperado acorde de cardamomo y bergamota, mientras que los toques verdes y afrutados de ruibarbo se mezclan con los toques frescos y picantes del jengibre y la pimienta negra. La vainilla aporta dulzura a las notas de fondo dominadas por la elegante madera de cedro, enriquecida con ámbar seco y almizcles.',22.99,20,'2020-08-15'),(41,1000,11,1,22,'Guilty Black','Los amantes de Guilty Black sacan a relucir los lados más escandalosos el uno del otro: solos son magníficos, juntos irreprimibles. Sin miedo en su pasión, son descarados, descarados, impredecibles, listos para todos y cada uno de los encuentros explosivos. Su atracción es instintiva: van donde huelen el peligro y entre ellos.\r\n\r\nDemasiado nunca es suficiente para nuestros jóvenes hedonistas, que se impulsan mutuamente a oscurecerse cada vez más. La vida es emocionante y está pensada para vivirla al máximo. Una y otra vez, ceden al placer y la emoción de romper las reglas.\r\n\r\nGucci Guilty Black Pour Homme es un atrevido aromatique fougere que lo invita a satisfacer sus deseos más profundos.',34.99,10,'2020-12-19'),(42,1000,11,1,29,'Boss Bottled United','BOSS Bottled United afterhsave para hombres es la encapsulación olfativa de un campo de fútbol del centro de la ciudad, que combina la frescura del aire libre con la calidez urbana de las notas amaderadas. Las notas de plantas silvestres de buchú abren un juego vigorizante y son energizadas por la hierbabuena fresca. Notas amaderadas sensuales y cálidas completan la fragancia para dar sensualidad y fuerza.',59.99,34,'2020-10-25'),(43,1000,12,2,32,'Vampirina','VAMPIRINA. Colonia corporal para niños que cuenta con una fragancia infantil fresca y agradable.',4.99,16,'2020-09-12'),(44,1000,12,1,32,'Flor Bubble','PERFUME AGATHA RUIZ DE LA PRADA FLOR BUBBLE 30 ML\r\nLas Bubbles de Agatha Ruiz de la Prada son perfectas para llevar tu perfume favorito a todas partes. Su pequeño y hermoso frasco de 30ml en forma de pelotita es ideal para tu cosmetiquero mochila cartera o bolso de gimnasio.\r\n!Ya no tienes excusa! Podrás retocar tu aroma favorito en cualquier momento y en cualquier lugar! Encuentra este producto y muchos aromas más en Ripley.com\r\n\r\nEl Perfume Flor de Agatha Ruiz de la Prada es una de nuestras fragancias más famosas gracias a su aroma especial sensual femenino y radiante que se adapta a tu personalidad. Sin duda un aroma que cautiva y que hará que no pases desapercibida.',5.99,55,'2020-08-10'),(45,1000,12,2,32,'Gotas de Bubble Prada','PERFUME AGATHA RUIZ DE LA PRADA GOTAS DE COLOR BUBBLE 30 ML\r\nLas Bubbles de Agatha Ruiz de la Prada son perfectas para llevar tu perfume favorito a todas partes. Su pequeño y hermoso frasco de 30ml en forma de pelotita es ideal para tu cosmetiquero mochila cartera o bolso de gimnasio.\r\n!Ya no tienes excusa! Podrás retocar tu aroma favorito en cualquier momento y en cualquier lugar! Encuentra este producto y muchos aromas más en Ripley.com\r\n\r\nEl Perfume Femenino Cítrico Gotas de Color de Agatha Ruiz de la Prada es un cóctel de frescor alegría y diversión con un aroma envolvente que llena tu mundo de colores positivos vitalidad y alegría.',5.99,25,'2020-12-19'),(46,1000,12,1,32,'Marmol & Son','Bergamota, lavanda, pimienta negra, CO 2, notas medias son cardamomo, geranio cálido, pachulí.\r\nLas notas inferiores son vainilla y almizcle.\r\nEsta fragancia para hombres está basada en el popular personaje de TV y película, por supuesto.',13.98,25,'2020-10-03'),(47,1000,12,2,32,'Shopaholic','El regalo perfecto: regalo ideal para cumpleaños, dulces dieciséis, Navidad, relleno de calcetín y vacaciones.\r\nDivertido y fresco aromas: cada botella tiene su propia forma y aroma único que le encantará.\r\nTamaño de viaje: cada botella tiene 0.68 fl oz',29.99,55,'2020-08-08'),(48,1000,12,4,32,'Niebla Corporal Essence','El regalo perfecto: Regalo ideal para cumpleaños, dulces dieciséis, Navidad, relleno de calcetín y días festivos.\r\nAroma divertido y fresco: Cada botella tiene su propia forma y olor únicos que le encantará.\r\nTamaño viajero: Cada botella tiene .68 fl oz',19.99,20,'2020-12-22'),(49,1000,12,3,32,'Disney Princess','El spray corporal de princesas de Disney es un gran regalo para esa pequeña princesa en tu vida.\r\nEl spray corporal es de 6.8 oz, 6.8 fl oz, spray.',9.99,52,'2020-07-16'),(50,1000,12,4,32,'Mickey Mouse Disney','Su fragancia cítrica tiene una mezcla de cítricos, limón y lima.\r\nSe recomienda para uso casual.',19.99,25,'2020-06-13');
/*!40000 ALTER TABLE `perfume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `contrasenia` varchar(30) NOT NULL,
  `nombre_completo` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1000,'admin','admin','Solange Romero Chacon'),(1001,'Luchito','luchito','Edward Luis Huayllasco Carlos'),(1002,'Aleja','aleja','Alejandra Chacon Talavera'),(1003,'Wal','wal','Walter Romero Guerrero'),(1004,'Key','key','Keyly Romero Chacon'),(1005,'Val','val','Valery Romero Chacon'),(1006,'Jim34','jim34','Jim Leonardo Huertas Canaza'),(1007,'Cinderella','cinderella','Shyndell Cutipa Ayala'),(1008,'LuisaGamer','luisagamer','Luisa Villanueva Guerrero'),(1009,'Kath','kath','Katherin Tejada Rivera'),(1010,'prueba','prueba','Prueba Prueba');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarjeta` (
  `numero` int(11) NOT NULL,
  `id_pago` int(11) DEFAULT NULL,
  `fecha_exp` date NOT NULL,
  `propietario` varchar(150) NOT NULL,
  `cvc` varchar(30) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `id_pago` (`id_pago`),
  CONSTRAINT `tarjeta_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
INSERT INTO `tarjeta` VALUES (987,2,'2020-12-23','Shyndell Bbita','987'),(7853,5,'2021-01-20','Aleja2','675'),(12398,7,'2020-12-17','yopi2','345'),(14586,3,'2020-12-31','Dainelle Cutipa Ayala','123'),(75432,6,'2020-12-17','Yopi','376'),(678543,1,'2020-12-28','Yop','564'),(762341,4,'2021-01-13','Alejaajela','876');
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'Agua de Toilette','La concentración de esencia varía entre el 8 y el 15%. Las fragancias siguen siendo frescas pero aumenta la fijación, llegando a durar el aroma hasta tres horas. Este formato es perfecto para usar en verano así como para los usuarios más jóvenes que aún no se atrevan con los perfumes.'),(2,'Agua de Perfume','La concentración de esencia aumenta hasta el 16-18%, y la duración de la fragancia sobre nuestra piel puede llegar a las seis horas. En verano mejor reservar este formato únicamente para las noches más frescas. También podemos llevarlo si trabajamos en lugares cerrados con aire acondicionado. Es una buena alternativa a los perfumes puros, ya que al ser menos concentrados suelen ser también más económicos.'),(3,'Splash de Perfume','Un Splash de Perfume se caracteriza por tener una concentración mucho menor de las notas aromáticas. Un perfume puede tener un 20%, mientras que el Splash de Perfume solo llega al 5%.'),(4,'Agua de Colonia','Es el formato más ligero, contiene entre un 6 y un 8% de esencia. Es perfecto para las épocas más calurosas, y al tratarse de aromas ligeros puedes usar bastante cantidad sin miedo a recargar demasiado. La parte negativa es que el olor no nos durará demasiadas horas, por lo que tendremos que repetir la aplicación a lo largo del día.');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pressence_perfume'
--
/*!50003 DROP PROCEDURE IF EXISTS `cantidad_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `cantidad_clientes`()
BEGIN
	SELECT COUNT(c.id_persona) AS nroclientes
	FROM cliente c;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `categoria_producto_cantidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `categoria_producto_cantidad`(IN ID INT)
BEGIN
	SELECT c.id, c.nombre, COUNT(p.id_categoria) AS nroproductos
	FROM categoria c
	LEFT JOIN perfume p ON p.id_categoria =c.id
	WHERE c.id = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `checking`(IN user_name varchar(40), IN contrase VARCHAR(30))
BEGIN
	SELECT *
	FROM persona
	WHERE persona.username = user_name AND persona.contrasenia = contrase;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cliente_estrella` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `cliente_estrella`()
BEGIN
	SELECT c.nombre_completo AS nombre, a.id_persona AS id, count(b.id) AS total
	FROM cliente a
	LEFT JOIN pedido b ON b.id_persona_cliente = a.id_persona 
	JOIN persona c ON c.id = a.id_persona
	GROUP BY a.id_persona 
	ORDER BY (COUNT(b.id)) DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comprobar_cantidad_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `comprobar_cantidad_producto`(IN ID_PEDIDO INT, IN ID_PERFUME INT, IN ID_P_C INT )
BEGIN
	SELECT pp.cantidad
	FROM pedido_perfume pp
	WHERE id_pedido = ID_PEDIDO AND id_perfume = ID_PERFUME AND id_persona_cliente = ID_P_C;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DELETE_F` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `DELETE_F`(IN ID_PERSONA_CLIENTE INT, IN ID_PERFUME INT)
BEGIN
	DELETE
	FROM cliente_gusta_perfume
	WHERE id_persona_cliente = ID_PERSONA_CLIENTE AND id_perfume = ID_PERFUME;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DELETE_PERFUME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `DELETE_PERFUME`(IN ID INT)
BEGIN
DELETE
FROM perfume
WHERE id = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DELETE_PRODUCTO_CARRITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `DELETE_PRODUCTO_CARRITO`(IN ID_PEDIDO INT, IN ID_PERFUME INT)
BEGIN
	DELETE
	FROM pedido_perfume 
	WHERE id_pedido = ID_PEDIDO AND id_perfume = ID_PERFUME;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getdatacategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getdatacategoria`(IN ID INT)
BEGIN
	SELECT *
	FROM categoria c
	WHERE c.id = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getdatamarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getdatamarca`(IN ID INT)
BEGIN
	SELECT *
	FROM marca m
	WHERE m.id = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getdatatipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getdatatipo`(IN ID INT)
BEGIN
	SELECT *
	FROM tipo t
	WHERE t.id = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_administrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_administrador`(IN ID INT )
BEGIN
	SELECT p.*
	FROM persona p
	LEFT JOIN administrador a ON a.id_persona = p.id
	WHERE p.id = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_agua_banio_hombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_agua_banio_hombre`()
BEGIN
	select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
	ON c.id=p.id_categoria
    INNER JOIN marca m
	ON m.id=p.id_marca
    INNER JOIN tipo t
	ON t.id=p.id_tipo
    WHERE p.id_categoria = 11 AND t.id = 1
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_agua_banio_mujer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_agua_banio_mujer`()
BEGIN
    select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
    ON c.id=p.id_categoria
    INNER JOIN marca m
    ON m.id=p.id_marca
    INNER JOIN tipo t
    ON t.id=p.id_tipo
    WHERE p.id_categoria = 10 AND t.id = 1
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_agua_banio_ninos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_agua_banio_ninos`()
BEGIN
    select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
    ON c.id=p.id_categoria
    INNER JOIN marca m
    ON m.id=p.id_marca
    INNER JOIN tipo t
    ON t.id=p.id_tipo
    WHERE p.id_categoria = 12 AND t.id = 1
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_agua_colonia_hombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_agua_colonia_hombre`()
BEGIN
	select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
	ON c.id=p.id_categoria
    INNER JOIN marca m
	ON m.id=p.id_marca
    INNER JOIN tipo t
	ON t.id=p.id_tipo
    WHERE p.id_categoria = 11 AND t.id = 4
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_agua_colonia_mujer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_agua_colonia_mujer`()
BEGIN
    select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
    ON c.id=p.id_categoria
    INNER JOIN marca m
    ON m.id=p.id_marca
    INNER JOIN tipo t
    ON t.id=p.id_tipo
    WHERE p.id_categoria = 10 AND t.id = 4
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_agua_colonia_ninos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_agua_colonia_ninos`()
BEGIN
    select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
    ON c.id=p.id_categoria
    INNER JOIN marca m
    ON m.id=p.id_marca
    INNER JOIN tipo t
    ON t.id=p.id_tipo
    WHERE p.id_categoria = 12 AND t.id = 4
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_agua_perfume_hombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_agua_perfume_hombre`()
BEGIN
	select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
	ON c.id=p.id_categoria
    INNER JOIN marca m
	ON m.id=p.id_marca
    INNER JOIN tipo t
	ON t.id=p.id_tipo
    WHERE p.id_categoria = 11 AND t.id = 2
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_agua_perfume_mujer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_agua_perfume_mujer`()
BEGIN
    select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
    ON c.id=p.id_categoria
    INNER JOIN marca m
    ON m.id=p.id_marca
    INNER JOIN tipo t
    ON t.id=p.id_tipo
    WHERE p.id_categoria = 10 AND t.id = 2
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_agua_perfume_ninos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_agua_perfume_ninos`()
BEGIN
    select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
    ON c.id=p.id_categoria
    INNER JOIN marca m
    ON m.id=p.id_marca
    INNER JOIN tipo t
    ON t.id=p.id_tipo
    WHERE p.id_categoria = 12 AND t.id = 2
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_BY_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `GET_BY_ID`(IN ID INT)
BEGIN 
SELECT p.*, c.id as categoria_id, c.nombre as categoria_nombre, m.id as marca_id, m.nombre as marca_nombre, t.id as tipo_id, t.nombre as tipo_nombre, t.descripcion as tipo_descripcion
FROM perfume p 
INNER JOIN categoria c 
ON c.id=p.id_categoria
INNER JOIN marca m 
ON m.id=p.id_marca 
INNER JOIN tipo t 
ON t.id=p.id_tipo 
WHERE p.id = ID; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_cliente`(IN ID INT )
BEGIN
	SELECT p.*, c.id_persona as cliente_id, c.correo as cliente_correo, 
			c.telefono as cliente_telefono, 
			c.genero as cliente_genero, c.fecha_nacimiento as cliente_fecha_nacimiento
	FROM persona p
	LEFT JOIN cliente c ON c.id_persona = p.id
	WHERE p.id = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_cuentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_cuentas`(IN ID INT )
BEGIN
	SELECT id, CONCAT(calle," ",provincia, " ", pais, " ", ciudad) as info
	FROM cuenta
	WHERE id_persona_cliente = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_favs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_favs`(IN ID_CLIENTE INT)
BEGIN
	SELECT p.*, m.id as marca_id, m.nombre as marca_nombre
	FROM perfume p 
	JOIN cliente_gusta_perfume cgp ON cgp.id_perfume = p.id
	JOIN cliente c ON c.id_persona = cgp.id_persona_cliente 
	JOIN marca m ON m.id = p.id_marca 
	WHERE c.id_persona = ID_CLIENTE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_id_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_id_pedido`(IN ID INT )
BEGIN
	SELECT *
	FROM pedido p
	WHERE id_persona_cliente = ID AND id_pago IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_new_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_new_id`()
BEGIN
	SELECT MAX(id) + 1
	FROM perfume;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_new_id_pago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_new_id_pago`()
BEGIN
	select auto_increment 
	from information_schema.tables 
	where table_schema = 'pressence_perfume' 
	AND table_name ='pago';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_new_id_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_new_id_pedido`()
BEGIN
	SELECT MAX(id) + 1
	FROM pedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_new_id_persona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_new_id_persona`()
BEGIN
	SELECT MAX(id) + 1
	FROM persona;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_new_id_tarjeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_new_id_tarjeta`()
BEGIN
	select auto_increment 
	from information_schema.tables 
	where table_schema = 'pressence_perfume' 
	AND table_name ='tarjeta';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_opinions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_opinions`(IN ID_PERFUME INT)
BEGIN
	SELECT e.id_persona_cliente as id_cliente , per.nombre_completo as cliente, e.puntuacion as puntuacion, e.opinion as opinion
	FROM cliente_evalua_perfume e
	JOIN perfume p ON e.id_perfume = p.id
	JOIN cliente c ON c.id_persona = e.id_persona_cliente 
	JOIN persona per ON c.id_persona = per.id
	WHERE p.id = ID_PERFUME;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_pedido_montos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_pedido_montos`(IN ID_PEDIDO INT )
BEGIN
	SELECT p.id as perfume_id, p.nombre as producto, (p.precio*pp.cantidad) as monto
	FROM pedido_perfume pp
	JOIN perfume p ON p.id = pp.id_perfume 
	WHERE id_pedido = ID_PEDIDO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_pedido_monto_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_pedido_monto_total`(IN ID_PEDIDO INT )
BEGIN
	SELECT SUM(p.precio*pp.cantidad) as total
	FROM pedido_perfume pp
	JOIN perfume p ON p.id = pp.id_perfume 
	WHERE id_pedido = ID_PEDIDO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_pedido_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_pedido_productos`(IN ID_PEDIDO INT )
BEGIN
	SELECT pp.*, p.id as perfume_id, p.nombre as producto, p.precio as precio, m.nombre as marca, t.nombre as tipo
	FROM pedido_perfume pp
	JOIN perfume p ON p.id = pp.id_perfume 
	JOIN marca m ON m.id = p.id_marca 
	JOIN tipo t ON t.id = p.id_tipo 
	WHERE id_pedido = ID_PEDIDO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_perfume_hombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_perfume_hombre`()
BEGIN
	select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
	ON c.id=p.id_categoria
    INNER JOIN marca m
	ON m.id=p.id_marca
    INNER JOIN tipo t
	ON t.id=p.id_tipo
    WHERE p.id_categoria = 11
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_perfume_mujer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_perfume_mujer`()
BEGIN
    select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
    ON c.id=p.id_categoria
    INNER JOIN marca m
    ON m.id=p.id_marca
    INNER JOIN tipo t
    ON t.id=p.id_tipo
    WHERE p.id_categoria = 10
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_perfume_ninos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_perfume_ninos`()
BEGIN
    select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
    ON c.id=p.id_categoria
    INNER JOIN marca m
    ON m.id=p.id_marca
    INNER JOIN tipo t
    ON t.id=p.id_tipo
    WHERE p.id_categoria = 12
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_persona_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_persona_by_id`(IN ID INT )
BEGIN
	SELECT p.*
	FROM persona p
	WHERE p.id = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_splash_perfume_hombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_splash_perfume_hombre`()
BEGIN
	select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
	ON c.id=p.id_categoria
    INNER JOIN marca m
	ON m.id=p.id_marca
    INNER JOIN tipo t
	ON t.id=p.id_tipo
    WHERE p.id_categoria = 11 AND t.id = 3
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_splash_perfume_mujer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_splash_perfume_mujer`()
BEGIN
    select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
    ON c.id=p.id_categoria
    INNER JOIN marca m
    ON m.id=p.id_marca
    INNER JOIN tipo t
    ON t.id=p.id_tipo
    WHERE p.id_categoria = 10 AND t.id = 3
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_splash_perfume_ninos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_splash_perfume_ninos`()
BEGIN
    select p.*, c.id as 'categoria_id', c.nombre as 'categoria_nombre', m.id as 'marca_id', m.nombre as 'marca_nombre', t.id as 'tipo_id', t.nombre as 'tipo_nombre', t.descripcion as 'tipo_descripcion'
    FROM perfume p
    INNER JOIN categoria c
    ON c.id=p.id_categoria
    INNER JOIN marca m
    ON m.id=p.id_marca
    INNER JOIN tipo t
    ON t.id=p.id_tipo
    WHERE p.id_categoria = 12 AND t.id = 3
    ORDER BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `INSERT_CLIENTE`(IN ID_PERSONA INT, CORREO varchar(40), IN TELEFONO varchar(30), IN GENERO varchar(200), IN FECHA_NACIMIENTO DATE)
BEGIN
INSERT INTO `cliente`(`id_persona`, `correo`, `telefono`, `genero`, `fecha_nacimiento`) 
VALUES (ID_PERSONA, CORREO, TELEFONO, GENERO, FECHA_NACIMIENTO);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_DETALLES_CUENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `INSERT_DETALLES_CUENTA`(IN ID INT, IN ID_PERSONA_CLIENTE INT, IN TELEFONO INT, IN CALLE VARCHAR(50),IN PROVINCIA VARCHAR(50),
				IN PAIS VARCHAR(50), IN CIUDAD VARCHAR(50), IN REFERENCIA VARCHAR(100), IN CODIGO_POSTAL INT)
BEGIN
INSERT INTO cuenta(id, id_persona_cliente, telefono, calle, provincia,pais, ciudad, referencia,codigo_postal ) 
VALUES (ID, ID_PERSONA_CLIENTE, TELEFONO, CALLE, PROVINCIA, PAIS, CIUDAD, REFERENCIA, CODIGO_POSTAL);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_FAVORITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `INSERT_FAVORITO`(IN ID_PERFUME INT, IN ID_PERSONA_CLIENTE INT )
BEGIN
INSERT INTO cliente_gusta_perfume (id_perfume , id_persona_cliente) 
VALUES (ID_PERFUME, ID_PERSONA_CLIENTE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_OPINION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `INSERT_OPINION`(IN ID_PERSONA_CLIENTE INT, IN ID_PERFUME INT, IN PUNTUACION INT, IN opinion MEDIUMTEXT)
BEGIN
INSERT INTO cliente_evalua_perfume(id_persona_cliente, id_perfume, puntuacion, opinion ) 
VALUES (ID_PERSONA_CLIENTE, ID_PERFUME, PUNTUACION, OPINION );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_PAGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `INSERT_PAGO`(IN ID INT, IN ID_CUENTA INT, IN ID_PEDIDO INT, IN FECHA_PAGO DATE, IN TOTAL_PRECIO INT, IN ID_PERSONA_CLIENTE INT, IN NUMERO_TARJETA INT)
BEGIN
INSERT INTO tarjeta(id, id_cuenta, id_pedido, fecha_pago, total_precio, id_persona_cliente,numero_tarjeta) 
VALUES (ID, ID_CUENTA, ID_PEDIDO, FECHA_PAGO, TOTAL_PRECIO, ID_PERSONA_CLIENTE, NUMERO_TARJETA);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `INSERT_PEDIDO`(IN ID INT, IN ID_PERSONA_CLIENTE INT, IN FECHA_PEDIDO DATE, IN ID_PAGO INT)
BEGIN
INSERT INTO pedido(id , id_persona_cliente, fecha_pago, id_pago) 
VALUES (ID, ID_PERSONA_CLIENTE, FECHA_PEDIDO, ID_PAGO);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_PEDIDO_PERFUME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `INSERT_PEDIDO_PERFUME`(IN ID_PEDIDO INT, IN ID_PERFUME INT, IN cantidad INT, IN ID_PERSONA_CLIENTE INT)
BEGIN
INSERT INTO pedido_perfume(id_pedido , id_perfume, cantidad, id_persona_cliente) 
VALUES (ID_PEDIDO, ID_PERFUME, CANTIDAD, ID_PERSONA_CLIENTE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_PERFUME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `INSERT_PERFUME`(IN ID INT, ID_PERSONA_ADMINISTRADOR INT,ID_CATEGORIA INT, ID_TIPO INT, ID_MARCA INT, NOMBRE VARCHAR(50), DESCRIPCION MEDIUMTEXT, PRECIO DOUBLE(5,2), STOCK INT, FECHA_INGRESO DATE)
BEGIN
INSERT INTO `perfume`(`id`, `id_persona_administrador`, `id_categoria`, `id_tipo`, `id_marca`, `nombre`, `descripcion`, `precio`, `stock`, `fecha_ingreso`) VALUES (ID, ID_PERSONA_ADMINISTRADOR,ID_CATEGORIA, ID_TIPO, ID_MARCA, NOMBRE, DESCRIPCION, PRECIO, STOCK , FECHA_INGRESO );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_PERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `INSERT_PERSONA`(IN ID INT, USERNAME varchar(40), IN CONTRASENIA varchar(30), IN NOMBRE_COMPLETO varchar(200))
BEGIN
INSERT INTO `persona`(`id`, `username`, `contrasenia`, `nombre_completo`) 
VALUES (ID, USERNAME, CONTRASENIA, NOMBRE_COMPLETO);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_TARJETA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `INSERT_TARJETA`(IN NUMERO INT, IN ID_PAGO INT, IN FECHA_EXP DATE, IN PROPIETARIO VARCHAR(150), CVC VARCHAR(30))
BEGIN
INSERT INTO tarjeta(numero, id_pago, fecha_exp, propietario, cvc) 
VALUES (NUMERO, ID_PAGO,FECHA_EXP, PROPIETARIO, CVC);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `is_administrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `is_administrador`(IN ID INT )
BEGIN
	SELECT COUNT(*) AS is_admin
	FROM administrador
	WHERE id_persona = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `is_Fav` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `is_Fav`(IN ID_CLIENTE INT, IN ID_PERFUME INT)
BEGIN
	SELECT * 
	FROM cliente_gusta_perfume  
	WHERE id_persona_cliente = ID_CLIENTE AND id_perfume = ID_PERFUME;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `is_opinion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `is_opinion`(IN ID_CLIENTE INT, IN ID_PERFUME INT)
BEGIN
	SELECT * 
	FROM cliente_evalua_perfume
	WHERE id_persona_cliente = ID_CLIENTE AND id_perfume = ID_PERFUME;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `marca_producto_cantidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `marca_producto_cantidad`(IN ID INT)
BEGIN
	SELECT m.id, m.nombre, COUNT(p.id_marca) AS nroproductos
	FROM marca m
	LEFT JOIN perfume p ON p.id_marca =m.id
	WHERE m.id = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `meses_ganancias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `meses_ganancias`()
BEGIN
	SELECT date_format(p.fecha_pago, '%M') AS Mes, SUM(p.total_precio)
	FROM pago p
	GROUP BY mes
	ORDER BY MONTH(p.fecha_pago);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `monto_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `monto_total`()
BEGIN
	SELECT count(p.id) AS nroclientes, SUM(p.total_precio) AS precio_total
	FROM pago p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pedidos_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `pedidos_cliente`(IN ID INT)
BEGIN
	SELECT p.id, p.fecha_pedido AS fecha, pa.total_precio AS total
	FROM pedido p
	JOIN pago pa ON pa.id = p.id_pago
	WHERE p.id_persona_cliente = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pedidos_ultimos_siete_dias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `pedidos_ultimos_siete_dias`()
BEGIN
	SELECT p.id as id_pago, per.id as id_cliente, p.fecha_pago as fecha, 
			per.nombre_completo as nombre, p.total_precio costo
	FROM pago p
	JOIN persona per ON per.id = p.id_persona_cliente 
	WHERE p.fecha_pago BETWEEN NOW() - INTERVAL 7 DAY AND NOW();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pedido_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `pedido_cliente`(IN ID INT)
BEGIN
	SELECT per.nombre AS perfume, m.nombre AS marca, per.precio AS precio, id_persona_cliente AS id_persona_cliente
	FROM pedido_perfume
	JOIN perfume per ON per.id = id_perfume
	JOIN marca m ON per.id_marca =m.id
	WHERE id_pedido = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `productos_economicos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `productos_economicos`()
BEGIN
	SELECT p.nombre, p.precio, m.nombre, t.nombre, c.nombre
	FROM perfume p
	JOIN marca m ON m.id=p.id_marca
	JOIN tipo t ON t.id=p.id_tipo 
	JOIN categoria c ON c.id=p.id_categoria 
	WHERE p.precio<=20
	ORDER BY p.precio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `productos_ultimas_dos_semanas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `productos_ultimas_dos_semanas`()
BEGIN
SELECT  DATE_FORMAT(p.fecha_ingreso, '%d/%m/%Y') AS 'Fecha de Ingreso', 
		p.nombre 'producto', p.precio, p.stock, m.nombre AS marca, t.nombre AS tipo, c.nombre AS categoria
FROM perfume p
JOIN marca m ON m.id=p.id_marca
JOIN tipo t ON t.id=p.id_tipo 
JOIN categoria c ON c.id=p.id_categoria 
WHERE fecha_ingreso BETWEEN NOW() - INTERVAL 14 DAY AND NOW()
ORDER BY fecha_ingreso DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `producto_del_mes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `producto_del_mes`()
BEGIN
	SELECT p.id,p.nombre, SUM(cep.puntuacion) as puntaje, p.precio, p.descripcion as perfume_descripcion,
			 m.nombre as marca, t.nombre as tipo, t.descripcion as tipo_descripcion, c.nombre as categoria
	FROM perfume p
	JOIN cliente_evalua_perfume cep ON cep.id_perfume = p.id
	JOIN marca m ON m.id = p.id_marca 
	JOIN tipo t ON t.id=p.id_tipo 
	JOIN categoria c ON c.id = p.id_categoria 
	GROUP BY p.id 
	ORDER BY puntaje DESC 
	LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_producto_cantidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `tipo_producto_cantidad`(IN ID INT)
BEGIN
	SELECT t.id, t.nombre, COUNT(p.id_tipo) AS nroproductos
	FROM tipo t
	LEFT JOIN perfume p ON p.id_tipo =t.id
	WHERE t.id = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `total_pedidos_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `total_pedidos_cliente`()
BEGIN
	SELECT c.nombre_completo AS nombre, a.id_persona AS id, COUNT(b.id) AS total
	FROM cliente a
	LEFT JOIN pedido b ON b.id_persona_cliente = a.id_persona
	JOIN persona c ON c.id=a.id_persona 
	GROUP BY a.id_persona 
	ORDER BY c.nombre_completo ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `UPDATE_CLIENTE`(IN ID_CLIENTE INT, IN ID_PERSONA INT, IN CORREO VARCHAR(200), IN TELEFONO INT, IN GENERO VARCHAR(15), IN FECHA_NACIMIENTO DATE)
BEGIN 
	UPDATE cliente
    SET id_persona = ID_PERSONA, correo = CORREO,telefono = TELEFONO, genero = GENERO, fecha_nacimiento = FECHA_NACIMIENTO
	WHERE id_persona = ID_CLIENTE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_PEDIDO_PAGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `UPDATE_PEDIDO_PAGO`(IN ID INT,IN ID_PAGO INT)
BEGIN
	UPDATE pedido
    SET id_pago=ID_PAGO
    WHERE id = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_PERFUME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `UPDATE_PERFUME`(IN ID_PERFUME INT, IN ID INT, IN ID_PERSONA_ADMINISTRADOR INT, IN ID_CATEGORIA INT,IN ID_TIPO INT,IN ID_MARCA INT, IN NOMBRE VARCHAR(50),IN DESCRIPCION MEDIUMTEXT, IN PRECIO DOUBLE(5,2), IN STOCK INT, IN FECHA_INGRESO DATE)
BEGIN
	UPDATE perfume
    SET id=ID,id_persona_administrador=ID_PERSONA_ADMINISTRADOR,id_categoria=ID_CATEGORIA,id_tipo=ID_TIPO,id_marca=ID_MARCA,nombre=NOMBRE,descripcion=DESCRIPCION,precio=PRECIO,stock=STOCK,fecha_ingreso=FECHA_INGRESO
    WHERE id = ID_PERFUME;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_PERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `UPDATE_PERSONA`(IN ID_PERSONA INT, IN ID INT, IN USERNAME VARCHAR(40), IN CONTRASENIA VARCHAR(30), IN NOMBRE_COMPLETO VARCHAR(200))
BEGIN 
	UPDATE persona SET id = ID, username = USERNAME,contrasenia = CONTRASENIA, nombre_completo = NOMBRE_COMPLETO 
	WHERE id = ID_PERSONA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_TARJETA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `UPDATE_TARJETA`(IN NUMERO INT, IN ID_PAGO INT)
BEGIN
	UPDATE tarjeta 
    SET id_pago=ID_PAGO
    WHERE numero = NUMERO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-28 11:56:47
