alter table disciplina
modify nome VARCHAR(50);
/*Altera uma propriedade da coluna nome, nos estamos alterando a capacidade de caracteres.*/

ALTER TABLE disciplina
CHANGE COLUMN nome nome_dis VARCHAR(70) NULL DEFAULT NULL;
/*Aqui nos estamos alterando o nome da column nome para nome_dis, aumentando o tamanho da quantidade de caracteres para 70 e as propriedades desta column sendo vazio como padra*/

ALTER TABLE disciplina
ADD INDEX ind_carga_horaria (carga_horaria ASC) VISIBLE;

ALTER TABLE professor
CHANGE COLUMN nome nome_pro VARCHAR(70) NULL DEFAULT NULL;

ALTER TABLE professor
CHANGE COLUMN nome_pro nome VARCHAR(90) NULL DEFAULT NULL;

ALTER TABLE professor
ADD COLUMN cidade VARCHAR(80) NULL;

ALTER TABLE professor
ADD COLUMN titulo VARCHAR(10) NULL AFTER cidade;