-- ============================================
-- BASE DE DATOS: MONOPOLY CASINO Y TAPAS
-- ============================================

DROP DATABASE IF EXISTS monopoly_db;
CREATE DATABASE monopoly_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE monopoly_db;

-- ==================================
-- USUARIOS Y PERFIL
-- ==================================

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  avatar VARCHAR(100) DEFAULT 'default',
  color VARCHAR(20) DEFAULT 'bg-red-500',
  elo INT DEFAULT 1000,
  moneda_lobby INT DEFAULT 0,
  gemas INT DEFAULT 0,
  nivel INT DEFAULT 1,
  experiencia INT DEFAULT 0,
  partidas_jugadas INT DEFAULT 0,
  partidas_ganadas INT DEFAULT 0,
  activo BOOLEAN DEFAULT TRUE,
  ultimo_login TIMESTAMP NULL,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_username (username),
  INDEX idx_email (email),
  INDEX idx_elo (elo)
) ENGINE=InnoDB;

-- ==================================
-- CASILLAS DEL TABLERO
-- ==================================

CREATE TABLE casillas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  posicion INT NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  tipo ENUM(
    'SALIDA',
    'PROPIEDAD',
    'SUERTE',
    'COMUNIDAD',
    'CASINO',
    'CARCEL',
    'IR_CARCEL',
    'IMPUESTO',
    'ESTACION',
    'COMPANIA',
    'LOTERIA'
  ) NOT NULL,
  descripcion TEXT,
  INDEX idx_posicion (posicion),
  INDEX idx_tipo (tipo)
) ENGINE=InnoDB;

-- ==================================
-- PROPIEDADES (LIGADAS A CASILLAS)
-- ==================================

CREATE TABLE propiedades (
  id INT AUTO_INCREMENT PRIMARY KEY,
  casilla_id INT NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  precio INT NOT NULL,
  alquiler_base INT NOT NULL,
  alquiler_nivel_1 INT,
  alquiler_nivel_2 INT,
  alquiler_nivel_3 INT,
  precio_mejora INT,
  color_grupo VARCHAR(50),
  FOREIGN KEY (casilla_id) REFERENCES casillas(id) ON DELETE CASCADE,
  INDEX idx_precio (precio),
  INDEX idx_color_grupo (color_grupo)
) ENGINE=InnoDB;

-- ==================================
-- TIENDA E INVENTARIO
-- ==================================

CREATE TABLE productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio INT NOT NULL,
  moneda ENUM('moneda_lobby', 'gemas') DEFAULT 'moneda_lobby',
  categoria ENUM('avatar', 'tema', 'power_up', 'otros') DEFAULT 'otros',
  rareza ENUM('comun', 'raro', 'epico', 'legendario') DEFAULT 'comun',
  preview VARCHAR(255),
  disponible BOOLEAN DEFAULT TRUE,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_categoria (categoria),
  INDEX idx_rareza (rareza),
  INDEX idx_disponible (disponible)
) ENGINE=InnoDB;

CREATE TABLE inventario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  producto_id INT NOT NULL,
  cantidad INT DEFAULT 1,
  equipado BOOLEAN DEFAULT FALSE,
  fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
  FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE,
  UNIQUE KEY unique_usuario_producto (usuario_id, producto_id),
  INDEX idx_usuario (usuario_id),
  INDEX idx_equipado (equipado)
) ENGINE=InnoDB;

-- ==================================
-- RECOMPENSAS
-- ==================================

CREATE TABLE recompensas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  tipo ENUM('diaria', 'partida', 'logro', 'evento') NOT NULL,
  moneda_lobby INT DEFAULT 0,
  gemas INT DEFAULT 0,
  experiencia INT DEFAULT 0,
  requisito VARCHAR(255),
  activa BOOLEAN DEFAULT TRUE,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_tipo (tipo),
  INDEX idx_activa (activa)
) ENGINE=InnoDB;

CREATE TABLE historial_recompensas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  recompensa_id INT NOT NULL,
  moneda_recibida INT DEFAULT 0,
  gemas_recibidas INT DEFAULT 0,
  experiencia_recibida INT DEFAULT 0,
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
  FOREIGN KEY (recompensa_id) REFERENCES recompensas(id) ON DELETE CASCADE,
  INDEX idx_usuario (usuario_id),
  INDEX idx_fecha (fecha)
) ENGINE=InnoDB;

-- ==================================
-- PARTIDAS
-- ==================================

CREATE TABLE partidas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_partida VARCHAR(20) UNIQUE,
  estado ENUM('esperando', 'en_curso', 'finalizada', 'cancelada') DEFAULT 'esperando',
  turno_actual INT DEFAULT 1,
  jugador_turno_id INT,
  ronda_actual INT DEFAULT 1,
  max_jugadores INT DEFAULT 4,
  fecha_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  fecha_fin TIMESTAMP NULL,
  ganador_id INT,
  FOREIGN KEY (ganador_id) REFERENCES usuarios(id) ON DELETE SET NULL,
  FOREIGN KEY (jugador_turno_id) REFERENCES usuarios(id) ON DELETE SET NULL,
  INDEX idx_codigo (codigo_partida),
  INDEX idx_estado (estado),
  INDEX idx_fecha_inicio (fecha_inicio)
) ENGINE=InnoDB;

CREATE TABLE partida_usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  partida_id INT NOT NULL,
  usuario_id INT NOT NULL,
  orden_juego INT NOT NULL,
  posicion_actual INT DEFAULT 0,
  dinero_actual INT DEFAULT 1500,
  turnos_carcel INT DEFAULT 0,
  posicion_final INT,
  elo_ganado INT DEFAULT 0,
  moneda_ganada INT DEFAULT 0,
  experiencia_ganada INT DEFAULT 0,
  activo BOOLEAN DEFAULT TRUE,
  fecha_union TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (partida_id) REFERENCES partidas(id) ON DELETE CASCADE,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
  UNIQUE KEY unique_partida_usuario (partida_id, usuario_id),
  INDEX idx_partida (partida_id),
  INDEX idx_usuario (usuario_id),
  INDEX idx_orden (orden_juego)
) ENGINE=InnoDB;

-- ==================================
-- PROPIEDADES DURANTE LA PARTIDA
-- ==================================

CREATE TABLE propiedades_partida (
  id INT AUTO_INCREMENT PRIMARY KEY,
  partida_id INT NOT NULL,
  propiedad_id INT NOT NULL,
  propietario_id INT,
  nivel INT DEFAULT 0,
  hipotecada BOOLEAN DEFAULT FALSE,
  fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (partida_id) REFERENCES partidas(id) ON DELETE CASCADE,
  FOREIGN KEY (propiedad_id) REFERENCES propiedades(id) ON DELETE CASCADE,
  FOREIGN KEY (propietario_id) REFERENCES usuarios(id) ON DELETE SET NULL,
  UNIQUE KEY unique_partida_propiedad (partida_id, propiedad_id),
  INDEX idx_partida (partida_id),
  INDEX idx_propietario (propietario_id)
) ENGINE=InnoDB;

-- ==================================
-- CARTAS (SUERTE / COMUNIDAD)
-- ==================================

CREATE TABLE cartas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tipo ENUM('SUERTE', 'COMUNIDAD') NOT NULL,
  descripcion TEXT NOT NULL,
  efecto ENUM('ganar_dinero', 'perder_dinero', 'mover_posicion', 'ir_carcel', 'salir_carcel', 'pagar_jugadores', 'cobrar_jugadores') NOT NULL,
  valor INT DEFAULT 0,
  activa BOOLEAN DEFAULT TRUE,
  INDEX idx_tipo (tipo),
  INDEX idx_activa (activa)
) ENGINE=InnoDB;

-- ==================================
-- CASINOS Y JUEGOS
-- ==================================

CREATE TABLE casinos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  casilla_id INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  FOREIGN KEY (casilla_id) REFERENCES casillas(id) ON DELETE CASCADE,
  INDEX idx_casilla (casilla_id)
) ENGINE=InnoDB;

CREATE TABLE juegos_casino (
  id INT AUTO_INCREMENT PRIMARY KEY,
  casino_id INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  tipo ENUM('ruleta', 'dados', 'cartas', 'slots') NOT NULL,
  apuesta_minima INT DEFAULT 10,
  apuesta_maxima INT DEFAULT 1000,
  activo BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (casino_id) REFERENCES casinos(id) ON DELETE CASCADE,
  INDEX idx_casino (casino_id),
  INDEX idx_tipo (tipo)
) ENGINE=InnoDB;

-- ==================================
-- HISTORIAL DE JUGADAS EN CASINO
-- ==================================

CREATE TABLE historial_casino (
  id INT AUTO_INCREMENT PRIMARY KEY,
  partida_id INT NOT NULL,
  usuario_id INT NOT NULL,
  juego_id INT NOT NULL,
  apuesta INT NOT NULL,
  resultado ENUM('ganado', 'perdido') NOT NULL,
  ganancia INT DEFAULT 0,
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (partida_id) REFERENCES partidas(id) ON DELETE CASCADE,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
  FOREIGN KEY (juego_id) REFERENCES juegos_casino(id) ON DELETE CASCADE,
  INDEX idx_partida (partida_id),
  INDEX idx_usuario (usuario_id),
  INDEX idx_fecha (fecha)
) ENGINE=InnoDB;
