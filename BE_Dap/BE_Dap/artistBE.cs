using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BL_Dap.DTO_Dap;
using DAL_Dapper.Models_Dapper;
using DAL_Dapper.TE_Dapper;

namespace BL_Dap.BE_Dap
{
    public class artistBE
    {
        public IEnumerable<artistDTO_Dap> GetArtistByName(string name)
        {
             artistTE_Dap artistTE_Dap = new artistTE_Dap();

            IEnumerable<artist_Dap> artistList = artistTE_Dap.GetArtistByName(name);

            List<artistDTO_Dap> artistDTOList = new List<artistDTO_Dap>();

            foreach (artist_Dap artist in artistList)
            {
                artistDTO_Dap artistDTO = new artistDTO_Dap(artist);

                artistDTOList.Add(artistDTO);
            }

            return artistDTOList;
        }

        public bool CreateArtist(artistCreateDTO_Dap artistDTO)
        {
            artist_Dap artist = new artist_Dap()
            {
                title = artistDTO.Title,
                biography = artistDTO.Biography,
                imageURL = artistDTO.ImageUrl,
                heroURL = artistDTO.HeroUrl
            };

            artistTE_Dap artistTE = new artistTE_Dap();

            return artistTE.CreateArtist(artist);

        }
    }
}
