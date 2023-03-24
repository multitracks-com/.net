CREATE PROCEDURE dbo.GetArtistByArtistName
	@ArtistName VARCHAR(100)
AS
BEGIN

	SELECT
        ArtistId = Artist.artistID,
		DateCreation = Artist.dateCreation,
		ArtistName = Artist.title,
		ArtistBiography = Artist.biography,
		ArtistImageUrl = Artist.imageURL,
		ArtistHeroImageUrl = Artist.heroURL
	FROM
		dbo.Artist
	WHERE
		Artist.title LIKE '%' + @ArtistName + '%'
	ORDER BY
		Artist.title DESC

END