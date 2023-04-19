using DataAccess;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Xml.Linq;

/// <summary>
/// Object to represent Artist that will be loaded onto the page
/// </summary>
public class Artist
{
    public int ID { get; set; }
    public DateTime DateCreated { get; set; }
    public string Title { get; set; }
    public string Bio { get; set; }
    public string ImageURL { get; set; }
    public string HeroURL { get; set; }
    public List<Song> songs { get; set; } = new List<Song>();
    public List<Album> albums { get; set; } = new List<Album>();
    public Artist GetArtist(int artistID)
    {
        try
        {
            //Get data form URL
            Artist artist = new Artist();
            var sql = new SQL();
            sql.Parameters.Add("@artistID", artistID);
            //DataSet dt = sql.ExecuteStoredProcedureDS("GetArtistDetails");//pass with artistID as param
            DataSet ds = sql.ExecuteDS("SELECT [artistID],[dateCreation],[title],[biography],[imageURL],[heroURL] FROM Artist WHERE artistID = @artistID;");
            DataRow dr = ds.Tables[0].Rows[0];
            //Serialize data into objects
            artist.ID = (int)dr["artistID"];
            artist.DateCreated = (DateTime)dr["dateCreation"];
            artist.Title = (string)dr["title"];
            artist.Bio = (string)dr["biography"];
            artist.ImageURL = (string)dr["imageURL"];
            artist.HeroURL = (string)dr["heroURL"];
            sql = new SQL();
            sql.Parameters.Add("@artistID", artistID);
            DataTable dt = sql.ExecuteDT("SELECT [songID],[dateCreation],[albumID],[artistID],[title],[bpm],[timeSignature],[multitracks],[customMix],[chart],[rehearsalMix],[patches],[songSpecificPatches],[proPresenter] FROM Song WHERE artistID = @artistID");
            for (int i = 0; i < dt.RowCount(); i++) //foreach too slow
            {
                Song song = new Song();
                DataRow drS = dt.Rows[i];
                song.ID = (int)drS["songID"];
                song.DateCreation = (DateTime)drS["dateCreation"];
                song.AlbumID = (int)drS["albumID"];
                song.ArtistID = (int)drS["artistID"];
                song.title = (string)drS["title"];
                song.bpm = (decimal)drS["bpm"];
                song.TimeSignature = (string)drS["timeSignature"];
                song.MultiTracks = (bool)drS["multitracks"];
                song.CustomMix = (bool)drS["customMix"];
                song.chart = (bool)drS["chart"];
                song.RehearsalMix = (bool)drS["rehearsalMix"];
                song.Patches = (bool)drS["patches"];
                song.SongSpecificPatch = (bool)drS["songSpecificPatches"];
                song.ProPresenter = (bool)drS["proPresenter"];
                artist.songs.Add(song);
            }
            sql = new SQL();
            sql.Parameters.Add("@artistID", artistID);
            dt = new DataTable();
            dt = sql.ExecuteDT("SELECT [albumID],[dateCreation],[artistID],[title],[imageURL],[year] FROM Album WHERE artistID = @artistID");
            for (int i = 0; i < dt.RowCount(); i++)//foreach too slow
            {
                Album album = new Album();
                DataRow drA = dt.Rows[i];
                album.ID = (int)drA["albumID"];
                album.DateCreation = (DateTime)drA["dateCreation"];
                album.ArtistID = (int)drA["artistID"];
                album.title = (string)drA["title"];
                album.ImageURL = (string)drA["imageURL"];
                album.Year = (int)drA["year"];
                artist.albums.Add(album);
            }
            return artist;
        }
        catch (Exception)
        {
            //error artist ID is not correct format or not in DB
            return null;
        }

    }
   
}
    public class Song
    {
        public int ID { get; set; }
        public DateTime DateCreation { get; set; }
        public int AlbumID { get; set; }
        public int ArtistID { get; set; }
        public string title { get; set; }
        public decimal bpm { get; set; }
        public string TimeSignature { get; set; }
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
        public string title { get; set; }
        public string ImageURL { get; set; }
        public int Year { get; set; }
    }