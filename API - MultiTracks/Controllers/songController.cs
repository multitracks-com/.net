using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Web_Api__multitracks.Models;
using Web_Api__multitracks.Data;

namespace Web_Api__multitracks.Controllers
{
    [Route("/[controller]")]
    [ApiController]
    public class songController : ControllerBase
    {
        private readonly MultiTracksDBContext _context;
        public songController(MultiTracksDBContext context)
        {
            _context = context;
        }

        [Route("list")]
        [HttpGet]
        public async Task<IActionResult> songList([FromQuery] SongParameters songParams)
        {
            var res = await (from a in _context.Song
                           
                             select a.title

                             ).Skip((songParams.PageNumber - 1) * songParams.PageSize)
                              .Take(songParams.PageSize)
                              .ToListAsync();
            return Ok(res);
        }
    }
}