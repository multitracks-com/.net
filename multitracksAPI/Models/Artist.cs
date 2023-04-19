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
        public string Biography { get; set; }
        public string ImageURL { get; set; }
        public string HeroURL { get; set; }

        public Artist GetArtistAPI(string title)
        {
            Artist artist = new Artist();
            var sql = new SQL();
            sql.Parameters.Add("@title", title);
            try
            {
                DataSet ds = sql.ExecuteDS("SELECT [artistID],[dateCreation],[title],[biography],[imageURL],[heroURL] FROM Artist WHERE title = @title;");
                DataRow dr = ds.Tables[0].Rows[0];
                if (ds.RowCount() > 0)
                {
                    artist.ID = (int)dr["artistID"];
                    artist.DateCreated = (DateTime)dr["dateCreation"];
                    artist.Title = (string)dr["title"];
                    artist.Biography = (string)dr["biography"];
                    artist.ImageURL = (string)dr["imageURL"];
                    artist.HeroURL = (string)dr["heroURL"];
                }
                return artist;
            }
            catch(Exception) 
            {
                return null;
            }
            
        }
        public string PostArtist(Artist artist)
        {
            //take in data from textbox
            //deserialize data into a datable? maybe object
            try
            {
                var sql = new SQL();
                sql.Parameters.Add("@dateCreation", SqlDbType.SmallDateTime);
                sql.Parameters["@dateCreation"].Value = DateTime.Now;
                sql.Parameters.Add("@title", SqlDbType.VarChar);
                sql.Parameters["@title"].Value = artist.Title;
                sql.Parameters.Add("@biography", SqlDbType.VarChar);
                sql.Parameters["@biography"].Value = artist.Biography;
                sql.Parameters.Add("@imageURL", SqlDbType.VarChar);
                sql.Parameters["@imageURL"].Value = artist.ImageURL;
                sql.Parameters.Add("@heroURL", SqlDbType.VarChar);
                sql.Parameters["@heroURL"].Value = artist.HeroURL;

                int i = sql.Execute("INSERT INTO Artist ([dateCreation],[title],[biography],[imageURL],[heroURL]) VALUES (@dateCreation,@title,@biography,@imageURL,@heroURL);");
                if (i < 1)
                {
                    return "Employee Not Added";
                }
                return "New Artist Added Succesfully";
            }
            catch(Exception e)
            {
                return "Employee Not Added" + e.Message;
            }

        }
    }

}
