--ex1
CREATE TABLE CidadeAux
AS
SELECT * FROM CidadeEx;


--ex2
Truncate table CidadeAux;

INSERT INTO CidadeAux
SELECT * FROM cidadeEx
WHERE UF = 'RS';



--ex3
CREATE TABLE EstoqueEx(
	IdEstoqueEx INT NOT NULL PRIMARY KEY,
	nomeEstoque VARCHAR(255) NOT NULL,
	dataCriacao DATE NOT NULL,
	capacidade NUMERIC(6,0) NOT NULL
);

INSERT INTO estoqueEx 
(IdEstoqueEx, nomeEstoque, dataCriacao, capacidade)
VALUES
(1, 'carnes',  to_date('2021/06/05','YYYY/MM/DD'), 456321);



--ex4
CREATE TABLE ProdutoEx(
	idProdutoEx INT NOT NULL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	descProduto VARCHAR(255) NOT NULL,
	dtCriacao DATE NOT NULL,
	IdEstoqueEx INT NOT NULL,
	quantidade NUMERIC(6,3) NOT NULL,
	preco NUMERIC(6,2) NOT NULL,
	FOREIGN KEY (IdEstoqueEx) REFERENCES estoqueEx (IdEstoqueEx)
);

INSERT INTO produtoEx
(idProdutoEx, nome, descProduto, dtCriacao, IdEstoqueEx, quantidade, preco)
VALUES
(1, 'picanha', 'carne de primeira', to_date('2021/06/05','YYYY/MM/DD'), 1, 453.254, 46.99);
INSERT INTO produtoEx
(idProdutoEx, nome, descProduto, dtCriacao, IdEstoqueEx, quantidade, preco)
VALUES
(2, 'carne moida', 'carne de segunda', to_date('2021/06/04','YYYY/MM/DD'), 1, 153.254, 26.99);

--ex5
UPDATE associadoEX
SET cpf = 03912619045,
	endereco = 'primeiro de maio, 35',
	bairro = 'centro',
	complemento = 'ap 25',
	idcidade = 4
WHERE idassociado = 1;

--ex6
UPDATE associadoEX
SET idcidade = null
WHERE idassociado = 1;

DELETE FROM cidadeEX
WHERE nome = 'Campinas' AND UF = 'SP';

DELETE FROM cidadeEX
WHERE nome = 'Taquara' AND UF = 'RS';
