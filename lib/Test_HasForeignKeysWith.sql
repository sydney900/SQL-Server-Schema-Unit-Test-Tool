CREATE PROCEDURE [dbo].[Test_HasForeignKeysWith]
		@MainTableName nvarchar(max),
        @MainColumnName nvarchar(max),
		@ChildTableName nvarchar(max),
        @ChildColumnName nvarchar(max),
		@TestContentStr nvarchar(max) = NULL
AS
BEGIN

	DECLARE @Result int;

	SELECT @Result = COUNT(0)
	FROM [sys].[foreign_key_columns]
	WHERE parent_object_id = OBJECT_ID(@ChildTableName)
	AND parent_column_id = (SELECT column_id FROM sys.columns WHERE object_id = OBJECT_ID(@ChildTableName)
	AND name = @ChildColumnName)
	AND referenced_object_id = OBJECT_ID(@MainTableName)
	AND referenced_column_id = (SELECT column_id FROM sys.columns WHERE object_id = OBJECT_ID(@MainTableName)
	AND name = @MainColumnName)

	IF @TestContentStr IS NULL
	BEGIN
	  SET @TestContentStr = 'The test table "' +
	  @ChildTableName +
	  '" has a foreign key column "' +
	  @ChildColumnName +
	  '" with column "' +
	  @MainColumnName +
	  '" of main table "' +
	  @MainTableName + '"';
	END

	IF @Result > 0
	  PRINT @TestContentStr + ' --- passed'
	ELSE
	  RAISERROR('%s%s', 16, 1, @TestContentStr, ' --- failed')

	RETURN
END
