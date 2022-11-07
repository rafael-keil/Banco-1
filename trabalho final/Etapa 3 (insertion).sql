/* insert na tabela usuario */
INSERT INTO usuario (id, apelido, data_nascimento, email, imagem, nome, sobrenome) VALUES
	(1, 'rafa', '2001-10-10', 'rafa@email.com', 'url', 'Rafael', 'Keil'),
	(2, 'le', '2001-10-10', 'le@email.com', 'url', 'Leandro', 'Lima'),
	(3, 'hec', '2001-10-10', 'hec@email.com', 'url', 'Hector', 'Tavares'),
	(4, 'thi', '2001-10-10', 'thi@email.com', 'url', 'Thiago', 'Monaco'),
	(5, 'lucs', '2001-10-10', 'lucs@email.com', 'url', 'Lucas', 'Paties');

/* insert na tabela solicitacao */
INSERT INTO solicitacao (id, aceita, criacao) VALUES
	(1, false, '2021-10-10 01:00:29.102'),
	(2, true, '2021-10-10 01:00:29.102'),
	(3, true, '2021-10-10 01:00:29.102'),
	(4, true, '2021-10-10 01:00:29.102'),
	(5, false, '2021-10-10 01:00:29.102');

/* insert na tabela solicitacao_usuario */
INSERT INTO solicitacao_usuario (id, usuario, solicitacao) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 1, 2),
	(4, 3, 2),
	(5, 3, 4),
	(6, 4, 4);

/* insert na tabela post */
INSERT INTO post (id, is_privado, titulo, autor, criacao, descricao, imagem) VALUES
	(1, false, 'post bom', 1, '2021-10-10 01:00:29.102', 'esse post é de exmplo', 'url'),
	(2, false, 'post ruim', 1, '2021-10-10 01:00:29.102', 'esse post é outro exmplo', 'url'),
	(3, true, 'post medio', 1, '2021-10-10 01:00:29.102', 'esse post é mais um exmplo', 'url'),
	(4, true, 'post ok', 3, '2021-10-10 01:00:29.102', 'esse post é de exmplo novamente', 'url'),
	(5, false, 'titulo', 3, '2021-10-10 01:00:29.102', 'esse post é de exmplo denovo', 'url');

/* insert na tabela comentario */
INSERT INTO comentario (id, post, autor, criacao, descricao, imagem) VALUES
	(1, 1, 1, '2021-10-10 01:00:29.102', 'comentario', 'url'),
	(2, 1, 2, '2021-10-10 01:00:29.102', 'comentario novo', 'url'),
	(3, 2, 5, '2021-10-10 01:00:29.102', 'comentario mais um', 'url'),
	(4, 4, 5, '2021-10-10 01:00:29.102', 'comentario exemplo', 'url'),
	(5, 4, 4, '2021-10-10 01:00:29.102', 'comentario novamente', 'url');

/* insert na tabela curtida */
INSERT INTO curtida (id, autor, post, tipo, criacao) VALUES
	(1, 2, 2, 'amei', '2021-10-10 01:00:29.102'),
	(2, 3, 2, 'amei', '2021-10-10 01:00:29.102'),
	(3, 3, 3, 'wow', '2021-10-10 01:00:29.102'),
	(4, 1, 1, 'curtida', '2021-10-10 01:00:29.102'),
	(5, 1, 4, 'wow', '2021-10-10 01:00:29.102');

/* insert na tabela evento */
INSERT INTO evento (id, autor, descricao, criacao, data_evento) VALUES
	(1, 1, 'evento louco', '2021-10-10 01:00:29.102', '2022-10-10'),
	(2, 2, 'evento novo', '2021-10-10 01:00:29.102', '2022-10-10'),
	(3, 3, 'evento novamente', '2021-10-10 01:00:29.102', '2022-10-10'),
	(4, 3, 'evento criado', '2021-10-10 01:00:29.102', '2022-10-10'),
	(5, 5, 'evento geral', '2021-10-10 01:00:29.102', '2022-10-10');

/* insert na tabela usuario_evento */
INSERT INTO usuario_evento (id, usuario, evento) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 1, 2),
	(4, 3, 2),
	(5, 3, 4),
	(6, 4, 4);