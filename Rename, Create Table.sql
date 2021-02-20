SELECT * FROM FULLSTACKELETRO.pedidos;

ALTER TABLE `fullstackeletro`.`produto` 
RENAME TO  `fullstackeletro`.`produtos` ;
-- Renomear Tabela

CREATE TABLE PEDIDOS 
(idpedidos int not null auto_increment,
nome_cli varchar(50) not null,
endereco varchar(80) not null,
telefone int not null,
produto varchar(150) not null,
valor_uni decimal(8, 2) not null,
qtd_prod int not null,
valor_total int not null,
PRIMARY KEY (idpedidos));