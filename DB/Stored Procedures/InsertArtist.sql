CREATE PROCEDURE dbo.InsertArtist
    @dateCreation DATETIME,
    @title NVARCHAR(MAX),
    @biography NVARCHAR(MAX),
    @imageUrl NVARCHAR(MAX),
    @heroUrl NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Artist (dateCreation, title, biography, imageUrl, heroUrl)
    VALUES (@dateCreation, @title, @biography, @imageUrl, @heroUrl)
END
