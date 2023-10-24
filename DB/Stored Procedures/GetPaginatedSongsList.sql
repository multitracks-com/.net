CREATE PROCEDURE dbo.GetPaginatedSongsList
	@PageNumber INT, 
    @PageSize INT
AS
BEGIN
    DECLARE @TotalSongs AS INT;
    SELECT @TotalSongs = COUNT(*)
    FROM   Song;
    
    DECLARE @StartIndex AS INT;
    DECLARE @EndIndex AS INT;

    SET @StartIndex = (@PageNumber - 1) * @PageSize;

    IF (@PageNumber * @PageSize) < @TotalSongs
    BEGIN
        SET @EndIndex = @PageNumber * @PageSize;
    END
    ELSE
    BEGIN
        SET @EndIndex = @TotalSongs;
    END;

    SELECT   s.songID AS SongId,
             s.dateCreation AS DateCreation,
             s.albumID AS AlbumId,
             s.artistID AS ArtistId,
             s.title AS Title,
             s.bpm AS Bpm,
             s.timeSignature AS TimeSignature,
             s.multitracks AS MultiTracks,
             s.customMix AS CustomMix,
             s.chart AS Chart,
             s.rehearsalMix AS RehearsalMix,
             s.patches AS Patches,
             s.songSpecificPatches AS SongSpecificPatches,
             s.proPresenter AS ProPresenter
    FROM     dbo.Song AS s
    ORDER BY SongId
    OFFSET @StartIndex ROWS FETCH NEXT @PageSize ROWS ONLY;
END;