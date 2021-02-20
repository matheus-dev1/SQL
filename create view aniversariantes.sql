CREATE TABLE usuario
(
nome VARCHAR(25) NOT NULL,
sobrenome VARCHAR(30) NOT NULL,
data_nascimento date
);
/*Para automatizar alguns processor nos podemos criar uma visao.*/
CREATE
	ALGORITHM = UNDEFINED
    DEFINER = `root`@`localhost`
    SQL SECURITY DEFINER 
		VIEW `view_exemplo` (`nome` , `sobrenome` , `data_nascimento`, `Referencia`, `Descricao`, `Estoque`) AS
        SELECT 
			`usuario`.`nome` AS `Nome`,
			`usuario`.`sobrenome` AS `Sobrenome`,
            `usuario`.`data_nascimento` AS `Data de Nascimento`,
            `produtos`.`Referencia` AS `Referencia do Produto`,
            `produtos`.`Descricao` AS `Descricao do Produto`,
            `produtos`.`Estoque` AS `Estoque`
		FROM
			`usuario`, `produtos`;
            
select * from view_exemplo;
            
insert into usuario(nome, sobrenome, data_nascimento) values ('Pedro', 'Albuquerque', 20090819);
insert into usuario(nome, sobrenome, data_nascimento) values ('Carlos', 'Eduardo', 19990202);
insert into usuario(nome, sobrenome, data_nascimento) values ('Cesar', 'Meida', 19690202);