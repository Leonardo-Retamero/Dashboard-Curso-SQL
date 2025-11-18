-- Clientes mais antigos, tem mais frequência de transação?

SELECT c.idCliente,
       CAST(julianday('now') - julianday(substr(c.DtCriacao, 1, 19)) AS INT) AS IdadeBase,
       COUNT(tr.IdTransacao) AS qtdeTransacoes
FROM clientes AS c
LEFT JOIN transacoes AS tr ON c.idCliente = tr.idCliente
GROUP BY c.idCliente, IdadeBase
ORDER BY IdadeBase DESC