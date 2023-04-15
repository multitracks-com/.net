using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

public partial class artistDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        List<artist> artistsList = new List<artist>();
        List<album> albumList = new List<album>();
        List<song> songsList = new List<song>();

        var sql = new SQL();

        try
        {
            sql.Parameters.Add("@artistID", 5);
            var data = sql.ExecuteStoredProcedureDataReader("GetArtistDetails");


            while (data.Read())
            {
                artist artist = new artist();
                album album = new album();
                song song = new song();

                artist.artistTitle = data.GetString(1);
                artist.artistImage = data.GetString(3);
                artist.heroURL = data.GetString(4);
                album.albumTitle = data.GetString(6);
                song.songTitle = data.GetString(9);
                song.albumTitle = data.GetString(6);

                albumList.Add(album);
                songsList.Add(song);

                artistsList.Add(artist);
            }

            #region artist

            artist artistData = new artist();

            artistData = artistsList.FirstOrDefault();

            artistTitle.InnerText = artistData.artistTitle;

            #endregion

            #region Header

            //Hero

            string heroBannerImageURL = artistData.heroURL;

            heroBanner.ImageUrl = heroBannerImageURL;
            heroBanner.AlternateText = artistData.artistTitle;
            heroBanner.Attributes["srcset"] = heroBannerImageURL + ", " + heroBannerImageURL + "2x";

            //artistImage

            string artistImageUrl = artistData.artistImage;

            artistImage.ImageUrl = artistImageUrl;
            artistImage.Attributes["srcset"] = artistImageUrl + ", " + artistImageUrl + "2x";
            artistImage.Attributes["class"] = "details-banner--info--box--img";

            #endregion

            #region Songs

            songsRepeater.DataSource = songsList;
            songsRepeater.DataBind();

            #endregion

            Console.WriteLine(data);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    private class artist
    {
        public string artistTitle { get; set; }
        public string biography { get; set; }
        public string artistImage { get; set; }
        public string heroURL { get; set; }
    }
    private class album
    {
        public string albumTitle { get; set; }
    }
    private class song
    {
        public string songTitle { get; set; }
        public string albumTitle { get; set; }
    }



}