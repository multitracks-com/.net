using AutoMapper;
using MTBusiness.Business.Interfaces;
using MTDataAccess.Dao.Interfaces;
using MTDTOs.DTOs;

namespace MTBusiness.Business
{
    public class SongBusiness : ISongBusiness
    {
        private readonly ISongDao _songDao;
        private readonly IMapper _mapper;

        public SongBusiness(ISongDao songDao, IMapper mapper)
        {
            _songDao = songDao;
            _mapper = mapper;
        }

        public List<SongDTO> GetAll()
        {
            var songListDomain = _songDao.GetAll();
            return _mapper.Map<List<SongDTO>>(songListDomain);
        }

        public List<SongDTO> GetSongByAlbumId(int albumId)
        {
            var songListDomain = _songDao.GetSongByAlbumId(albumId);
            return _mapper.Map<List<SongDTO>>(songListDomain);
        }
    }
}
