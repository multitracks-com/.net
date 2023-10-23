using Newtonsoft.Json;

namespace multitracks.com.api.Models.Dtos
{
    public class ArtistDto
    {
        [JsonIgnore] public string ArtistId { get; set; }
        public string Title { get; set; }
        public string ImageUrl { get; set; }
        public string HeroUrl { get; set; }
        public string Biography { get; set; }
    }
}