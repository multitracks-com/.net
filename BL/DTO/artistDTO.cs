using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_EF.Models;
using DAL_EF.TE;

namespace BL.DTO
{
    public class artistDTO
    {
        public int ArtistId { get; set; }

        public DateTime DateCreation { get; set; }

        public string Title { get; set; } = null!;

        public string Biography { get; set; } = null!;

        public string ImageUrl { get; set; } = null!;

        public string HeroUrl { get; set; } = null!;

        public artistDTO(Artist artist)
        {
            ArtistId = artist.ArtistId;
            DateCreation = artist.DateCreation;
            Title = artist.Title;
            Biography = artist.Biography;
            ImageUrl = artist.ImageUrl;
            HeroUrl = artist.HeroUrl;
        }

    }
}
