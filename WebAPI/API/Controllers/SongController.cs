using API.Models;
using DataAccess;
using Serilog;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Http;

namespace API.Controllers
{
    public class SongController : ApiController
    {
        /// <summary>
        /// this api is used for paging based on two parameters pageSize and Page Number
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNumber"></param>
        /// <returns>IHttpActionResult</returns>
        [HttpGet]
        [Route("api.multitracks.com/song/list")]
        public IHttpActionResult List(int pageSize, int pageNumber)
        {
            Song song = new Song();
            List<Song> songs = song.GetSongs();    
            try
            {
                if (pageSize <= 0)
                {
                    return BadRequest("Invalid page size. Page size must be greater than zero.");
                }
                if (pageNumber <= 0)
                {
                    return BadRequest("Invalid page number. Page number must be greater than zero.");
                }
                int totalSongs = songs.Count;
                int totalPages = (int)Math.Ceiling((double)totalSongs / pageSize);
                if (pageNumber > totalPages)
                {
                    return NotFound();
                }
                int startIndex = (pageNumber - 1) * pageSize;
                var pagedSongs = songs.Skip(startIndex).Take(pageSize).ToList();
                var result = new
                {
                    TotalSongs = totalSongs,
                    TotalPages = totalPages,
                    CurrentPage = pageNumber,
                    PageSize = pageSize,
                    Songs = pagedSongs
                };
                return Ok(result);
            }
            catch (Exception ex)
            {
                Log.Error(ex,"Error Occurred While fetching the List");
                return InternalServerError(ex);
            }
        }
    }
}