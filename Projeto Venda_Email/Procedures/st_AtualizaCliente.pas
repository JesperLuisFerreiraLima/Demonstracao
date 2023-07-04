CREATE PROCEDURE dbo.st_AtualizaCliente @nome  Varchar(80)
								                       ,@email Varchar(80)
								                       ,@id    Integer
AS
BEGIN

  UPDATE cliente
  SET NM_Cliente = @nome
     ,EM_Cliente = @email
  WHERE ID_Cliente = @id

END

