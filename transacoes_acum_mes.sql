-- Quantidade de trnasações acumuladas ao longo do tempo (diário)

WITH tb_diario AS (

    SELECT substr(DtCriacao, 1, 10) AS dtDia,
           COUNT(IdTransacao) AS qtdetransacoes

    FROM transacoes

    GROUP BY dtDia
    ORDER BY dtDia
)

SELECT *,
       SUM(qtdetransacoes) OVER (ORDER BY dtDia) AS totAcumulado

FROM tb_diario

