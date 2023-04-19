using API.Models;
using DataAccess;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace multitracksAPI.Models
{
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
        public string GetAllSongs()
        {
            var sql = new SQL();
            DataTable dt = sql.ExecuteDT("SELECT [songID],[dateCreation],[albumID],[artistID],[title],[bpm],[timeSignature],[multitracks],[customMix],[chart],[rehearsalMix],[patches],[songSpecificPatches],[proPresenter] FROM Song");
            return JsonConvert.SerializeObject(dt, Formatting.Indented);
        }
        public IEnumerable<Song> GetSongs()
        {
            var sql = new SQL();
            DataTable dt = sql.ExecuteDT("SELECT [songID],[dateCreation],[albumID],[artistID],[title],[bpm],[timeSignature],[multitracks],[customMix],[chart],[rehearsalMix],[patches],[songSpecificPatches],[proPresenter] FROM Song");
            List<Song> songs = new List<Song>();
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
                songs.Add(song);
            }
            IEnumerable<Song> list = songs;
            return list;
        }
    }
    
}