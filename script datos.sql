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

INSERT INTO propiedades (casilla_id, nombre, precio, alquiler_base, color_grupo) VALUES
((SELECT id FROM casillas WHERE posicion = 12), 'Iberdrola', 150, 0, 'Servicios'),
((SELECT id FROM casillas WHERE posicion = 28), 'Aquaservice', 150, 0, 'Servicios');

-- ==========================================
-- INSERTS PARA CARTAS DE COMUNIDAD (SUERTE)
-- ==========================================
INSERT INTO cartas (tipo, descripcion, efecto, valor) VALUES
('COMUNIDAD', 'Bono de Navidad: La empresa te adelanta una nómina por las fiestas. ¡Corre a por un buen jamón! - Ganas 50 ₧', 'ganar_dinero', 50),
('COMUNIDAD', 'Ayuda del Amigo: Tu colega el fontanero te hace un favor: te legaliza una obra sin licencia. - Ganas 50 ₧', 'ganar_dinero', 50),
('COMUNIDAD', 'Lotería de El Gordo: Te ha tocado el reintegro. No es mucho, pero da para un chato de vino y unas bravas. - Ganas 100 ₧', 'ganar_dinero', 100),
('COMUNIDAD', 'Fondos Europeos: Recibes una subvención inesperada para digitalizar tu negocio de churros. - Ganas 120 ₧', 'ganar_dinero', 120),
('COMUNIDAD', 'Plusvalía Inesperada: Vendes un piso que heredaste. El mercado inmobiliario ha hecho el resto. - Ganas 100 ₧', 'ganar_dinero', 100),
('COMUNIDAD', 'Promoción Interna: Te ascienden en el trabajo porque la jefa es prima de tu cuñado. - Ganas 400 ₧', 'ganar_dinero', 400),
('COMUNIDAD', 'Errores del Banco: El cajero automático se ha vuelto loco y te ingresa 250 ₧ de más. ¡Cállate y corre! - Ganas 250 ₧', 'ganar_dinero', 250),
('COMUNIDAD', 'Herencia del Tío Paco: Tu tío lejano de Albacete, del que no sabías nada, te deja un pequeño solar. - Ganas 200 ₧', 'ganar_dinero', 200),
('COMUNIDAD', '"Maletín" Político: Encuentras un maletín olvidado en un parking de un congreso. Discreción, por favor. - Ganas 150 ₧', 'ganar_dinero', 150),
('COMUNIDAD', 'Derechos de Imagen: Descubren que tu cara sale en un meme viral de Internet. Cobras los derechos. - Ganas 50 ₧', 'ganar_dinero', 50),
('COMUNIDAD', 'Tapa de la Semana: Tu bar de tapas recibe un premio. Recibes 50 ₧ de cada jugador por tu receta secreta.', 'cobrar_jugadores', 50),
('COMUNIDAD', 'Cátedra Universitaria: Te han concedido el bono cultural. - Ganas 100 ₧', 'ganar_dinero', 100),
('COMUNIDAD', 'Indulto: Te perdonan una multa de tráfico por un defecto de forma en el formulario. - Ganas 0 pts', 'ganar_dinero', 0),
('COMUNIDAD', 'Black Friday: Encuentras una ganga de pisos a reformar en la costa. Véndela con sobreprecio. - Ganas 250 ₧', 'ganar_dinero', 250),
('COMUNIDAD', 'Cena de Empresa: Tu jefe paga la cuenta y, de propina, te da 100 ₧ para el taxi. - Ganas 100 ₧', 'ganar_dinero', 100),
('COMUNIDAD', 'Venta de Tierras: Vendes unos terrenos rústicos que se convierten en urbanizables por arte de magia. - Ganas 100 ₧', 'ganar_dinero', 100),
('COMUNIDAD', 'La Abuela Interviene: Tu abuela te ingresa dinero para que no te falte nada al ver tu piso vacío. - Ganas 50 ₧', 'ganar_dinero', 50),
('COMUNIDAD', 'Influencer Digital: Consigues un patrocinio fugaz para promocionar un producto de dudosa calidad. - Ganas 50 ₧', 'ganar_dinero', 50),
('COMUNIDAD', 'Error en la Renta: Hacienda se equivoca a tu favor y te devuelve más de lo que esperabas. - Ganas 20 ₧', 'ganar_dinero', 20),
('COMUNIDAD', 'Bote de las Carreras: Ganas el bote en las carreras de caballos. ¡A celebrarlo con marisco! - Ganas 10 ₧', 'ganar_dinero', 10);

-- ==========================================
-- INSERTS PARA CARTAS DE SUERTE (HACIENDA)
-- ==========================================
INSERT INTO cartas (tipo, descripcion, efecto, valor) VALUES
('SUERTE', 'IVA Impagado: Hacienda te pilla intentando ahorrarte el IVA de unas facturas. ¡A pagar! - Pagas 50 ₧', 'perder_dinero', 50),
('SUERTE', 'Aviso de Desahucio: Tienes que pagar el alquiler de una propiedad que tenías ocupada ilegalmente. - Pagas 100 ₧', 'perder_dinero', 100),
('SUERTE', 'Multa de Tráfico: Te llega una multa de radar. Ibas a 140 km/h y te la notifica Correos un mes tarde. - Pagas 50 ₧', 'perder_dinero', 50),
('SUERTE', 'Derrama Vecinal: Los vecinos te obligan a pagar la derrama por un nuevo ascensor de lujo. - Pagas 70 ₧', 'perder_dinero', 70),
('SUERTE', 'Inspección Laboral: Te detectan a un empleado "en negro" limpiando la escalera. Paga la sanción. - Pagas 100 ₧', 'perder_dinero', 100),
('SUERTE', 'Impuesto al Sol: Te multan por no declarar los paneles solares que pusiste en el balcón. - Pagas 20 ₧', 'perder_dinero', 20),
('SUERTE', 'Gasto Boda Gitana: Tienes que pagar el traje de boda a tu sobrino. El banquete ya es cosa del suegro. - Pagas 100 ₧', 'perder_dinero', 100),
('SUERTE', 'Impuesto de Patrimonio: Tienes demasiadas propiedades. Hacienda te recuerda que eres rico. - Pagas 100 ₧', 'perder_dinero', 100),
('SUERTE', 'Crisis Hipotecaria: Tu banco te sube la hipoteca al doble por la subida del Euribor. - Pagas 80 ₧', 'perder_dinero', 80),
('SUERTE', 'Regreso del Político: El político del maletín ha venido a recuperar lo suyo. Paga el doble. - Pagas 50 ₧', 'perder_dinero', 50),
('SUERTE', 'Impuesto de Turismo: Los turistas han llenado tanto tu zona que te cobran un "Impuesto de Masificación". - Pagas 100 ₧', 'perder_dinero', 100),
('SUERTE', 'Cena de Fianza: Estás en el restaurante y te toca pagar la fianza del grupo porque se han dejado la cartera. - Pagas 60 ₧', 'perder_dinero', 60),
('SUERTE', 'ITV Negativa: Tu coche no pasa la ITV por décima vez. Tienes que pagar la multa y la reparación. - Pagas 90 ₧', 'perder_dinero', 90),
('SUERTE', 'Gastos Notariales: El notario te cobra por la tinta y por respirar en su oficina. - Pagas 100 ₧', 'perder_dinero', 100),
('SUERTE', 'Pinchazo en la Rueda: Pinchas una rueda con un clavo oxidado de una obra sin señalizar. - Pagas 50 ₧', 'perder_dinero', 50),
('SUERTE', 'Tasa de Residuos: Te cobran la tasa de reciclaje que nadie sabe para qué sirve. - Pagas 50 ₧', 'perder_dinero', 50),
('SUERTE', 'Gasto de I+D+i: Tienes que invertir en un proyecto de I+D que sabes que no va a funcionar. - Pagas 100 ₧', 'perder_dinero', 100),
('SUERTE', 'Fiesta de Nochevieja: Te toca pagar todos los canapés de la cena de fin de año y te quedas sin uvas. - Pagas 50 ₧', 'perder_dinero', 50),
('SUERTE', 'Alquiler de Casa: Paga a cada jugador 50 ₧ por cada casa/hotel que posean.', 'pagar_jugadores', 50),
('SUERTE', 'Arreglos del Pueblo: El Ayuntamiento de tu pueblo te exige pagar los arreglos de la plaza mayor. - Pagas 50 ₧', 'perder_dinero', 50);