--1
SELECT SPLIT_PART(nome, ' ', 1) AS PRIMEIRO_NOME, COUNT(nome) AS quantidade 
FROM cliente
	GROUP BY PRIMEIRO_NOME
	ORDER BY quantidade DESC
LIMIT (1);	

--2
SELECT COUNT(*) AS quantidade, SUM(valorpedido) as valor_total
FROM pedido
WHERE date_part('year', datapedido) = 2018
	AND date_part('month', datapedido) = 3;
	
--3
(SELECT cid.UF, COUNT(DISTINCT cli.*) AS quantidade
FROM cidade cid
	INNER JOIN cliente cli ON cli.idcidade = cid.idcidade 
	GROUP BY cid.UF
	ORDER BY quantidade 
LIMIT (1))

UNION

(SELECT cid.UF, COUNT(DISTINCT cli.*) AS quantidade
FROM cidade cid
	INNER JOIN cliente cli ON cli.idcidade = cid.idcidade 
	GROUP BY cid.UF
	ORDER BY quantidade DESC
LIMIT (1));

--4
INSERT INTO produto (idproduto, nome, datacadastro, precocusto, preCovenda, situacao)
VALUES(101010, 'Coturno Pica-Pau', CURRENT_DATE, 29.25, 77.95, 'A');

--5
SELECT prod.nome
FROM produto prod
WHERE prod.idproduto NOT IN (SELECT ped.idproduto FROM pedidoitem ped)
	

--6
SELECT prod.nome, SUM(ped.quantidade * ped.precounitario) AS lucro
FROM produto prod
	INNER JOIN pedidoitem ped ON ped.idproduto = prod.idproduto
WHERE ped.idpedido IN (SELECT idpedido FROM pedido
				  		WHERE extract(year from datapedido) = '2018')
	GROUP BY prod.idproduto
ORDER BY lucro DESC
LIMIT (30);





