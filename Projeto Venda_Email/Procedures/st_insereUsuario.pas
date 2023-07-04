CREATE PROCEDURE dbo.st_insereUsuario @usu varchar(80)
                                     ,@sen varchar(10)

AS
BEGIN

 INSERT INTO usuário (NM_Usuario
                     ,SE_Usuario)
 VALUES (@usu
        ,@sen)
END
