--- EJERCICIO 1 - COMPLEJIDAD BAJA:
--Realizar una consulta para consultar todos los alumnos existentes, mostrar: TipoDoc, Documento, Nombre, Apellido, Legajo.

SELECT p.tipodoc, p.documento, p.nombre, p.apellido, a.legajo FROM alumno a INNER JOIN persona p on a.idpersona = p.identificador;

--- EJERCICIO 2 - COMPLEJIDAD BAJA:
--Realizar una consulta para consultar todas las carreras a la que un alumno esta inscripto, mostrar: Legajo, nombre, apellido, nombre carrera, fechainscripcioncarrera
--ordenado por legajo descendiente

SELECT a.legajo, p.nombre, p.apellido, c2.nombre AS nombre_carrera, ca.fechainscripcion AS fecha_inscripcion_carrera
FROM alumno a
INNER JOIN inscripciones_carrera ca on a.identificador = ca.idalumno
INNER JOIN carrera c2 on ca.idcarrera = c2.identificador
INNER JOIN persona p on a.idpersona = p.identificador
ORDER BY a.legajo DESC;

--- EJERCICIO 3 - COMPLEJIDAD MEDIA:
--Realizar una consulta para consultar la cantidad de inscriptos por curso, mostrando: nombre carrera, nombre curso, cantidad inscriptos, cupo máximo por curso

SELECT
car.nombre AS nombre_carrera,
cur.nombre AS nombre_curso,
(SELECT COUNT(ic.idalumno) FROM inscripciones_curso ic WHERE ic.idcurso = cur.identificador GROUP BY ic.idcurso) AS cantidad_inscriptos,
cur.cupomaximo AS cupo_maximo
FROM curso cur
INNER JOIN carrera car on cur.idcarrera = car.identificador;

--- EJERCICIO 4 - COMPLEJIDAD ALTA:
--Sobre la consulta anterior (copiar y pegarla y modificarla) modificar la sql para que la consulta retorne solo los cursos cuya cantidad de inscripciones
--supera su cupo maximo

SELECT * FROM (
	SELECT
	car.nombre AS nombre_carrera,
	cur.nombre AS nombre_curso,
	(SELECT COUNT(ic.idalumno) FROM inscripciones_curso ic WHERE ic.idcurso = cur.identificador GROUP BY ic.idcurso) AS cantidad_inscriptos,
	cur.cupomaximo AS cupo_maximo
	FROM curso cur
	INNER JOIN carrera car on cur.idcarrera = car.identificador ) AS temp
WHERE temp.cantidad_inscriptos > temp.cupo_maximo;

--- EJERCICIO 5 -  COMPLEJIDAD BAJA:
-- actualizar todos las cursos que posean anio 2018 y cuyo cupo sea menor a 5, y actualizar el cupo de todos ellos a 10.

UPDATE curso SET cupomaximo = 10 WHERE anio = 2018 AND cupomaximo < 5;

--- EJERCICIO 6 -  COMPLEJIDAD ALTA:
-- actualizar todas las fechas de inscripcion a cursados que posean el siguiente error: la fecha de inscripcion al cursado de un
-- alumno es menor a la fecha de inscripcion a la carrera. La nueva fecha que debe tener es la fecha del dia. Se puede hacer en dos pasos, primero
-- realizando la consulta y luego realizando el update manual

SELECT concat(p.nombre,' ',p.apellido) AS nombre,c3.nombre nombre_carrera, c.nombre nombre_curso,ic.fechainscripcion fecha_inscripcion_curso, ic2.fechainscripcion fecha_inscripcion_carrera
FROM inscripciones_curso ic
INNER JOIN alumno a ON ic.idalumno = a.identificador
INNER JOIN persona p ON a.idpersona = p.identificador
INNER JOIN curso c ON ic.idcurso = c.identificador
INNER JOIN inscripciones_carrera ic2 ON c.idcarrera = ic2.idcarrera
INNER JOIN carrera c3 on c.idcarrera = c3.identificador
WHERE ic.fechainscripcion < ic2.fechainscripcion;

UPDATE inscripciones_curso ic
SET fechainscripcion = NOW()
FROM inscripciones_carrera ic2
WHERE ic.fechainscripcion < ic2.fechainscripcion;

--- EJERCICIO 7 - COMPLEJIDAD BAJA:
--INSERTAR un nuevo registro de alumno con tus datos personales, (hacer todos inserts que considera necesario)

INSERT INTO persona VALUES (6,'CC', 1017264978, 'Cristian', 'Morales', '1998-10-20');
INSERT INTO alumno VALUES (6,6, 1250);

--- EJERCICIO 8 -  COMPLEJIDAD BAJA:
-- si se desea comenzar a persistir de ahora en mas el dato de direccion de un alumno y considerando que este es un único cambio string de 200 caracteres.
-- Determine sobre que tabla seria mas conveniente persistir esta información y realizar la modificación de estructuras correspondientes.

--Opción 1 (en caso de que la dirección de la persona no sea obligatoria)
ALTER TABLE persona ADD direccion varchar(200);

--Opción 2(En caso de que la dirección de la persona sea obligatoria y hayan registros existentes sin dirección asociada)
ALTER TABLE persona ADD direccion varchar(200);
UPDATE persona SET direccion = 'N/A' WHERE direccion ISNULL;
ALTER TABLE persona ALTER COLUMN direccion SET NOT NULL;

--Opción 3(En caso de que la persona pueda tener varias direcciones asociadas)
CREATE TABLE dirrecion_persona(
    idpersona integer REFERENCES persona (identificador) NOT NULL,
    direccion varchar(200) NOT NULL
);

