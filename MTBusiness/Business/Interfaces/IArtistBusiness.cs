using MTDTOs.DTOs;

namespace MTBusiness.Business.Interfaces
{
    public interface IArtistBusiness
    {
        List<ArtistDTO> GetArtistsByArtistName(string artistName);
        ArtistDTO AddArtist(ArtistRequestDTO artistRequestDTO);
    }
}
