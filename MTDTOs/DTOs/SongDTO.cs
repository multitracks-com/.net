namespace MTDTOs.DTOs
{
    public class SongDTO
    {
        public int SongId { get; set; }
        public DateTime DateCreated { get; set; }
        public string AlbumTitle { get; set; }
        public string ArtistName { get; set; }
        public string Title { get; set; }
        public decimal Bpm { get; set; }
        public string TimeSignature { get; set; }
        public bool HasMultiTracks { get; set; }
        public bool HasCustomMix { get; set; }
        public bool HasChordChart { get; set; }
        public bool HasRehearsalMix { get; set; }
        public bool HasPatches { get; set; }
        public bool HasSongSpecificPatches { get; set; }
        public bool HasProPresenterSlides { get; set; }
    }
}
