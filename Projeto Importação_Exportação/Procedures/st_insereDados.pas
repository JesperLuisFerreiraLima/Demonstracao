CREATE procedure [dbo].[st_insereDados] @nome  Varchar(50)
                                       ,@idade Integer
						                           ,@sexo  Char(1)
						                           ,@cargo Varchar(30)
						                           ,@sal   Money
AS
BEGIN

  DECLARE @ID_Pessoa INTEGER

  IF ( @sexo = 'M')
  BEGIN
    INSERT INTO Pessoa ( Nm_Pessoa
                        ,Ida_Pessoa
  					    ,SX_Pessoa )
    VALUES ( @nome
            ,@idade
		    ,'Masculino' )
  END

  IF ( @sexo = 'F')
  BEGIN
    INSERT INTO Pessoa ( Nm_Pessoa
                        ,Ida_Pessoa
  					    ,SX_Pessoa )
    VALUES ( @nome
            ,@idade
		    ,'Feminino' )
  END


  SELECT @ID_Pessoa = ID_Pessoa
  FROM PESSOA
  WHERE Nm_Pessoa = @nome

  INSERT INTO Cargo ( Nm_Cargo
                    , Sl_Cargo
					, ID_Pessoa )

  VALUES ( @cargo
          ,@sal
		  ,@ID_Pessoa)

END





