CREATE PROCEDURE dbo.st_ExcluiCliente @id    Integer
AS
BEGIN
  DELETE FROM cliente
  WHERE ID_Cliente = @id
END
