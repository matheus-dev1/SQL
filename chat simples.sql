CREATE DATABASE chatsimples;

CREATE TABLE chat1(
id int not null auto_increment primary key,
nome varchar(30) not null,
mensagem text not null
);

SELECT * FROM chat1