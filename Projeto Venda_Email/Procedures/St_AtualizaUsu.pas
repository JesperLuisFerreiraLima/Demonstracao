CREATE PROCEDURE dbo.St_AtualizaUsu @id    INTEGER
                                   ,@nome  VARCHAR(50)
								                   ,@senha VARCHAR(10)
AS
BEGIN
  UPDATE usuário
  SET NM_Usuario = @nome
     ,SE_Usuario = @senha
  WHERE ID_Usuario = @id
END
