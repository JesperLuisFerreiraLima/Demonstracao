CREATE PROCEDURE dbo.st_insereUsuario @usu varchar(80)
                                     ,@sen varchar(10)

AS
BEGIN

 INSERT INTO usu�rio (NM_Usuario
                     ,SE_Usuario)
 VALUES (@usu
        ,@sen)
END
