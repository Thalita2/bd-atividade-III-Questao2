CREATE DATABASE ExclusaoFun;

DROP DATABASE ExclusaoFun;

USE ExclusaoFun;

CREATE TABLE tb_Funcionarios (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  NomeFun VARCHAR(255) NOT NULL,
  Cargo VARCHAR(255) NOT NULL
);

CREATE TABLE tb_Funcionarios_Demitidos (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  NomeFun VARCHAR(255) NOT NULL,
  Cargo VARCHAR(255) NOT NULL,
  DataDemissao DATE
);

DELIMITER //
CREATE TRIGGER trg_Registro_Demissao
AFTER DELETE ON tb_Funcionarios
FOR EACH ROW
BEGIN
  INSERT INTO tb_Funcionarios_Demitidos (NomeFun, Cargo, DataDemissao)
  VALUES (OLD.NomeFun, OLD.Cargo, CURDATE());
END;
//
DELIMITER ;

-- Registro de funcionário
INSERT INTO tb_Funcionarios (NomeFun, Cargo) VALUES ('João', 'Gerente');

-- Deletar registro de funcionário
DELETE FROM tb_Funcionarios WHERE Id = 1;

SELECT * FROM tb_Funcionarios_Demitidos;
