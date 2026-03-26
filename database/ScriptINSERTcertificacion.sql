-- Certificacion

-- Este inset nos permite certificar a los estudiantes que tiene el 100% del curso y su estado de pago esta activo 1(TRUE)

INSERT INTO certificacion (fecha_certificacion, id_curso, id_matricula)
SELECT
    CURDATE() AS fecha_certificacion,
    m.id_curso,
    m.id_matricula
FROM matricula      m
JOIN suscripciones s ON s.id_estudiante = m.id_estudiante
WHERE m.porcentaje_curso = 100
  AND s.estado_pago = 1;
