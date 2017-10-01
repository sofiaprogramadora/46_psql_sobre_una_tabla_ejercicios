-- Crear la base de datos movies
CREATE DATABASE movies_db;
\c movies_db
-- Crear la tabla movie con las columnas id y name

CREATE TABLE movie(
	id serial PRIMARY KEY,
	name varchar
);

-- Ingresar la película El Rey León

INSERT INTO movie(name) VALUES('El Rey León');

-- Ingresar la película Terminator II

INSERT INTO movie(name) VALUES('Terminator');

-- Alterar la tabla películas para agregar el año

ALTER TABLE movie
	ADD age integer;

-- Cambiar los datos de todas las películas existentes a 1984

UPDATE movie
SET age = 1984;

-- Borrar la película Terminator II


DELETE FROM movie
	WHERE name='Terminator';

-- Crear un usuario nuevo en la base de datos

CREATE USER usuario_select;

-- Asignarle un rol que sólo permite hacer consultas select (no podrá ingresar)

ALTER USER usuario_select NOSUPERUSER;

-- Cambiar de usuario en la base de datos

\q
psql movies_db -U usuario_select

-- Probar que no puede ingresar una película Taller películas

INSERT INTO movie(name) VALUES('Cars');
-- RESULTADO: ERROR:  permission denied for relation movie

-- Ingresar 5 películas más, con nombres y años distintos. devolver las primeras 3 películas (ordenadas alfabéticamente)

INSERT INTO movie(name, age) VALUES('El Rey León', 1948);
INSERT INTO movie(name, age) VALUES('Cars', 2010 );
INSERT INTO movie(name, age) VALUES('La Dama Y El Vagabundo', 1950);
INSERT INTO movie(name, age) VALUES('Arthur', 2005);
INSERT INTO movie(name, age) VALUES('Finding Nemo', 2005);
SELECT name FROM movie ORDER BY name ASC LIMIT 3;

-- devolver las últimas 3 películas (ordenadas por año)

SELECT name FROM age ORDER BY name DESC LIMIT 3;

-- Contar la cantidad de películas en la base de datos

SELECT COUNT(name) FROM movie;

-- Contar la cantidad de películas por año.

-- Cambiar 2005 por el año deseado
SELECT COUNT(name) FROM movie WHERE age=2005;

-- Alterar la tabla para agregar la categoría de la película

ALTER TABLE movie
ADD category varchar;

-- Agregar categorías a todas las películas existentes


UPDATE movie
	SET category = 'Animacion' WHERE NOT name = 'El Rey León';

UPDATE movie
	SET category = 'Infantil' WHERE name = 'El Rey León';

-- Obtener un listado de las categorías (sin repeticiones)


SELECT category FROM (SELECT DISTINCT category FROM  movie) AS Category;