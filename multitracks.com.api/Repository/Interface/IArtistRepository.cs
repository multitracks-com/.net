using multitracks.com.api.Models.Dtos;

namespace multitracks.com.api.Repository.Interface
{
    public interface IArtistRepository
    {
        ArtistDto SearchArtist(string name);
        int AddArtist(ArtistDto artist);
    }
}