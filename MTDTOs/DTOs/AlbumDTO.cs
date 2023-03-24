namespace MTDTOs.DTOs
{
    public class AlbumDTO
    {
        public int AlbumId { get; set; }
        public DateTime DateCreated { get; set; }
        public string ArtistName { get; set; }
        public string Title { get; set; }
        public string ImageUrl { get; set; }
        public int ReleaseYear { get; set; }
        public virtual List<SongDTO> SongList { get; set; }
    }
}
