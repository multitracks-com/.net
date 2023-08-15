using DataAccess;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Route("api.multitracks.com/[controller]")]
    [ApiController]
    public class SongController:ControllerBase
    {
        [HttpGet("list")]
        public IActionResult GetListOfSongs([FromQuery] int pageSize, [FromQuery] int pageNumber)
        {
            SQL sQL = new SQL();
            SqlParameter currentPageParam = new SqlParameter("@CurrentPage",System.Data.SqlDbType.Int);
            currentPageParam.Value = pageNumber;
            SqlParameter pagesizeParam = new SqlParameter("@PageSize", System.Data.SqlDbType.Int);
            pagesizeParam.Value = pageSize;
            sQL.Parameters.Add(currentPageParam);
            sQL.Parameters.Add(pagesizeParam);
            DataTable songsTable = sQL.ExecuteStoredProcedureDT("GetArtistDetails");
            if (songsTable == null || songsTable.Rows.Count == 0) { return StatusCode(500, "No Songs Available on this page"); }
            List<Song> songs = new List<Song>();
            foreach (DataRow row in songsTable.Rows)
            {
                songs.Add(SetSongDetails(row));
            }
            return Ok(songs);
        }
        private Song SetSongDetails(DataRow row)
        {
            Song song = new Song();
            if (row == null ) { return new Song(); }
            if (row["ID"] != null) { song.SongId = Convert.ToString(row["ID"]); }
            if (row["SongName"] != null) { song.SongName = Convert.ToString(row["SongName"]); }
            if (row["SongBPM"] != null) { song.SongBPM = Convert.ToString(row["SongBPM"]); }
            return song;
        }
    }
}
