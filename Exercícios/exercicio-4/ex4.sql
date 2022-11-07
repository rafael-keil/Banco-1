--ex 1 e 2
INSERT INTO cursoaula1 (nome, data, situacao, local, valor, idcurso, prerequisito)
VALUES ('ciencias', to_date('1980/12/17','YYYY/MM/DD'), 'N', 'sala1', 450.00, 1, null),
	   ('TI', to_date('1980/12/17','YYYY/MM/DD'), 'N', 'sala2', 550.25, 2, null),
	   ('artes', to_date('1980/12/17','YYYY/MM/DD'), 'N', 'sala1', 248.54, 3, null),
	   ('matematica', to_date('1980/12/17','YYYY/MM/DD'), 'N', 'sala1', 478.65, 4, null),
	   ('filosofia', to_date('1980/12/17','YYYY/MM/DD'), 'N', 'sala2', 97.45, 5, null),
	   ('geografia', to_date('1980/12/17','YYYY/MM/DD'), 'N', 'sala3', 499.99, 6, null),
	   ('medicina', to_date('1980/12/17','YYYY/MM/DD'), 'N', 'sala1', 599.99, 7, null),
	   ('fisica', to_date('1980/12/17','YYYY/MM/DD'), 'N', 'sala3', 439.99, 8, null),
	   ('jogos digitais', to_date('1980/12/17','YYYY/MM/DD'), 'N', 'sala1', 199.99, 9, null),
	   ('sistemas', to_date('1980/12/17','YYYY/MM/DD'), 'N', 'sala3', 245.99, 10, null);
	   
INSERT INTO alunoaula1 (nome, datanascimento, cidade, cpf, matricula, cursomatriculado, idaluno)
VALUES ('rafael', to_date('1980/12/17','YYYY/MM/DD'), 'novo hamburgo', 03912618045, 292425, 1, 1),
	   ('maria', to_date('1980/12/17','YYYY/MM/DD'), 'novo hamburgo', 03945618045, 292426, 2, 2),
	   ('joao', to_date('1980/12/17','YYYY/MM/DD'), 'estancia velha', 03912218045, 292427, 3, 3),
	   ('pedro', to_date('1980/12/17','YYYY/MM/DD'), 'novo hamburgo', 03912618045, 292428, 4, 4),
	   ('lucas', to_date('1980/12/17','YYYY/MM/DD'), 'estancia velha', 03912358045, 292429, 5, 5),
	   ('larissa', to_date('1980/12/17','YYYY/MM/DD'), 'novo hamburgo', 03965618045, 292430, 6, 6),
	   ('ramon', to_date('1980/12/17','YYYY/MM/DD'), 'novo hamburgo', 03911218045, 292431, 7, 7),
	   ('amanda', to_date('1980/12/17','YYYY/MM/DD'), 'estancia velha', 03562618045, 292432, 8, 8),
	   ('laura', to_date('1980/12/17','YYYY/MM/DD'), 'estancia velha', 03914518045, 292433, 9, 9),
	   ('vithoria', to_date('1980/12/17','YYYY/MM/DD'), 'novo hamburgo', 03222618045, 292434, 9, 10);
	   
	  
	   
--ex3	 
UPDATE cursoaula1 SET SITUACAO = 'A';

--ex4
UPDATE cliente SET situacao='P' WHERE situacao = 'I'; -- nn funciona, constraint negando

--ex5
DELETE FROM associadoEX WHERE sexo = 'M';

--ex6
UPDATE cursoaula1
SET valor = ROUND((valor * 1.05), 2);





