CREATE PROCEDURE dbo.GetSongDetails
	@artistID INT
AS
BEGIN
	SELECT [songID],[dateCreation],[albumID],[artistID],[title],[bpm],[timeSignature],[multitracks],[customMix],[chart],[rehearsalMix],[patches],[songSpecificPatches],[proPresenter]
	FROM Song 
	WHERE artistID = @artistID
END
