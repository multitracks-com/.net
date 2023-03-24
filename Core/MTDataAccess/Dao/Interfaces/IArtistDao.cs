using MTDataAccess.Domain;
using System.Collections.Generic;

namespace MTDataAccess.Dao.Interfaces
{
    public interface IArtistDao
    {
        List<Artist> GetArtistsByArtistName (string artistName);
        Artist AddArtist (Artist artist);
    }
}
