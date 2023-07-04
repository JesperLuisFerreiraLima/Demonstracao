CREATE PROCEDURE dbo.st_AtualizaProduto @nome  Varchar(80)
								                       ,@valor Money
								                       ,@qtd   Integer
								                       ,@id    Integer
AS
BEGIN

  UPDATE produto
  SET NM_Produto  = @nome
     ,VL_Produto  = @valor
	   ,QTD_Produto = @qtd
  WHERE ID_Produto = @ID
END
