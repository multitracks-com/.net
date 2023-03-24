using MTDTOs.DTOs;

namespace MTBusiness.Business.Interfaces
{
    public interface IAlbumBusiness
    {
        List<AlbumDTO> GetAlbumByArtistId(int artistId);
    }
}
