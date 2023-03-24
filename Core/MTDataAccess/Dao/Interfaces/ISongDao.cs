using MTDataAccess.Domain;
using System.Collections.Generic;

namespace MTDataAccess.Dao.Interfaces
{
    public interface ISongDao
    {
        List<Song> GetSongByAlbumId (int albumId);

        List<Song> GetAll();
    }
}
