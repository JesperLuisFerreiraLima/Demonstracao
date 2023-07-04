CREATE PROCEDURE dbo.st_InsereCliente @nome  Varchar(80)
                                     ,@email Varchar(80)
AS
BEGIN

  INSERT INTO cliente (NM_Cliente
                      ,EM_Cliente )

   VALUES ( @nome
           ,@email )

END

