using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_EF.TE;
using BL.DTO;
using DAL_EF.Models;

namespace BL.BE
{
    public class artistBE
    {
        public IEnumerable<artistDTO> GetArtistByName(string name)
        {
            artistTE artistTE = new artistTE();

            IEnumerable<Artist> artistList = artistTE.GetArtistByName(name);

            List<DTO.artistDTO> artistDTOList = new List<DTO.artistDTO>();

            foreach (Artist artist in artistList) {
                artistDTO artistDTO = new artistDTO(artist);

                artistDTOList.Add(artistDTO);
            }

            return artistDTOList;
        }

        public bool CreateArtist(artistCreateDTO artistDTO)
        {
            Artist artist = new Artist()
            {
                Title = artistDTO.Title,
                Biography = artistDTO.Biography,
                ImageUrl = artistDTO.ImageUrl,
                HeroUrl = artistDTO.HeroUrl
            };

            artistTE artistTE = new artistTE();

            return artistTE.CreateArtist(artist);

        }
    }
}
