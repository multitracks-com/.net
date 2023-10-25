CREATE PROCEDURE dbo.GetArtistDetails
	@artistID INT
AS
BEGIN
	SET NOCOUNT ON;

		SELECT 
			a.title AS artistTitle,
			a.imageURL AS artistImageUrl,
			a.heroURL AS artistHeroUrl,
			a.biography AS artistBiography,
			s.title AS songTitle,
			s.bpm AS songBpm,
			al.title AS albumTitle,
			al.imageURL AS albumImageUrl
		FROM Artist a
			INNER JOIN Song s ON a.artistID = s.artistID
			INNER JOIN Album al ON al.albumID = s.albumID
		WHERE a.artistID = @artistID
END
