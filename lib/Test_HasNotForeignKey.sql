CREATE PROCEDURE [dbo].[Test_HasNotForeignKey]
		@TableName nvarchar(max),
		@KeyColumn varchar(max) = NULL,
		@TestContentStr nvarchar(max) = NULL
AS
BEGIN
	
	EXEC [dbo].[Test_HasNotKey] @TableName, 'FOREIGN KEY', @KeyColumn, @TestContentStr 

END