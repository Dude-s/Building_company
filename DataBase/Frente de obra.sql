CREATE DATABASE IF NOT EXISTS frente_de_obra;

USE frente_de_obra;

/*drop database frente_de_obra;*/
/* Creación de la tabla Proyectos */
CREATE TABLE IF NOT EXISTS `Proyectos` (
   `id_proyecto` INT AUTO_INCREMENT PRIMARY KEY,
   `nombre_proyecto` VARCHAR(100),
   `descripcion` VARCHAR(500)
);

/* Inserción de datos en la tabla Proyectos */
INSERT INTO `Proyectos` (`nombre_proyecto`, `descripcion`) 
VALUES 
('Proyecto 1', 'Descripción del Proyecto 1'),
('Proyecto 2', 'Descripción del Proyecto 2'),
('Proyecto 3', 'Descripción del Proyecto 3');

/* Creación de la tabla Reportes */
CREATE TABLE IF NOT EXISTS `Reportes`(
	`id_reporte` INT AUTO_INCREMENT PRIMARY KEY,
    `id_proyecto` INT,
    `Nombre_reporte` TEXT,
    `Nombre_usuario` VARCHAR(50),
    `Fecha` varchar(10),
    `Actividades_Realizadas` TEXT,
    `Incidentes` TEXT,
    `Metros_cuadrados_realizados` FLOAT,
    `Avance_dia` FLOAT,
    `Estado_semaforo` VARCHAR(10),
    FOREIGN KEY (`id_proyecto`) REFERENCES `Proyectos`(`id_proyecto`)
);


INSERT INTO Reportes (
    id_proyecto,
    Nombre_reporte,
    Nombre_usuario,
    Fecha,
    Actividades_Realizadas,
    Incidentes,
    Metros_cuadrados_realizados,
    Avance_dia,
    Estado_semaforo
) VALUES (1,'Reporte de Avance 1','Usuario1','2023-12-11','Se realizaron las tareas A, B y C en el área X.','Incidente 1: Descripción del incidente 1\nIncidente 2: Descripción del incidente 2',100.5,75.0,'Pendiente');

INSERT INTO Reportes (
    id_proyecto,
    Nombre_reporte,
    Nombre_usuario,
    Fecha,
    Actividades_Realizadas,
    Incidentes,
    Metros_cuadrados_realizados,
    Avance_dia,
    Estado_semaforo
) VALUES (2,'Reporte de Avance 1','Usuario1','2023-12-11','Se realizaron las tareas A, B y C en el área X.','Incidente 1: Descripción del incidente 1\nIncidente 2: Descripción del incidente 2',100.5,75.0,'Pendiente');
INSERT INTO Reportes (
    id_proyecto,
    Nombre_reporte,
    Nombre_usuario,
    Fecha,
    Actividades_Realizadas,
    Incidentes,
    Metros_cuadrados_realizados,
    Avance_dia,
    Estado_semaforo
) VALUES (3,'Reporte de Avance 1','Usuario1','2023-12-11','Se realizaron las tareas A, B y C en el área X.','Incidente 1: Descripción del incidente 1\nIncidente 2: Descripción del incidente 2',100.5,75.0,'Pendiente');


INSERT INTO Reportes (
    id_proyecto,
    Nombre_reporte,
    Nombre_usuario,
    Fecha,
    Actividades_Realizadas,
    Incidentes,
    Metros_cuadrados_realizados,
    Avance_dia,
    Estado_semaforo
) VALUES (3,'Reporte de Avance 1','Usuario1','2023-12-11','Se realizaron las tareas A, B y C en el área X.','Incidente 1: Descripción del incidente 1\nIncidente 2: Descripción del incidente 2',100.5,75.0,'Aceptado');

-- Reporte con diferente fecha y estado 'Pendiente'
INSERT INTO Reportes (
    id_proyecto,
    Nombre_reporte,
    Nombre_usuario,
    Fecha,
    Actividades_Realizadas,
    Incidentes,
    Metros_cuadrados_realizados,
    Avance_dia,
    Estado_semaforo
) VALUES (
    1,
    'Reporte de Avance 1',
    'Usuario1',
    '2023-12-24', -- Nueva fecha
    'Se realizaron las tareas A, B y C en el área X.',
    'Incidente 1: Descripción del incidente 1\nIncidente 2: Descripción del incidente 2',
    12213,
    75.0,
    'Pendiente'
);

-- Reporte con diferente fecha y estado 'Aceptado'
INSERT INTO Reportes (
    id_proyecto,
    Nombre_reporte,
    Nombre_usuario,
    Fecha,
    Actividades_Realizadas,
    Incidentes,
    Metros_cuadrados_realizados,
    Avance_dia,
    Estado_semaforo
) VALUES (
    1,
    'Reporte de Avance 1',
    'Usuario1',
    '2023-12-13', -- Nueva fecha
    'Se realizaron las tareas A, B y C en el área X.',
    'Incidente 1: Descripción del incidente 1\nIncidente 2: Descripción del incidente 2',
    100.5,
    75.0,
    'Aceptado'
);



SELECT Metros_cuadrados_realizados,fecha FROM Reportes WHERE id_proyecto= '1';

UPDATE Reportes SET Estado_semaforo = 'Rechazado' WHERE id_reporte = '3';


select * from reportes;

/*SELECT * FROM reportes WHERE id_proyecto = '1' and Estado_semaforo = 'Pendiente';


/* Creación de la tabla ImagenesReporte */

CREATE TABLE IF NOT EXISTS `ImagenesReporte` (
   `id_imagen` INT AUTO_INCREMENT PRIMARY KEY,
   `Imagen_reporte_id` INT,
   `imagen` TEXT,
   FOREIGN KEY (`Imagen_reporte_id`) REFERENCES `Reportes`(`id_reporte`)
);

select*from ImagenesReporte;

/* Inserción de datos en la tabla ImagenesReporte */
INSERT INTO `ImagenesReporte` (`Imagen_reporte_id`, `imagen`)
VALUES 
(1, 'imagen_reporte_1'),
(2, 'imagen_reporte_2'),
(3, 'imagen_reporte_3');

/* Creación de la tabla Documentos */
CREATE TABLE IF NOT EXISTS `Documentos` (
   `id_documento` INT AUTO_INCREMENT PRIMARY KEY,
   `id_documento_reporte` INT,
   `nombre` VARCHAR(255),
   `archivo_PDF` LONGBLOB,
   `fecha_creacion` TIMESTAMP,
   FOREIGN KEY (`id_documento_reporte`) REFERENCES `Reportes`(`id_reporte`)
);

/* Inserción de datos en la tabla Documentos */
INSERT INTO `Documentos` (`id_documento_reporte`, `nombre`, `archivo_PDF`, `fecha_creacion`)
VALUES 
(1, 'Documento_Reporte_1', 'documento_PDF_1', CURRENT_TIMESTAMP),
(2, 'Documento_Reporte_2', 'documento_PDF_2', CURRENT_TIMESTAMP),
(3, 'Documento_Reporte_3', 'documento_PDF_3', CURRENT_TIMESTAMP);

/* Creación de la tabla users */
CREATE TABLE IF NOT EXISTS `users` (
   `id_Empleado` varchar(50),
   `id_asignado` INT,
   `contraseña` varchar(100),
   `Nombre(s)` VARCHAR(100),
   `Apellidos` varchar(100),
   `Sexo` varchar(1),
   FOREIGN KEY (`id_asignado`) REFERENCES `Proyectos`(`id_proyecto`)
);


select * from users;

/* Inserción de datos en la tabla users */
INSERT INTO `users` (`id_Empleado`, `id_asignado`, `contraseña`, `Nombre(s)`, `Apellidos`, `Sexo`)
VALUES 
('Dir123', 1, 'pass1', 'Usuario 1', 'Apellido 1', 'M'),
('SV456', 2, 'pass2', 'Usuario 2', 'Apellido 2', 'F'),
('SI789', 3, 'pass3', 'Usuario 3', 'Apellido 3', 'M'),
('Res101', 1, 'pass1', 'Usuario 1', 'Apellido 1', 'M');

CREATE TABLE IF NOT EXISTS `Estimaciones` (
	`id_estimacion` INT AUTO_INCREMENT PRIMARY KEY,
   `id_proyecto` INT,
   `numContrato` INT,
   `Nombre_estimacion` TEXT,
   `Nombre_empresa` TEXT,
   `Terminos` TEXT,
   `Materiales` TEXT,
   `Precios_Materiales` TEXT,
   `MaterialUnits` TEXT,
   `Servicios` TEXT,
   `Precio_Servicios` TEXT,
   `Total` float,
   `fecha` varchar(10),
   `SUP` VARCHAR(10),
   `RES` VARCHAR(10),
   `Estado_semaforo` VARCHAR(10),
   `pago` varchar(10),
   FOREIGN KEY (`id_proyecto`) REFERENCES `Proyectos`(`id_proyecto`)
);

INSERT INTO `Estimaciones` (`id_proyecto`, `numContrato`, `Nombre_estimacion`, `Nombre_empresa`, `Terminos`, `Materiales`, `Precios_Materiales`, `MaterialUnits`, `Servicios`, `Precio_Servicios`, `Total`, `fecha`, `SUP`, `RES`, `Estado_semaforo`,`pago`)
VALUES
    (1, 10001, 'Estimacion1', 'Empresa1', 'Términos estimación 1', 'Material1, Material2', '10, 20', '5, 8', 'Servicio1, Servicio2', '30, 40', 150.00, '2023-01-15', 'Pendiente', 'Pendiente', 'Pendiente','Pagado'),
    (2, 10002, 'Estimacion2', 'Empresa2', 'Términos estimación 2', 'Material3, Material4', '15, 25', '6, 9', 'Servicio3, Servicio4', '35, 45', 180.00, '2023-02-20', 'Pendiente', 'Pendiente', 'Pendiente','Pagado'),
    (3, 10003, 'Estimacion3', 'Empresa3', 'Términos estimación 3', 'Material5, Material6', '12, 18', '7, 10', 'Servicio5, Servicio6', '28, 50', 200.00, '2023-03-25', 'Pendiente', 'Pendiente', 'Pendiente','Pagado'),
    (1, 10004, 'Estimacion4', 'Empresa4', 'Términos estimación 4', 'Material7, Material8', '20, 30', '8, 12', 'Servicio7, Servicio8', '45, 60', 250.00, '2023-04-30', 'Pendiente', 'Pendiente', 'Pendiente','Pagado'),
    (2, 10005, 'Estimacion5', 'Empresa5', 'Términos estimación 5', 'Material9, Material10', '25, 35', '10, 15', 'Servicio9, Servicio10', '50, 70', 300.00, '2023-05-05', 'Pendiente', 'Pendiente', 'Pendiente','Pagado'),
    (3, 10006, 'Estimacion6', 'Empresa6', 'Términos estimación 6', 'Material11, Material12', '18, 22', '9, 11', 'Servicio11, Servicio12', '40, 55', 270.00, '2023-06-10', 'Pendiente', 'Pendiente', 'Pendiente','Pagado'),
    (2, 10002, 'Estimacion7', 'Empresa2', 'Términos estimación 2', 'Material3, Material4', '15, 25', '6, 9', 'Servicio3, Servicio4', '35, 45', 180.00, '2023-02-20', 'Pendiente', 'Pendiente', 'Pendiente','Pendiente');


select*from Estimaciones;

/*UPDATE Estimaciones SET pago = 'Pagado' WHERE id_estimacion = 13;*/



/*drop table Estimaciones;*/


/*
drop table prueba;

CREATE TABLE IF NOT EXISTS `prueba` (
	`id_reporte` INT AUTO_INCREMENT PRIMARY KEY,
    `id_proyecto` INT,
    `Nombre_usuario` VARCHAR(50),
    `Fecha` varchar(10),
    `Actividades_Realizadas` VARCHAR(500),
    `Incidentes` VARCHAR(100),
    `Metros_cuadrados_realizados` FLOAT,
    `Avance_dia` FLOAT,
    `Estado_semaforo` VARCHAR(10),
    FOREIGN KEY (`id_proyecto`) REFERENCES `Proyectos`(`id_proyecto`)
);

select*from prueba;*/