CREATE PROCEDURE dbo.GetSongsList
@CurrentPage INT, @PageSize INT
AS
BEGIN
    DECLARE @TotalSongs AS INT;
    SELECT @TotalSongs = COUNT(*)
    FROM   Song;
    
    DECLARE @StartIndex AS INT;
    DECLARE @EndIndex AS INT;

    SET @StartIndex = (@CurrentPage - 1) * @PageSize;

    IF (@CurrentPage * @PageSize) < @TotalSongs
    BEGIN
        SET @EndIndex = @CurrentPage * @PageSize;
    END
    ELSE
    BEGIN
        SET @EndIndex = @TotalSongs;
    END;

    SELECT   Song.songID AS ID,
             Song.title AS SongName,
             Song.bpm AS SongBPM
    FROM     dbo.Song AS Song
    ORDER BY ID
    OFFSET @StartIndex ROWS FETCH NEXT @PageSize ROWS ONLY;
END;
