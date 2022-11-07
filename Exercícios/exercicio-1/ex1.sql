DROP TABLE AlunoAula1 CASCADE;
DROP TABLE CursoAula1 CASCADE;
DROP TABLE preRequisitoCursoAula1 CASCADE;


-- EX1
CREATE TABLE AlunoAula1
(
	nome VARCHAR(255) NOT NULL,
	dataNascimento TIMESTAMP NOT NULL,
	cidade VARCHAR(255) NOT NULL,
	cpf NUMERIC(11,0) NOT NULL,
	matricula INT NOT NULL,
	cursoMatriculado INT NOT NULL
);

--EX 2
CREATE TABLE CursoAula1
(
	nome VARCHAR(255) NOT NULL,
	data TIMESTAMP NOT NULL,
	situacao CHAR(1) NOT NULL,
	preRequisito VARCHAR(255),
	local VARCHAR(255) NOT NULL
);

--EX3
ALTER TABLE  cursoaula1 ADD COLUMN valor NUMERIC(5,2) NOT NULL DEFAULT 0;

--EX4
ALTER TABLE alunoaula1 ADD COLUMN idaluno INT NOT NULL PRIMARY KEY;

ALTER TABLE cursoaula1 ADD COLUMN idcurso INT NOT NULL PRIMARY KEY;
ALTER TABLE cursoaula1 DROP COLUMN prerequisito;
ALTER TABLE cursoaula1 ADD COLUMN prerequisito INT;


CREATE TABLE preRequisitoCursoAula1
(
	idPreRequisito INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	idCursoReferente INT NOT NULL,
	FOREIGN KEY (idCursoReferente) REFERENCES cursoaula1(idcurso),
	idCursoPreRequisito INT NOT NULL,
	FOREIGN KEY (idCursoPreRequisito) REFERENCES cursoaula1(idcurso)
	
);

ALTER TABLE alunoaula1 ADD FOREIGN KEY (cursomatriculado) REFERENCES cursoaula1(idcurso);
ALTER TABLE cursoaula1 ADD FOREIGN KEY (prerequisito) REFERENCES prerequisitocursoaula1;



-- Um curso possui alunos e cada aluno pode estar matriculado em um curso  
-- melhoria: Relação N:N entre cursos e alunos