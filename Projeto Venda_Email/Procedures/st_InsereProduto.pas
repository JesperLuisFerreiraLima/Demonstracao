CREATE PROCEDURE dbo.st_InsereProduto @nome  Varchar(80)
                                     ,@valor Money
                                     ,@qtd   Integer
AS
BEGIN

  INSERT INTO produto (NM_Produto
                      ,VL_Produto
					  ,QTD_Produto)
  VALUES ( @nome
		  ,@valor
		  ,@qtd  )
END
