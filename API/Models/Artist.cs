using DataAccess;
using System;
using System.Data;
namespace API.Models
{
    public class Artist
    {

        public int ID { get; set; }
        public DateTime DateCreated { get; set; }
        public string Title { get; set; }
        public string Bio { get; set; }
        public string ImageURL { get; set; }
        public string HeroURL { get; set; }

        public Artist GetArtistAPI(string title)
        {
            Artist artist = new Artist();
            var sql = new SQL();
            sql.Parameters.Add("@title", title);
            DataSet ds = sql.ExecuteDS("SELECT [artistID],[dateCreation],[title],[biography],[imageURL],[heroURL] FROM Artist WHERE title = @title;");
            DataRow dr = ds.Tables[0].Rows[0];
            if (ds.RowCount() > 0)
            {
                artist.ID = (int)dr["artistID"];
                artist.DateCreated = (DateTime)dr["dateCreation"];
                artist.Title = (string)dr["title"];
                artist.Bio = (string)dr["biography"];
                artist.ImageURL = (string)dr["imageURL"];
                artist.HeroURL = (string)dr["heroURL"];
            }
            return artist;
        }
    }

}
