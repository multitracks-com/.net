using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageToSync_artistDetails : MultitracksPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int artistID = 2;
            DataTable artistData = FetchArtistData(artistID);

            if (artistData.Rows.Count > 0)
            {
                DisplayArtistDetails(artistData);
                BindDataToControls(artistData);
                title.Visible = true;
            }
            else
            {
                title.Visible = false;
            }
        }
        catch (Exception ex)
        {
            LogException(ex);
            title.Visible = false;
        }
    }

    private DataTable FetchArtistData(int artistId)
    {
        SQL sql = new SQL();
        SqlParameter artistIdParam = new SqlParameter("@artistId", SqlDbType.Int);
        artistIdParam.Value = artistId;
        sql.Parameters.Add(artistIdParam);
        return sql.ExecuteStoredProcedureDT("GetArtistDetails");
    }

    private void DisplayArtistDetails(DataTable dataTable)
    {
        artistTitle.Text = dataTable.Rows[0]["artistTitle"].ToString();
        FetchImageUrl(dataTable);
    }

    private void FetchImageUrl(DataTable dataTable)
    {
        DataRow dataRow = dataTable.Rows[0];
        heroURL.ImageUrl = dataRow["artistHeroUrl"].ToString();
        imageURL.ImageUrl = dataRow["artistImageUrl"].ToString();
    }

    private void BindDataToControls(DataTable dataTable)
    {
        songsList.DataSource = dataTable;
        songsList.DataBind();
        albumList.DataSource = dataTable;
        albumList.DataBind();
        artistBio.DataSource = dataTable;
        artistBio.DataBind();
    }

    private void LogException(Exception ex)
    {
        // Log the exception (consider using a proper logging mechanism)
        Console.WriteLine(ex.Message);
    }
}