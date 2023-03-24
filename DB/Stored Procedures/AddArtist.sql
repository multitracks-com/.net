CREATE PROCEDURE dbo.AddArtist
	@ArtistName VARCHAR(100),
	@ArtistBiography VARCHAR(MAX),
	@ArtistImageUrl VARCHAR(500),
	@ArtistHeroImageUrl VARCHAR(500)
AS
BEGIN

	

	INSERT INTO dbo.Artist (
		title,
		biography,
		imageURL,
		heroURL
	)OUTPUT Inserted.artistID as ArtistId,
			inserted.title as ArtistName,
			Inserted.biography as ArtistBiography,
			Inserted.dateCreation as DateCreation,
			Inserted.heroURL as ArtistHeroImageUrl,
			Inserted.imageURL as ArtistImageUrl
	VALUES(
		@ArtistName,
		@ArtistBiography,
		@ArtistImageUrl,
		@ArtistHeroImageUrl
	)

END