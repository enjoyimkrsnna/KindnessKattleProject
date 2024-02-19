CREATE PROCEDURE InsertUser
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Username VARCHAR(50),
    @ImageURL VARCHAR(255) = NULL,
    @EmailAddress VARCHAR(100),
    @ProfileDescription NVARCHAR(MAX) = NULL,
    @IsActive BIT = 1
AS
BEGIN
    SET NOCOUNT ON;
 
    IF NOT EXISTS (SELECT 1 FROM UserAccounts WHERE Username = @Username)
    BEGIN
        INSERT INTO UserAccounts (FirstName, LastName, Username, ImageURL, EmailAddress, ProfileDescription, IsActive)
        VALUES (@FirstName, @LastName, @Username, @ImageURL, @EmailAddress, @ProfileDescription, @IsActive);
        PRINT 'User inserted successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Username already exists. Please choose a different username.';
    END
END;