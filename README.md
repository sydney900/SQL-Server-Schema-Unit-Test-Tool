# SQL-Server-Schema-Unit-Test-Tool

## How to use
1. Run all sql files in fold *lib* in your SQL Server
2. Edit test SQL file like below
```sql
Print '****** Begin to test the schema of "AppliationUsers" table ******';
Exec dbo.Test_HasColumn @TableName='AppliationUsers', @ColumnName='UserId', @IsNullable='No', @DataType='UNIQUEIDENTIFIER';
Exec dbo.Test_HasColumn @TableName='AppliationUsers', @ColumnName='UserName', @IsNullable='No', @DataType='nvarchar', @MaxLength='max';
Exec dbo.Test_HasPrimaryKey @TableName='AppliationUsers', @KeyColumn='UserId';
Exec dbo.Test_HasNotForeignKey @TableName='AppliationUsers';

print Char(13)
Print '****** Begin to test the schema of "AppliationUsers" table ******';
Exec dbo.Test_HasColumn @TableName='AppliationUsers', @ColumnName='UserId', @IsNullable='No', @DataType='UNIQUEIDENTIFIER';
Exec dbo.Test_HasColumn @TableName='AppliationUsers', @ColumnName='UserName', @IsNullable='No', @DataType='nvarchar', @MaxLength='max';
Exec dbo.Test_HasPrimaryKey @TableName='AppliationUsers', @KeyColumn='UserId';
Exec dbo.Test_HasNotForeignKey @TableName='AppliationUsers';

print Char(13)
Print '****** Begin to test the schema of "Roles" table ******';
Exec dbo.Test_HasColumn @TableName='Roles', @ColumnName='RoleId', @IsNullable='No', @DataType='Int';
Exec dbo.Test_HasColumn @TableName='Roles', @ColumnName='RoleName', @IsNullable='No', @DataType='nvarchar', @MaxLength='256';
Exec dbo.Test_HasPrimaryKey @TableName='Roles', @KeyColumn='RoleId';
Exec dbo.Test_HasNotForeignKey @TableName='Roles';
Exec dbo.Test_HasUniqueKey @TableName='Roles', @KeyColumn='RoleName';

print Char(13)
Print '****** Begin to test the schema of "UserRoles" table ******';
Exec dbo.Test_HasColumn @TableName='UserRoles', @ColumnName='UserId', @IsNullable='No', @DataType='UNIQUEIDENTIFIER';
Exec dbo.Test_HasColumn @TableName='UserRoles', @ColumnName='RoleId', @IsNullable='No', @DataType='Int';
Exec dbo.Test_HasPrimaryKey @TableName='UserRoles', @KeyColumn='UserId';
Exec dbo.Test_HasPrimaryKey @TableName='UserRoles', @KeyColumn='RoleId';
Exec dbo.Test_HasNotUniqueKey @TableName='UserRoles';
Exec dbo.Test_HasForeignKeysWith @ChildTableName='UserRoles', @ChildColumnName='UserId', @MainTableName='AppliationUsers', @MainColumnName='UserId'
Exec dbo.Test_HasForeignKeysWith @ChildTableName='UserRoles', @ChildColumnName='RoleId', @MainTableName='Roles', @MainColumnName='RoleId'

print Char(13)
Print '****** Schema test finished ******';

```
3. run your SQL test file