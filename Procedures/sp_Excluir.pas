CREATE PROCEDURE [dbo].[sp_Excluir]  @pessoa integer
AS
BEGIN

  DELETE FROM Cargo
  WHERE ID_Pessoa = @pessoa

  DELETE FROM Pessoa
  WHERE ID_Pessoa = @pessoa

END

