using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DAL.Models;
using BL.BE;
using BL.DTO;

namespace API_EF.Controllers
{
    [ApiController]
    public class ArtistsController : ControllerBase
    {
        [HttpGet("artist/search")]
        public  IActionResult GetArtist([FromQuery] string name)
        {
            try
            {
                artistBE artistBE = new artistBE();

                IEnumerable<artistDTO> artist = artistBE.GetArtistByName(name);

                return Ok(artist);
            }
            catch (Exception ex)
            {
                throw new Exception("Unexpected error" + ex.Message);
            }
            
        }

        [HttpPost("artist/add")]
        public IActionResult Create([FromBody] artistCreateDTO artist)
        {
            try
            {
                artistBE artistBE = new artistBE();

                bool isSuccess = artistBE.CreateArtist(artist);

                return isSuccess == true ? Ok("Artist successfully added") : BadRequest("Failed to add the artist");
            }
            catch (Exception ex)
            {
                throw new Exception("Unexpected error" + ex.Message);
            }
        }

    }
}
