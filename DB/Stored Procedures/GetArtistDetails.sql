CREATE PROCEDURE dbo.GetArtistDetails
	@artistID int = 5
AS
BEGIN
	SELECT [artistID],[dateCreation],[title],[biography],[imageURL],[heroURL]
	FROM Artist 
	WHERE artistID = @artistID;
END
