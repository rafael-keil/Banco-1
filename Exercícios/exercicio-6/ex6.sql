--1
SELECT idpedido, idcliente, datapedido, valorpedido, situacao
FROM pedido
WHERE (situacao = 'A' AND idcliente = 11518) OR valorpedido > 9000
ORDER BY valorpedido;

--2
SELECT * FROM material
WHERE pesoliquido > 4 AND precocusto < 0.3;

--3
SELECT nome, uf
FROM cidade
WHERE uf = 'RS'
ORDER BY nome;

--4
SELECT * FROM pedido 
WHERE valorpedido = 28299.76
	AND situacao = 'Q';
	
SELECT * FROM pedidoitem
WHERE idpedido = 162;

--5
SELECT * FROM cliente
WHERE cep IS NULL AND situacao = 'A';

--6
SELECT idpedido, idproduto, (precounitario * quantidade) AS calculodovalor
FROM pedidoitem
WHERE idpedido = 168
ORDER BY calculodovalor DESC;

--7
SELECT * FROM material
WHERE pesoliquido BETWEEN 0.5 AND 0.6;

--8
SELECT * FROM pedido p
WHERE EXISTS(SELECT * FROM pedidoitem i WHERE p.idpedido = i.idpedido)
	AND situacao = 'A' 
	AND valorpedido > 9500;

--9


Vamos precisar provisionar o estoque para armazenar cinco vezes mais os materiais do produto com id igual 2492,
precisamos calcular as quantidades, considere o valor de 1, caso tenha valores nulos.

--10
SELECT * FROM pedido
WHERE situacao in ('A', 'C', 'I') AND valorpedido >= 9800



