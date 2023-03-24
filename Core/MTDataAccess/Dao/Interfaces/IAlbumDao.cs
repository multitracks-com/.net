using MTDataAccess.Domain;
using System.Collections.Generic;

namespace MTDataAccess.Dao.Interfaces
{
    public interface IAlbumDao
    {
        List<Album> GetAlbumByArtistId(int artistId);
    }
}
