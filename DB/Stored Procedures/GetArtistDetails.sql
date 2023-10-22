CREATE PROCEDURE [dbo].[GetArtistDetails]
	@artistID INT
AS
BEGIN
	SELECT Artist.title AS artistTitle,
		   Artist.imageURL AS artistImageURL,
		   Artist.heroURL AS artistHeroURL,
		   Artist.biography AS artistBiography,
		   Song.title AS songTitle,
		   Song.bpm AS songBPM,
		   Album.title AS albumTitle,
		   Album.imageURL AS albumImageURL
	FROM dbo.Artist Artist
	LEFT JOIN dbo.Song Song ON Artist.artistID = Song.artistID
	LEFT JOIN dbo.Album Album ON Album.albumID = Song.albumID
	WHERE Artist.artistID = @artistID
END
