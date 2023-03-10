-- CONSULTAS
-- Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre
FROM producto

-- Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio
FROM producto

-- Lista todas las columnas de la tabla producto.
SELECT *
FROM producto

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, (precio/22.09) AS EURO, (precio/19.54) AS DOLLAR
FROM producto

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
-- SELECT P.nombre, (P.precio/22.09) AS EURO, (P.precio/19.54) AS DOLLAR
-- FROM P.productos

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio
FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre), precio
FROM producto;

-- Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) AS ExtractString
FROM fabricante;

-- Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio,0)
FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal. (Revisar)

-- Lista el identificador de los fabricantes que tienen productos en la tabla producto.
SELECT id_fabricante
FROM fabricante
WHERE EXISTS (SELECT id_fabricante
FROM fabricante);

-- Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
SELECT DISTINCT id_fabricante
FROM fabricante;

-- Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre
FROM fabricante
ORDER BY nombre ASC;

-- Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre
FROM fabricante
ORDER BY nombre DESC;

-- Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre
FROM producto
ORDER BY nombre ASC, precio DESC;

-- Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT TOP 5
    *
FROM fabricante;

-- Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta. (Revisar)


-- Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT TOP 1
    nombre, precio
FROM producto
ORDER BY precio ASC;

-- Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT TOP 1
    nombre, precio
FROM producto
ORDER BY precio DESC;

-- Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
SELECT *
FROM fabricante
WHERE id_fabricante =2;

-- Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre
FROM producto
WHERE precio <= 120;

-- Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre
FROM producto
WHERE precio >= 400;

-- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre
FROM producto
WHERE NOT precio >= 400;

-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT nombre
FROM producto
WHERE precio >= 80 AND precio <= 300;

-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT nombre
FROM producto
WHERE precio BETWEEN 60 AND 200;

-- Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
SELECT *
FROM producto
WHERE precio > 200 AND id_fabricante=6;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT *
FROM producto
WHERE id_fabricante = 1 OR id_fabricante = 3 OR id_fabricante = 5;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT *
FROM producto
WHERE id_fabricante IN (1,3,5);

-- Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, precio * 100 AS céntimos
FROM producto;

-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre
FROM fabricante
WHERE nombre LIKE 'S%'

-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre
FROM fabricante
WHERE nombre LIKE '%e'

-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre
FROM fabricante
WHERE nombre LIKE '%w%'

-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre
FROM fabricante
WHERE nombre LIKE '____'

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre
FROM producto
WHERE nombre LIKE '%Portátil%'

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre, precio
FROM producto
WHERE nombre LIKE '%Monitor%' AND precio < 215;

-- Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).

SELECT nombre, precio
FROM producto
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;