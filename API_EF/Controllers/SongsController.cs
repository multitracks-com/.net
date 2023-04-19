using DAL_EF.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using BL.BE;
using BL.DTO;
using Newtonsoft.Json.Linq;

namespace API_EF.Controllers
{
    [ApiController]
    public class SongsController : ControllerBase
    {
        [HttpGet("song/search")]
        public IActionResult getSongs([FromQuery] int pageSize, int currentPageNumber)
        {
            try
            {
                songBE songBE = new songBE();

                return Ok(songBE.getSongs(pageSize, currentPageNumber));
            }
            catch (Exception ex)
            {
                throw new Exception("Unexpected error " + ex.Message);
            }
        }
    }
}
