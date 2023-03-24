using MTDTOs.DTOs;

namespace MTBusiness.Business.Interfaces
{
    public interface ISongBusiness
    {
        List<SongDTO> GetSongByAlbumId(int albumId);

        List<SongDTO> GetAll();
    }
}
