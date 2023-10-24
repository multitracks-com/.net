CREATE PROCEDURE dbo.InsertArtist
    @DateCreation DATETIME,
    @Title NVARCHAR(MAX),
    @Biography NVARCHAR(MAX),
    @ImageUrl NVARCHAR(MAX),
    @HeroUrl NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Artist (dateCreation, title, biography, imageUrl, heroUrl)
    VALUES (@DateCreation, @Title, @Biography, @ImageUrl, @HeroUrl)
END
