using AutoMapper;
using MTBusiness.Business.Interfaces;
using MTDataAccess.Dao.Interfaces;
using MTDataAccess.Domain;
using MTDTOs.DTOs;

namespace MTBusiness.Business
{
    public class ArtistBusiness : IArtistBusiness
    {
        private readonly IArtistDao _artistDao;
        private readonly IAlbumBusiness _albumBusiness;
        private readonly IMapper _mapper;

        public ArtistBusiness(IArtistDao artistDao, IAlbumBusiness albumBusiness, ISongBusiness songBusiness, IMapper mapper)
        {
            _artistDao = artistDao;
            _albumBusiness = albumBusiness;
            _mapper = mapper;
        }

        public ArtistDTO AddArtist(ArtistRequestDTO artistRequestDTO)
        {
            var artistDomain = _mapper.Map<Artist>(artistRequestDTO);

            artistDomain = _artistDao.AddArtist(artistDomain);

            var artistResponse = _mapper.Map<ArtistDTO>(artistDomain);

            return artistResponse;
        }

        public List<ArtistDTO> GetArtistsByArtistName(string artistName)
        {
            var artistListDomain = _artistDao.GetArtistsByArtistName(artistName);

            var artistList = _mapper.Map<List<ArtistDTO>>(artistListDomain);

            foreach (var artist in artistList)
            {
                artist.AlbumList.AddRange(_albumBusiness.GetAlbumByArtistId(artist.ArtistId));
            }

            return artistList;
        }
    }
}
