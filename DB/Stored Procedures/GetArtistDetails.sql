CREATE PROCEDURE dbo.GetArtistDetails
	@artistID INT
AS
BEGIN
	SELECT Artist.title as artistTiltle,
		   Artist.imageURL as artistImageURL,
		   Artist.heroURL as artistHeroURL,
		   Artist.biography as artistBiography,
		   Song.title as songTilte,
		   Song.bpm as songBPM,
		   Album.title as albumTitle,
		   Album.imageURL as albumImageURL
	FROM dbo.Artist Artist
	LEFT JOIN dbo.Song Song on Artist.artistID = Song.artistID
	LEFT JOIN dbo.Album Album on Album.albumID = Song.albumID
	WHERE Artist.artistID = @artistID
END
