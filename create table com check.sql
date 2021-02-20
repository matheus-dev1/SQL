CREATE TABLE produtos 
(produto_num integer, 
descricao VARCHAR(40), 
preco numeric 
CONSTRAINT preco_positivo CHECK (preco > 0));

INSERT INTO produtos (produto_num, descricao, preco) values (1, 'Martelo', 20); 

truncate table produtos;

drop table produtos;