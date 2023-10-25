CREATE PROCEDURE dbo.GetPaginatedSongsList
	@PageNumber INT, 
    @PageSize INT
AS
BEGIN
    DECLARE @TotalSongs AS INT;
    SELECT @TotalSongs = COUNT(*)
    FROM Song;
    
    DECLARE @StartIndex AS INT;
    DECLARE @EndIndex AS INT;

    SET @startIndex = (@pageNumber - 1) * @pageSize;

    IF (@pageNumber * @pageSize) < @totalSongs
    BEGIN
        SET @endIndex = @pageNumber * @pageSize;
    END
    ELSE
    BEGIN
        SET @endIndex = @totalSongs;
    END;

    SELECT   
        s.songID AS songId,
        s.dateCreation AS dateCreation,
        s.albumID AS albumId,
        s.artistID AS artistId,
        s.title AS title,
        s.bpm AS bpm,
        s.timeSignature AS timeSignature,
        s.multitracks AS multiTracks,
        s.customMix AS customMix,
        s.chart AS chart,
        s.rehearsalMix AS rehearsalMix,
        s.patches AS patches,
        s.songSpecificPatches AS songSpecificPatches,
        s.proPresenter AS proPresenter
    FROM Song AS s
    ORDER BY songId
    OFFSET @startIndex ROWS FETCH NEXT @pageSize ROWS ONLY;
END;