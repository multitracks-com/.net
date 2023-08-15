CREATE PROCEDURE dbo.GetArtistDetailsByName
    @artistName NVARCHAR(100)
AS
BEGIN
    SELECT Artist.artistID as ArtistID,
           Artist.title as artistTitle,
           Artist.imageURL as ImageURL,
           Artist.heroURL as HeroURL,
           Artist.biography as Biography
    FROM dbo.Artist Artist
    WHERE Title like '%'+@artistName+'%';
END
