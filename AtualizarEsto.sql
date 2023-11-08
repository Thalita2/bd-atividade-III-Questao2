CREATE DATABASE AtualizarEsto;

DROP DATABASE AtualizarEsto;

USE AtualizarEsto;

CREATE TABLE Produtos (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  NomeProduto VARCHAR(255) NOT NULL,
  Estoque INT NOT NULL
);

CREATE TABLE Vendas (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  IdProduto INT,
  Quantidade INT NOT NULL
);

DELIMITER //
CREATE TRIGGER trg_Atualizar_Estoque
AFTER INSERT ON Vendas
FOR EACH ROW
BEGIN
  UPDATE Produtos
  SET Estoque = Estoque - NEW.Quantidade
  WHERE Id = NEW.IdProduto;
END;
//
DELIMITER ;

-- Registro de produto com estoque inicial
INSERT INTO Produtos (NomeProduto, Estoque) VALUES ('Armário', 100);

-- Registro de venda
INSERT INTO Vendas (IdProduto, Quantidade) VALUES (1, 5);

SELECT NomeProduto, Estoque FROM Produtos WHERE Id = 1;
