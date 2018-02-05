CREATE PROCEDURE [dbo].[Test_HasUniqueKey]
		@TableName nvarchar(max),
		@KeyColumn varchar(max) = NULL,
		@TestContentStr nvarchar(max) = NULL
AS
BEGIN
	
	EXEC [dbo].[Test_HasKey] @TableName, 'UNIQUE', @KeyColumn, @TestContentStr 

END