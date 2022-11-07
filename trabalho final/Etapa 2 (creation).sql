/* tabela de usuário */
CREATE TABLE usuario (
	id INT NOT NULL,
	apelido VARCHAR(255),
	data_nascimento DATE NOT NULL,
	email VARCHAR(255) NOT NULL,
	imagem VARCHAR(255),
	nome VARCHAR(255) NOT NULL,
	sobrenome VARCHAR(255) NOT NULL,
	CONSTRAINT usuario_pkey PRIMARY KEY (id)
);

/* tabela de amizades*/
CREATE TABLE solicitacao (
	id INT NOT NULL,
	aceita BOOL NOT NULL,
	criacao TIMESTAMP NOT NULL,
	CONSTRAINT solicitacao_pkey PRIMARY KEY (id)
);

/* tabela N X N de amizades de usuário usuário */
CREATE TABLE solicitacao_usuario (
	id INT NOT NULL,
	usuario INT NOT NULL,
	solicitacao INT NOT NULL,
	CONSTRAINT solicitacao_usuario_pkey PRIMARY KEY (id),
	CONSTRAINT id_usuario FOREIGN KEY (usuario) REFERENCES usuario(id),
	CONSTRAINT id_solicitacao FOREIGN KEY (solicitacao) REFERENCES solicitacao(id)
);

/* tabela de post */
CREATE TABLE post (
	id INT NOT NULL,
	is_privado BOOL NOT NULL,
	titulo VARCHAR(255) NOT NULL,
	autor INT NOT NULL,
	criacao TIMESTAMP NOT NULL,
	descricao VARCHAR(255),
	imagem VARCHAR,
	CONSTRAINT post_pkey PRIMARY KEY (id),
	CONSTRAINT id_autor FOREIGN KEY (autor) REFERENCES usuario(id)
);

/* tabela de comentario */
CREATE TABLE comentario (
	id INT NOT NULL,
	post INT NOT NULL,
	autor INT NOT NULL,
	criacao TIMESTAMP NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	imagem VARCHAR,
	CONSTRAINT comentario_pkey PRIMARY KEY (id),
	CONSTRAINT id_autor FOREIGN KEY (autor) REFERENCES usuario(id),
	CONSTRAINT id_post FOREIGN KEY (post) REFERENCES post(id)
);

/* tabela de curtida */
CREATE TABLE curtida (
	id INT NOT NULL,
	autor INT NOT NULL,
	post INT NOT NULL,
	tipo VARCHAR(10) NOT NULL, 
	criacao TIMESTAMP NOT NULL,
	CONSTRAINT curtida_pkey PRIMARY KEY (id),
	CONSTRAINT id_post FOREIGN KEY (post) REFERENCES post(id),
	CONSTRAINT id_autor FOREIGN KEY (autor) REFERENCES usuario(id)
);

/* tabela de evento */
CREATE TABLE evento (
	id INT NOT NULL,
	autor INT NOT NULL,
	descricao VARCHAR(255) NOT NULL, 
	criacao TIMESTAMP NOT NULL,
	data_evento TIMESTAMP,
	CONSTRAINT evento_pkey PRIMARY KEY (id),
	CONSTRAINT id_autor FOREIGN KEY (autor) REFERENCES usuario(id)
);

/* tabela N X N de participante de evento */
CREATE TABLE usuario_evento (
	id INT NOT NULL,
	usuario INT NOT NULL,
	evento INT NOT NULL,
	CONSTRAINT usuario_evento_pkey PRIMARY KEY (id),
	CONSTRAINT id_usuario FOREIGN KEY (usuario) REFERENCES usuario(id),
	CONSTRAINT id_evento FOREIGN KEY (evento) REFERENCES evento(id)
);