-- a) Atualize o pre�o do livro, cujo t�tulo � �Torto Arado�, para R$ 46,00.
UPDATE livro SET preco = 46
WHERE titulo = 'Torto Arado';

-- b) Exclua o registro da autora cujo nome � �Chimamanda Adichie�.
DELETE FROM autor 
WHERE nome = 'Chimamanda Adichie';