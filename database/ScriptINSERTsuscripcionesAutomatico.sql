-- Suscripciones

-- Este insert nos permite asignar de forma automatica el plan mensual o anual y asigna 
-- el estado de pago de 5 a 1 por lo que cada 5 estudiantes hay un pago inactivo

INSERT INTO suscripciones (plan_suscripcion, estado_pago, id_estudiante)
SELECT
    CASE
        WHEN MOD(e.id_estudiante, 3) = 0 THEN 'Mensual'
        WHEN MOD(e.id_estudiante, 3) = 1 THEN 'Anual'
        ELSE 'Trimestral'
    END AS plan_suscripcion,
    CASE
        WHEN MOD(e.id_estudiante, 5) = 0 THEN FALSE
        ELSE TRUE
    END AS estado_pago,
    e.id_estudiante
FROM estudiante e;
