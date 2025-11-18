-- Quantidade de trnasações acumuladas ao longo do tempo (diário)

WITH tb_diario AS (

    SELECT substr(DtCriacao, 1, 10) AS dtDia,
           COUNT(IdTransacao) AS qtdetransacoes

    FROM transacoes

    WHERE dtDia >= '2025-01-01'
    AND dtDia < '2025-09-24'

    GROUP BY dtDia
    ORDER BY dtDia
)

SELECT *,
       SUM(qtdetransacoes) OVER (ORDER BY dtDia) AS totAcumulado

FROM tb_diario

