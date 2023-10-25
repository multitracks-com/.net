using Newtonsoft.Json;

namespace multitracks.com.api.Models.Dtos
{
	public class GetArtistDto
	{
		public int ArtistId { get; set; }
		public string Title { get; set; }
		public string ImageUrl { get; set; }
		public string HeroUrl { get; set; }
		public string Biography { get; set; }
	}
}