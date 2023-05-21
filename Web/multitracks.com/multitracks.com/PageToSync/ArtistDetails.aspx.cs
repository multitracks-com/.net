using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageToSync_ArtistDetails : MultitracksPage
{
    private bool flag =false;
    protected void Page_Load(object sender, EventArgs e)
    {
        var sql = new SQL();

        try
        {
            sql.Parameters.Add("@artistID", 5);
            DataTable dataTable = sql.ExecuteStoredProcedureDT("GetArtistDetails");
            DataTable dataTableWithSingleRow = CreateDataTableWithFirstRow(dataTable);
            SetBothImages(dataTableWithSingleRow);
            SetArtistName(dataTableWithSingleRow);
            SetArtistBiography(dataTableWithSingleRow);
            SetTopSongs(dataTable);
            SetAlbums(dataTable);
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
        artistTitle.Text = dataTable.Rows[0].ItemArray[2].ToString();
    }
    /// <summary>
    /// To Fetch the Biography from the DataBase
    /// </summary>
    /// <param name="dataTable"></param>
    private void SetArtistBiography(DataTable dataTable)
    {
        artistBio.DataSource = dataTable;
        artistBio.DataBind();
    }
    /// <summary>
    /// To fetch imageURL and heroURL from DataBase and set in ImageURL
    /// </summary>
    /// <param name="dataTable"></param>
    private void SetBothImages(DataTable dataTable)
    {
        DataRow dataRow = dataTable.Rows[0];
        heroURL.ImageUrl = dataRow.ItemArray[5].ToString();
        imageURL.ImageUrl = dataRow.ItemArray[4].ToString();
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
    /// <summary>
    /// Showing Top Songs
    /// </summary>
    /// <param name="dataTable"></param>
    private void SetTopSongs(DataTable dataTable)
    {
        SetSongsVisibility(dataTable);
        if (flag == true) { return; }
        setSong1Details(dataTable);
        SetSong2Details(dataTable);
        SetSong3Details(dataTable);
    }
    /// <summary>
    /// Setting Up The Visibility of the grid
    /// </summary>
    /// <param name="dataTable"></param>
    private void SetSongsVisibility(DataTable dataTable)
    {
        if (dataTable.Rows.Count == 0)
        {
            song1.Visible = false;
            song2.Visible = false;
            song3.Visible = false;
            flag = true;
        }
        if (dataTable.Rows.Count == 1)
        {
            song2.Visible = false;
            song3.Visible = false;
            setSong1Details(dataTable);
            flag = true;
        }
        if (dataTable.Rows.Count == 2)
        {
            song3.Visible = false;
            setSong1Details(dataTable);
            SetSong2Details(dataTable);
            flag=true;
        }
    }
    /// <summary>
    /// Setting the song1 details
    /// </summary>
    /// <param name="dataTable"></param>
    private void setSong1Details(DataTable dataTable)
    {
        SongTitle1.Text = dataTable.Rows[0].ItemArray[10].ToString();
        SongAlbum1.Text = dataTable.Rows[0].ItemArray[23].ToString();
        SongBPM1.Text = dataTable.Rows[0].ItemArray[11].ToString() + " BPM";
    }
    /// <summary>
    /// Setting the song2 Details
    /// </summary>
    /// <param name="dataTable"></param>
    private void SetSong2Details(DataTable dataTable)
    {
        SongTitle2.Text = dataTable.Rows[1].ItemArray[10].ToString();
        SongAlbum2.Text = dataTable.Rows[1].ItemArray[23].ToString();
        SongBPM2.Text = dataTable.Rows[1].ItemArray[11].ToString() + " BPM";
    }
    /// <summary>
    /// Setting the Song 3 Details
    /// </summary>
    /// <param name="dataTable"></param>
    private void SetSong3Details(DataTable dataTable)
    {
        SongTitle3.Text = dataTable.Rows[2].ItemArray[10].ToString();
        SongAlbum3.Text = dataTable.Rows[2].ItemArray[23].ToString();
        SongBPM3.Text = dataTable.Rows[2].ItemArray[11].ToString() + " BPM";
    }
    private void SetAlbums(DataTable datatable)
    {
        DataTable albumTable = SetUniqueAlbums(datatable);
        SetAlbumVisibility(albumTable);

    }
    private DataTable SetUniqueAlbums(DataTable dataTable)
    {
        List<String> albumNames =new List<String>();
        DataTable newtable = dataTable.Clone();
        foreach (DataRow albumRow in dataTable.Rows)
        {
            String albumName = albumRow.ItemArray[23].ToString();
            if (albumNames.Contains(albumName)) { continue; }
            newtable.ImportRow(albumRow);
            albumNames.Add(albumName);
        }
       return newtable;
    }
    private void SetAlbumVisibility(DataTable dataTable)
    {
        if (dataTable.Rows.Count == 1)
        {
            SetVisibilityForAlbum1(dataTable);
        }
        if (dataTable.Rows.Count == 2)
        {
            SetVisibilityForAlbum2(dataTable);
        }
        if (dataTable.Rows.Count == 3)
        {
            SetVisibilityForAlbum3(dataTable);
        }
        if (dataTable.Rows.Count == 4)
        {
            SetVisibilityForAlbum4(dataTable);
        }
        if (dataTable.Rows.Count == 5)
        {
            SetVisibilityForAlbum5(dataTable);
        }
        if (dataTable.Rows.Count == 6)
        {
            SetVisibilityForAlbum6(dataTable);
        }
        if (dataTable.Rows.Count == 7)
        {
            SetVisibilityForAlbum7(dataTable);
        }
        if (dataTable.Rows.Count > 7)
        {
            SetVisibilityForAlbum8(dataTable);
        }
    }
    private void SetAlbum1Details(DataTable dataTable)
    {
        albumImage1.ImageUrl = dataTable.Rows[0].ItemArray[24].ToString();
        albumTitle1.Text = dataTable.Rows[0].ItemArray[23].ToString();
        albumSubTitle1.Text = dataTable.Rows[0].ItemArray[2].ToString();
    }
    private void SetAlbum2Details(DataTable dataTable)
    {
        albumImage2.ImageUrl = dataTable.Rows[1].ItemArray[24].ToString();
        albumTitle2.Text = dataTable.Rows[1].ItemArray[23].ToString();
        albumSubTitle2.Text = dataTable.Rows[1].ItemArray[2].ToString();
    }
    private void SetAlbum3Details(DataTable dataTable)
    {
        albumImage3.ImageUrl = dataTable.Rows[2].ItemArray[24].ToString();
        albumTitle3.Text = dataTable.Rows[2].ItemArray[23].ToString();
        albumSubTitle3.Text = dataTable.Rows[2].ItemArray[2].ToString();
    }
    private void SetAlbum4Details(DataTable dataTable)
    {
        albumImage4.ImageUrl = dataTable.Rows[3].ItemArray[24].ToString();
        albumTitle4.Text = dataTable.Rows[3].ItemArray[23].ToString();
        albumSubTitle4.Text = dataTable.Rows[3].ItemArray[2].ToString();
    }
    private void SetAlbum5Details(DataTable dataTable)
    {
        albumImage5.ImageUrl = dataTable.Rows[4].ItemArray[24].ToString();
        albumTitle5.Text = dataTable.Rows[4].ItemArray[23].ToString();
        albumSubTitle5.Text = dataTable.Rows[4].ItemArray[2].ToString();
    }
    private void SetAlbum6Details(DataTable dataTable)
    {
        albumImage6.ImageUrl = dataTable.Rows[5].ItemArray[24].ToString();
        albumTitle6.Text = dataTable.Rows[5].ItemArray[23].ToString();
        albumSubTitle6.Text = dataTable.Rows[5].ItemArray[2].ToString();
    }
    private void SetAlbum7Details(DataTable dataTable)
    {
        albumImage7.ImageUrl = dataTable.Rows[6].ItemArray[24].ToString();
        albumTitle7.Text = dataTable.Rows[6].ItemArray[23].ToString();
        albumSubTitle7.Text = dataTable.Rows[6].ItemArray[2].ToString();
    }
    private void SetAlbum8Details(DataTable dataTable)
    {
        albumImage8.ImageUrl = dataTable.Rows[7].ItemArray[24].ToString();
        albumTitle8.Text = dataTable.Rows[7].ItemArray[23].ToString();
        albumSubTitle8.Text = dataTable.Rows[7].ItemArray[2].ToString();
    }
    private void SetVisibilityForAlbum1(DataTable dataTable)
    {
        Album2.Visible = false;
        Album3.Visible = false;
        Album4.Visible = false;
        Album5.Visible = false;
        Album6.Visible = false;
        Album7.Visible = false;
        Album8.Visible = false;
        SetAlbum1Details(dataTable);
    }
    private void SetVisibilityForAlbum2(DataTable dataTable)
    {
        Album3.Visible = false;
        Album4.Visible = false;
        Album5.Visible = false;
        Album6.Visible = false;
        Album7.Visible = false;
        Album8.Visible = false;
        SetAlbum1Details(dataTable);
        SetAlbum2Details(dataTable);
    }
    private void SetVisibilityForAlbum3(DataTable dataTable)
    {
        Album4.Visible = false;
        Album5.Visible = false;
        Album6.Visible = false;
        Album7.Visible = false;
        Album8.Visible = false;
        SetAlbum1Details(dataTable);
        SetAlbum2Details(dataTable);
        SetAlbum3Details(dataTable);
    }
    private void SetVisibilityForAlbum4(DataTable dataTable)
    {
        Album5.Visible = false;
        Album6.Visible = false;
        Album7.Visible = false;
        Album8.Visible = false;
        SetAlbum1Details(dataTable);
        SetAlbum2Details(dataTable);
        SetAlbum3Details(dataTable);
        SetAlbum4Details(dataTable);
    }
    private void SetVisibilityForAlbum5(DataTable dataTable)
    {
        Album6.Visible = false;
        Album7.Visible = false;
        Album8.Visible = false;
        SetAlbum1Details(dataTable);
        SetAlbum2Details(dataTable);
        SetAlbum3Details(dataTable);
        SetAlbum4Details(dataTable);
        SetAlbum5Details(dataTable);
    }
    private void SetVisibilityForAlbum6(DataTable dataTable)
    {
        Album7.Visible = false;
        Album8.Visible = false;
        SetAlbum1Details(dataTable);
        SetAlbum2Details(dataTable);
        SetAlbum3Details(dataTable);
        SetAlbum4Details(dataTable);
        SetAlbum5Details(dataTable);
        SetAlbum6Details(dataTable);
    }
    private void SetVisibilityForAlbum7(DataTable dataTable)
    {
        Album8.Visible = false;
        SetAlbum1Details(dataTable);
        SetAlbum2Details(dataTable);
        SetAlbum3Details(dataTable);
        SetAlbum4Details(dataTable);
        SetAlbum5Details(dataTable);
        SetAlbum6Details(dataTable);
        SetAlbum7Details(dataTable);
    }
    private void SetVisibilityForAlbum8(DataTable dataTable)
    {
        SetAlbum1Details(dataTable);
        SetAlbum2Details(dataTable);
        SetAlbum3Details(dataTable);
        SetAlbum4Details(dataTable);
        SetAlbum5Details(dataTable);
        SetAlbum6Details(dataTable);
        SetAlbum7Details(dataTable);
        SetAlbum8Details(dataTable);
    }
}