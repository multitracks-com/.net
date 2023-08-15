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
        var sql = new SQL();

        try
        {
            int artistID = 1040;
            SqlParameter artistIDParam = new SqlParameter("@artistID", SqlDbType.Int);
            artistIDParam.Value = artistID;
            sql.Parameters.Add(artistIDParam);
            DataTable dataTable = sql.ExecuteStoredProcedureDT("GetArtistDetails");
            DataTable dataTableWithSingleRow = CreateDataTableWithFirstRow(dataTable);
            SetBothImages(dataTableWithSingleRow);
            SetArtistName(dataTableWithSingleRow);
            songsList.DataSource = dataTable;
            songsList.DataBind();
            albumList.DataSource = dataTable;
            albumList.DataBind();
            artistBio.DataSource = dataTable;
            artistBio.DataBind();
            title.Visible = true;
        }
        catch
        {
            title.Visible = false;
        }
    }
    /// <summary>
    /// To Fetch The Artist Name From the Data Base
    /// </summary>
    /// <param name="dataTable"></param>
    private void SetArtistName(DataTable dataTable)
    {
        artistTitle.Text = dataTable.Rows[0]["artistTiltle"].ToString();
    }
    /// <summary>
    /// To fetch imageURL and heroURL from DataBase and set in ImageURL
    /// </summary>
    /// <param name="dataTable"></param>
    private void SetBothImages(DataTable dataTable)
    {
        DataRow dataRow = dataTable.FirstOrNewRow();
        heroURL.ImageUrl = dataRow["artistHeroURL"].ToString();
        imageURL.ImageUrl = dataRow["artistImageURL"].ToString();
    }
    /// <summary>
    /// Creating a new dataTable which consists only the first row ao that the title and biography do not get duplicated.
    /// </summary>
    /// <param name="dataTable"></param>
    /// <returns></returns>
    private DataTable CreateDataTableWithFirstRow(DataTable dataTable)
    {
        DataTable newtable = dataTable.Clone();
        newtable.ImportRow(dataTable.Rows[0]);
        return newtable;
    }
}
