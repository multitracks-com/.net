CREATE PROCEDURE dbo.GetAllSongs
AS
BEGIN

	SELECT
		SongId = songID,
		AlbumImageUrl = Album.imageURL,
		AlbumTitle = Album.title,
		SongTitle = Song.title,
		ArtistName = Artist.title,
		DateCreation = Song.dateCreation,
		Bpm = Song.bpm,
		TimeSignature = Song.timeSignature,
		HasMultiTracks = Song.multitracks,
		HasCustomMix = Song.customMix,
		HasChordChart = Song.chart,
		HasRehearsalMix = Song.rehearsalMix,
		HasPatches = Song.patches,
		HasSongSpecificPatches = Song.songSpecificPatches,
		HasProPresenterSlides = Song.proPresenter
	FROM
		dbo.Song
		INNER JOIN dbo.Album ON Song.albumID = Album.albumID
		INNER JOIN dbo.Artist ON Album.artistID = Artist.artistID
    ORDER BY
        Song.title DESC

END