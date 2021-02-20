CREATE TABLE postagens (
id_postagens int PRIMARY KEY AUTO_INCREMENT,
conteudo VARCHAR(400) NOT NULL,
fk_usuario int NOT NULL, 
FOREIGN KEY(fk_usuario) REFERENCES usuarios(id) ON DELETE CASCADE
-- A chave estrangeira e o que faz a conexao entre tabelas.on update
-- Neste caso eu estou conectando cada postagem a sempre o usuairo que fez a postagem.on update
-- No modo cascada ou seja, se eu excluir o usuario eu excluio as postagems.
);

SELECT * FROM usuarios;
SELECT * FROM postagens;
SELECT * FROM postagens JOIN usuarios WHERE fk_usuario = id;