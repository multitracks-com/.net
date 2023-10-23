CREATE PROCEDURE [dbo].[GetArtistDetailsByName]
	@artistName NVARCHAR(100)
AS
BEGIN
    SELECT Artist.artistID as ArtistId,
           Artist.title as ArtistTitle,
           Artist.imageURL as ImageUrl,
           Artist.heroURL as HeroUrl,
           Artist.biography as Biography
    FROM dbo.Artist Artist
    WHERE ArtistTitle like '%'+@artistName+'%';
END