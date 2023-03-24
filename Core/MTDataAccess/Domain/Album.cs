using System;
using System.Collections.Generic;

namespace MTDataAccess.Domain
{
    public class Album
    {
        public int AlbumId { get; set; }
        public DateTime DateCreation { get; set; }
        public string ArtistName { get; set; }
        public string Title { get; set; }
        public string ImageUrl { get; set; }
        public int ReleaseYear { get; set; }
        public virtual List<Song> SongList { get; set; }
    }
}
