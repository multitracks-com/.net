using System;
using DataAccess;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class artistDetails : MultitracksPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        var sql = new SQL();
        
        try
        {
            sql.Parameters.Add("@artistID", 31);
            var data = sql.ExecuteStoredProcedureDT("GetArtistDetails");
            
            artistItems.DataSource = AlbumnInfo.DataSource = data;
            artistItems.DataBind(); AlbumnInfo.DataBind();

            DataTable dt = data.Clone(); 
            dt.ImportRow(data.FirstOrNewRow());
            
            artistHeaderInfo.DataSource = biography.DataSource = dt;
            biography.DataBind(); artistHeaderInfo.DataBind();

        }
        catch
        {
            artistItems.DataSource = "DEFAULT";
            artistItems.DataBind();

        }


    }
}