/* Script purpose : This script is used to create the initial database named 'DataWarehouseCRM'. If there one existing with the same name, it drop the old one and create a new one'
 Warning: Running this script will all data from DataWarehouseCRM. 

*/


USE master;
GO
-- IF the database already exist, drop it and create a new one' --
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouseCRM')
BEGIN 
	ALTER DATABASE DataWarehouseCRM SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouseCRM;
END;

GO
CREATE DATABASE DataWarehouseCRM;

USE DataWarehouseCRM;

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
