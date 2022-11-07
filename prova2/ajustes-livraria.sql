-- a) Atualize o preço do livro, cujo título é “Torto Arado”, para R$ 46,00.
UPDATE livro SET preco = 46
WHERE titulo = 'Torto Arado';

-- b) Exclua o registro da autora cujo nome é “Chimamanda Adichie”.
DELETE FROM autor 
WHERE nome = 'Chimamanda Adichie';