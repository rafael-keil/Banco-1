--1
SELECT e.nomeempregado,
	d.nomedepartamento AS departamento_empregado,
	g.nomeempregado AS nomegerente,
	(SELECT nomedepartamento FROM departamento WHERE iddepartamento = g.iddepartamento) AS departamento_gerente
FROM empregado e
	INNER JOIN empregado g ON e.idempregado = g.idgerente
	LEFT JOIN departamento d ON e.iddepartamento = d.iddepartamento;

--2
SELECT iddepartamento, nomedepartamento
FROM departamento
	WHERE iddepartamento = (SELECT DISTINCT iddepartamento FROM empregado WHERE salario = 
							(SELECT MAX(salario) FROM empregado WHERE iddepartamento IS NOT NULL));

--3
ALTER TABLE departamento ADD CONSTRAINT unico UNIQUE (nomedepartamento);

INSERT INTO departamento (iddepartamento, nomedepartamento, localizacao)
VALUES(55, 'Vendas', 'SAO LEOPOLDO')
ON CONFLICT ON CONSTRAINT unico 
DO UPDATE 
	SET localizacao = EXCLUDED.localizacao;

--4
SELECT nome, uf, COUNT(*)
FROM cidadeex
	GROUP BY nome, uf;

--5
CREATE VIEW cidades_repetidas AS
	SELECT MAX(idcidade) AS id, nome, uf, COUNT(*) AS quant
	FROM cidadeex
		GROUP BY nome, uf;

UPDATE cidadeEX
	SET nome = nome || '*'
	WHERE idcidade IN (SELECT id FROM cidades_repetidas WHERE quant>1);
	