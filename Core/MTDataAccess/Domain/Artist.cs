using System;
using System.Collections.Generic;

namespace MTDataAccess.Domain
{
    public class Artist
    {
        public int ArtistId { get; set; }
        public string Name { get; set; }
        public string Biography { get; set; }
        public string ImageUrl { get; set; }
        public string HeroImageUrl { get; set; }
        public DateTime DateCreation { get; set; }
        public virtual List<Album> AlbumList { get; set; }
    }
}
