using DataAccess;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Route("api.multitracks.com/[controller]")]
    [ApiController]
    public class ArtistController:ControllerBase
    {
        private String SET_ARTIST = "INSERT INTO dbo.Artist ( dateCreation, title,biography,imageURL,heroURL)VALUES ('{0}','{1}','{2}','{3}','{4}')";

        [HttpGet("search")]
        public IActionResult SearchArtist([FromQuery] string name)
        {
            SQL sql = new SQL();
            Artist artist = new Artist();
            try
            {
                SqlParameter sqlParameter = new SqlParameter("@artistName", SqlDbType.NVarChar);
                sqlParameter.Value = name;
                sql.Parameters.Add(sqlParameter);
                DataTable dataTable = sql.ExecuteStoredProcedureDT("GetArtistDetailsByName");
                if (dataTable == null || dataTable.Rows.Count == 0) { return StatusCode(500, "Artist with the given name is not present in the DataBase"); }
                DataRow dataRow = dataTable.FirstOrNewRow();
                artist = SetArtistDetails(dataRow ,artist);
                return Ok(artist);
            }
            catch(Exception ex)
            {
                return StatusCode(500, ex);
            }
        }

        [HttpPost("add")]
        public IActionResult AddArtist([FromBody] Artist artist)
        {
            try 
            {
                int artistID = SetArtist(artist);
                if (artistID == 0) { return BadRequest("Artist Data Invalid"); }
                return Ok(artistID);
            }
            catch (Exception ex) 
            {
                return StatusCode(500, ex);
            }
        }

        private Artist SetArtistDetails(DataRow dataRow,Artist artist) 
        {
            if (dataRow == null || artist == null) { return new Artist(); }
            if (dataRow["ArtistID"] != null) { artist.ArtistID = Convert.ToString(dataRow["ArtistID"]); }
            if (dataRow["Title"] != null) { artist.Title = Convert.ToString(dataRow["artistTitle"]); }
            if (dataRow["ImageURL"] != null) { artist.ImageURL = Convert.ToString(dataRow["ImageURL"]); }
            if (dataRow["HeroURL"] != null) { artist.HeroURL = Convert.ToString(dataRow["HeroURL"]); }
            if (dataRow["Biography"] != null) { artist.Biography = Convert.ToString(dataRow["Biography"]); }
            return artist;
        }

        private int SetArtist(Artist artist)
        {
            var sql = new SQL();
            if (artist == null) { return 0; }
            string dateCreation = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string title = artist.Title;
            string biography = artist.Biography;
            string imageURL = artist.ImageURL;
            string heroURL = artist.HeroURL;
            string query = string.Format(SET_ARTIST, dateCreation, title, biography, imageURL, heroURL);
            int id = sql.Execute(query);
            return id;
        }

    }
}
