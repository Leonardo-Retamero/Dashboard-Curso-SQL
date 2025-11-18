-- Qual o dia com maior engajamento de cada aluno que iniciou o curso no dia 1

WITH tb_alunos_dia1 AS (

    SELECT DISTINCT IdCliente

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-26'
),

tb_dia_cliente AS (

    SELECT t1.IdCliente,
        substr(t2.DtCriacao, 1, 10) AS dtDia,
        COUNT(*) AS qtdeInteracoes

    FROM tb_alunos_dia1 AS t1

    LEFT JOIN transacoes AS t2
    ON t1.IdCliente = t2.IdCliente
    AND t2.DtCriacao >= '2025-08-25'
    AND t2.DtCriacao < '2025-08-30'

    GROUP BY t1.IdCliente, dtDia
),

tb_rn AS (

    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY qtdeInteracoes DESC) AS rn

    FROM tb_dia_cliente
)

SELECT IdCliente,
       dtDia,
       qtdeInteracoes

FROM tb_rn

WHERE rn = 1