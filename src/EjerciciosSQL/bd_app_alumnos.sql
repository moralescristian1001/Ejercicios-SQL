----- Insert de datos iniciales persona
   INSERT INTO persona VALUES
    (1,'Maneiro', 31565839, '1985-06-28','Florencia', 'DNI');
   INSERT INTO persona VALUES
    (2, 'Brumatti', 31000123, '1985-01-13','Patricia', 'DNI');
    INSERT INTO persona VALUES
    (3,'Menendez',20945422, '1982-04-10','Diego','DNI');
    INSERT INTO persona VALUES
    (4, 'Perez', 30999281,'1986-02-05', 'Franzo','DNI');
    INSERT INTO persona VALUES
    (5,'Garcia', 24112872,'1988-01-03', 'Leandro','DNI');

----- Insert de datos iniciales alumno
   INSERT INTO alumno VALUES
    (1,98734,3);
   INSERT INTO alumno VALUES
    (2,09213,4);
   INSERT INTO alumno VALUES
    (3,35839,1);
   INSERT INTO alumno VALUES
    (4,36299,5);
   INSERT INTO alumno VALUES
    (5,11009,2);

----- Insert de datos iniciales carrera

   INSERT INTO carrera VALUES
    (1, 'Carrera a fines a programación y desarrollo de software en general','1960-01-01', null ,'Ingenieria en sistema de información');

   INSERT INTO carrera VALUES
    (2, 'Carrera a fines a construcción, planificación y desarrollo de obras de desarrollo urbano','1980-01-01', null ,'Ingenieria civil');


----- Insert de datos iniciales curso


   INSERT INTO curso VALUES
    (1,2018,5,'Curso sobre el desarrollo avanzado de matemáticas','Análisis matemático',1);

  INSERT INTO curso VALUES
    (2,2018,3, 'Curso sobre diseño de componentes de sistemas de software','Diseño de sistemas',1);

  INSERT INTO curso VALUES
    (3,2018,4, 'Curso sobre el lenguaje de programación JAVA','Java', 1);

  INSERT INTO curso VALUES
    (4,2018,4,'Curso sobre tipos de base de datos y consultas sql','Base de datos-SQL',1);

  INSERT INTO curso VALUES
    (5,2018,5, 'Curso sobre fundamentos base de física','Fisica básica',2);

  INSERT INTO curso VALUES
    (6,2018,10, 'Curso sobre dibujo de planos','Dibujo',2);


----- Insert de datos iniciales inscripciones

INSERT INTO inscripciones_carrera VALUES
(1,'2000-01-01',1,1);
INSERT INTO inscripciones_carrera VALUES
(2,'2003-01-01',2,1);
INSERT INTO inscripciones_carrera VALUES
(3,'2004-01-01',3,1);
INSERT INTO inscripciones_carrera VALUES
(4,'2001-01-01',4,1);

INSERT INTO inscripciones_carrera VALUES
(5,'2000-01-01',5,2);
INSERT INTO inscripciones_carrera VALUES
(6,'2000-01-01',4,2);


INSERT INTO inscripciones_curso VALUES
(1,'2002-01-01',1,1);
INSERT INTO inscripciones_curso VALUES
(2,'2006-01-01',1,2);
INSERT INTO inscripciones_curso VALUES
(3,'2002-01-01',1,3);
INSERT INTO inscripciones_curso VALUES
(4,'2004-01-01',2,1);
INSERT INTO inscripciones_curso VALUES
(5,'2002-01-01',2,3);
INSERT INTO inscripciones_curso VALUES
(6,'2004-01-01',2,4);
INSERT INTO inscripciones_curso VALUES
(7,'2010-01-01',3,1);
INSERT INTO inscripciones_curso VALUES
(8,'2010-01-01',3,3);
INSERT INTO inscripciones_curso VALUES
(9,'2010-01-01',4,1);
INSERT INTO inscripciones_curso VALUES
(10,'2010-01-01',4,3);
INSERT INTO inscripciones_curso VALUES
(11,'2010-01-01',5,3);

INSERT INTO inscripciones_curso VALUES
(12,'2010-01-01',4,3);
INSERT INTO inscripciones_curso VALUES
(13,'2011-01-01',5,4);
INSERT INTO inscripciones_curso VALUES
(14,'2011-01-01',4,4);
INSERT INTO inscripciones_curso VALUES
(15,'2011-01-01',2,5);
INSERT INTO inscripciones_curso VALUES
(16,'2011-01-01',2,6);

SELECT * FROM inscripciones_curso WHERE alumno_id = 2;