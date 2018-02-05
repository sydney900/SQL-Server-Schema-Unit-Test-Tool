CREATE PROCEDURE [dbo].[Test_HasKey]
		@TableName nvarchar(max),
        @KeyType varchar(max) = 'PRIMARY KEY',
		@KeyColumn varchar(max) = NULL,
		@TestContentStr nvarchar(max) = NULL
AS
BEGIN

	DECLARE @Result int;
 
	SET @Result = [dbo].[Test_GetKeyNumber](@TableName, @KeyType, @KeyColumn);

	IF @TestContentStr IS NULL
	BEGIN
		SET @TestContentStr = 'The test table "' + 
							  @TableName+
							  '" has a '  +
							  @KeyType + 
							  IIF(@KeyColumn IS NULL, '', ' with column "' + @KeyColumn +'"')
	END

	IF @Result > 0
	  PRINT @TestContentStr + ' --- passed'
	ELSE
	  RAISERROR('%s%s', 16, 1, @TestContentStr, ' --- failed')

	RETURN
END
