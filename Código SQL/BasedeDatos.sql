DROP DATABASE IF EXISTS `pressence_perfume`;
CREATE DATABASE `pressence_perfume`;
USE `pressence_perfume`;

CREATE TABLE `persona` (
  `id` INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `username` VARCHAR(40) NOT NULL,
  `contrasenia` VARCHAR(30) NOT NULL,
  `nombre_completo` VARCHAR(200) NOT NULL
)AUTO_INCREMENT=1000;


CREATE TABLE `administrador` (
  `id_persona` INTEGER PRIMARY KEY NOT NULL
);
	
CREATE TABLE `cliente` (
  `id_persona` INTEGER PRIMARY KEY NOT NULL,
  `correo` VARCHAR(200) NOT NULL,
  `telefono` INTEGER  NOT NULL,
  `genero` VARCHAR(15)  NOT NULL,
  `fecha_nacimiento` DATE NOT NULL 
);


CREATE TABLE `perfume` (
  `id` INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `id_persona_administrador` INTEGER NOT NULL,
  `id_categoria` INTEGER NOT NULL,
  `id_tipo` INTEGER NOT NULL,
  `id_marca` INTEGER NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` MEDIUMTEXT NOT NULL,
  `precio` DOUBLE (5,2) NOT NULL,
  `stock` INTEGER NOT NULL,
  `fecha_ingreso` DATE NOT NULL
);


CREATE TABLE `marca` (
  `id` INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `nombre` VARCHAR(40) NOT NULL
) AUTO_INCREMENT = 20;


CREATE TABLE `categoria` (
  `id` INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `nombre` VARCHAR(15) NOT NULL
)AUTO_INCREMENT = 10;


CREATE TABLE `tipo` (
  `id` INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` MEDIUMTEXT NOT NULL
);


CREATE TABLE `cliente_evalua_perfume` (
  `id_persona_cliente` INTEGER NOT NULL,
  `id_perfume` INTEGER NOT NULL,
  `puntuacion` INTEGER NOT NULL,
  `opinion`MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`id_persona_cliente`, `id_perfume`)
);


CREATE TABLE `cliente_gusta_perfume` (
  `id_persona_cliente` INTEGER NOT NULL,
  `id_perfume` INTEGER NOT NULL,
  PRIMARY KEY (`id_perfume`, `id_persona_cliente`)
);

	
CREATE TABLE `pedido` (
  `id` INTEGER AUTO_INCREMENT NOT NULL,
  `id_persona_cliente` INTEGER NOT NULL ,
  `fecha_pedido` DATE  NOT NULL,
  `id_pago` INTEGER NOT NULL,
  PRIMARY KEY (`id`, `id_persona_cliente`)
) AUTO_INCREMENT = 500;


CREATE TABLE `cuenta` (
  `id` INTEGER AUTO_INCREMENT NOT NULL,
  `id_persona_cliente` INTEGER NOT NULL,
  `telefono` INTEGER NOT NULL,
  `calle` VARCHAR(50) NOT NULL,
  `provincia` VARCHAR(50) NOT NULL ,
  `pais` VARCHAR(50) NOT NULL ,
  `ciudad` VARCHAR(50) NOT NULL,
  `referencia` VARCHAR(100) NOT NULL,
  `codigo_postal` INTEGER NOT NULL,
  PRIMARY KEY (`id`, `id_persona_cliente`)
)AUTO_INCREMENT = 100;

	
CREATE TABLE `pedido_perfume` (
  `id_pedido` INTEGER NOT NULL ,
  `id_perfume` INTEGER  NOT NULL,
  `cantidad` INTEGER NOT NULL ,
  `id_persona_cliente` INTEGER NOT NULL ,
  PRIMARY KEY (`id_pedido`, `id_perfume`, `id_persona_cliente`)
);

	
CREATE TABLE `pago` (
  `id` INTEGER NULL AUTO_INCREMENT PRIMARY KEY,
  `id_cuenta` INTEGER  NOT NULL,
  `id_pedido` INTEGER  NOT NULL,
  `fecha_pago` DATE NOT NULL ,
  `total_precio` DOUBLE(5,2) NOT NULL,
  `id_persona_cliente` INTEGER NOT NULL ,
  `numero_tarjeta` INTEGER NOT NULL
);


CREATE TABLE `tarjeta` (
  `numero` INTEGER PRIMARY KEY NOT NULL,
  `id_pago` INTEGER NOT NULL,
  `fecha_exp` DATE NOT NULL,
  `propietario` VARCHAR(150) NOT NULL ,
  `cvc` VARCHAR(30) NOT NULL
);

ALTER TABLE `administrador` ADD FOREIGN KEY (id_persona) REFERENCES `persona` (`id`);
ALTER TABLE `cliente` ADD FOREIGN KEY (id_persona) REFERENCES `persona` (`id`);
ALTER TABLE `perfume` ADD FOREIGN KEY (id_persona_administrador) REFERENCES `administrador` (`id_persona`);
ALTER TABLE `perfume` ADD FOREIGN KEY (id_categoria) REFERENCES `categoria` (`id`);
ALTER TABLE `perfume` ADD FOREIGN KEY (id_tipo) REFERENCES `tipo` (`id`);
ALTER TABLE `perfume` ADD FOREIGN KEY (id_marca) REFERENCES `marca` (`id`);
ALTER TABLE `cliente_evalua_perfume` ADD FOREIGN KEY (id_persona_cliente) REFERENCES `cliente` (`id_persona`);
ALTER TABLE `cliente_evalua_perfume` ADD FOREIGN KEY (id_perfume) REFERENCES `perfume` (`id`);
ALTER TABLE `cliente_gusta_perfume` ADD FOREIGN KEY (id_persona_cliente) REFERENCES `cliente` (`id_persona`);
ALTER TABLE `cliente_gusta_perfume` ADD FOREIGN KEY (id_perfume) REFERENCES `perfume` (`id`);
ALTER TABLE `cuenta` ADD FOREIGN KEY (id_persona_cliente) REFERENCES `cliente` (`id_persona`);
ALTER TABLE `pedido` ADD FOREIGN KEY (id_persona_cliente) REFERENCES `cliente` (`id_persona`);
ALTER TABLE `pedido` ADD FOREIGN KEY (id_pago) REFERENCES `pago` (`id`);
ALTER TABLE `pedido_perfume` ADD FOREIGN KEY (id_pedido) REFERENCES `pedido` (`id`);
ALTER TABLE `pedido_perfume` ADD FOREIGN KEY (id_perfume) REFERENCES `perfume` (`id`);
ALTER TABLE `pedido_perfume` ADD FOREIGN KEY (id_persona_cliente) REFERENCES `pedido` (`id_persona_cliente`);
ALTER TABLE `pago` ADD FOREIGN KEY (id_cuenta) REFERENCES `cuenta` (`id`);
ALTER TABLE `pago` ADD FOREIGN KEY (id_pedido) REFERENCES `pedido` (`id`);
ALTER TABLE `pago` ADD FOREIGN KEY (id_persona_cliente) REFERENCES `pedido` (`id_persona_cliente`);
ALTER TABLE `pago` ADD FOREIGN KEY (id_persona_cliente) REFERENCES `cuenta` (`id_persona_cliente`);
ALTER TABLE `pago` ADD FOREIGN KEY (numero_tarjeta) REFERENCES `tarjeta` (`numero`);
ALTER TABLE `tarjeta` ADD FOREIGN KEY (id_pago) REFERENCES `pago` (`id`);
