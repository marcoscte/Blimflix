CREATE DATABASE "proyectoBD"
    WITH
    OWNER = root
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


CREATE TABLE USUARIO (CVE_USUARIO SERIAL PRIMARY KEY, NOMBRE_USUARIO VARCHAR(30) NOT NULL,APELLIDO_USUARIO VARCHAR(30), EMAIL_USUARIO VARCHAR(30) NOT NULL, CONTRASENIA_USUARIO VARCHAR(20), TIPO_USUARIO INT, ULTIMA_CONEXION TIMESTAMP);
CREATE TABLE GENERO(CVE_GENERO SERIAL PRIMARY KEY, DESCRIPCION_GENERO VARCHAR(25));
CREATE TABLE DIRECTOR(CVE_DIRECTOR SERIAL PRIMARY KEY, NOMBRE_DIRECTOR VARCHAR(40), PAIS_DIRECTOR VARCHAR(20));
CREATE TABLE ACTORPRINCIPAL(CVE_ACTOR SERIAL PRIMARY KEY, NOMBRE_ACTOR VARCHAR(40), PAIS_ACTOR VARCHAR(20));
CREATE TABLE SERIE(CVE_SERIE SERIAL PRIMARY KEY, TITULO_SERIE VARCHAR(50) NOT NULL, ANIO_SERIE INT NOT NULL, TEMPORADAS INT NOT NULL, PAIS_SERIE VARCHAR(20), PORTADA_SERIE VARCHAR NOT NULL, SINOPSIS_SERIE VARCHAR(500), CVE_DIRECTOR INT REFERENCES DIRECTOR(CVE_DIRECTOR), CVE_ACTOR INT REFERENCES ACTORPRINCIPAL(CVE_ACTOR), CVE_GENERO INT REFERENCES GENERO(CVE_GENERO));
CREATE TABLE USUARIO_SERIE(CVE_USUARIO INT REFERENCES USUARIO(CVE_USUARIO), CVE_SERIE INT REFERENCES SERIE(CVE_SERIE), COMENTARIO VARCHAR(250), CALIFICACION INT);


INSERT INTO USUARIO (NOMBRE_USUARIO, APELLIDO_USUARIO, EMAIL_USUARIO, CONTRASENIA_USUARIO, TIPO_USUARIO) VALUES ('ADMIN', 'ADMIN', 'admin@admin.com', 'root123', 2);
INSERT INTO USUARIO (NOMBRE_USUARIO, APELLIDO_USUARIO, EMAIL_USUARIO, CONTRASENIA_USUARIO, TIPO_USUARIO) VALUES ('Marcos', 'Martinez', 'marcos@algo.com', 'hola123', 1);

INSERT INTO DIRECTOR(NOMBRE_DIRECTOR, PAIS_DIRECTOR) VALUES ('ROBERT KIRKMAN', 'USA');
INSERT INTO DIRECTOR(NOMBRE_DIRECTOR, PAIS_DIRECTOR) VALUES ('CEDRIC ANTONIO KYLES', 'USA');
INSERT INTO DIRECTOR(NOMBRE_DIRECTOR, PAIS_DIRECTOR) VALUES ('ANTHONY E. ZUIKER', 'USA');

INSERT INTO ACTORPRINCIPAL(NOMBRE_ACTOR, PAIS_ACTOR) VALUES ('ANDREW LINCOLN', 'REINO UNIDO');
INSERT INTO ACTORPRINCIPAL(NOMBRE_ACTOR, PAIS_ACTOR) VALUES ('MAX GREENFIELD', 'USA');
INSERT INTO ACTORPRINCIPAL(NOMBRE_ACTOR, PAIS_ACTOR) VALUES ('DAVID CARUSO', 'USA');

INSERT INTO GENERO (DESCRIPCION_GENERO) VALUES ('SUSPENSO');
INSERT INTO GENERO (DESCRIPCION_GENERO) VALUES ('CRIMENES');


INSERT INTO SERIE(TITULO_SERIE, ANIO_SERIE, TEMPORADAS, PAIS_SERIE, PORTADA_SERIE, SINOPSIS_SERIE, CVE_DIRECTOR, CVE_ACTOR, CVE_GENERO) VALUES ('THE WALKING DEAD', 2010, 10, 'USA', 'img/20s.jpg', 'Tras estar en estado de coma, el expolic�a Rick Grimes, descubre que una enfermedad origin� un apocalipsis zombi. Rick liderar� un grupo de sobrevivientes para buscar un lugar seguro, pero las luchas m�s peligrosas surgir�n entre ellos mismos.', 1,1,1);
INSERT INTO SERIE(TITULO_SERIE, ANIO_SERIE, TEMPORADAS, PAIS_SERIE, PORTADA_SERIE, SINOPSIS_SERIE, CVE_DIRECTOR, CVE_ACTOR, CVE_GENERO) VALUES ('THE NEIGHBORHOOD', 2018, 2, 'USA', 'img/19s.jpg', 'Una agradable familia del Medio Oeste se muda a un barrio de Los �ngeles. Calvin, su nuevo vecino, est� preocupado porque cree que los nuevos vecinos alterar�n la cultura del barrio.', 2,2,1);
INSERT INTO SERIE(TITULO_SERIE, ANIO_SERIE, TEMPORADAS, PAIS_SERIE, PORTADA_SERIE, SINOPSIS_SERIE, CVE_DIRECTOR, CVE_ACTOR, CVE_GENERO) VALUES ('CSI MIAMI', 2002, 10, 'USA', 'img/18s.jpg', 'Un equipo de investigadores forenses de la polic�a, utiliza m�todos de tecnolog�a de punta y trabajo policiaco tradicional para resolver cr�menes. Horatio Caine, un ex detective de homicidios dirige al grupo de investigadores que trabajan en los cr�menes en medio de sus alrededores tropicales', 3,3,2);

--Select SERIE.TITULO_SERIE,SERIE.ANIO_SERIE,SERIE.TEMPORADAS,
--SERIE.PAIS_SERIE,SERIE.PORTADA_SERIE,SERIE.SINOPSIS_SERIE,
--ACTORPRINCIPAL.NOMBRE_ACTOR, GENERO.DESCRIPCION_GENERO, 
--DIRECTOR.NOMBRE_DIRECTOR from SERIE 
--INNER JOIN GENERO ON GENERO.CVE_GENERO = SERIE.CVE_GENERO 
--INNER JOIN DIRECTOR ON DIRECTOR.CVE_DIRECTOR = SERIE.CVE_DIRECTOR 
--INNER JOIN ACTORPRINCIPAL ON ACTORPRINCIPAL.CVE_ACTOR = SERIE.CVE_ACTOR ;
--WHERE SERIE.CVE_SERIE = 3;

