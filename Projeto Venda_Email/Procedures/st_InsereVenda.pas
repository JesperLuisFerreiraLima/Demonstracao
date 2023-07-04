CREATE PROCEDURE dbo.st_InsereVenda  @nm_Prod  Varchar(80)
                                    ,@nm_Cli   Varchar(80)
							                      ,@qtdVenda Integer
							                      ,@codVEnda Integer
							                	    ,@erMsg   Varchar(255) Output
						                		    ,@return  Integer      Output

AS
BEGIN

  DECLARE  @idProd   Integer
		  ,@idCli    Integer
   		  ,@vlVenda  Money
		  ,@estoque  Integer
		  ,@qtd      Integer

  SET @return = 1
  SET @erMsg = '';

  SELECT @idProd  = ID_Produto
        ,@vlVenda = VL_Produto
	    ,@estoque = QTD_Produto
  FROM dbo.produto WITH (NOLOCK)
  WHERE NM_Produto = @nm_Prod

  SELECT @idCli = ID_Cliente
  FROM dbo.Cliente  WITH (NOLOCK)
  WHERE NM_Cliente = @nm_Cli

  Select @qtd = @estoque - @qtdVenda

  IF (@estoque <= 0 )
  BEGIN
    SET @return = 2;
    SET @erMsg = 'Produto '+ @nm_Prod + ' em Falta';
	RETURN
  END

  ELSE IF (@qtd <= 5 AND @qtd <= @estoque AND @qtd >=0 )
  BEGIN
    SET @return = 2;
    SET @erMsg = 'Estoque Baixo ' + @nm_Prod ;

	INSERT INTO VENDA  (ID_Produto
                       ,ID_Cliente
					   ,qtd_venda
					   ,Cod_venda
					   ,Vl_venda
					   ,DT_Venda)
    VALUES ( @idProd
		    ,@idCli
		    ,@qtdVenda
		    ,@codVEnda
		    ,@vlVenda
		    ,GETDATE() )

    UPDATE produto
    SET QTD_Produto = @estoque - @qtdVenda
    WHERE ID_Produto = @idProd
  END

  ELSE IF (@qtd <= 5 AND @qtd <= @estoque AND @qtd  < 0 )
  BEGIN
    SET @return = 2;
    SET @erMsg = 'Estoque Indispovinel: ' + @nm_Prod + '
	    Estoque produto = ' + CAST(@estoque AS VARCHAR(2)) ;
	RETURN
  END
  ELSE
  BEGIN

    INSERT INTO VENDA  (ID_Produto
                       ,ID_Cliente
					   ,qtd_venda
					   ,Cod_venda
					   ,Vl_venda
					   ,DT_Venda)
    VALUES ( @idProd
		    ,@idCli
		    ,@qtdVenda
		    ,@codVEnda
		    ,@vlVenda
		    ,GETDATE() )

    UPDATE produto
    SET QTD_Produto = @estoque - @qtdVenda
    WHERE ID_Produto = @idProd
  END
END
