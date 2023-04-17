using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

public partial class views_artists_artists : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        var sql = new SQL();

        List<artistData> artistsList = new List<artistData>();

        try
        {
            var data = sql.ExecuteStoredProcedureDataReader("GetAllArtists");

            while (data.Read())
            {
                artistData artistData = new artistData();

                artistData.artistID = data.GetInt32(0);
                artistData.title = data.GetString(1);
                artistData.imageURL = data.GetString(2);
                artistData.albumCount = Convert.ToString(data.GetInt32(3)) + " Albums";

                artistsList.Add(artistData);
            }

            artistsRepeater.DataSource = artistsList;
            artistsRepeater.DataBind();

            

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }



    }

    private class artistData
    {
        public int artistID { get; set; }
        public string title { get; set; }
        public string imageURL { get; set; }
        public string albumCount { get; set; }
    }
}