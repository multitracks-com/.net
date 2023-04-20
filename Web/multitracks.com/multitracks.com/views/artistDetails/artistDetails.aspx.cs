using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using models;
using DTOs;
public partial class artistDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string artistId = Request.QueryString["idArt"];
        if (artistId == null)
        {
            Response.Redirect("../allartists/allartists.aspx");
        }

        artist artist = new artist();

        var sql = new SQL();

        try
        {

            sql.Parameters.Add("@artistID", artistId);
            var data = sql.ExecuteStoredProcedureDataReader("GetArtistDetails");

            while (data.Read())
            {
                if (artist.artistID == 0)
                {
                    artist.artistID = data.GetInt32(0);
                    artist.artistTitle = data.GetString(1);
                    artist.biography = data.GetString(2);
                    artist.artistImage = data.GetString(3);
                    artist.heroURL = data.GetString(4);
                    List<album> newAlbumList = new List<album>();
                    artist.albums = newAlbumList;
                }

                bool hasNoAlbums = data.IsDBNull(5); //albumID

                if (hasNoAlbums)
                {
                    List<album> newAlbumList = new List<album>();
                    artist.albums = newAlbumList;
                }
                else
                {
                    bool hasNoSongs = data.IsDBNull(10);//songID

                    if (hasNoSongs) {

                        int albumID = data.GetInt32(5);

                        album albumExists = artist.albums?.Where(a => a.albumID == albumID).FirstOrDefault();

                        if (albumExists == null)
                        {
                            album newAlbum = new album();
                            List<song> newSongList = new List<song>();

                            newAlbum.albumID = data.GetInt32(5);
                            newAlbum.albumTitle = data.GetString(6);
                            newAlbum.albumImage = data.GetString(7);
                            newAlbum.year = data.GetInt32(8);
                            newAlbum.albumSongID = data.GetInt32(9);

                            newAlbum.songs = newSongList;

                            artist.albums.Add(newAlbum);
                        }
                    }
                    else //Has songs
                    {
                        song song = new song();

                        song.songID = data.GetInt32(10);
                        song.songTitle = data.GetString(11);
                        song.bpm = Convert.ToString(data.GetDecimal(12)) + " BPM";
                        song.albumSongID = data.GetInt32(13);
                        song.timeSignature = data.GetString(14);

                        album albumExists = artist.albums?.Where(a => a.albumID == song.albumSongID).FirstOrDefault();

                        if (albumExists == null)
                        {
                            album newAlbum = new album();
                            List<song> newSongList = new List<song>();

                            newAlbum.albumID = data.GetInt32(5);
                            newAlbum.albumTitle = data.GetString(6);
                            newAlbum.albumImage = data.GetString(7);
                            newAlbum.year = data.GetInt32(8);
                            newAlbum.albumSongID = data.GetInt32(9);

                            newSongList.Add(song);
                            newAlbum.songs = newSongList;


                            artist.albums.Add(newAlbum);
                        }
                        else
                        {
                            albumExists.songs.Add(song);
                        }
                    }
                }
            }

            sql.CloseReader(data);

            #region Header

            //Hero

            string heroBannerImageURL = artist.heroURL;

            heroBanner.ImageUrl = heroBannerImageURL;
            heroBanner.AlternateText = artist.artistTitle;
            heroBanner.Attributes["srcset"] = heroBannerImageURL + ", " + heroBannerImageURL + "2x";

            //artistImage

            string artistImageUrl = artist.artistImage;

            artistImage.ImageUrl = artistImageUrl;
            artistImage.Attributes["srcset"] = artistImageUrl + ", " + artistImageUrl + "2x";
            artistImage.Attributes["class"] = "details-banner--info--box--img";

            //Title

            artistTitle.InnerText = artist.artistTitle;


            #endregion

            #region Songs

            List<albumDTO> allAlbums = new List<albumDTO>();
            List<songDTO> allSongs = new List<songDTO>();

            if(artist.albums != null) {

                foreach (album album in artist.albums)
                {

                    albumDTO _albumDTO = new albumDTO()
                    {
                        album = album,
                        artistTitle = artist.artistTitle,
                    };

                    allAlbums.Add(_albumDTO);

                    album.songs.ForEach(song =>
                    {
                        songDTO _songDTO = new songDTO();

                        _songDTO.song = song;
                        _songDTO.albumTitle = album.albumTitle;
                        _songDTO.albumImage = album.albumImage;

                        allSongs.Add(_songDTO);
                    });
                }
            }



            songsRepeater.DataSource = allSongs;
            songsRepeater.DataBind();

            #endregion

            #region Albums


            albumsRepeater.DataSource = allAlbums;
            albumsRepeater.DataBind();

            #endregion

            #region biography

            biographyLiteral.Text = artist.biography;

            #endregion

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    //private class artist
    //{
    //    public int artistID;
    //    public string artistTitle { get; set; }
    //    public string biography { get; set; }
    //    public string artistImage { get; set; }
    //    public string heroURL { get; set; }
    //    public List<album> albums { get; set; }
    //}
    //private class album
    //{
    //    public int albumID { get; set; }
    //    public string albumTitle { get; set; }
    //    public string albumImage { get; set; }
    //    public int year { get; set; }
    //    public int albumSongID { get; set; }
    //    public List<song> songs { get; set; }
    //}
    //private class song
    //{
    //    public int songID { get; set; }
    //    public string songTitle { get; set; }
    //    public string bpm { get; set; }
    //    public string timeSignature { get; set; }
    //    public int albumSongID { get; set; }

    //}

    //private class songDTO
    //{
    //    public song song { get; set; }
    //    public string albumTitle { get; set; }
    //    public string albumImage { get; set; }
    //}

    //private class albumDTO
    //{
    //    public album album { get; set; }
    //    public string artistTitle { get; set; }
    //}

}