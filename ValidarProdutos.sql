CREATE DATABASE ValidarPro;

DROP DATABASE ValidarPro;

USE ValidarPro;


CREATE TABLE Produtos (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  NomeProduto VARCHAR(255) NOT NULL,
  DataValidade DATE
);

DELIMITER //
CREATE TRIGGER trg_Validar_DataValidade
BEFORE INSERT ON Produtos
FOR EACH ROW
BEGIN
  IF NEW.DataValidade < CURDATE() THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data de validade do produto expirada';
  END IF;
END;
//
DELIMITER ;

-- Registro com uma data de validade válida
INSERT INTO Produtos (NomeProduto, DataValidade) VALUES ('Feijão', '2023-12-21');

-- Registro com uma data de validade vencida
INSERT INTO Produtos (NomeProduto, DataValidade) VALUES ('Arroz', '2022-06-15');

SELECT NomeProduto, DataValidade FROM Produtos;



