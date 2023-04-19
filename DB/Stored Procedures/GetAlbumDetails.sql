CREATE PROCEDURE dbo.GetAlbumDetails
	@artistID INT
AS
BEGIN
	SELECT [albumID],[dateCreation],[artistID],[title],[imageURL],[year]
	FROM Album
	WHERE artistID = @artistID
END
