CREATE PROCEDURE dbo.st_excluiProduto @id Integer
AS
BEGIN

  DELETE produto
  WHERE ID_Produto = @id

END
