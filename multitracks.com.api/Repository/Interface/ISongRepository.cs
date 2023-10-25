using System.Collections.Generic;
using multitracks.com.api.Models.Dtos;
using System.Threading.Tasks;

namespace multitracks.com.api.Repository.Interface
{
    public interface ISongRepository
    {
        List<SongDto> GetListOfSongs(int pageSize, int pageNumber);
    }
}