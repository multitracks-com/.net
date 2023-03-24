namespace MTDTOs.DTOs
{
    public class ArtistDTO
    {
        public int ArtistId { get; set; }
        public string Name { get; set; }
        public string Biography { get; set; }
        public string ImageUrl { get; set; }
        public string HeroImageUrl { get; set; }
        public virtual List<AlbumDTO> AlbumList { get; set; }
    }
}
