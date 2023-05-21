using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace API.Models
{
    public class Song
    {
        public String songID { get; set; }
        public String dateCreation { get; set; }
        public String albumID { get; set; }
        public String artistID { get; set; }
        public String title { get; set; }
        public String  bpm{ get; set; }

        private readonly String GET_SONG = "SELECT * FROM dbo.Song";

        public List<Song> GetSongs()
        {
            var sql = new SQL();
            DataTable dataTable = sql.ExecuteDT(GET_SONG);
            List<Song> songs = new List<Song>();
            foreach (DataRow row in dataTable.Rows)
            {
                Song song = new Song();
                song.songID = row.ItemArray[0].ToString();
                song.dateCreation = row.ItemArray[1].ToString();
                song.albumID = row.ItemArray[2].ToString();
                song.artistID = row.ItemArray[3].ToString();
                song.title = row.ItemArray[4].ToString();
                song.bpm = row.ItemArray[5].ToString();
                songs.Add(song);
            }
            return songs;
        }
    }
}