DELIMITER $
CREATE TRIGGER Tgr_ItensVenda_Insert AFTER INSERT ON ItensVenda
/*Nesta linha nos estamos criando uma trigger que vai fazer alguma coisa depois de fazer um INSERT na tabela ItensVenda*/
FOR EACH ROW
BEGIN
	UPDATE Produtos SET Estoque = Estoque - NEW.Quantidade
    /*Quantidade vem de ItensVenda*/
    /*Quando eu insino na tabela ItensVenda na celula Quantidade, ele faz uma subtracao do que te na linha de produtos com o da linha de itensvenda*/
    /*Todos os valores que estavam la no meu insert devem recer new.*/
	WHERE Referencia = NEW.Produto;
END$

DELIMITER $
CREATE TRIGGER Tgr_ItensVenda_Delete AFTER DELETE ON ItensVenda
FOR EACH ROW
BEGIN
	UPDATE Produtos SET Estoque = Estoque + OLD.Quantidade
    /*Se eu excluir a linha do ItensVenda ele vai adicionar o valro de Quantidade da tabela ItensVenda na tabela Produtos*/
    /*Old e um dado ja inserido*/
	WHERE Referencia = OLD.Produto;
END$