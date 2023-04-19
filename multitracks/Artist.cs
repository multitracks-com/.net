using System.Data;

namespace multitracks
{
    public class Artist
    {
        public int ID { get; set; }
        public DateTime DateCreated { get; set; }
        public string? Title { get; set; }
        public string? Bio { get; set; }
        public string? ImageURL { get; set; }
        public string? HeroURL { get; set; }
        public List<Song> songs { get; set; } = new List<Song>();
        public List<Album> albums { get; set; } = new List<Album>();
        
    }
    public class Song
    {
        public int ID { get; set; }
        public DateTime DateCreation { get; set; }
        public int AlbumID { get; set; }
        public int ArtistID { get; set; }
        public string? title { get; set; }
        public decimal bpm { get; set; }
        public string? TimeSignature { get; set; }
        public bool MultiTracks { get; set; }
        public bool CustomMix { get; set; }
        public bool chart { get; set; }
        public bool RehearsalMix { get; set; }
        public bool Patches { get; set; }
        public bool SongSpecificPatch { get; set; }
        public bool ProPresenter { get; set; }
    }
    public class Album
    {
        public int ID { get; set; }
        public DateTime DateCreation { get; set; }
        public int ArtistID { get; set; }
        public string? title { get; set; }
        public string? ImageURL { get; set; }
        public int Year { get; set; }
    }
}
}
