CREATE PROCEDURE [dbo].[Test_HasColumn]
		@TableName nvarchar(max),
        @ColumnName nvarchar(max),		
        @IsNullable varchar(3) = NULL,
        @MaxLength varchar(20) = NULL,
		@DataType nvarchar(max) = NULL,
        @TestContentStr nvarchar(max) = NULL
AS
BEGIN

	DECLARE @MaxlengthInt int = -1,			
			@Result int;

	IF @MaxLength IS NOT NULL
	BEGIN
		IF @MaxLength = 'MAX'
			SET @MaxlengthInt = -1
		ELSE
			SET @MaxlengthInt = CAST(@MaxLength AS int);
	END

	SELECT @Result = COUNT(0)
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = @TableName
	AND COLUMN_NAME = @ColumnName
	AND ((@Maxlength IS NULL) OR ([CHARACTER_MAXIMUM_LENGTH] = @MaxlengthInt))
	AND ((@IsNullable IS NULL) OR ([IS_NULLABLE] = @IsNullable))
	AND ((@DataType IS NULL) OR (DATA_TYPE = @DataType))

	IF (@TestContentStr IS NULL)
		SET @TestContentStr = 'The test table "' + 
							  @TableName + 
							  '" has column "' + 
							  @ColumnName + 
							  IIF(@Maxlength IS NULL, '"', '" of lenght ' + IIF(@MaxlengthInt = -1, 'max', Cast(@MaxlengthInt as nvarchar))) +							  
							  IIF(@IsNullable IS NULL, '"', IIF(@IsNullable='YES', ' and the column is nullable', ' and the column is not nullable')) +
							  IIF(@DataType IS NULL, '"', ' and its type is ' + @DataType)

	IF @Result > 0
	  PRINT @TestContentStr + ' --- passed'
	ELSE
	  RAISERROR('%s%s', 16, 1, @TestContentStr, ' --- failed')

	RETURN
END
