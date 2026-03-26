-- Interaccion

-- 	La primera interaccion se hace cuando el porcentaje del curso es igual o mayor al 50% y menor a 100%

INSERT INTO interaccion (id_matricula,
                         calificacion_evaluacion,
                         cantidad_participacion)
SELECT
    m.id_matricula,
    ROUND(RAND()*5,1)                                   AS calificacion_evaluacion,
    /* 50‑99% → al menos 1 participación */
    FLOOR(RAND()*5) + 1                                 AS cantidad_participacion
FROM matricula m
WHERE m.porcentaje_curso >= 50
  AND m.porcentaje_curso < 100;        -- 1 interacción por matrícula


-- 	Las siguientes dos interacciones se hacen cuando el porcentaje es igual al 100%, 
--  La primera fila nos genera una interaccion en la cual el oorcentaje de participacion sea mayor a 1
-- 	La segunda fila genera una participación mayor que la primera.

INSERT INTO interaccion (id_matricula,
                         calificacion_evaluacion,
                         cantidad_participacion)
SELECT
    m.id_matricula,
    ROUND(RAND()*5,1)                                   AS calificacion_evaluacion,
    /* primera interacción (≥1) */
    FLOOR(RAND()*5) + 1                                 AS cantidad_participacion
FROM matricula m
WHERE m.porcentaje_curso = 100;



INSERT INTO interaccion (id_matricula,
                         calificacion_evaluacion,
                         cantidad_participacion)
SELECT
    m.id_matricula,
    ROUND(RAND()*5,1)                                   AS calificacion_evaluacion,
    /* segunda interacción: valor mayor que la primera */
    (SELECT MAX(cantidad_participacion) + FLOOR(RAND()*5) + 1
     FROM interaccion i
     WHERE i.id_matricula = m.id_matricula)            AS cantidad_participacion
FROM matricula m
WHERE m.porcentaje_curso = 100;
