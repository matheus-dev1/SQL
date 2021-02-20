CREATE DATABASE supermercado;

use supermercado;

CREATE TABLE produto
(id int PRIMARY key AUTO_INCREMENT,
nome varchar(40) NOT NULL,
quantidade int NOT NULL,
preco float);

INSERT INTO `produto`(`nome`, `quantidade`, `preco`) 
VALUES 
	("Arroz", 20, 12.50), 
	("Feijão", 30, 10.99), 
	("Carne", 10, 12.50), 
	("Linguiça", 300, 8.00), 
	("frango", 10, 9.00), 
	("Suco", 80, 1.99), 
	("Feijão", 30, 10.99), 
	("Arroz", 20, 12.50);
    
SELECT * FROM PRODUTO;

SELECT * FROM PRODUTO
WHERE (NOME = 'ARROZ' OR NOME = 'Feijão');

UPDATE PRODUTO
SET QUANTIDADE = 8
WHERE (nome = 'carne');

UPDATE PRODUTO
SET PRECO = 18
WHERE (nome = 'carne');

UPDATE PRODUTO
SET PRECO = 18 AND PRECO = 8
WHERE (nome = 'carne');

DELETE FROM PRODUTO WHERE (ID  = 1);
DELETE FROM PRODUTO WHERE (ID  = 2);
DELETE FROM PRODUTO WHERE (ID  = 4);

-- Sintaxe Delete - EXCLUI APENAS OS DADOS E NAO A TEBELA EM SI
-- DELETE FROM TABELA WHERE COLUNA = VALOR;.

-- SINTAXE TRUNCATE - EXCLUI APENAS OS DADOS E NAO A TEBELA EM SI
-- TRUNCATE TABELA

CREATE TABLE PEDIDOS
(
id_pedido int primary key auto_increment,
qtd_itens int not null,
nome varchar(40) not null,
telefone int not null
);

SELECT * FROM pedidos;