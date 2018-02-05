CREATE PROCEDURE [dbo].[Test_HasPrimaryKey]
		@TableName nvarchar(max),
		@KeyColumn varchar(max) = NULL,
		@TestContentStr nvarchar(max) = NULL
AS
BEGIN
	
	EXEC [dbo].[Test_HasKey] @TableName, 'PRIMARY KEY', @KeyColumn, @TestContentStr 

END