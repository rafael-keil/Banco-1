--1
SELECT idempregado, nomeempregado, age(dataadmissao) as anosempresa
FROM empregado
WHERE EXTRACT(YEAR FROM dataadmissao) = 1981;

--2
SELECT CARGO, COUNT(*) AS quant 
FROM empregado
	GROUP BY cargo
	HAVING COUNT(*) = (SELECT MAX(quant) FROM (SELECT cargo, COUNT(*) AS quant FROM empregado GROUP BY cargo) empregado)

--3
SELECT uf, COUNT(*) AS quantidade_cidades
FROM cidade
	GROUP BY UF
	ORDER BY quantidade_cidades desc

--4

INSERT INTO departamento (iddepartamento, nomedepartamento, localizacao)
VALUES(100, 'Inovação', 'SAO LEOPOLDO');

UPDATE empregado
	SET iddepartamento = 100
WHERE date_part('Month', dataadmissao) = 12
	AND cargo != 'Atendente';	