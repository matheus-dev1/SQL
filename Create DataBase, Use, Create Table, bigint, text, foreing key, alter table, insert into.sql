CREATE DATABASE lojaVenda;

USE lojaVenda;

CREATE TABLE fornecedor (
idFornecedor int primary key auto_increment not null,
empresa text not null,
cpf bigint not null,
logradouro varchar(80) not null,
numero varchar(80) not null,
bairro varchar(80) not null,
cidade varchar(80) not null,
estado varchar(80) not null);

CREATE TABLE produtos (
idProdutos int primary key auto_increment not null,
nome text,
qtd int,
idFornecedor int,
constraint fkFornecedor foreign key(idFornecedor) references fornecedor(idFornecedor));

CREATE TABLE cliente (
idCliente int primary key auto_increment not null,
nome text not null,
telefone int,
dataNascimento date,
cpf bigint not null,
logradouro varchar(80) not null,
numero varchar(80) not null,
bairro varchar(80) not null,
cidade varchar(80) not null,
estado varchar(80) not null);

CREATE TABLE vendas(
idVendas int primary key auto_increment not null,
idClientes int,
idProdutos int,
constraint fkCliente foreign key(idClientes) references cliente(idCliente),
constraint fkProduto foreign key(idProdutos) references produtos(idProdutos),
qtd bigint not null);

ALTER TABLE `lojavenda`.`fornecedor` 
CHANGE COLUMN `cpf` `cnpj_cpf` BIGINT NOT NULL ;

INSERT INTO fornecedor (empresa, cnpj_cpf, logradouro, numero, bairro, cidade, estado) 
VALUES ('Sophia e Stefany Telecom ME', '87365905000143', 'Viela Oceano', '956', 'Jardim Zaira', 'Mauá', 'SP'),
('Bruna e Heitor Advocacia Ltda', '44709724000184', 'Rua Turumãs', '972', 'Vila Parque Jabaquara', 'São Paulo', 'SP'),
('Manuela e Diego Pães e Doces Ltda', '78615180000103', 'Rua Antônio F. C. Branco', '997', 'Jardim Recanto do Jaguari', 'São João da Boa Vista', 'SP'),
('Tiago e Bianca Pizzaria Delivery ME', '02326869000156', 'Rua dos Artistas', '701', 'Cipava', 'Osasco', 'SP'),
('Lorenzo e Rosa Advocacia Ltda', '91120844000121', 'Rua Manoel Zeferino', '212', 'Centro(Parnaso)', 'Tupã', 'SP');

INSERT INTO produtos(nome, qtd, idFornecedor)
VALUES ('Atraente Daw', 122, '2'),
('Daw Geradora', 100, '3'),
('Felizes Daw', 93, '4'),
('Daw Amigas', 334, '5'),
('Daw Shampoo', 12, '6');

ALTER TABLE `lojavenda`.`cliente` 
CHANGE COLUMN `telefone` `telefone` BIGINT(11) NULL DEFAULT NULL ;

INSERT INTO cliente(nome, telefone, dataNascimento, cpf, logradouro, numero, bairro, cidade, estado)
VALUES ('Samuel Pietro Vitor da Silva', '9125430401', '2001-08-01', '39579792186', 'Quadra Dois', '304', 'Pedreira', 'Capanema', 'PA'),
('Bianca Juliana Marcela Cardoso', '9529203184', '1961-01-23', '49687046660', 'Rua Governador Adeumar Soares da Rocha', '247', 'Dr. Airton Rocha', 'Boa Vista', 'RR'),
('Erick Geraldo Sebastião Bernardes', '6139131558', '1998-09-22', '52578829810', 'Quadra QC 1 Conjunto Q', '637', 'Santa Maria', 'Brasília', 'DF'),
('Yago Bryan das Neves', '6128777889', '2001-10-12', '74400281396', 'Quadra Quadra 86', '323', 'Parque Estrela Dalva XI', 'Santo Antônio do Descoberto', 'GO'),
('Vitória Louise da Paz', '6337154529', '1975-10-11', '28876668357', 'Rua Tingui, s/n', '238', 'Setor Central', 'Sucupira', 'TO'),
('Miguel Bruno da Cunha', '6439211578', '1964-04-25', '43797720718', 'Rua Xixá', '579', 'Mãe de Deus', 'Catalão', 'GO');

-- Data de Criacao e Data de Modificacao - Sao campos obrigatorio para toda tabela.
-- Campo automatico de Data. DateTime, TimeStamp