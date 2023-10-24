using DataAccess;
using System;
using System.Data;

public partial class ArtistDetails : MultitracksPage
{
	public ArtistDetails()
	{
		Load += Page_Load;
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		if (Page.IsPostBack) return;
		int artistId = Convert.ToInt32(Request.QueryString["artistID"] ?? "1");

		var sql = new SQL();
		sql.Parameters.Add("@artistID", artistId);
		var artistData = sql.ExecuteStoredProcedureDS("GetArtistDetails");
		artistData.SetTableNames("artistDetails");

		if (artistData.Tables["artistDetails"].RowCount() > 0)
		{
			artistTitle.Text = artistData.Tables["artistDetails"].Field<string>("ArtistTitle");
			artistBio.Text = artistData.Tables["artistDetails"].Field<string>("artistBiography");
			heroURL.ImageUrl = artistData.Tables["artistDetails"].Field<string>("ArtistHeroURL");
			imageURL.ImageUrl = artistData.Tables["artistDetails"].Field<string>("ArtistImageURL");

			songsList.DataSource = artistData;
			songsList.DataBind();

			albumList.DataSource = artistData;
			albumList.DataBind();

			//artistBio.DataSource = artistData;
			//artistBio.DataBind();

			title.Visible = true;
		}
		else
		{
			title.Visible = false;
		}
	}
}