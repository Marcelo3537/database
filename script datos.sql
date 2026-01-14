USE monopoly_db;

INSERT INTO casillas (posicion, nombre, tipo) VALUES
(0, 'SALIDA', 'SALIDA'),
(1, 'San José', 'PROPIEDAD'),
(2, 'Caja de Comunidad', 'COMUNIDAD'),
(3, 'Juan Ramón Jiménez', 'PROPIEDAD'),
(4, 'Impuesto sobre el Lujo', 'IMPUESTO'),
(5, 'Tram Metropolitano 1', 'ESTACION'),
(6, 'Perú', 'PROPIEDAD'),
(7, 'Suerte', 'SUERTE'),
(8, 'Nueva', 'PROPIEDAD'),
(9, 'Pintor Picasso', 'PROPIEDAD'),
(10, 'Cárcel', 'CARCEL'),
(11, 'Calle de la Plata', 'PROPIEDAD'),
(12, 'Iberdrola', 'COMPANIA'),
(13, 'Calle del Bronze', 'PROPIEDAD'),
(14, 'Calle de Alicante', 'PROPIEDAD'),
(15, 'Tram Metropolitano 2', 'ESTACION'),
(16, 'Calle de Castelar', 'PROPIEDAD'),
(17, 'Caja de Comunidad', 'COMUNIDAD'),
(18, 'Calle Relleu', 'PROPIEDAD'),
(19, 'Calle de los Postigos', 'PROPIEDAD'),
(20, 'Casino Central', 'CASINO'),
(21, 'San Nicolás', 'PROPIEDAD'),
(22, 'Suerte', 'SUERTE'),
(23, 'Av Juan Bautista La Folra', 'PROPIEDAD'),
(24, 'El Puerto', 'PROPIEDAD'),
(25, 'Tram Metropolitano 3', 'ESTACION'),
(26, 'Alfonso el Sabio', 'PROPIEDAD'),
(27, 'Av Federico Soto', 'PROPIEDAD'),
(28, 'Aquaservice', 'COMPANIA'),
(29, 'Canalejas', 'PROPIEDAD'),
(30, 'Vaya a la Cárcel', 'IR_CARCEL'),
(31, 'Costa Blanca', 'PROPIEDAD'),
(32, 'Av Oviedo', 'PROPIEDAD'),
(33, 'Caja de Comunidad', 'COMUNIDAD'),
(34, 'Av Mrto José Garberí', 'PROPIEDAD'),
(35, 'Tram Metropolitano 4', 'ESTACION'),
(36, 'Suerte', 'SUERTE'),
(37, 'Camino del Faro', 'PROPIEDAD'),
(38, 'Impuesto sobre el Patrimonio', 'IMPUESTO'),
(39, 'Calle de la Dorada', 'PROPIEDAD');

-- Usamos subconsultas para obtener el ID de la casilla por su posición
INSERT INTO propiedades (casilla_id, nombre, precio, alquiler_base, alquiler_nivel_1, alquiler_nivel_2, alquiler_nivel_3, precio_mejora, color_grupo) VALUES
-- LILA
((SELECT id FROM casillas WHERE posicion = 1), 'San José', 60, 2, 10, 30, 90, 50, 'Lila'),
((SELECT id FROM casillas WHERE posicion = 3), 'Juan Ramón Jiménez', 60, 4, 20, 60, 180, 50, 'Lila'),
-- AZUL CLARO
((SELECT id FROM casillas WHERE posicion = 6), 'Perú', 100, 6, 30, 90, 270, 50, 'Azul Claro'),
((SELECT id FROM casillas WHERE posicion = 8), 'Nueva', 100, 6, 30, 90, 270, 50, 'Azul Claro'),
((SELECT id FROM casillas WHERE posicion = 9), 'Pintor Picasso', 120, 8, 40, 100, 300, 50, 'Azul Claro'),
-- ROSA
((SELECT id FROM casillas WHERE posicion = 11), 'Calle de la Plata', 140, 10, 50, 150, 450, 100, 'Rosa'),
((SELECT id FROM casillas WHERE posicion = 13), 'Calle del Bronze', 140, 10, 50, 150, 450, 100, 'Rosa'),
((SELECT id FROM casillas WHERE posicion = 14), 'Calle de Alicante', 160, 12, 60, 180, 500, 100, 'Rosa'),
-- BLANCO
((SELECT id FROM casillas WHERE posicion = 16), 'Calle de Castelar', 180, 14, 70, 200, 550, 100, 'Blanco'),
((SELECT id FROM casillas WHERE posicion = 18), 'Calle Relleu', 180, 14, 70, 200, 550, 100, 'Blanco'),
((SELECT id FROM casillas WHERE posicion = 19), 'Calle de los Postigos', 200, 16, 80, 220, 600, 100, 'Blanco'),
-- ROJO
((SELECT id FROM casillas WHERE posicion = 21), 'San Nicolás', 220, 18, 90, 250, 700, 150, 'Rojo'),
((SELECT id FROM casillas WHERE posicion = 23), 'Av Juan Bautista La Folra', 220, 18, 90, 250, 700, 150, 'Rojo'),
((SELECT id FROM casillas WHERE posicion = 24), 'El Puerto', 240, 20, 100, 300, 750, 150, 'Rojo'),
-- AMARILLO
((SELECT id FROM casillas WHERE posicion = 26), 'Alfonso el Sabio', 260, 22, 110, 330, 800, 150, 'Amarillo'),
((SELECT id FROM casillas WHERE posicion = 27), 'Av Federico Soto', 260, 22, 110, 330, 800, 150, 'Amarillo'),
((SELECT id FROM casillas WHERE posicion = 29), 'Canalejas', 280, 24, 120, 360, 850, 150, 'Amarillo'),
-- VERDE
((SELECT id FROM casillas WHERE posicion = 31), 'Costa Blanca', 300, 26, 130, 390, 900, 200, 'Verde'),
((SELECT id FROM casillas WHERE posicion = 32), 'Av Oviedo', 300, 26, 130, 390, 900, 200, 'Verde'),
((SELECT id FROM casillas WHERE posicion = 34), 'Av Mrto José Garberí', 320, 28, 150, 450, 1000, 200, 'Verde'),
-- AZUL OSCURO
((SELECT id FROM casillas WHERE posicion = 37), 'Camino del Faro', 350, 35, 175, 500, 1100, 200, 'Azul Oscuro'),
((SELECT id FROM casillas WHERE posicion = 39), 'Calle de la Dorada', 400, 50, 200, 600, 1400, 200, 'Azul Oscuro'),
-- ESTACIONES (TRAMS)
((SELECT id FROM casillas WHERE posicion = 5), 'Tram Metropolitano 1', 200, 25, 50, 100, 200, NULL, 'Estacion'),
((SELECT id FROM casillas WHERE posicion = 15), 'Tram Metropolitano 2', 200, 25, 50, 100, 200, NULL, 'Estacion'),
((SELECT id FROM casillas WHERE posicion = 25), 'Tram Metropolitano 3', 200, 25, 50, 100, 200, NULL, 'Estacion'),
((SELECT id FROM casillas WHERE posicion = 35), 'Tram Metropolitano 4', 200, 25, 50, 100, 200, NULL, 'Estacion');

INSERT INTO cartas (tipo, descripcion, efecto, valor) VALUES
('SUERTE', 'Bono de Navidad: La empresa te adelanta una nómina.', 'ganar_dinero', 300),
('SUERTE', 'Lotería de El Gordo: Te ha tocado el reintegro.', 'ganar_dinero', 100),
('SUERTE', 'Multa de tráfico: Ibas demasiado rápido con el coche.', 'perder_dinero', 150),
('COMUNIDAD', 'Error del banco a tu favor.', 'ganar_dinero', 200),
('COMUNIDAD', 'Gastos médicos: Visita inesperada al dentista.', 'perder_dinero', 50),
('SUERTE', 'Vaya directamente a la Cárcel sin pasar por la salida.', 'ir_carcel', 0);