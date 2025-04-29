-- Crear la tabla de pacientes_fisio
CREATE TABLE paciente_fisio (
    paciente_id VARCHAR(50),
    nombre VARCHAR,
    apellidos VARCHAR,
    direccion TEXT,
    telefono VARCHAR,
    fecha_nacimiento DATE,
    fisio_id VARCHAR(50),

    PRIMARY KEY (paciente_id, fisio_id) -- Clave primaria compuesta
);


-- Crear la tabla de diagnóstico médico
CREATE TABLE diagnostico_medico (
    id VARCHAR(255) PRIMARY KEY,
    sistema_lesionado VARCHAR(50),
    zona_afectada VARCHAR(50)
);

-- Tabla para el historial médico del paciente
CREATE TABLE paciente_historial_medico (
    paciente_id VARCHAR(50) NOT NULL,
    fisio_id VARCHAR(50) NOT NULL,
    diagnostico_id VARCHAR(255) NOT NULL, 
    fecha_diagnostico DATE NOT NULL,
    fecha_inicio_tratamiento DATE,
    fecha_fin_tratamiento DATE,
    sintomas TEXT,
    medicamentos TEXT,

    PRIMARY KEY (paciente_id, fisio_id, diagnostico_id), -- Clave primaria compuesta

    -- Claves foráneas
    FOREIGN KEY (paciente_id, fisio_id) REFERENCES paciente_fisio(paciente_id, fisio_id) ON DELETE CASCADE,
    FOREIGN KEY (diagnostico_id) REFERENCES diagnostico_medico(id) ON DELETE CASCADE
);


