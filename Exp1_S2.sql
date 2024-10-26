-- Script SQL Creado por [Jaime Barraza]

-- DROPEA las tablas creadas anteriormente
DROP TABLE customers;
DROP TABLE products;
DROP TABLE sales;
DROP TABLE sales_staff;


-- Crear la tabla de Clientes (customers)
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_registro DATE,
    email VARCHAR(100),
    telefono VARCHAR(20)
);

-- Crear la tabla de Productos (products)
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    categoria VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT
);

-- Crear la tabla de Ventas (sales)
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    cantidad INT,
    fecha_venta DATE,
    total_venta DECIMAL(10, 2),
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Crear la tabla de Personal de Ventas (sales_staff)
CREATE TABLE sales_staff (
    staff_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100),
    telefono VARCHAR(20)
);



-- Poblando tabla customers
INSERT INTO customers (customer_id, nombre, apellido, fecha_registro, email, telefono)
    VALUES (1, 'Juan', 'Pérez', '01-01-2024', 'juan.perez@mail.com', '123456789');
INSERT INTO customers (customer_id, nombre, apellido, fecha_registro, email, telefono)
    VALUES (2, 'Ana', 'López', '15-02-2024', 'ana.lopez@mail.com', '987654321');
INSERT INTO customers (customer_id, nombre, apellido, fecha_registro, email, telefono)
    VALUES (3, 'Carlos', 'Gómez', '10-03-2024', 'carlos.gomez@mail.com', '654321987');
INSERT INTO customers (customer_id, nombre, apellido, fecha_registro, email, telefono)
    VALUES (4, 'María', 'Ramírez', '25-05-2024', 'maria.ramirez@mail.com', '321654987');
INSERT INTO customers (customer_id, nombre, apellido, fecha_registro, email, telefono)
    VALUES (5, 'Pedro', 'Sánchez', '30-09-2024', 'pedro.sanchez@mail.com', '456789123');


-- Poblando tabla products
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock)
    VALUES (1, 'Laptop', 'Electrónica', 1500.00, 20);
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock)
    VALUES (2, 'Smartphone', 'Electrónica', 800.00, 50);
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock)
    VALUES (3, 'Televisor', 'Electrónica', 1200.00, 15);
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock)
    VALUES (4, 'Cámara', 'Fotografía', 600.00, 25);
INSERT INTO products (product_id, nombre_producto, categoria, precio, stock)
    VALUES (5, 'Impresora', 'Oficina', 300.00, 10);


-- Poblando tabla sales
INSERT INTO sales (sale_id, customer_id, product_id, cantidad, fecha_venta, total_venta)
    VALUES (1, 1, 1, 1, '01-06-2024', 1500.00);
INSERT INTO sales (sale_id, customer_id, product_id, cantidad, fecha_venta, total_venta)
    VALUES (2, 2, 2, 2, '10-06-2024', 1600.00);
INSERT INTO sales (sale_id, customer_id, product_id, cantidad, fecha_venta, total_venta)
    VALUES (3, 3, 3, 1, '15-06-2024', 1200.00);
INSERT INTO sales (sale_id, customer_id, product_id, cantidad, fecha_venta, total_venta)
    VALUES (4, 4, 4, 3, '20-06-2024', 1800.00);
INSERT INTO sales (sale_id, customer_id, product_id, cantidad, fecha_venta, total_venta)
    VALUES (5, 5, 5, 2, '25-06-2024', 600.00);

-- Poblando tabla sales_staff
INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono)
    VALUES (1, 'Luis', 'Martínez', 'luis.martinez@mail.com', '789456123');
INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono)
    VALUES (2, 'Elena', 'Torres', 'elena.torres@mail.com', '789123456');
INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono)
    VALUES (3, 'Diego', 'Fernández', 'diego.fernandez@mail.com', '456123789');
INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono)
    VALUES (4, 'Lucía', 'Soto', 'lucia.soto@mail.com', '123789456');
INSERT INTO sales_staff (staff_id, nombre, apellido, email, telefono)
    VALUES (5, 'Fernando', 'García', 'fernando.garcia@mail.com', '456987123');

SELECT * FROM sales;

-- Desafio 1
SELECT 
    nombre || ' ' || apellido AS nombre_completo, 
    fecha_registro
FROM 
    customers
WHERE 
    fecha_registro >= ADD_MONTHS(SYSDATE, -1) -- Muestra clientes registrados en el ultimo mes
ORDER BY 
    fecha_registro DESC;


-- Desafio 2
SELECT 
    nombre_producto,
    ROUND(precio+(precio*0.15),1) AS "Precio incrementado en 15%", -- Redondea el incremento al entero
    precio AS "Precio sin incrementar"
FROM 
    products
WHERE 
    nombre_producto LIKE '%a' -- termine en la letra a (sin mayus)
    AND stock > 10
ORDER BY
    2 ASC; -- ordena el listado por el incremento (2) de forma ascendente
    

-- Desafio 3
SELECT 
    nombre || ' ' || apellido AS nombre_completo, 
    email,
    SUBSTR(nombre, 1, 4) || LENGTH(email) || SUBSTR(apellido, -3) AS contrasena_defecto
FROM 
    sales_staff
ORDER BY 
    apellido DESC, 
    nombre ASC;




