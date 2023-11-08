CREATE DATABASE ExclusaoDep;

DROP DATABASE ExclusaoDep;

USE ExclusaoDep;


CREATE TABLE tb_Funcionarios (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  NomeFun VARCHAR(255) NOT NULL
);


CREATE TABLE tb_Dependentes (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  NomeFun VARCHAR(255) NOT NULL,
  FuncionarioId INT
);


INSERT INTO tb_Funcionarios (NomeFun) VALUES ('João');
INSERT INTO tb_Dependentes (NomeFun, FuncionarioId) VALUES ('Maria', 1);


DELIMITER //
CREATE TRIGGER trg_Excluir_Dependentes
AFTER DELETE ON tb_Funcionarios
FOR EACH ROW
BEGIN
  DELETE FROM tb_Dependentes WHERE FuncionarioId = OLD.Id;
END;
//
DELIMITER ;

-- Excluir um funcionário
DELETE FROM tb_Funcionarios WHERE Id = 2;

SELECT * FROM tb_Funcionarios;
SELECT * FROM tb_Dependentes;
