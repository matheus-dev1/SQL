USE FULLSTACKELETRO;

SELECT * FROM PEDIDOS;

SELECT * FROM PRODUTOS;

CREATE TABLE MENSAGEM 
(
id int not null primary key auto_increment,
nome varchar(80) not null,
email varchar(80) not null,
assunto varchar(20) not null,
mensagem varchar(1000) not null,
data_post datetime default now() -- No momento em que eu fazer a isercao de dados ele coloca a hora em que eu inseri.
)

select * from mensagem