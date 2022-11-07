/* A - Todos os dados da tabela usuario */
SELECT * FROM usuario;

/* B - Todos os dados da tabela post e os dados de seu autor */
SELECT * FROM usuario u
JOIN post p  
ON p.autor = u.id;

/* C - Todos os dados da tabela curtida e os dados de seu autor onde o nome do autor seja 'Rafael'*/
SELECT * FROM usuario u
INNER JOIN curtida c 
ON c.autor = u.id
WHERE u.nome = 'Rafael';

/* D - Todos os dados da tabela autor que tenham posts e comentarios */
SELECT u.* FROM usuario u
JOIN comentario c 
ON c.autor = u.id 
JOIN post p  
ON p.autor = u.id;

/* E - Todos os dados da tabela autor que tenham curtidas e comentarios */
SELECT u.* FROM usuario u
INNER JOIN comentario c 
ON c.autor = u.id 
INNER JOIN curtida c2  
ON c2.autor = u.id;

/* F - O nome dos autores que tenham curtidas e comentarios e posts */
SELECT u.nome FROM usuario u
INNER JOIN comentario c 
ON c.autor = u.id 
INNER JOIN curtida c2  
ON c2.autor = u.id
INNER JOIN post p  
ON p.autor = u.id;

/* G - Todos os posts dos autores que tenham como segunda letra "e" no nome */
SELECT u.nome, p.* FROM usuario u
INNER JOIN post p  
ON p.autor = u.id;
WHERE u.nome LIKE '_e%';

/* H - Todos os usuarios que tenham curtido o post 1 */
SELECT u.nome FROM usuario u
INNER JOIN post p  
ON p.autor = u.id
WHERE u.id IN (SELECT c.autor FROM curtida c) AND
	p.id = 1;

/* I - O nome dos usuarios e a sua quantidade de curtidas */
SELECT u.nome, count(*) FROM usuario u
INNER JOIN curtida c
ON c.autor = u.id
GROUP BY u.nome;

/* J - O nome dos usuarios e a sua quantidade de curtidas onde tenham mais do que 1 curtida */
SELECT u.nome, count(*) AS curtidas FROM usuario u
INNER JOIN curtida c
ON c.autor = u.id
GROUP BY u.nome
HAVING count(*) > 1;



