CREATE DATABASE if not exists Frente_de_obra;

USE frente_de_obra;

create table if not exists `Reportes`(
	`id_reporte` INT AUTO_INCREMENT PRIMARY KEY, /*Id del reporte*/
    `Nombre_usuario` VARCHAR(50), /*Nombre de la persona que genero el reporte*/
    `Fecha` DATE,
    `Actividades_Realizadas` VARCHAR(500),/*Contenido del reporte*/
    `Incidentes` VARCHAR(100),
    `Metros_cuadrados_realizados` DECIMAL(5,2),
    `Avance_dia` DECIMAL(3,2), /*Porcentaje de avance*/
    `Estado_semaforo` VARCHAR(10) /*Aceptado, rechazado, pendiente*/
);

/*============================================Tabla de las imagenes de los reportes=====================================================================*/
CREATE TABLE IF NOT EXISTS `ImagenesReporte` (
   `id_imagen` INT AUTO_INCREMENT PRIMARY KEY, /*Id individual de la imagen*/
   `Imagen_reporte_id` INT,					/*Id del reporte al que pertenece*/
   `imagen` BLOB,							/*Imagen guardada*/
   FOREIGN KEY (`Imagen_reporte_id`) REFERENCES `Reportes`(`id_reporte`)
);


/*============================================Tabla de los documentos de los reportes=====================================================================*/
CREATE TABLE IF NOT EXISTS `Documentos` (
   `id_documento` INT AUTO_INCREMENT PRIMARY KEY,	/*Id individual de el documento*/
   `id_documento_reporte` INT,						/*Id del reporte al que pertenece*/
   `nombre` VARCHAR(255),							/*Nombre del documento*/
   `archivo_PDF` LONGBLOB,							/*Guarda el archivo*/
   `fecha_creacion` TIMESTAMP,								
   FOREIGN KEY (`id_documento_reporte`) REFERENCES `Reportes`(`id_reporte`)
);



/*============================================Tabla de los usuarios dados de alta=====================================================================*/
CREATE TABLE IF NOT EXISTS `Documentos` (
   `id_Empleado` int(50),	/*Id individual de cada empleado*/
   `contraseña` varchar(100),
   `Nombre(s)` VARCHAR(100),
   `Apellidos` varchar(100),
   `Sexo` varchar(1)
);
