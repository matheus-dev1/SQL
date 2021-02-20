-- Alterando o DELIMITADOR PARA $$ EM VEZ DE ;
DELIMITER $$

-- AQUI EU ESTROU CRIANDO UMA PROCEDURE(FUNCAO) E DANDO UM NOME A ELA E INICIANDO,
-- PODEMOS ENTENDER O BEGIN E O END COMO {} DE UMA FUNCAO NORMALMENTE USADA.
-- E DENTRO DE BEGIN E END FICA TUDO O QUE O PROCEDURE IRA FAZER 
CREATE PROCEDURE HoraAtual() BEGIN
	SELECT NOW() AS HoraAtual;
END$$

-- AQUI EU ESTOU CHAMANDO A PROCEDURE COMO SE FOSSE UMA FUNCAO MESMO.
CALL HoraAtual();

DELIMITER ;

-- -----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE HoraAtualMenos3(IN FusoSp INT) BEGIN
	SELECT NOW() AS HoraAtual,
    -- ESTA FUNCAO DATE_ADD FAZ COM QUE A GENTE CONSIGA MUDAR A HORA PARA A DO BRASIL -3
	DATE_ADD(NOW(), INTERVAL FusoSp HOUR) AS HoraFusoSp;
END $$

CALL HoraAtualMenos3(-3);

DELIMITER ;

-- ---------------------------------------------------------------------- 
USE `recodepro`;
DROP procedure IF EXISTS `HoraAtualMenos3`;

DELIMITER $$
USE `recodepro`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `HoraAtualMenos3`(IN FusoSp INT)
BEGIN
	SELECT NOW() AS HoraAtual,
	DATE_ADD(NOW(), INTERVAL FusoSp HOUR) AS HoraFusoSp;
END$$

DELIMITER ;

-- ----------------------------------------------------------------------

DELIMITER $$
-- O INOUR RECEBE PARAMETRO COMO RETORNA VALORES, JA O IN APENAS RECEBE, E
-- O OUT APENAS RETORNA VALORES.
CREATE PROCEDURE SOMA (INOUT N1 INT, INOUT N2 INT, OUT N3 INT) BEGIN
	SET N1 = N1 + 1;
    SET N2 = N2 + 2;
	SET N3 = N1 + N2;
END$$

DELIMITER ;

-- DECLARANDO UMA VARIAVEL, tem que ter o @
SET @N1 = 5;
SET @N2 = 5;
CALL SOMA(@N1, @N2, @N3);
SELECT @N3 AS TotalSoma;

-- Obs: Uma boa pratica de nomeacaode procedure e colocar pr_ antes da procedure para
-- voce saber que aquilo e uma procedure.

DELIMITER $$

-- A FUNCTION APENAS ACEITA PARAMETRO DE ENTRADA E NOS DEFINIMOS QUAL O TIPO DO VALOR DO
-- RETORNO DA FUNCAO.
CREATE FUNCTION CONTADOR(Valor INT) RETURNS INT
-- A FUNCTION EH USADA APENAS PARA PROCESSAMENTO DE DADOS E NAO PARA EXIBIR DADOS.
READS SQL DATA
BEGIN
	SET Valor = Valor + 1;
    RETURN Valor;
END$$

DELIMITER ;

SET @Val = 0;
-- UMA FUNCAO NAO PODE SER CHAMADA SOZINHA, APENAS DENTRO DE UM STATEMENTS
SELECT CONTADOR(@val);
SELECT @Val;

-- --------------------------------------------------------------------------
DELIMITER $$

CREATE FUNCTION ReturnHello(UserName char(20))
RETURNS CHAR(50)
READS SQL DATA
BEGIN
	RETURN CONCAT('Ola ', UserName, '. Tudo bem?');
END$$

DELIMITER ;

SELECT ReturnHello('Matheus');

-- ---------------------------------------------------------------------
-- UMA VIEW SERVE APENAS PARA O SELECT
CREATE VIEW Products AS
-- A ideia disso aqui e tanto uma questao de seguranca como uma consulta frequente que
-- pode ser incurtada.
SELECT * FROM PRODUTOS;

SELECT * from Products
where idproduto = 3;

-- Obs: Uma boa pratica eh usao vw_ antes de um view