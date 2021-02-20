CREATE DATABASE ContaBanco;

use ContaBanco;

CREATE TABLE Bancos (
id_cod int primary key not null,
nome_banco varchar(50) not null
);

CREATE TABLE Pessoas (
cpf int primary key not null,
nome_pessoa varchar(100));

CREATE TABLE ContaCorrente (
id_cod int not null,
cpf int not null,
constraint fk_cod_banco foreign key(id_cod) references Bancos(id_cod),
constraint fk_cpf foreign key(cpf) references Pessoas(cpf),
numero int not null);

ALTER TABLE `contabanco`.`pessoas` 
CHANGE COLUMN `cpf` `cpf` BIGINT(12) NOT NULL ;

INSERT INTO `contabanco`.`pessoas` (`cpf`, `nome_pessoa`) VALUES ('12345678912', 'Jose da Silva');
insert into `contabanco`.`pessoas` (`cpf`, `nome_pessoa`) VALUES ('86786786786', 'Matheus da Silva');
insert into `contabanco`.`pessoas` (`cpf`, `nome_pessoa`) values ('92381237653', 'Ricardo Legani');
insert into `contabanco`.`pessoas` (`cpf`, `nome_pessoa`) values ('92381233433', 'Leticia Orniele');

insert into `contabanco`.`bancos` (`id_cod`, `nome_banco`) values ('422', 'Safra');

ALTER TABLE `contabanco`.`contacorrente` 
ADD CONSTRAINT `fp_cpf`
  FOREIGN KEY (`cpf`)
  REFERENCES `contabanco`.`pessoas` (`cpf`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
insert into `contabanco`.`ContaCorrente` (`id_cod`, `cpf`, `numero`) values ('033', '12345678912', '43434');
insert into `contabanco`.`ContaCorrente` (`id_cod`, `cpf`, `numero`) values ('237', '86786786786', '43435');
insert into `contabanco`.`ContaCorrente` (`id_cod`, `cpf`, `numero`) values ('341', '92381237653', '43436');

ALTER TABLE `contabanco`.`contacorrente` 
DROP FOREIGN KEY `fk_cod_banco`,
DROP FOREIGN KEY `fp_cpf`;
ALTER TABLE `contabanco`.`contacorrente` 
ADD CONSTRAINT `fk_cod_banco`
  FOREIGN KEY (`id_cod`)
  REFERENCES `contabanco`.`bancos` (`id_cod`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fp_cpf`
  FOREIGN KEY (`cpf`)
  REFERENCES `contabanco`.`pessoas` (`cpf`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

DELETE FROM ContaCorrente WHERE (id_cod = 33);

SELECT * FROM Bancos
	INNER JOIN ContaCorrente
		ON Bancos.id_cod = ContaCorrente.id_cod;
        
SELECT * FROM Pessoas
	INNER JOIN ContaCorrente as CC -- CC ContaCorrente
		ON Pessoas.cpf = CC.cpf
        WHERE CC.id_cod = '33';
        
SELECT * FROM Bancos
	INNER JOIN ContaCorrente
		ON Bancos.id_cod = ContaCorrente.id_cod
	INNER JOIN Pessoas
		ON ContaCorrente.cpf = Pessoas.cpf;
        
SELECT * FROM Bancos
	LEFT OUTER JOIN ContaCorrente
		ON Bancos.id_cod = ContaCorrente.id_cod;
        
-- LEFT = Baixo / Esquerda
-- RIGHT = Cima / Direita
SELECT * FROM ContaCorrente
	RIGHT OUTER JOIN Pessoas
		ON ContaCorrente.cpf = Pessoas.cpf;
	
-- Indices e o que voce quer priorizar tanto nas suas consultas quanto nos seus relacionamentos.

ALTER TABLE `lojavenda`.`produtos` 
ADD COLUMN `preco` INT NULL AFTER `qtd`;

ALTER TABLE `lojavenda`.`produtos` 
CHANGE COLUMN `preco` `preco` FLOAT NULL DEFAULT NULL ;

UPDATE `lojavenda`.`produtos` SET `preco` = '25.99' WHERE (`idProdutos` = '1');
UPDATE `lojavenda`.`produtos` SET `preco` = '100' WHERE (`idProdutos` = '2');
UPDATE `lojavenda`.`produtos` SET `preco` = '210' WHERE (`idProdutos` = '3');
UPDATE `lojavenda`.`produtos` SET `preco` = '345' WHERE (`idProdutos` = '4');
UPDATE `lojavenda`.`produtos` SET `preco` = '5' WHERE (`idProdutos` = '5');
UPDATE `lojavenda`.`produtos` SET `preco` = '100' WHERE (`idProdutos` = '6');

INSERT INTO `lojavenda`.`vendas` (`idClientes`, `idProdutos`, `qtd`) VALUES ('2', '4', '5');
INSERT INTO `lojavenda`.`vendas` (`idClientes`, `idProdutos`, `qtd`) VALUES ('1', '3', '25');

INSERT INTO `lojavenda`.`vendas` (`idClientes`, `idProdutos`, `qtd`) VALUES ('3', '1', '10');
INSERT INTO `lojavenda`.`vendas` (`idClientes`, `idProdutos`, `qtd`) VALUES ('6', '6', '12');

SELECT MAX(vendas.qtd) from vendas; -- MAior quantidade de produtos vendidos de um determinado produto.

select max(vendas.qtd), produtos.nome as maiorVenda
	from vendas 
		inner join produtos on produtos.idProdutos = vendas.IdProdutos;
        
select max(vendas.qtd) as maiorVenda, produtos.nome nomeProduto from vendas inner join produtos on produtos.idProdutos = vendas.IdProdutos;

SELECT * FROM VENDAS
	INNER JOIN PRODUTOS
		ON PRODUTOS.idProdutos = vendas.idProdutos;
        
use lojavenda;

SELECT * FROM VENDAS;
SELECT * FROM produtos;
SELECT * FROM CLIENTE;

-- 1 - Qual recorde de vendas de um produto?? -- Qual produto que mais vendeu??
SELECT PRODUTOS.NOME AS NOME_PRODUTO, SUM(VENDAS.QTD) AS VALOR_PRODUTO FROM VENDAS
-- Neste linha eu estou buscando apenas a coluna NOME em PRODUTOS e SOMANDO todas as vendas de cada
-- produto(PROTUDO.NOME). 
		INNER JOIN PRODUTOS
        -- Aqui eu estou juntando as duas tabelas VENDAS E PRODUTOS, para que eu possa comparar
        -- os produtos vendidos pelo ID, tanto na tabela VENDAS.IDPRODUTOS como na PRODUTOS.IDPRODUTOS
			ON vendas.idProdutos = PRODUTOS.idProdutos
            -- Verificando todas as vendas de produtos que ocorreram.
				GROUP BY PRODUTOS.NOME
                -- Estou fazendo um Order By para pegar apenas um nome de cada produto.
                -- que consequentemente vai esta relacionado com o total de vendas deste produto.
                -- Exemplo: Foram vendidos 10 paes entao pao vai estar 10 vezes na tabela.
                -- mas eu so quero uma vez o pao e a soma do valor da venda dos paes que estara 
                -- relacionado apenas a uma linha pao e total.
					ORDER BY VENDAS.QTD DESC;
                    -- Ordeno as vendas de forma decrescente.
						-- LIMIT 1;
                        -- Aqui eu passo que eu quero apenas o limite de um, ou seja, a primeira
                        -- linha desta consulta.

-- 2 - Qual comprador comprou mais produtos??
SELECT CLIENTE.NOME AS NOME_CLIENTE, PRODUTOS.NOME AS NOME_PRODUTO, SUM(VENDAS.QTD) AS QTD_VENDAS
-- A soma neste caso tem a utilidade se somar caso o mesmo cliente tenha comprado o mesmo produto
-- mais de uma vez. E se caso ele tambem tenha compado so uma vez nao causa problema.
	FROM CLIENTE
		INNER JOIN VENDAS
			ON CLIENTE.IDCLIENTE = VENDAS.IDCLIENTES
		INNER JOIN PRODUTOS
			ON VENDAS.IDPRODUTOS = PRODUTOS.IDPRODUTOS
				GROUP BY PRODUTOS.NOME
                -- O GROUP BY SERVE PARA AGRUPAR ATRIBUTOS, NO CASO ELE DEVE EXIBIR 
                -- APENAS UM VALOR DE CADA TIPO EXEMPLO
				-- SE POSSUI O VALOR 600 EM DUAS DIFERENTES TUPLAS ENTAO ELE IRA EXIBIR
                -- APENAS UMA VEZ O VALOR 600 MESMO QUE ELE POSSUA DUAS OU MAIS OCORRENCIAS.
					ORDER BY VENDAS.QTD DESC
						LIMIT 1;

-- 3 - Qual fornecedor entregou mais produtos??
SELECT FORNECEDOR.EMPRESA AS NOME_EMPRESA, SUM(PRODUTOS.QTD) AS QTD_PRODUTOS_FORNECIDOS FROM FORNECEDOR
	INNER JOIN PRODUTOS
		ON FORNECEDOR.IDFORNECEDOR = PRODUTOS.IDFORNECEDOR
			GROUP BY FORNECEDOR.EMPRESA
				ORDER BY PRODUTOS.QTD DESC;
        
INSERT INTO `lojavenda`.`produtos` (`nome`, `qtd`, `preco`, `idFornecedor`) VALUES ('Daw Macarrao', '100', '25.5', '4');

-- 4 - Qual a venda mais cara(valor do produto vezes a quantidade de produtos vendidos)??
-- (Produto.valor * vendas.quantidade)
SELECT PRODUTOS.NOME AS NOME_PRODUTO, (PRODUTOS.PRECO * VENDAS.QTD) AS VENDA_MAIS_CARA FROM VENDAS
	INNER JOIN PRODUTOS
		ON VENDAS.IDPRODUTOS = PRODUTOS.IDPRODUTOS
			ORDER BY (PRODUTOS.PRECO * VENDAS.QTD) DESC;
            


-- 5 - Quais produtos não foram vendidos??
SELECT * FROM PRODUTOS
	LEFT OUTER JOIN VENDAS
		ON PRODUTOS.IDPRODUTOS = VENDAS.IDPRODUTOS
			WHERE VENDAS.IDVENDAS IS NULL;
        
INSERT INTO `lojavenda`.`produtos` (`nome`, `qtd`, `preco`, `idFornecedor`) VALUES ('Feijao Daw', '444', '25.99', '6');

-- 6 - Qual cliente não comprou nada??
SELECT * FROM CLIENTE
	LEFT OUTER JOIN VENDAS
		ON CLIENTE.IDCLIENTE = VENDAS.IDCLIENTES
			WHERE VENDAS.IDVENDAS IS NULL;

-- 7 – Qual a faixa etária de quem(CLIENTE) comprou mais??
SELECT CLIENTE.NOME AS NOME_CLIENTE, PRODUTOS.NOME AS NOME_PRODUTO, SUM(VENDAS.QTD) AS QTD_VENDAS,
TIMESTAMPDIFF(YEAR, CLIENTE.DATANASCIMENTO, NOW()) AS IDADE_CLIENTE
	FROM CLIENTE
		INNER JOIN VENDAS
			ON CLIENTE.IDCLIENTE = VENDAS.IDCLIENTES
		INNER JOIN PRODUTOS
			ON VENDAS.IDPRODUTOS = PRODUTOS.IDPRODUTOS
				GROUP BY PRODUTOS.NOME
					ORDER BY VENDAS.QTD DESC;