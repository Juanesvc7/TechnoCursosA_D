-- Matricula

-- Este insert nos permite que el porcentaje de cada curso este por lo menos por encima del 25%,
-- tambien agrega entre 1 y 3 cursos por estudiante
    
INSERT INTO matricula (id_curso, id_estudiante, porcentaje_curso)
SELECT
    rc.id_curso,
    rc.id_estudiante,
    ROUND(25 + RAND()*75, 2) AS porcentaje_curso
FROM (
    SELECT
        e.id_estudiante,
        c.id_curso,
        ROW_NUMBER() OVER (PARTITION BY e.id_estudiante
                           ORDER BY RAND()) AS rn,
        /* número aleatorio entre 1 y 3 para cada estudiante */
        FLOOR(RAND()*3) + 1 AS max_cursos
    FROM estudiante e
    CROSS JOIN curso c
) rc
WHERE rc.rn <= rc.max_cursos
ORDER BY rc.id_estudiante, rc.id_curso;


