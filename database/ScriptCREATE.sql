CREATE DATABASE plataforma_educativa;

USE plataforma_educativa;

CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(50) NOT NULL,
    autor_curso VARCHAR(50) NOT NULL
);
-- Crear tabla estudiante
CREATE TABLE estudiante (
    id_estudiante INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    perfil_progreso VARCHAR(50)
);

-- Crear tabla suscripciones
CREATE TABLE suscripciones (
    id_suscripcion INT AUTO_INCREMENT PRIMARY KEY,
    plan_suscripcion VARCHAR(50) NOT NULL,
    estado_pago BOOLEAN NOT NULL,
    id_estudiante INT NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante)
);

-- Crear tabla matricula
CREATE TABLE matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    id_estudiante INT NOT NULL,
    porcentaje_curso FLOAT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante)
);

-- Crear tabla certificacion
CREATE TABLE certificacion (
    id_certificacion INT AUTO_INCREMENT PRIMARY KEY,
    fecha_certificacion DATE NOT NULL,
    id_curso INT NOT NULL,
    id_matricula INT NOT NULL,
    FOREIGN KEY (id_matricula) REFERENCES matricula(id_matricula),
    FOREIGN KEY (id_matricula) REFERENCES matricula(id_matricula)

);

-- Crear tabla interaccion
CREATE TABLE interaccion (
    id_interaccion INT AUTO_INCREMENT PRIMARY KEY,
    calificacion_evaluacion FLOAT NOT NULL,
    cantidad_participacion INT NOT NULL,
    id_matricula INT NOT NULL,
    FOREIGN KEY (id_matricula) REFERENCES matricula(id_matricula)
);