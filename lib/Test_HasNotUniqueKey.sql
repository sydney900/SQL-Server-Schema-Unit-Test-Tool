CREATE PROCEDURE [dbo].[Test_HasNotUniqueKey]
		@TableName nvarchar(max),
		@KeyColumn varchar(max) = NULL,
		@TestContentStr nvarchar(max) = NULL
AS
BEGIN
	
	EXEC [dbo].[Test_HasNotKey] @TableName, 'UNIQUE', @KeyColumn, @TestContentStr 

END