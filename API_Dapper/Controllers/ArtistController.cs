using Dapper;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using BL_Dap.DTO_Dap;
using BL_Dap.BE_Dap;
using System.Collections.Generic;

namespace API_Dapper.Controllers
{
    [ApiController]
    public class artistController : ControllerBase
    {
        [HttpGet("artist/search")]
        public IActionResult GetArtistByName(string name)
        {
            try
            {
                artistBE artistBE = new artistBE();

                IEnumerable<artistDTO_Dap> lst = artistBE.GetArtistByName(name);

                return Ok(lst);
            }
            catch (Exception ex)
            {
                throw new Exception("Unexpected error " + ex.Message);
            }
        }

        [HttpPost("artist/add")]
        public IActionResult Create([FromBody] artistCreateDTO_Dap artist)
        {
            try
            {
                artistBE artistBE = new artistBE();

                bool isSuccess = artistBE.CreateArtist(artist);

                return isSuccess == true ? Ok("Artist successfully added.") : BadRequest("Failed to add the artist.");
            }
            catch (Exception ex)
            {
                throw new Exception("Unexpected error " + ex.Message);
            }
        }
    }
}
