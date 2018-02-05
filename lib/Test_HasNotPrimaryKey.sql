CREATE PROCEDURE [dbo].[Test_HasNotPrimaryKey]
		@TableName nvarchar(max),
		@KeyColumn varchar(max) = NULL,
		@TestContentStr nvarchar(max) = NULL
AS
BEGIN
	
	EXEC [dbo].[Test_HasNotKey] @TableName, 'PRIMARY KEY', @KeyColumn, @TestContentStr 

END