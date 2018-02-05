CREATE PROCEDURE [dbo].[Test_HasForeignKey]
		@TableName nvarchar(max),
		@KeyColumn varchar(max) = NULL,
		@TestContentStr nvarchar(max) = NULL
AS
BEGIN
	
	EXEC [dbo].[Test_HasKey] @TableName, 'FOREIGN KEY', @KeyColumn, @TestContentStr 

END