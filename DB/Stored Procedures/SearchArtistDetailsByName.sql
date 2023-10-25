CREATE PROCEDURE dbo.SearchArtistDetailsByName
    @artistName NVARCHAR(100)
AS
BEGIN
    WITH MatchingArtists AS (
        SELECT a.artistID, a.title, a.imageURL, a.heroURL, a.biography
        FROM Artist a
        WHERE a.title LIKE '%' + @artistName + '%'
    )
    SELECT artistId, title, imageUrl, heroUrl, biography
    FROM MatchingArtists
    ORDER BY title;
END
