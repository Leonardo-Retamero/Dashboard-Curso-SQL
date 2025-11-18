-- Quem iniciou o curso no primeiro dia em média assistiu quantas aulas

WITH tb_prim_dia AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'

),

tb_dias_curso AS (

    SELECT DISTINCT IdCliente,
           substr(DtCriacao, 1, 10) AS presenteDia
    FROM transacoes
    WHERE DtCriacao >= '2025-08-25' 
    AND DtCriacao < '2025-08-30'

    ORDER BY IdCliente, presenteDia

),

tb_dias AS (

    SELECT *
    FROM tb_prim_dia AS t1

    LEFT JOIN tb_dias_curso AS t2
    ON t1.IdCliente = t2.IdCliente

)

SELECT IdCliente,
       COUNT(IdCliente) AS totDias
FROM tb_dias

GROUP BY IdCliente