CREATE DATABASE ProdutosPro;

DROP DATABASE ProdutosPro;

USE ProdutosPro;

CREATE TABLE Produtos (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  NomeProduto VARCHAR(255),
  Preco DECIMAL(10, 2)
);

DELIMITER //
CREATE TRIGGER trg_Aumentar_Preco
BEFORE UPDATE ON Produtos
FOR EACH ROW
BEGIN
  SET NEW.Preco = NEW.Preco * 1.1;
END;
//
DELIMITER ;

-- Registro de produto com preço inicial
INSERT INTO Produtos (NomeProduto, Preco) VALUES ('Pentedeira', 100.00);

-- Atualizar o registro, aumentará o preço em 10%)
UPDATE Produtos SET Preco = 110.00 WHERE Id = '1';

SELECT NomeProduto, Preco FROM Produtos WHERE Id = '1';
