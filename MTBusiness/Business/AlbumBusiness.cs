using AutoMapper;
using MTBusiness.Business.Interfaces;
using MTDataAccess.Dao.Interfaces;
using MTDTOs.DTOs;

namespace MTBusiness.Business
{
    public class AlbumBusiness : IAlbumBusiness
    {
        private readonly IAlbumDao _albumDao;
        private readonly ISongBusiness _songBusiness;
        private readonly IMapper _mapper;

        public AlbumBusiness(IAlbumDao albumDao, ISongBusiness songBusiness, IMapper mapper)
        {
            _albumDao = albumDao;
            _songBusiness = songBusiness;
            _mapper = mapper;
        }

        public List<AlbumDTO> GetAlbumByArtistId(int artistId)
        {
            var albumListDomain = _albumDao.GetAlbumByArtistId(artistId);

            var albumList = _mapper.Map<List<AlbumDTO>>(albumListDomain);

            foreach (var album in albumList)
            {
                album.SongList.AddRange(_songBusiness.GetSongByAlbumId(album.AlbumId));
            }
            
            return albumList;
        }
    }
}
