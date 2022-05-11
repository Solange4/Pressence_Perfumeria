
#########################
# REPORTE CLIENTE MODEL
########################

# Cantidad de clientes
CREATE PROCEDURE cantidad_clientes()
BEGIN
    SELECT COUNT(c.id_persona) AS nroclientes
    FROM cliente c;
END;

CALL cantidad_clientes(); 

# Total de pedidos por cliente
CREATE PROCEDURE total_pedidos_cliente()
BEGIN
    SELECT c.nombre_completo AS nombre, a.id_persona AS id, COUNT(b.id) AS total
    FROM cliente a
    LEFT JOIN pedido b ON b.id_persona_cliente = a.id_persona
    JOIN persona c ON c.id=a.id_persona 
    GROUP BY a.id_persona 
    ORDER BY c.nombre_completo ASC;
END;

CALL total_pedidos_cliente(); 

# Pedidos de cada cliente
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS pedidos_cliente 
CREATE PROCEDURE pedidos_cliente(IN ID INT)
BEGIN
    SELECT p.id, p.fecha_pedido AS fecha, pa.total_precio AS total
    FROM pedido p
    JOIN pago pa ON pa.id = p.id_pago
    WHERE p.id_persona_cliente = ID;
END;
//
CALL pedidos_cliente(1001); 


# PEDIDO DEL CLIENTE
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS pedido_cliente 
CREATE PROCEDURE pedido_cliente(IN ID INT)
BEGIN
    SELECT per.nombre AS perfume, m.nombre AS marca, per.precio AS precio, id_persona_cliente AS id_persona_cliente
    FROM pedido_perfume
    JOIN perfume per ON per.id = id_perfume
    JOIN marca m ON per.id_marca =m.id
    WHERE id_pedido = ID;
END;
//
CALL pedido_cliente(1);


# Cliente estrella
CREATE PROCEDURE cliente_estrella()
BEGIN
    SELECT c.nombre_completo AS nombre, a.id_persona AS id, count(b.id) AS total
    FROM cliente a
    LEFT JOIN pedido b ON b.id_persona_cliente = a.id_persona 
    JOIN persona c ON c.id = a.id_persona
    GROUP BY a.id_persona 
    ORDER BY (COUNT(b.id)) DESC;
END;

CALL cliente_estrella(); 

##########################
# REPORTE PEDIDO MODEL
##########################
# Monto Total
CREATE PROCEDURE monto_total()
BEGIN
    SELECT count(p.id) AS nroclientes, SUM(p.total_precio) AS precio_total
    FROM pago p;
END;

CALL monto_total(); 

#Pedidos de los ultimos siete días
CREATE PROCEDURE pedidos_ultimos_siete_dias()
BEGIN
    SELECT p.id as id_pago, per.id as id_cliente, p.fecha_pago as fecha, 
            per.nombre_completo as nombre, p.total_precio costo
    FROM pago p
    JOIN persona per ON per.id = p.id_persona_cliente 
    WHERE p.fecha_pago BETWEEN NOW() - INTERVAL 7 DAY AND NOW();
END;
CALL pedidos_ultimos_siete_dias(); 

# MESES EN LOS QUE SE GENERARON GANANCIAS 
#Ayuda a cambiar el formato de los meses
SET lc_time_names = 'es_PE';
#PROCEDIMIENTO
CREATE PROCEDURE meses_ganancias()
BEGIN
    SELECT date_format(p.fecha_pago, '%M') AS Mes, SUM(p.total_precio)
    FROM pago p
    GROUP BY mes
    ORDER BY MONTH(p.fecha_pago);
END;
CALL meses_ganancias(); 


########################
# REPORTE PRODUCTO MODEL

#PRODUCTO DEL MES
CREATE PROCEDURE producto_del_mes()
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
END;
CALL producto_del_mes(); 

# CANTIDAD DE Productos por Marca
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS marca_producto_cantidad 
CREATE PROCEDURE marca_producto_cantidad(IN ID INT)
BEGIN
    SELECT m.id, m.nombre, COUNT(p.id_marca) AS nroproductos
    FROM marca m
    LEFT JOIN perfume p ON p.id_marca =m.id
    WHERE m.id = ID;
END;
//
CALL marca_producto_cantidad(20); 


# CANTIDAD DE Productos por tipo
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS tipo_producto_cantidad 
CREATE PROCEDURE tipo_producto_cantidad(IN ID INT)
BEGIN
    SELECT t.id, t.nombre, COUNT(p.id_tipo) AS nroproductos
    FROM tipo t
    LEFT JOIN perfume p ON p.id_tipo =t.id
    WHERE t.id = ID;
END;
//
CALL tipo_producto_cantidad(1); 

# CANTIDAD DE Productos por categoria
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS categoria_producto_cantidad 
CREATE PROCEDURE categoria_producto_cantidad(IN ID INT)
BEGIN
    SELECT c.id, c.nombre, COUNT(p.id_categoria) AS nroproductos
    FROM categoria c
    LEFT JOIN perfume p ON p.id_categoria =c.id
    WHERE c.id = ID;
END;
//
CALL categoria_producto_cantidad(10); 

# Productos ingresados en las dos últimas semanas
CREATE PROCEDURE productos_ultimas_dos_semanas()
BEGIN
SELECT  DATE_FORMAT(p.fecha_ingreso, '%d/%m/%Y') AS 'Fecha de Ingreso', 
        p.nombre 'producto', p.precio, p.stock, m.nombre AS marca, t.nombre AS tipo, c.nombre AS categoria
FROM perfume p
JOIN marca m ON m.id=p.id_marca
JOIN tipo t ON t.id=p.id_tipo 
JOIN categoria c ON c.id=p.id_categoria 
WHERE fecha_ingreso BETWEEN NOW() - INTERVAL 14 DAY AND NOW()
ORDER BY fecha_ingreso DESC;
END;

CALL productos_ultimas_dos_semanas(); 


# Productos Económicos: Aquellos que cuestan hasta 20 dólares
CREATE PROCEDURE productos_economicos()
BEGIN
    SELECT p.nombre, p.precio, m.nombre, t.nombre, c.nombre
    FROM perfume p
    JOIN marca m ON m.id=p.id_marca
    JOIN tipo t ON t.id=p.id_tipo 
    JOIN categoria c ON c.id=p.id_categoria 
    WHERE p.precio<=20
    ORDER BY p.precio;
END;

CALL productos_economicos(); 


#########################
# PERFUME MODEL
#########################
USE pressence_perfume;
DELIMITER//
DROP PROCEDURE IF EXISTS GET_BY_ID //
CREATE PROCEDURE GET_BY_ID(IN ID INT)
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
END;
//


USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_PERFUME //
CREATE PROCEDURE DELETE_PERFUME(IN ID INT)
BEGIN
DELETE
FROM perfume
WHERE id = ID;
END;
//


USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_PERFUME //
CREATE PROCEDURE INSERT_PERFUME(IN ID INT, ID_PERSONA_ADMINISTRADOR INT,ID_CATEGORIA INT, ID_TIPO INT, ID_MARCA INT, NOMBRE VARCHAR(50), DESCRIPCION MEDIUMTEXT, PRECIO DOUBLE(5,2), STOCK INT, FECHA_INGRESO DATE)
BEGIN
INSERT INTO `perfume`(`id`, `id_persona_administrador`, `id_categoria`, `id_tipo`, `id_marca`, `nombre`, `descripcion`, `precio`, `stock`, `fecha_ingreso`) VALUES (ID, ID_PERSONA_ADMINISTRADOR,ID_CATEGORIA, ID_TIPO, ID_MARCA, NOMBRE, DESCRIPCION, PRECIO, STOCK , FECHA_INGRESO );
END;
//

# Se utiliza para que las imágenes de
# los productos se guarden con el id del producto a ingresar
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS get_new_id//
CREATE PROCEDURE get_new_id()
BEGIN
	SELECT MAX(id) + 1
	FROM perfume;
END;
//
CALL get_new_id(); 

#Actualiza perfume
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS UPDATE_PERFUME //
CREATE PROCEDURE UPDATE_PERFUME(IN ID_PERFUME INT, IN ID INT, IN ID_PERSONA_ADMINISTRADOR INT, IN ID_CATEGORIA INT,IN ID_TIPO INT,IN ID_MARCA INT, IN NOMBRE VARCHAR(50),IN DESCRIPCION MEDIUMTEXT, IN PRECIO DOUBLE(5,2), IN STOCK INT, IN FECHA_INGRESO DATE)
BEGIN
	UPDATE perfume
    SET id=ID,id_persona_administrador=ID_PERSONA_ADMINISTRADOR,id_categoria=ID_CATEGORIA,id_tipo=ID_TIPO,id_marca=ID_MARCA,nombre=NOMBRE,descripcion=DESCRIPCION,precio=PRECIO,stock=STOCK,fecha_ingreso=FECHA_INGRESO
    WHERE id = ID_PERFUME;
END;
//

#Elimina perfume
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS DELETE_PERFUME //
CREATE PROCEDURE DELETE_PERFUME(IN ID INT)
BEGIN
	DELETE
	FROM perfume 
	WHERE id = ID;
END;
//

########################
# PERFUME HOMBRE MODEL
########################
#Muestra todos los perfumes de la categoria hombre
DROP PROCEDURE IF EXISTS get_perfume_hombre
CREATE PROCEDURE get_perfume_hombre()
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
END

CALL get_perfume_hombre(); 

# Los siguientes procedimientos almacenados muestran todos los productos de la categoría de acuerdo a su tipo
DROP PROCEDURE IF EXISTS get_agua_perfume_hombre
CREATE PROCEDURE get_agua_perfume_hombre()
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
END

CALL get_agua_perfume_hombre();


DROP PROCEDURE IF EXISTS get_agua_banio_hombre
CREATE PROCEDURE get_agua_banio_hombre()
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
END

CALL get_agua_banio_hombre();

DROP PROCEDURE IF EXISTS get_agua_colonia_hombre
CREATE PROCEDURE get_agua_colonia_hombre()
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
END

CALL get_agua_colonia_hombre();



DROP PROCEDURE IF EXISTS get_splash_perfume_hombre
CREATE PROCEDURE get_splash_perfume_hombre()
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
END

CALL get_splash_perfume_hombre();


########################
# PERFUME MUJER MODEL
########################
#Muestra todos los perfumes de la categoria mujer
DROP PROCEDURE IF EXISTS get_perfume_mujer
CREATE PROCEDURE get_perfume_mujer()
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
END

CALL get_perfume_mujer(); 

# Los siguientes procedimientos almacenados muestran todos los productos de la categoría de acuerdo a su tipo
DROP PROCEDURE IF EXISTS get_agua_perfume_mujer
CREATE PROCEDURE get_agua_perfume_mujer()
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
END

CALL get_agua_perfume_mujer();


DROP PROCEDURE IF EXISTS get_agua_banio_mujer
CREATE PROCEDURE get_agua_banio_mujer()
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
END

CALL get_agua_banio_mujer();

DROP PROCEDURE IF EXISTS get_agua_colonia_mujer
CREATE PROCEDURE get_agua_colonia_mujer()
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
END

CALL get_agua_colonia_mujer();



DROP PROCEDURE IF EXISTS get_splash_perfume_mujer
CREATE PROCEDURE get_splash_perfume_mujer()
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
END

CALL get_splash_perfume_mujer();


########################
# PERFUME NIÑOS MODEL
########################
#Muestra todos los perfumes de la categoria ninos
DROP PROCEDURE IF EXISTS get_perfume_ninos
CREATE PROCEDURE get_perfume_ninos()
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
END

CALL get_perfume_ninos(); 

# Los siguientes procedimientos almacenados muestran todos los productos de la categoría de acuerdo a su tipo
DROP PROCEDURE IF EXISTS get_agua_perfume_ninos
CREATE PROCEDURE get_agua_perfume_ninos()
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
END

CALL get_agua_perfume_ninos();


DROP PROCEDURE IF EXISTS get_agua_banio_ninos
CREATE PROCEDURE get_agua_banio_ninos()
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
END

CALL get_agua_banio_ninos();

DROP PROCEDURE IF EXISTS get_agua_colonia_ninos
CREATE PROCEDURE get_agua_colonia_ninos()
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
END

CALL get_agua_colonia_ninos();



DROP PROCEDURE IF EXISTS get_splash_perfume_ninos
CREATE PROCEDURE get_splash_perfume_ninos()
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
END

CALL get_splash_perfume_ninos();


###########################
# TIPO MODEL
###########################
# Obtiene todos los datos del id_tipo
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS getdatatipo 
CREATE PROCEDURE getdatatipo (IN ID INT)
BEGIN
	SELECT *
	FROM tipo t
	WHERE t.id = ID;
END;
//
CALL getdatatipo(1); 

###########################
# CATEGORIA MODEL
###########################
# Obtiene todos los datos del id de la categoria
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS getdatacategoria 
CREATE PROCEDURE getdatacategoria (IN ID INT)
BEGIN
	SELECT *
	FROM categoria c
	WHERE c.id = ID;
END;
//
CALL getdatacategoria(11); 

###########################
# MARCA MODEL
###########################
# Obtiene todos los datos del id de la MARCA
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS getdatamarca 
CREATE PROCEDURE getdatamarca (IN ID INT)
BEGIN
	SELECT *
	FROM marca m
	WHERE m.id = ID;
END;
//
CALL getdatamarca(21); 

########################
# FAVORITO MODEL
# Sirve para comprobar si el perfume ya se encuentra
# en favoritos del cliente en la página web
# Retorna todos los favoritos del cliente
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS is_fav 
CREATE PROCEDURE is_Fav(IN ID_CLIENTE INT, IN ID_PERFUME INT)
BEGIN
	SELECT * 
	FROM cliente_gusta_perfume  
	WHERE id_persona_cliente = ID_CLIENTE AND id_perfume = ID_PERFUME;
END;
//
CALL is_fav(1001,3);



# INSERTAR EN CLIENTE_GUSTA_PERFUME

USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_FAVORITO //
CREATE PROCEDURE INSERT_FAVORITO(IN ID_PERFUME INT, IN ID_PERSONA_CLIENTE INT )
BEGIN
INSERT INTO cliente_gusta_perfume (id_perfume , id_persona_cliente) 
VALUES (ID_PERFUME, ID_PERSONA_CLIENTE);
END;

CALL INSERT_FAVORITO(1, 1010); 


#Da más detalles de los favoritos del cliente
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS get_favs 
CREATE PROCEDURE get_favs(IN ID_CLIENTE INT)
BEGIN
	SELECT p.*, m.id as marca_id, m.nombre as marca_nombre
	FROM perfume p 
	JOIN cliente_gusta_perfume cgp ON cgp.id_perfume = p.id
	JOIN cliente c ON c.id_persona = cgp.id_persona_cliente 
	JOIN marca m ON m.id = p.id_marca 
	WHERE c.id_persona = ID_CLIENTE;
END;
//
CALL get_favs(1001);

#ELimina favoritos
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS DELETE_F //
CREATE PROCEDURE DELETE_F (IN ID_PERSONA_CLIENTE INT, IN ID_PERFUME INT)
BEGIN
	DELETE
	FROM cliente_gusta_perfume
	WHERE id_persona_cliente = ID_PERSONA_CLIENTE AND id_perfume = ID_PERFUME;
END;
//

#################################3
# OPINION model  
########################
# Sirve para comprobar si el perfume ya se encuentra
# en cliente_evalua_perfume(reseñas/opiniones) del cliente en la página web
# Retorna todas las reseñas del cliente
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS is_opinion 
CREATE PROCEDURE is_opinion(IN ID_CLIENTE INT, IN ID_PERFUME INT)
BEGIN
	SELECT * 
	FROM cliente_evalua_perfume
	WHERE id_persona_cliente = ID_CLIENTE AND id_perfume = ID_PERFUME;
END;
//
CALL is_opinion(1001,1);

# Insertar opinion
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_OPINION //
CREATE PROCEDURE INSERT_OPINION(IN ID_PERSONA_CLIENTE INT, IN ID_PERFUME INT, IN PUNTUACION INT, IN opinion MEDIUMTEXT)
BEGIN
INSERT INTO cliente_evalua_perfume(id_persona_cliente, id_perfume, puntuacion, opinion ) 
VALUES (ID_PERSONA_CLIENTE, ID_PERFUME, PUNTUACION, OPINION );
END;

CALL INSERT_OPINION(1010, 1, 5, 'Uno de mis perfumes favoritos.');


# Devuelve todas las opiniones del perfume
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS get_opinions 
CREATE PROCEDURE get_opinions(IN ID_PERFUME INT)
BEGIN
	SELECT e.id_persona_cliente as id_cliente , per.nombre_completo as cliente, e.puntuacion as puntuacion, e.opinion as opinion
	FROM cliente_evalua_perfume e
	JOIN perfume p ON e.id_perfume = p.id
	JOIN cliente c ON c.id_persona = e.id_persona_cliente 
	JOIN persona per ON c.id_persona = per.id
	WHERE p.id = ID_PERFUME;
END;
//
CALL get_opinions(22);


###########################
# LOGIN MODEL
##########################
# Ayudará a verificar si el login del usuario es con su respectiva contraseña
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS checking 
CREATE PROCEDURE checking(IN user_name varchar(40), IN contrase VARCHAR(30))
BEGIN
	SELECT *
	FROM persona
	WHERE persona.username = user_name AND persona.contrasenia = contrase;
END;
//
CALL checking('Luchito', 'luchito');

# Se utiliza en el sistema para hacer que se cree un usuario como cliente, para esa funcionalidad
# tendríamos que trabajar con persona y cliente
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS get_new_id_persona//
CREATE PROCEDURE get_new_id_persona()
BEGIN
	SELECT MAX(id) + 1
	FROM persona;
END;
//
CALL get_new_id_persona();

# Obtiene la información del cliente
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS get_cliente 
CREATE PROCEDURE get_cliente(IN ID INT )
BEGIN
	SELECT p.*, c.id_persona as cliente_id, c.correo as cliente_correo, 
			c.telefono as cliente_telefono, 
			c.genero as cliente_genero, c.fecha_nacimiento as cliente_fecha_nacimiento
	FROM persona p
	LEFT JOIN cliente c ON c.id_persona = p.id
	WHERE p.id = ID;
END;
//
CALL get_cliente(1002);

# Obtiene a la persona por su id
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS get_persona_by_id 
CREATE PROCEDURE get_persona_by_id(IN ID INT )
BEGIN
	SELECT p.*
	FROM persona p
	WHERE p.id = ID;
END;
//
CALL get_persona_by_id(1003);

# Obtiene la información del administrador
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS get_administrador 
CREATE PROCEDURE get_administrador(IN ID INT )
BEGIN
	SELECT p.*
	FROM persona p
	LEFT JOIN administrador a ON a.id_persona = p.id
	WHERE p.id = ID;
END;
//
CALL get_administrador(1000);

# La función nos sirve para verificar si la persona que ingresa
# a la página web es administrador o cliente
# retorna 1 si es admin y 0 si es cliente

USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS is_administrador 
CREATE PROCEDURE is_administrador(IN ID INT )
BEGIN
	SELECT COUNT(*) AS is_admin
	FROM administrador
	WHERE id_persona = ID;
END;
//
CALL is_administrador(1000);
CALL is_administrador(1001);


# INSERTAR EN PERSONA

USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_PERSONA //
CREATE PROCEDURE INSERT_PERSONA(IN ID INT, USERNAME varchar(40), IN CONTRASENIA varchar(30), IN NOMBRE_COMPLETO varchar(200))
BEGIN
INSERT INTO `persona`(`id`, `username`, `contrasenia`, `nombre_completo`) 
VALUES (ID, USERNAME, CONTRASENIA, NOMBRE_COMPLETO);
END;

CALL INSERT_PERSONA(1010 , 'prueba', 'prueba', 'Prueba Prueba'); 


USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_CLIENTE //
CREATE PROCEDURE INSERT_CLIENTE(IN ID_PERSONA INT, CORREO varchar(40), IN TELEFONO varchar(30), IN GENERO varchar(200), IN FECHA_NACIMIENTO DATE)
BEGIN
INSERT INTO `cliente`(`id_persona`, `correo`, `telefono`, `genero`, `fecha_nacimiento`) 
VALUES (ID_PERSONA, CORREO, TELEFONO, GENERO, FECHA_NACIMIENTO);
END;

CALL INSERT_CLIENTE(1010 , 'prueba@gmail.com', '954222911', 'femenino', '2002-10-11'); 



//

#Actualiza persona
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS UPDATE_PERSONA //
CREATE PROCEDURE UPDATE_PERSONA (IN ID_PERSONA INT, IN ID INT, IN USERNAME VARCHAR(40), IN CONTRASENIA VARCHAR(30), IN NOMBRE_COMPLETO VARCHAR(200)) 
BEGIN 
	UPDATE persona SET id = ID, username = USERNAME,contrasenia = CONTRASENIA, nombre_completo = NOMBRE_COMPLETO 
	WHERE id = ID_PERSONA;
END;
//

#Actualiza cliente
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS UPDATE_CLIENTE //
CREATE PROCEDURE UPDATE_CLIENTE (IN ID_CLIENTE INT, IN ID_PERSONA INT, IN CORREO VARCHAR(200), IN TELEFONO INT, IN GENERO VARCHAR(15), IN FECHA_NACIMIENTO DATE) 
BEGIN 
	UPDATE cliente
    SET id_persona = ID_PERSONA, correo = CORREO,telefono = TELEFONO, genero = GENERO, fecha_nacimiento = FECHA_NACIMIENTO
	WHERE id_persona = ID_CLIENTE;
END;
//
##################################
# PEDIDO MODEL
##################################

# INSERTAR PEDIDO
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_PEDIDO //
CREATE PROCEDURE INSERT_PEDIDO(IN ID INT, IN ID_PERSONA_CLIENTE INT, IN FECHA_PEDIDO DATE, IN ID_PAGO INT)
BEGIN
INSERT INTO pedido(id , id_persona_cliente, fecha_pago, id_pago) 
VALUES (ID, ID_PERSONA_CLIENTE, FECHA_PEDIDO, ID_PAGO);
END;

# Se utiliza en el sistema para hacer que el también se cree pedido_perfume a la par con pedido(vista de carrito)
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS get_new_id_pedido//
CREATE PROCEDURE get_new_id_pedido()
BEGIN
	SELECT MAX(id) + 1
	FROM pedido;
END;
//
CALL get_new_id_pedido();


#INSERTAR PEDIDO_PERFUME
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_PEDIDO_PERFUME //
CREATE PROCEDURE INSERT_PEDIDO_PERFUME(IN ID_PEDIDO INT, IN ID_PERFUME INT, IN cantidad INT, IN ID_PERSONA_CLIENTE INT)
BEGIN
INSERT INTO pedido_perfume(id_pedido , id_perfume, cantidad, id_persona_cliente) 
VALUES (ID_PEDIDO, ID_PERFUME, CANTIDAD, ID_PERSONA_CLIENTE);
END;

# INSERTAR CUENTA
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_DETALLES_CUENTA //
CREATE PROCEDURE INSERT_DETALLES_CUENTA(IN ID INT, IN ID_PERSONA_CLIENTE INT, IN TELEFONO INT, IN CALLE VARCHAR(50),IN PROVINCIA VARCHAR(50),
				IN PAIS VARCHAR(50), IN CIUDAD VARCHAR(50), IN REFERENCIA VARCHAR(100), IN CODIGO_POSTAL INT)
BEGIN
INSERT INTO cuenta(id, id_persona_cliente, telefono, calle, provincia,pais, ciudad, referencia,codigo_postal ) 
VALUES (ID, ID_PERSONA_CLIENTE, TELEFONO, CALLE, PROVINCIA, PAIS, CIUDAD, REFERENCIA, CODIGO_POSTAL);
END;

# INSERTAR CUENTA
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_DETALLES_CUENTA //
CREATE PROCEDURE INSERT_DETALLES_CUENTA(IN ID INT, IN ID_PERSONA_CLIENTE INT, IN TELEFONO INT, IN CALLE VARCHAR(50),IN PROVINCIA VARCHAR(50),
				IN PAIS VARCHAR(50), IN CIUDAD VARCHAR(50), IN REFERENCIA VARCHAR(100), IN CODIGO_POSTAL INT)
BEGIN
INSERT INTO cuenta(id, id_persona_cliente, telefono, calle, provincia,pais, ciudad, referencia,codigo_postal ) 
VALUES (ID, ID_PERSONA_CLIENTE, TELEFONO, CALLE, PROVINCIA, PAIS, CIUDAD, REFERENCIA, CODIGO_POSTAL);
END;

 
# INSERTAR TARJETA
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_TARJETA //
CREATE PROCEDURE INSERT_TARJETA(IN NUMERO INT, IN ID_PAGO INT, IN FECHA_EXP DATE, IN PROPIETARIO VARCHAR(150), CVC VARCHAR(30))
BEGIN
INSERT INTO tarjeta(numero, id_pago, fecha_exp, propietario, cvc) 
VALUES (NUMERO, ID_PAGO,FECHA_EXP, PROPIETARIO, CVC);
END;

#OBTIENE UN NUEVO ID DE PAGO que será útil para nuestra página web
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS get_new_id_pago //
CREATE PROCEDURE get_new_id_pago()
BEGIN
	select auto_increment 
	from information_schema.tables 
	where table_schema = 'pressence_perfume' 
	AND table_name ='pago';
END;

CALL get_new_id_pago();

#INSERTAR PAGO
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_PAGO //
CREATE PROCEDURE INSERT_PAGO(IN ID INT, IN ID_CUENTA INT, IN ID_PEDIDO INT, IN FECHA_PAGO DATE, IN TOTAL_PRECIO INT, IN ID_PERSONA_CLIENTE INT, IN NUMERO_TARJETA INT)
BEGIN
INSERT INTO tarjeta(id, id_cuenta, id_pedido, fecha_pago, total_precio, id_persona_cliente,numero_tarjeta) 
VALUES (ID, ID_CUENTA, ID_PEDIDO, FECHA_PAGO, TOTAL_PRECIO, ID_PERSONA_CLIENTE, NUMERO_TARJETA);
END;


# Obtiene las cuentas del cliente
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS get_cuentas
CREATE PROCEDURE get_cuentas(IN ID INT )
BEGIN
	SELECT id, CONCAT(calle," ",provincia, " ", pais, " ", ciudad) as info
	FROM cuenta
	WHERE id_persona_cliente = ID;
END;
//

CALL get_cuentas(1001);

# Obtiene información sobre el pedido que falta pagar
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS get_id_pedido 
CREATE PROCEDURE get_id_pedido(IN ID INT )
BEGIN
	SELECT *
	FROM pedido p
	WHERE id_persona_cliente = ID AND id_pago IS NULL;
END;
//

CALL get_id_pedido(1002);


# Comprueba la cantidad del producto en el pedido
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS comprobar_cantidad_producto
CREATE PROCEDURE comprobar_cantidad_producto (IN ID_PEDIDO INT, IN ID_PERFUME INT, IN ID_P_C INT )
BEGIN
	SELECT pp.cantidad
	FROM pedido_perfume pp
	WHERE id_pedido = ID_PEDIDO AND id_perfume = ID_PERFUME AND id_persona_cliente = ID_P_C;
END;
//

CALL comprobar_cantidad_producto(2, 1, 1002);


# Obtiene los productos del pedido
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS get_pedido_productos
CREATE PROCEDURE get_pedido_productos(IN ID_PEDIDO INT )
BEGIN
	SELECT pp.*, p.id as perfume_id, p.nombre as producto, p.precio as precio, m.nombre as marca, t.nombre as tipo
	FROM pedido_perfume pp
	JOIN perfume p ON p.id = pp.id_perfume 
	JOIN marca m ON m.id = p.id_marca 
	JOIN tipo t ON t.id = p.id_tipo 
	WHERE id_pedido = ID_PEDIDO;
END;
//

CALL get_pedido_productos(1);



# Obtiene el monto de cada uno de los productos incluyendo la cantidad
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS get_pedido_montos
CREATE PROCEDURE get_pedido_montos(IN ID_PEDIDO INT )
BEGIN
	SELECT p.id as perfume_id, p.nombre as producto, (p.precio*pp.cantidad) as monto
	FROM pedido_perfume pp
	JOIN perfume p ON p.id = pp.id_perfume 
	WHERE id_pedido = ID_PEDIDO;
END;
//

CALL get_pedido_montos(1);

# Obtiene el monto total del pedido
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS get_pedido_monto_total
CREATE PROCEDURE get_pedido_monto_total(IN ID_PEDIDO INT )
BEGIN
	SELECT SUM(p.precio*pp.cantidad) as total
	FROM pedido_perfume pp
	JOIN perfume p ON p.id = pp.id_perfume 
	WHERE id_pedido = ID_PEDIDO;
END;
//

CALL get_pedido_monto_total(1);

#Actualiza tarjeta
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS UPDATE_TARJETA //
CREATE PROCEDURE UPDATE_TARJETA(IN NUMERO INT, IN ID_PAGO INT)
BEGIN
	UPDATE tarjeta 
    SET id_pago=ID_PAGO
    WHERE numero = NUMERO;
END;
//
#Actualiza pedido
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS UPDATE_PEDIDO_PAGO//
CREATE PROCEDURE UPDATE_PEDIDO_PAGO(IN ID INT,IN ID_PAGO INT)
BEGIN
	UPDATE pedido
    SET id_pago=ID_PAGO
    WHERE id = ID;
END;
//

#Elimina producto del carrito
USE pressence_perfume;
DELIMITER //
DROP PROCEDURE IF EXISTS DELETE_PRODUCTO_CARRITO //
CREATE PROCEDURE DELETE_PRODUCTO_CARRITO (IN ID_PEDIDO INT, IN ID_PERFUME INT)
BEGIN
	DELETE
	FROM pedido_perfume 
	WHERE id_pedido = ID_PEDIDO AND id_perfume = ID_PERFUME;
END;
//