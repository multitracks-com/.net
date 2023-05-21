CREATE PROCEDURE dbo.GetArtistDetails
	@artistID INT
AS
BEGIN
	SELECT *
	FROM dbo.Artist Artist
	LEFT JOIN dbo.Song Song on Artist.artistID = Song.artistID
	LEFT JOIN dbo.Album Album on Album.albumID = Song.albumID
	WHERE Artist.artistID = @artistID
END
