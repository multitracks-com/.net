CREATE PROCEDURE dbo.GetArtistDetails
	@artistID INT = 1 
AS

BEGIN
	WITH ALBUMS AS(

	SELECT Album.artistID, albumID, Album.title, Album.imageURL, [year]
	FROM Album
	JOIN Artist on Album.artistID= Artist.artistID
	WHERE Album.artistID=@artistID
	)
	SELECT Artist.title AS artistTitle, Artist.biography AS biography , Artist.imageURL AS artistImage, heroURL AS artistHeroImage,
	       ALBUMS.title AS albumnTitle, ALBUMS.imageURL AS albumnImage, [year] AS albumnYear,
		   Song.title AS songTitle, Song.bpm AS songBpm, Song.timeSignature AS timeSignature
	FROM(( ALBUMS
	INNER JOIN Song ON ALBUMS.albumID = Song.albumID AND Song.artistID = @artistID)
	INNER JOIN Artist ON Artist.artistID = @artistID)
	
END