CREATE TABLE disciplina
(cod_dis VARCHAR(5) NOT NULL,
nome VARCHAR(20) NOT NULL,
carga_horaria INTEGER NOT NULL,
area VARCHAR(20),
credito integer,
UNIQUE (nome),
PRIMARY KEY (cod_dis));

CREATE TABLE curso
(cod_cur VARCHAR(5) NOT NULL,
nome VARCHAR(5) NOT NULL,
tipo VARCHAR(12),
duracao INTEGER,
PRIMARY KEY (cod_cur));

CREATE TABLE professor
(cod_pro VARCHAR(5) NOT NULL,
nome VARCHAR(60),
endereco VARCHAR(80),
PRIMARY KEY (cod_pro));

CREATE TABLE grade
(cod_cur VARCHAR(5),
cod_dis VARCHAR(5),
cod_pro VARCHAR(5),
sala INTEGER,
PRIMARY KEY (cod_cur, cod_dis, cod_pro),
FOREIGN KEY (cod_cur) REFERENCES curso (cod_cur),
FOREIGN KEY (cod_dis) REFERENCES disciplina (cod_dis),
FOREIGN KEY (cod_pro) REFERENCES PROFESSOR (cod_pro));

