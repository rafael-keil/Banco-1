--1
SELECT 
	to_char(current_timestamp, 'DD-mon-YYYY HH24:MI:SS') as Data;

--2

--minha solução
SELECT 
	LOWER(SUBSTRING(nomeEmpregado, 1, 4)) || SUBSTRING(nomeEmpregado, 4, 20) AS nomeNovo, e.*
FROM empregado e;

--solução deles
SELECT 
	SUBSTR(LOWER(nomeEmpregado), 1, 4) nome, e.*
FROM empregado e;

--3
SELECT 
	CONCAT(nomeEmpregado, cargo) as NomeCargo1, nomeEmpregado || cargo as NomeCargo2
FROM empregado;

--4
SELECT 
	to_char(dataadmissao + '08 hours'::interval, 'DD/MM/YYYY HH24:MI:SS') as Data_admissao
FROM empregado;