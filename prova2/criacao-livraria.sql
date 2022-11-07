-- GENERO(id_genero: inteiro, descrição: texto)
CREATE TABLE genero (
	id_genero INT NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	CONSTRAINT genero_pkey PRIMARY KEY (id_genero)
);


-- EDITORA(id_editora: inteiro, nome: texto)
CREATE TABLE editora (
	id_editora INT NOT NULL,
	nome VARCHAR(255) NOT NULL,
	CONSTRAINT editora_pkey PRIMARY KEY (id_editora)
);


-- LIVRO(id_livro: inteiro, titulo: texto, preco: decimal, id_editora: inteiro, id_genero: inteiro)
-- id_editora referencia EDITORA(id_editora)
-- id_genero referencia GENERO(id_genero)
CREATE TABLE livro (
	id_livro INT NOT NULL,
	titulo VARCHAR(255) NOT NULL,
	preco DECIMAL(5,2) NOT NULL,
	id_editora INT NOT NULL,
	id_genero INT NOT NULL,
	CONSTRAINT livro_pkey PRIMARY KEY (id_livro),
	CONSTRAINT id_editora FOREIGN KEY (id_editora) REFERENCES editora(id_editora),
	CONSTRAINT id_genero FOREIGN KEY (id_genero) REFERENCES genero(id_genero)
);



-- AUTOR(id_autor: inteiro, nome: texto)
CREATE TABLE autor (
	id_autor INT NOT NULL,
	nome VARCHAR(255) NOT NULL,
	CONSTRAINT autor_pkey PRIMARY KEY (id_autor)
);


-- RANKING(id_ranking: inteiro, data_inicial: data, data_final: data)
CREATE TABLE ranking (
	id_ranking INT NOT NULL,
	data_inicial DATE NOT NULL,
	data_final DATE NOT NULL,
	CONSTRAINT ranking_pkey PRIMARY KEY (id_ranking)
);


-- LIVRO_AUTOR(id_livro: inteiro, id_autor: inteiro)
-- id_livro referencia LIVRO(id_livro)
-- id_autor referencia AUTOR(id_autor)
CREATE TABLE livro_autor (
	id_autor INT NOT NULL,
	id_livro INT NOT NULL,
	CONSTRAINT id_autor FOREIGN KEY (id_autor) REFERENCES autor(id_autor),
	CONSTRAINT id_livro FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);



-- CLASSIFICACAO(id_livro: inteiro, id_ranking: inteiro, posicao: inteiro)
-- id_livro referencia LIVRO(id_livro)
-- id_ranking referencia RANKING(id_ranking)
CREATE TABLE classificacao (
	id_livro INT NOT NULL,
	id_ranking INT NOT NULL,
	posicao INT NOT NULL,
	CONSTRAINT id_livro FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
	CONSTRAINT id_ranking FOREIGN KEY (id_ranking) REFERENCES ranking(id_ranking)
);


