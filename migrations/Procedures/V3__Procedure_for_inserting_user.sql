USE [dbkindkattle]
GO

CREATE PROCEDURE [dbo].[insert_User]
    @first_name VARCHAR(50),
    @last_name VARCHAR(50),
    @username VARCHAR(50),
    @image_url VARCHAR(2083) = NULL,
    @email_address VARCHAR(100),
    @profile_description NVARCHAR(120) = NULL,
    @is_active BIT = 1
AS
BEGIN
    SET NOCOUNT ON;
 
    IF NOT EXISTS (SELECT 1 FROM user_accounts WHERE username = @Username)
    BEGIN
        INSERT INTO user_accounts (first_name, last_name, username, image_url, email_address, profile_description, is_active)
        VALUES (@first_name, @last_name, @username, @image_url, @email_address, @profile_description, @is_active);
        PRINT 'User inserted successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Username already exists. Please choose a different username.';
    END
END;
GO


