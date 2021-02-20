DROP FUNCTION IF EXISTS somapreco;

DELIMITER $
CREATE FUNCTION somaperco(id int) RETURNS FLOAT
READS SQL DATA
BEGIN
	DECLARE SOMA FLOAT;
    SET SOMA = (
    SELECT (preco_normal + preco_descont)
		FROM produto
		WHERE id_produto = id
    );