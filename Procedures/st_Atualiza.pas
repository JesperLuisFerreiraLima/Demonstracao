CREATE procedure [dbo].[st_Atualiza] @nome      Varchar(50)
							                      ,@idade     Integer
							                      ,@sexo      Varchar(10)
							                      ,@cargo     Varchar(30)
							                      ,@sal       Money
                                    ,@pessoa Integer
AS
BEGIN

 UPDATE Pessoa
 SET Nm_Pessoa   = @nome
   ,Ida_Pessoa   = @idade
   ,SX_Pessoa    = @sexo
 WHERE id_pessoa = @pessoa

 UPDATE Cargo
 SET Nm_Cargo    = @cargo
    ,Sl_cargo    = @sal
 WHERE id_pessoa = @pessoa

END
