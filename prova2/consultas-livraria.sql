-- a) Mostre todos os atributos de todos os autores cadastrados.
SELECT * FROM autor;

-- b) Mostre o título e o preço dos livros, exibindo-os do livro mais caro ao mais barato.
SELECT l.titulo, l.preco FROM livro l
ORDER BY preco DESC;

-- c) Mostre os nomes de todos os autores que escreveram pelo menos um livro, sem repetir os nomes dos autores.
SELECT a.nome FROM autor a 
WHERE a.id_autor IN (SELECT la.id_autor FROM livro_autor la);

-- d) Mostre, em ordem alfabética crescente, os autores que não começam com a letra “L”.
SELECT * FROM autor a
WHERE a.nome NOT LIKE 'L%'
ORDER BY a.nome;

-- e) Liste o título dos livros das editoras “Companhia das Letras”, “Darkside Books” e “Planeta”.
SELECT l.titulo FROM livro l 
INNER JOIN editora e
	ON e.id_editora = l.id_editora 
WHERE e.nome IN ('Companhia das Letras', 'Darkside Books', 'Planeta');

-- f) Mostre os códigos e os títulos dos livros do gênero “ficção”, das editoras “Darkside Books” e “Planeta”, que custam mais de R$ 50,00.
SELECT l.id_livro, l.titulo FROM livro l
INNER JOIN editora e
	ON e.id_editora = l.id_editora 
INNER JOIN genero g
	ON g.id_genero = l.id_genero
WHERE e.nome IN ('Darkside Books', 'Planeta')
	AND g.descricao = 'ficção'
	AND l.preco > 50;

-- g) Mostre todos os títulos de livros com seus respectivos nomes de editoras e gêneros.
SELECT l.titulo, e.nome AS editora, g.descricao AS genero FROM livro l
INNER JOIN editora e
	ON e.id_editora = l.id_editora 
INNER JOIN genero g
	ON g.id_genero = l.id_genero;

-- h) Mostre o preço do livro mais barato e do livro mais caro do gênero “Terror”.
SELECT MAX(l.preco), MIN(l.preco) FROM livro l
INNER JOIN genero g
	ON g.id_genero = l.id_genero
WHERE g.descricao = 'Terror';

-- i) Mostre o título dos livros e seus preços, mas somente daqueles livros que custam menos que a média de preço dos livros da editora “Companhia das Letras”.
SELECT l.titulo, l.preco FROM livro l
INNER JOIN editora e
	ON e.id_editora = l.id_editora
WHERE l.preco < (
	SELECT (SUM(l.preco)/COUNT(*)) FROM livro l
	INNER JOIN editora e
		ON e.id_editora = l.id_editora
	WHERE e.nome = 'Companhia das Letras'	
	);

-- j) Mostre todos os livros dos autores “Machado de Assis” e “Laurentino Gomes”, na ordem crescente de título.
SELECT l.* FROM livro l
INNER JOIN livro_autor la
	ON la.id_livro = l.id_livro
INNER JOIN autor a 
	ON a.id_autor = la.id_autor
WHERE a.nome IN ('Machado de Assis', 'Laurentino Gomes')
ORDER BY l.titulo;

-- k) Liste o título e a quantidade de vezes que cada livro apareceu no ranking semanal.
SELECT l.titulo, COUNT(*) AS ocorrencias FROM classificacao c 
INNER JOIN livro l 
	ON l.id_livro = c.id_livro
INNER JOIN ranking r 
	ON r.id_ranking = c.id_ranking
GROUP BY l.id_livro;	
	

-- l) Liste o nome dos autores e a quantidade de vezes que cada um deles apareceu no ranking semanal, na primeira posição.
SELECT a.nome, COUNT(*) AS ocorrencias FROM classificacao c 
INNER JOIN livro l 
	ON l.id_livro = c.id_livro
INNER JOIN ranking r 
	ON r.id_ranking = c.id_ranking
INNER JOIN autor a 
	ON a.id_autor = l.id_livro
WHERE c.posicao = 1
GROUP BY a.id_autor;


