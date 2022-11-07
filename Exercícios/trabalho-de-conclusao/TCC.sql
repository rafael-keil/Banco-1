-- Exercício 1
SELECT TO_CHAR(data_fechamento, 'DD-Mon-YYYY') AS data_fechamento,
	valor_estimado_min,
	titulo
FROM lic_licitacao
	WHERE inicio_vigencia >= '01-11-2018'
		AND fim_vigencia <= '06-30-2018';



-- Exercício 2
SELECT idcontratante,
	TRUNC(AVG(valor_estimado_min), 2) AS minimo,
	TRUNC(AVG(valor_estimado_max), 2) as maximo
FROM lic_licitacao
	WHERE idcontratante IN (705, 738)
	GROUP BY idcontratante;		
	
	
	
-- Exercício 3
SELECT idcontratante, COUNT(*) as quant
FROM lic_licitacao
	GROUP BY idcontratante
	ORDER BY quant DESC
	LIMIT 6	;



-- Exercício 4
SELECT CASE situacao 
			WHEN 'S' THEN 'selecionada'
			WHEN 'D' THEN 'desqualificada'
			WHEN 'N' THEN 'não selecionada'
		END	AS descricao_situacao,
		idlicitacao,
		idempresa
FROM lic_proposta
	WHERE data_inscricao >= '06-01-2018';



-- Exercício 5 
SELECT idproposta, TRUNC(valor_inicial) as valor_inicial, TRUNC(valor_final) as valor_final
FROM lic_proposta;



-- Exercício 6
SELECT idlicitacao, TRUNC(valor_final) as valor_final
FROM lic_proposta
	WHERE situacao = 'S'
	ORDER BY valor_final DESC;



-- Exercício 7
SELECT situacao, DATE_PART('month', data_inscricao) AS mes, COUNT (*)
FROM lic_proposta
	WHERE DATE_PART('year', data_inscricao) = 2018
	GROUP BY situacao, mes
	ORDER BY mes, situacao;



-- Exercício 8
SELECT *
FROM lic_material
	WHERE idclasse_material = 13
		AND nome LIKE '%ALTURA 925 MM%';



-- Exercício 9
SELECT *, ROUND(valor_minimo * quantidade, 2) AS minimo_total, ROUND(valor_maximo * quantidade, 2) AS maximo_total
FROM lic_item_licitacao
	ORDER BY idlicitacao;



-- Exercício 10
SELECT idcontratante,
	cont.nome,  
	CASE esfera WHEN 'M' THEN 'Municipal' WHEN 'E' THEN 'Estadual' END,
	cid.nome
FROM lic_contratante cont
	INNER JOIN lic_cidade cid ON cid.idcidade = cont.idcidade
	WHERE cid.UF = 'PE'
		AND cid.nome = 'Recife';
	

 
-- Exercício 11
SELECT e.nome, e.cnpj, c.nome AS cidade
FROM lic_empresa e
	INNER JOIN lic_cidade c ON c.idcidade = e.idcidade
	WHERE cnpj LIKE '%86';



-- Exercício 12
SELECT SUBSTRING(m.nome,1, 20) AS nome,
	i.quantidade,
	TRUNC(((valor_minimo + valor_maximo) / 2) * i.quantidade, 2) AS valor_medio_X_quantidade
FROM lic_item_licitacao i
	INNER JOIN lic_material m ON m.idmaterial = i.idmaterial
	WHERE idlicitacao = 60
	ORDER BY i.quantidade;



-- Exercício 13
SELECT l.titulo, l.inicio_vigencia, i.quantidade, m.nome AS nome_material, c.nome AS nome_classe
FROM lic_licitacao l
	INNER JOIN lic_item_licitacao i ON i.idlicitacao = l.idlicitacao
	INNER JOIN lic_material m ON m.idmaterial = i.idmaterial
	INNER JOIN lic_classe_material c ON c.idclasse_material = m.idclasse_material
	WHERE idcontratante = 643
		AND DATE_PART('Month', data_fechamento) = 3
		AND DATE_PART('Year', data_fechamento) = 2018;



-- Exercício 14
SELECT MAX(valor_final) - MIN(valor_final) AS diferenca, idlicitacao
FROM lic_proposta
	GROUP BY idlicitacao
	ORDER BY diferenca DESC;



-- Exercício 15
SELECT p.idproposta,
	p.data_inscricao,
	e.nome AS empresa,
	c.nome AS cidade,
	c.uf AS estado,
	coalesce(e.cnpj, e.CPF) AS CPF_CNPJ,
	l.titulo AS licitacao,
	l.situacao,
	i.quantidade AS quantidade_item,
	i.observacao,
	m.nome AS material
FROM lic_proposta p
	INNER JOIN lic_empresa e ON e.idempresa = p.idempresa
	INNER JOIN lic_cidade c ON c.idcidade = e.idcidade
	INNER JOIN lic_licitacao l ON l.idlicitacao = p.idlicitacao
	INNER JOIN lic_item_licitacao i ON i.idlicitacao = l.idlicitacao
	INNER JOIN lic_material m ON m.idmaterial = i.idmaterial;



-- Exercício 16
SELECT COUNT(*)
FROM lic_material
	WHERE idmaterial NOT IN(SELECT idmaterial FROM lic_item_licitacao);

