using AutoMapper;
using MTDataAccess.Domain;
using MTDTOs.DTOs;

namespace MTBusiness.Profiles
{
    public class DTOProfile : Profile
    {
        public DTOProfile()
        {
            CreateMap<Album, AlbumDTO>().ReverseMap();
            CreateMap<Artist, ArtistDTO>().ReverseMap();
            CreateMap<Song, SongDTO>().ReverseMap();
            CreateMap<Artist, ArtistRequestDTO>().ReverseMap();
        }
    }
}
