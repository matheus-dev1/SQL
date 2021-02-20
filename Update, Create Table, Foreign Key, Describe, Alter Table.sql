USE recodepro;

select * from curso;

UPDATE CURSO SET NOME = 'Desenvolvimento de Games', COD_CUR = 'C1' WHERE COD_CUR = 1;
#Quando eu vou atulizar mais de 2 valores eu nao preciso usar outro SET.

CREATE DATABASE sistema_escolar;

use sistema_escolar;

CREATE TABLE ALUNO
(
idaluno int auto_increment primary key,
nome varchar(60),
genero varchar(15),
endereco varchar(80),
bairro varchar(80),
cidade varchar(40),
cep int
);

CREATE TABLE TELEFONE
(
idtelefone int auto_increment primary key,
id_aluno int,
telefone int,
CONSTRAINT fk_aluno_telefone FOREIGN KEY (id_aluno) REFERENCES aluno (idaluno)
#Cada aluno pode ter varios numeros de telefone, por isso da chave estrangeiro e assim que devemos
#pensar quando criamos uma chave estrangeira que e 1 para n, sendo n a quantidade de numeros de telefone
);
#FOREIGN KEY `sistema_escolar`.`aluno`(`idaluno`) REFERENCES `sistema_escolar`.`telefone` (`idtelefone`)
#foreign key (idtelefone) references fk_idaluno_to_idtelefone(idaluno)
SELECT * FROM ALUNO;
SELECT * FROM TELEFONE;

DROP TABLE TELEFONE; -- Excluir a tabela.
DROP TABLE aluno;

describe aluno; -- Descreve os tipos de dados da tabela.

SELECT NOME FROM ALUNO WHERE idaluno = 2;

select telefone from telefone where id_aluno = 1;

/*
ALTER TABLE `recodepro`.`curso` 
ADD CONSTRAINT `asdsada`
  FOREIGN KEY (`cod_cur`)
  REFERENCES `recodepro`.`disciplina` (`cod_dis`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
*/

/*
ALTER TABLE `sistema_escolar`.`aluno` 
ADD CONSTRAINT `fk_idaluno_to_idtelefone`
  FOREIGN KEY (`idaluno`)
  REFERENCES `sistema_escolar`.`telefone` (`idtelefone`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
*/