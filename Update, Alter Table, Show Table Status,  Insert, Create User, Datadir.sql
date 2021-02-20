select * from produto;

UPDATE `FULLSTACKELETRO`.`PRODUTO` SET IDPRODUTO = 3 WHERE (IDPRODUTO = 101);

UPDATE `FULLSTACKELETRO`.`PRODUTO` SET DATA_INCLUSAO = '2020/10/13' WHERE (idproduto = 1);
-- ANO/MES/DIA
UPDATE `FULLSTACKELETRO`.`PRODUTO` SET DATA_INCLUSAO = '2020/10/14' WHERE (IDPRODUTO >= 1);
-- INSERIR UMA DATA PARA UMA TODOS OS PRODUTOS.

update `produto` set idproduto = 4 where (idproduto = 102);
update `produto` set idproduto = 5 where (idproduto = 103);

ALTER TABLE `fullstackeletro`.`produto`
AUTO_INCREMENT = 6;
-- Altetera o valor de incremento da tabela.

SHOW TABLE STATUS LIKE 'produto';
-- Mostra informacos sobre a tabela produto

insert into `produto` (categoria, descricao, preco, precofinal, imagem)
values ('lavaloucas', 'Lava-louças Brastemp BLF10BB', 3699.00, 3329.00, 'imgs/lava_pratos1.jpeg');

insert into `produto` (categoria, descricao, preco, precofinal, imagem)
values ('microondas', 'Micro-ondas Electrolux MTD30', 499.00, 399.00, 'imgs/microondas1.jpeg');

insert into `produto` (categoria, descricao, preco, precofinal, imagem)
values ('microondas', 'Micro-ondas Midea 20L MTFB21', 499.00, 32700, 'imgs/microondas2.jpeg');

insert into `produto` (categoria, descricao, preco, precofinal, imagem)
values 
('microondas', 'Microondas Midea 31L Branco Espelhado MTFE4 110V', 494.00, 343.00, 'imgs/microondas3.jpeg'),
('fogao', 'Fogão 4 Bocas Consul Branco', 899.00, 782.00, 'imgs/fogao1.jpeg'),
('fogao', 'Fogão À Gás 5 Bocas Atlas Agile Glass Tripla Chama Automático Preto', 1249.00, 1069.00, 'imgs/fogao2.jpeg'),
('lavaroupas', 'Lavadora de Roupas Brastemp BWK12AB 12Kg', 2199.00, 1779.00, 'imgs/maquina_de_lavar_roupa1.jpeg'),
('lavaroupas', 'Lavadora de Roupas Electrolux LAC13', 1899.00, 1599.00, 'imgs/maquina_de_lavar_roupa2.jpeg'),
('lavaroupas', 'Lavadora de Roupas Electrolux LAC12', 3279.00, 166900, 'iimgs/maquina_de_lavar_roupa3.jpeg');
-- Nao necessariamente percisamos informar as colunas, caso os nossos values estejam na possicao correta!

ALTER TABLE `FULLSTACKELETRO`.`PRODUTO` CHANGE COLUMN `DATA_INCLUSAO` `DATA_INCLUSAO` DATE NULL DEFAULT NULL;

CREATE USER 'Gabriel'@'%' IDENTIFIED WITH mysql_native_password BY 'password123';
-- Criar ususario e senha. E na aba de Users and Privileges podemos dar privilegios para este ususario.

show variables like 'datadir';
-- Verificar o diretorio do meu MySQL