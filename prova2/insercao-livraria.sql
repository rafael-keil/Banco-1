INSERT INTO autor (id_autor, nome) VALUES
	(1, 'J. K. Rowling'),
    (2, 'George R. R. Martin'),
    (3, 'J. R. R. Tolkien');

INSERT INTO editora (id_editora, nome) VALUES
    (1, 'Editora Rocco'),
    (2, 'Companhia das Letras'),
    (3, 'Europa América');

INSERT INTO genero (id_genero, descricao) VALUES
    (1, 'ficção cientifica'),
    (2, 'drama'),
    (3, 'romance');

INSERT INTO livro (id_livro, titulo, preco, id_editora, id_genero) VALUES
    (1, 'Harry Potter e a Pedra Filosofal', 69.99, 1, 1),
    (2, 'A Guerra dos Tronos', 89.99, 2, 3),
    (3, 'O Senhor dos Anéis: Volume único', 199.99, 3, 2);

INSERT INTO livro_autor (id_autor, id_livro) VALUES
    (1, 1),
    (2, 2),
    (3, 3);   

INSERT INTO ranking (id_ranking, data_inicial, data_final) VALUES
    (1, '2001-05-10', '2021-10-10'),
    (2, '2001-05-10', '2021-10-10'),
    (3, '2001-05-10', '2021-10-10');

INSERT INTO classificacao (id_livro, id_ranking, posicao) VALUES
    (1, 1, 20),
    (1, 2, 15),
    (1, 3, 25),
    (2, 1, 30),
    (2, 2, 5),
    (2, 3, 2),
    (3, 1, 5),
    (3, 2, 29),
    (3, 3, 17);


