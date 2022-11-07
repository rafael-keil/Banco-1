--1
SELECT idempregado AS id, nomeEmpregado AS Nome
FROM empregado
ORDER BY dataAdmissao;

--2
SELECT nomeEmpregado AS Nome, salario
FROM empregado
WHERE comissao is null
ORDER BY salario;

--3
SELECT idempregado AS ID,
	nomeEmpregado AS Nome,
	(salario * 13) AS salario_anual, 
	(comissao * 12) AS comissao_anual,
	(salario * 13) + (coalesce(comissao,0) * 12) AS renda_anual
FROM empregado
ORDER BY nomeempregado;

--4
SELECT idempregado AS ID,
	nomeEmpregado AS Nome,
	cargo,
	(salario * 13) AS salario_anual 
FROM empregado
WHERE (salario * 13) < 18500
ORDER BY nomeEmpregado;

--5
SELECT nomeEmpregado AS Nome, cargo
FROM empregado
WHERE cargo = 'Atendente' OR idgerente = 7698
ORDER BY nomeEmpregado;

--6
SELECT iddepartamento AS id, nomedepartamento AS Nome
FROM departamento
WHERE localizacao like 'SAO%'
ORDER BY nomedepartamento;

--7
SELECT *
FROM cidadeex
WHERE idcidade BETWEEN 4 AND 9
ORDER BY idcidade;

--8
SELECT *
FROM departamento d
WHERE NOT EXISTS (SELECT iddepartamento FROM empregado e WHERE d.iddepartamento = e.iddepartamento)
ORDER BY iddepartamento;

--9
SELECT nomeEmpregado AS Nome, cargo
FROM empregado
WHERE iddepartamento is null
ORDER BY nomeEmpregado;

--10
SELECT nomeEmpregado AS Nome
FROM empregado
WHERE idgerente in (7566, 7698, 7782)
ORDER BY nomeEmpregado;






