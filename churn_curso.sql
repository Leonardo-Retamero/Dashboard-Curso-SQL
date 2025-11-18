-- Como foi a curva de Churn do Curso de SQL

WITH tb_clientes_1dia AS (

    SELECT DISTINCT IdCliente

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25' 
    AND DtCriacao < '2025-08-26'
)

SELECT substr(t2.DtCriacao, 1, 10) AS dtDia,
       COUNT(DISTINCT t1.IdCliente) AS qtdeClientes,
       1 - 1.* COUNT(DISTINCT t1.IdCliente) / (SELECT COUNT(*) FROM tb_clientes_1dia) AS pctChurn

FROM tb_clientes_1dia AS t1

LEFT JOIN transacoes AS t2
ON t1.IdCliente = t2.IdCliente

WHERE substr(t2.DtCriacao, 1, 10) >= '2025-08-25' 
AND substr(t2.DtCriacao, 1, 10) < '2025-08-30'

GROUP BY dtDia