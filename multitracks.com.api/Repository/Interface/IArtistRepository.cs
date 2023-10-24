using System.Collections.Generic;
using multitracks.com.api.Models.Dtos;

namespace multitracks.com.api.Repository.Interface
{
	public interface IArtistRepository
	{
		List<GetArtistDto> SearchArtists(string name);
		int AddArtist(AddArtistDto artist);
	}
}