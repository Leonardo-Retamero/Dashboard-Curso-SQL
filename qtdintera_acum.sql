-- Quantidade de interações acumuladas ao longo do curso

WITH tb_acum AS (

    SELECT substr(DtCriacao, 1, 10) AS dtDia,
           COUNT(IdTransacao) AS qtdeInteracoes

    FROM transacoes

    WHERE dtDia >= '2025-08-25'
    AND dtDia < '2025-08-30'

    GROUP BY dtDia
)

SELECT *,
       SUM(qtdeInteracoes) OVER (ORDER BY dtDia) AS totAcumulado

FROM tb_acum