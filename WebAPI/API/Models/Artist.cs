using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.WebPages;

namespace API.Models
{
    public class Artist
    {
        public String artistID { get; set; }
        public String dateCreation { get; set; }
        public String title { get; set; }
        public String biography { get; set; }
        public String imageURL { get; set; }
        public String heroURL { get; set; }

        private readonly String GET_ARTIST = "SELECT * FROM dbo.Artist";

        private String SET_ARTIST = "INSERT INTO dbo.Artist ( dateCreation, title,biography,imageURL,heroURL)VALUES ('{0}','{1}','{2}','{3}','{4}')";


        /// <summary>
        /// Prepares the DataTable From The DataBase
        /// </summary>
        /// <returns></returns>
        public List<Artist> GetArtists()
        {
            var sql = new SQL();
            DataTable dataTable = sql.ExecuteDT(GET_ARTIST);
            List<Artist> artists = new List<Artist>();
            foreach (DataRow row in dataTable.Rows)
            {
                Artist artist = new Artist();
                artist.artistID = row.ItemArray[0].ToString();
                artist.dateCreation = row.ItemArray[1].ToString();
                artist.title = row.ItemArray[2].ToString();
                artist.biography = row.ItemArray[3].ToString();
                artist.imageURL = row.ItemArray[4].ToString();
                artist.heroURL = row.ItemArray[5].ToString();
                artists.Add(artist);
            }
            return artists;
        }
        /// <summary>
        /// Adds the new artist to the artist table.
        /// </summary>
        /// <param name="artist"></param>
        /// <returns></returns>
        public int SetArtist(Artist artist)
        {
            var sql = new SQL();
            String dateCreation  = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            String title = artist.title;
            if (title.IsEmpty()) { title = "null"; }
            String biography = artist.biography;
            if (biography.IsEmpty()) { biography = "null"; }
            String imageURL = artist.imageURL;
            if (imageURL.IsEmpty()) {  imageURL = "null"; }
            String heroURL = artist.heroURL;
            if (heroURL.IsEmpty()) {  heroURL = "null"; }
            String query = String.Format(SET_ARTIST, dateCreation, title, biography, imageURL, heroURL);
            int id = sql.Execute(query);
            return id;
        }
    }
}